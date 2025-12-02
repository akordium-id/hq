#!/bin/bash

# setup-go-env.sh
# Setup Go development environment for Akordium Lab projects
# Usage: ./setup-go-env.sh [project-name]

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Default values
PROJECT_NAME=""
GO_VERSION="1.21"

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

# Help function
show_help() {
    cat << EOF
Setup Go Development Environment

Usage: $0 [OPTIONS] PROJECT_NAME

Arguments:
  PROJECT_NAME    Name of the project to setup

Options:
  -v, --version  Go version to install (default: 1.21)
  -h, --help     Show this help message

Examples:
  $0 waqfwise
  $0 -v 1.20 atribuo
EOF
}

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        -v|--version)
            GO_VERSION="$2"
            shift 2
            ;;
        -h|--help)
            show_help
            exit 0
            ;;
        *)
            if [[ -z "$PROJECT_NAME" ]]; then
                PROJECT_NAME="$1"
            else
                print_error "Unknown argument: $1"
                show_help
                exit 1
            fi
            shift
            ;;
    esac
done

# Validate required arguments
if [[ -z "$PROJECT_NAME" ]]; then
    print_error "Project name is required"
    show_help
    exit 1
fi

# Check if project directory exists
if [[ ! -d "$PROJECT_NAME" ]]; then
    print_error "Project directory '$PROJECT_NAME' not found"
    exit 1
fi

print_status "Setting up Go environment for project: $PROJECT_NAME"
print_status "Go version: $GO_VERSION"

# Change to project directory
cd "$PROJECT_NAME"

# Check if Go is installed
if ! command -v go &> /dev/null; then
    print_warning "Go is not installed. Installing Go $GO_VERSION..."

    # Detect OS
    OS=$(uname -s | tr '[:upper:]' '[:lower:]')
    ARCH=$(uname -m | tr '[:upper:]' '[:lower:]')

    # Map architecture
    case $ARCH in
        x86_64) ARCH="amd64" ;;
        aarch64|arm64) ARCH="arm64" ;;
        *) print_error "Unsupported architecture: $ARCH"; exit 1 ;;
    esac

    GO_TAR="go${GO_VERSION}.${OS}-${ARCH}.tar.gz"
    DOWNLOAD_URL="https://go.dev/dl/${GO_TAR}"

    # Download and install Go
    print_status "Downloading Go from: $DOWNLOAD_URL"
    wget -q "$DOWNLOAD_URL"

    print_status "Installing Go..."
    sudo tar -C /usr/local -xzf "$GO_TAR"

    # Add to PATH if not already there
    if ! grep -q 'export PATH=$PATH:/usr/local/go/bin' ~/.bashrc; then
        echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc
        print_status "Added Go to PATH in ~/.bashrc"
    fi

    # Clean up
    rm "$GO_TAR"

    export PATH=$PATH:/usr/local/go/bin
    print_status "Go installation completed"
fi

# Verify Go installation
GO_INSTALLED_VERSION=$(go version | cut -d' ' -f3 | sed 's/go//')
print_status "Installed Go version: $GO_INSTALLED_VERSION"

# Initialize Go module if not exists
if [[ ! -f "go.mod" ]]; then
    print_status "Initializing Go module..."
    go mod init "github.com/akordium/$PROJECT_NAME"
    print_status "Go module initialized"
else
    print_status "Go module already exists"
fi

# Create standard Go project structure
print_status "Creating project structure..."
mkdir -p cmd/server
mkdir -p internal/{config,handlers,models,services,utils}
mkdir -p pkg/{api,auth,validation}
mkdir -p scripts
mkdir -p docs
mkdir -p deployments
mkdir -p tests

# Create basic files
print_status "Creating basic files..."

# .gitignore
cat > .gitignore << EOF
# Binaries for programs and plugins
*.exe
*.exe~
*.dll
*.so
*.dylib

# Test binary, built with `go test -c`
*.test

# Output of the go coverage tool
*.out

# Go workspace file
go.work

# Environment variables
.env
.env.local
.env.staging
.env.production

# IDE
.vscode/
.idea/
*.swp
*.swo

# OS
.DS_Store
Thumbs.db

# Logs
logs/
*.log

# Database
*.db
*.sqlite

# Coverage
coverage.out
coverage.html
EOF

# Makefile
cat > Makefile << EOF
.PHONY: build run test clean install lint format

