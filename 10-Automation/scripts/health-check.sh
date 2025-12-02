#!/bin/bash

# health-check.sh
# Application health monitoring script
# Usage: ./health-check.sh [OPTIONS]

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Default values
APP_URL="http://localhost:3000"
TIMEOUT=30
RETRY_COUNT=3
RETRY_DELAY=5
VERBOSE=false
SLACK_WEBHOOK=""
DATABASE_URL="http://localhost:5432"

# Health check endpoints
HEALTH_ENDPOINTS=(
    "/"
    "/health"
    "/api/health"
    "/ping"
)

# Services to check
SERVICES=(
    "app:8080"
    "postgres:5432"
    "redis:6379"
    "nginx:80"
)

# Function to print colored output
print_status() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

print_debug() {
    if [[ "$VERBOSE" == "true" ]]; then
        echo -e "${BLUE}[DEBUG]${NC} $1"
    fi
}

# Help function
show_help() {
    cat << EOF
Application Health Check Script

Usage: $0 [OPTIONS]

Options:
  -u, --url URL        Application URL to check (default: http://localhost:3000)
  -t, --timeout SEC    Request timeout in seconds (default: 30)
  -r, --retry COUNT    Number of retries (default: 3)
  -d, --delay SEC      Delay between retries in seconds (default: 5)
  -v, --verbose        Enable verbose output
  -s, --slack URL      Send notification to Slack webhook
  --db-url URL         Database health check URL (default: http://localhost:5432)
  -h, --help           Show this help message

Examples:
  $0 -u https://api.akordium.id -v
  $0 --url http://localhost:8080 --retry 5 --slack https://hooks.slack.com/...
  $0 -u https://staging.waqfwise.id -t 60 -v
EOF
}

# Function to send Slack notification
send_slack_notification() {
    local status="$1"
    local message="$2"

    if [[ -n "$SLACK_WEBHOOK" ]]; then
        local color="good"
        if [[ "$status" == "failure" ]]; then
            color="danger"
        elif [[ "$status" == "warning" ]]; then
            color="warning"
        fi

        local payload=$(cat << EOF
{
    "attachments": [
        {
            "color": "$color",
            "title": "Health Check - $status",
            "title_link": "$APP_URL",
            "text": "$message",
            "fields": [
                {
                    "title": "Application URL",
                    "value": "$APP_URL",
                    "short": true
                },
                {
                    "title": "Timestamp",
                    "value": "$(date)",
                    "short": true
                }
            ],
            "footer": "Akordium Health Monitor",
            "footer_icon": "https://platform.slack-edge.com/img/default_application_icon.png"
        }
    ]
}
EOF
        )

        curl -X POST -H 'Content-type: application/json' \
            --data "$payload" \
            "$SLACK_WEBHOOK" > /dev/null 2>&1 || true

        print_debug "Slack notification sent"
    fi
}

# Function to check HTTP endpoint
check_http_endpoint() {
    local url="$1"
    local endpoint="$2"
    local full_url="${url}${endpoint}"

    print_debug "Checking endpoint: $full_url"

    local response
    local http_code
    local response_time

    response=$(curl -s -o /dev/null -w "%{http_code},%{time_total}" \
        --max-time "$TIMEOUT" \
        --connect-timeout 10 \
        "$full_url" 2>/dev/null || echo "000,0")

    IFS=',' read -r http_code response_time <<< "$response"

    print_debug "HTTP Code: $http_code, Response Time: ${response_time}s"

    if [[ "$http_code" =~ ^[23] ]]; then
        print_status "✓ $endpoint - HTTP $http_code (${response_time}s)"
        return 0
    else
        print_error "✗ $endpoint - HTTP $http_code (${response_time}s)"
        return 1
    fi
}

# Function to check service connectivity
check_service() {
    local service="$1"
    local host_port="${service#*:}"
    local host="${service%:*}"

    print_debug "Checking service: $service"

    if nc -z -w3 "$host" "$host_port" 2>/dev/null; then
        print_status "✓ $service - Connected"
        return 0
    else
        print_error "✗ $service - Connection failed"
        return 1
    fi
}

# Function to check database connectivity
check_database() {
    print_debug "Checking database connectivity"

    # This is a basic check - customize based on your database type
    if pg_isready -h "${DATABASE_URL%:*}" -p "${DATABASE_URL##*:}" -q 2>/dev/null; then
        print_status "✓ Database - Connected"
        return 0
    else
        print_error "✗ Database - Connection failed"
        return 1
    fi
}

# Function to check disk space
check_disk_space() {
    print_debug "Checking disk space"

    local usage
    usage=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')

    if [[ "$usage" -lt 85 ]]; then
        print_status "✓ Disk Space - ${usage}% used"
        return 0
    elif [[ "$usage" -lt 95 ]]; then
        print_warning "⚠ Disk Space - ${usage}% used (warning)"
        return 1
    else
        print_error "✗ Disk Space - ${usage}% used (critical)"
        return 2
    fi
}

# Function to check memory usage
check_memory() {
    print_debug "Checking memory usage"

    local usage
    usage=$(free | awk 'NR==2{printf "%.0f", $3*100/$2}')

    if [[ "$usage" -lt 85 ]]; then
        print_status "✓ Memory - ${usage}% used"
        return 0
    elif [[ "$usage" -lt 95 ]]; then
        print_warning "⚠ Memory - ${usage}% used (warning)"
        return 1
    else
        print_error "✗ Memory - ${usage}% used (critical)"
        return 2
    fi
}

# Main health check function
run_health_check() {
    local exit_code=0
    local warnings=0
    local errors=0

    echo "=========================================="
    echo "🏥 Application Health Check"
    echo "URL: $APP_URL"
    echo "Timestamp: $(date)"
    echo "=========================================="

    # Check HTTP endpoints
    echo ""
    echo "📡 HTTP Endpoints:"
    for endpoint in "${HEALTH_ENDPOINTS[@]}"; do
        local retry=0
        local success=false

        while [[ $retry -lt $RETRY_COUNT ]]; do
            if check_http_endpoint "$APP_URL" "$endpoint"; then
                success=true
                break
            fi

            if [[ $((retry + 1)) -lt $RETRY_COUNT ]]; then
                print_debug "Retrying in $RETRY_DELAY seconds..."
                sleep "$RETRY_DELAY"
            fi
            ((retry++))
        done

        if [[ "$success" == "false" ]]; then
            ((errors++))
            exit_code=1
        fi
    done

    # Check services
    echo ""
    echo "🔗 Service Connectivity:"
    for service in "${SERVICES[@]}"; do
        if ! check_service "$service"; then
            ((errors++))
            exit_code=1
        fi
    done

    # Check database
    echo ""
    echo "🗄️ Database:"
    if ! check_database; then
        ((errors++))
        exit_code=1
    fi

    # Check system resources
    echo ""
    echo "💻 System Resources:"
    local disk_result
    local memory_result

    disk_result=$(check_disk_space)
    disk_code=$?

    memory_result=$(check_memory)
    memory_code=$?

    # Count warnings and errors from system checks
    if [[ $disk_code -eq 1 ]]; then ((warnings++)); fi
    if [[ $disk_code -eq 2 ]]; then ((errors++)); exit_code=1; fi
    if [[ $memory_code -eq 1 ]]; then ((warnings++)); fi
    if [[ $memory_code -eq 2 ]]; then ((errors++)); exit_code=1; fi

    # Summary
    echo ""
    echo "=========================================="
    echo "📊 Health Check Summary:"
    echo "Warnings: $warnings"
    echo "Errors: $errors"
    echo "Status: $([ $exit_code -eq 0 ] && echo "✅ HEALTHY" || echo "❌ UNHEALTHY")"
    echo "Timestamp: $(date)"
    echo "=========================================="

    # Send notifications
    if [[ $errors -gt 0 ]]; then
        send_slack_notification "failure" "Health check failed with $errors errors and $warnings warnings"
    elif [[ $warnings -gt 0 ]]; then
        send_slack_notification "warning" "Health check completed with $warnings warnings"
    fi

    return $exit_code
}

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        -u|--url)
            APP_URL="$2"
            shift 2
            ;;
        -t|--timeout)
            TIMEOUT="$2"
            shift 2
            ;;
        -r|--retry)
            RETRY_COUNT="$2"
            shift 2
            ;;
        -d|--delay)
            RETRY_DELAY="$2"
            shift 2
            ;;
        -v|--verbose)
            VERBOSE=true
            shift
            ;;
        -s|--slack)
            SLACK_WEBHOOK="$2"
            shift 2
            ;;
        --db-url)
            DATABASE_URL="$2"
            shift 2
            ;;
        -h|--help)
            show_help
            exit 0
            ;;
        *)
            print_error "Unknown argument: $1"
            show_help
            exit 1
            ;;
    esac
done

# Validate inputs
if [[ ! "$APP_URL" =~ ^https?:// ]]; then
    APP_URL="http://$APP_URL"
fi

if ! [[ "$TIMEOUT" =~ ^[0-9]+$ ]] || [[ "$TIMEOUT" -lt 1 ]]; then
    print_error "Timeout must be a positive integer"
    exit 1
fi

if ! [[ "$RETRY_COUNT" =~ ^[0-9]+$ ]] || [[ "$RETRY_COUNT" -lt 1 ]]; then
    print_error "Retry count must be a positive integer"
    exit 1
fi

# Check dependencies
for cmd in curl nc; do
    if ! command -v "$cmd" &> /dev/null; then
        print_error "Required command not found: $cmd"
        exit 1
    fi
done

# Run health check
run_health_check
exit $?