# Variables
APP_NAME := $PROJECT_NAME
BUILD_DIR := bin
MAIN_FILE := cmd/server/main.go

# Default target
all: install build

# Install dependencies
install:
	@echo "Installing dependencies..."
	go mod download
	go mod tidy

# Build application
build:
	@echo "Building \$(APP_NAME)..."
	mkdir -p \$(BUILD_DIR)
	go build -o \$(BUILD_DIR)/\$(APP_NAME) \$(MAIN_FILE)

# Run application
run:
	@echo "Running \$(APP_NAME)..."
	go run \$(MAIN_FILE)

# Run tests
test:
	@echo "Running tests..."
	go test -v ./...

# Run tests with coverage
test-coverage:
	@echo "Running tests with coverage..."
	go test -v -coverprofile=coverage.out ./...
	go tool cover -html=coverage.out -o coverage.html

# Lint code
lint:
	@echo "Linting code..."
	golangci-lint run

# Format code
format:
	@echo "Formatting code..."
	go fmt ./...
	goimports -w .

# Clean build artifacts
clean:
	@echo "Cleaning..."
	rm -rf \$(BUILD_DIR)
	rm -f coverage.out coverage.html

# Build Docker image
docker-build:
	@echo "Building Docker image..."
	docker build -t akordium/\$(APP_NAME):latest .

# Run with hot reload (requires air)
dev:
	@echo "Running in development mode..."
	air -c .air.toml

# Migration helpers
migrate-up:
	@echo "Running migrations..."
	go run cmd/migrate/main.go up

migrate-down:
	@echo "Rolling back migrations..."
	go run cmd/migrate/main.go down
EOF

# .air.toml for hot reload
cat > .air.toml << EOF
root = "."
testdata_dir = "testdata"
tmp_dir = "tmp"

[build]
  bin = "./tmp/main"
  cmd = "go build -o ./tmp/main ./cmd/server"
  delay = 1000
  exclude_dir = ["assets", "tmp", "vendor", "testdata"]
  exclude_file = []
  exclude_regex = ["_test.go"]
  exclude_unchanged = false
  follow_symlink = false
  full_bin = ""
  include_dir = []
  include_ext = ["go", "tpl", "tmpl", "html"]
  kill_delay = "0s"
  log = "build-errors.log"
  send_interrupt = false
  stop_on_root = false

[color]
  app = ""
  build = "yellow"
  main = "magenta"
  runner = "green"
  watcher = "cyan"

[log]
  time = true

[misc]
  clean_on_exit = false
EOF

# Install development tools
print_status "Installing development tools..."
go install github.com/cosmtrek/air@latest
go install golang.org/x/tools/cmd/goimports@latest
go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest

# Set up pre-commit hooks
print_status "Setting up pre-commit hooks..."
if [[ ! -d ".git/hooks" ]]; then
    git init
fi

cat > .pre-commit-config.yaml << EOF
repos:
  - repo: https://github.com/pre-commit/pre-commit-hooks
    rev: v4.4.0
    hooks:
      - id: trailing-whitespace
      - id: end-of-file-fixer
      - id: check-yaml
      - id: check-added-large-files

  - repo: local
    hooks:
      - id: go-fmt
        name: go fmt
        entry: gofmt
        language: system
        args: [-w]
        files: \\.go$

      - id: go-imports
        name: go imports
        entry: goimports
        language: system
        args: [-w]
        files: \\.go$

      - id: go-lint
        name: golangci-lint
        entry: golangci-lint run --fix
        language: system
        files: \\.go$
        pass_filenames: false

      - id: go-test
        name: go test
        entry: go test
        language: system
        args: [-v, ./...]
        files: \\.go$
        pass_filenames: false
EOF

print_status "Setting up completed successfully!"
print_status ""
print_status "Next steps:"
print_status "1. Source your bashrc: source ~/.bashrc"
print_status "2. Install pre-commit: pip install pre-commit"
print_status "3. Install pre-commit hooks: pre-commit install"
print_status "4. Run 'make install' to install dependencies"
print_status "5. Run 'make dev' to start development server"
print_status ""
print_status "Available commands:"
print_status "- make build      Build the application"
print_status "- make run        Run the application"
print_status "- make test       Run tests"
print_status "- make dev        Run with hot reload"
print_status "- make lint       Lint code"
print_status "- make format     Format code"