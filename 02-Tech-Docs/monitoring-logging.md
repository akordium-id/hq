# 📊 Monitoring & Logging Standards

Comprehensive monitoring dan logging strategy untuk semua Akordium Lab products. Fokus pada observability, alerting, dan operational excellence.

## 🎯 Monitoring Philosophy

### **Core Principles**
- **Observability First:** Systems designed untuk monitored
- **Metrics-Driven:** Data-informed decisions
- **Proactive Monitoring:** Detect issues before users do
- **Contextual Logging:** Structured logs dengan relevant context
- **Single Source of Truth:** Centralized monitoring platform

### **Monitoring Stack**
- **Infrastructure Monitoring:** System metrics, uptime, performance
- **Application Monitoring:** Error rates, response times, business metrics
- **Log Management:** Centralized log aggregation dan search
- **Alerting:** Intelligent alerting dengan proper escalation
- **Visualization:** Real-time dashboards dan historical trends

## 📈 Infrastructure Monitoring

### **System Metrics Collection**
```yaml
# Prometheus Configuration for System Monitoring
global:
  scrape_interval: 15s
  evaluation_interval: 15s

scrape_configs:
  - job_name: 'node-exporter'
    static_configs:
      - targets: ['localhost:9100']
    metrics_path: /metrics
    scrape_interval: 10s

  - job_name: 'postgres-exporter'
    static_configs:
      - targets: ['localhost:9187']
    metrics_path: /metrics

  - job_name: 'docker'
    static_configs:
      - targets: ['localhost:9323']
    metrics_path: /metrics

  - job_name: 'nginx'
    static_configs:
      - targets: ['localhost:9113']
    metrics_path: /metrics
```

### **Key System Metrics**
```yaml
# Essential System Metrics
system_metrics:
  cpu:
    - cpu_usage_percent
    - load_average_1m
    - load_average_5m
    - load_average_15m

  memory:
    - memory_usage_percent
    - memory_available_bytes
    - memory_cached_bytes
    - swap_usage_percent

  disk:
    - disk_usage_percent
    - disk_io_read_bytes_per_sec
    - disk_io_write_bytes_per_sec
    - disk_free_bytes

  network:
    - network_bytes_sent_per_sec
    - network_bytes_received_per_sec
    - network_errors_per_sec
    - network_connections_active

  database:
    - postgres_connections_active
    - postgres_connections_max
    - postgres_query_duration_seconds
    - postgres_deadlocks_total
```

### **Dashboard Configuration**
```yaml
# Grafana Dashboard - System Overview
dashboard:
  title: "Akordium Lab - System Overview"
  panels:
    - title: "CPU Usage"
      type: graph
      targets:
        - expr: "100 * (1 - avg(rate(node_cpu_seconds_total{mode='idle'}[5m])))"
          legendFormat: "CPU %"

    - title: "Memory Usage"
      type: graph
      targets:
        - expr: "100 * ((1 - (node_memory_MemAvailable_bytes / node_memory_MemTotal_bytes)))"
          legendFormat: "Memory %"

    - title: "Disk Usage"
      type: singlestat
      targets:
        - expr: "100 * (1 - (node_filesystem_avail_bytes / node_filesystem_size_bytes))"

    - title: "Database Connections"
      type: graph
      targets:
        - expr: "pg_stat_activity_count"
          legendFormat: "Active Connections"
```

## 🏗️ Application Monitoring

### **Application Metrics (Go)**
```go
// Prometheus Metrics Collection
package monitoring

import (
    "github.com/prometheus/client_golang/prometheus"
    "github.com/prometheus/client_golang/prometheus/promauto"
)

var (
    // HTTP Request Metrics
    httpRequestsTotal = promauto.NewCounterVec(
        prometheus.CounterOpts{
            Name: "http_requests_total",
            Help: "Total number of HTTP requests",
        },
        []string{"method", "endpoint", "status_code"},
    )

    httpRequestDuration = promauto.NewHistogramVec(
        prometheus.HistogramOpts{
            Name: "http_request_duration_seconds",
            Help: "HTTP request duration in seconds",
            Buckets: []float64{0.005, 0.01, 0.025, 0.05, 0.1, 0.25, 0.5, 1, 2.5, 5, 10},
        },
        []string{"method", "endpoint"},
    )

    // Business Metrics
    userRegistrationsTotal = promauto.NewCounter(
        prometheus.CounterOpts{
            Name: "user_registrations_total",
            Help: "Total number of user registrations",
        },
    )

    transactionsTotal = promauto.NewCounterVec(
        prometheus.CounterOpts{
            Name: "transactions_total",
            Help: "Total number of transactions",
        },
        []string{"status", "payment_method"},
    )

    // Database Metrics
    databaseConnectionsActive = promauto.NewGauge(
        prometheus.GaugeOpts{
            Name: "database_connections_active",
            Help: "Number of active database connections",
        },
    )

    databaseQueryDuration = promauto.NewHistogramVec(
        prometheus.HistogramOpts{
            Name: "database_query_duration_seconds",
            Help: "Database query duration in seconds",
            Buckets: []float64{0.001, 0.005, 0.01, 0.025, 0.05, 0.1, 0.25, 0.5, 1, 2.5, 5},
        },
        []string{"query_type", "table"},
    )
)

// Middleware for HTTP Metrics
func PrometheusMiddleware(handler http.Handler) http.Handler {
    return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
        start := time.Now()

        // Wrap response writer to capture status code
        rw := &responseWriter{ResponseWriter: w, statusCode: 200}

        handler.ServeHTTP(rw, r)

        duration := time.Since(start).Seconds()

        httpRequestsTotal.WithLabelValues(
            r.Method,
            r.URL.Path,
            fmt.Sprintf("%d", rw.statusCode),
        ).Inc()

        httpRequestDuration.WithLabelValues(
            r.Method,
            r.URL.Path,
        ).Observe(duration)
    })
}

type responseWriter struct {
    http.ResponseWriter
    statusCode int
}

func (rw *responseWriter) WriteHeader(code int) {
    rw.statusCode = code
    rw.ResponseWriter.WriteHeader(code)
}
```

### **Application Metrics (Laravel)**
```php
// Laravel Metrics Package
<?php

namespace App\Metrics;

use PrometheusExporter;

class ApplicationMetrics
{
    protected $prometheus;

    public function __construct()
    {
        $this->prometheus = new PrometheusExporter();
    }

    public function recordUserRegistration()
    {
        $this->prometheus->incrementCounter('user_registrations_total');
    }

    public function recordTransaction($status, $paymentMethod)
    {
        $this->prometheus->incrementCounter(
            'transactions_total',
            ['status' => $status, 'payment_method' => $paymentMethod]
        );
    }

    public function recordAPIRequest($method, $endpoint, $statusCode, $duration)
    {
        $this->prometheus->incrementCounter(
            'http_requests_total',
            ['method' => $method, 'endpoint' => $endpoint, 'status_code' => (string)$statusCode]
        );

        $this->prometheus->recordHistogram(
            'http_request_duration_seconds',
            $duration,
            ['method' => $method, 'endpoint' => $endpoint]
        );
    }

    public function recordDatabaseQuery($queryType, $table, $duration)
    {
        $this->prometheus->recordHistogram(
            'database_query_duration_seconds',
            $duration,
            ['query_type' => $queryType, 'table' => $table]
        );
    }
}
```

### **Business Metrics Dashboard**
```yaml
# Grafana Dashboard - Business Metrics
dashboard:
  title: "Akordium Lab - Business Metrics"
  panels:
    - title: "User Registrations"
      type: graph
      targets:
        - expr: "rate(user_registrations_total[1h])"
          legendFormat: "Registrations/Hour"

    - title: "Active Users"
      type: graph
      targets:
        - expr: "active_users_total"
          legendFormat: "Active Users"

    - title: "Transaction Volume"
      type: graph
      targets:
        - expr: "sum(rate(transactions_total[5m])) by (status)"
          legendFormat: "Transactions"

    - title: "Revenue Trend"
      type: graph
      targets:
        - expr: "sum(rate(revenue_total[1h]))"
          legendFormat: "Revenue/Hour"

    - title: "Conversion Rate"
      type: singlestat
      targets:
        - expr: "(sum(rate(user_registrations_total[1d])) / sum(rate(visitors_total[1d]))) * 100"
```

## 📝 Structured Logging

### **Log Structure Standards**
```json
// Standard Log Entry Structure
{
  "timestamp": "2024-12-01T10:30:00.000Z",
  "level": "info",
  "service": "waqfwise-api",
  "version": "v1.2.3",
  "request_id": "uuid-generated-per-request",
  "user_id": 12345,
  "session_id": "session-uuid",
  "message": "User created waqf project",
  "context": {
    "action": "create_project",
    "component": "ProjectController",
    "function": "create",
    "line": 42
  },
  "data": {
    "project_id": 789,
    "project_name": "Education Waqf Fund",
    "target_amount": 100000000,
    "category": "education"
  },
  "duration_ms": 245,
  "ip_address": "192.168.1.100",
  "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36"
}
```

### **Logging Implementation (Go)**
```go
// Structured Logger Implementation
package logger

import (
    "context"
    "encoding/json"
    "fmt"
    "log"
    "os"
    "time"
)

type LogLevel string

const (
    LogLevelDebug LogLevel = "debug"
    LogLevelInfo  LogLevel = "info"
    LogLevelWarn  LogLevel = "warn"
    LogLevelError LogLevel = "error"
)

type Logger struct {
    service  string
    version  string
    hostname string
}

type LogEntry struct {
    Timestamp  string                 `json:"timestamp"`
    Level      string                 `json:"level"`
    Service    string                 `json:"service"`
    Version    string                 `json:"version"`
    RequestID  string                 `json:"request_id,omitempty"`
    UserID     string                 `json:"user_id,omitempty"`
    SessionID  string                 `json:"session_id,omitempty"`
    Message    string                 `json:"message"`
    Context    map[string]interface{} `json:"context,omitempty"`
    Data       map[string]interface{} `json:"data,omitempty"`
    DurationMs int64                  `json:"duration_ms,omitempty"`
    IPAddress  string                 `json:"ip_address,omitempty"`
    UserAgent  string                 `json:"user_agent,omitempty"`
}

func NewLogger(service, version string) *Logger {
    hostname, _ := os.Hostname()
    return &Logger{
        service:  service,
        version:  version,
        hostname: hostname,
    }
}

func (l *Logger) log(level LogLevel, message string, context map[string]interface{}, data map[string]interface{}, duration time.Duration) {
    entry := LogEntry{
        Timestamp: time.Now().Format(time.RFC3339Nano),
        Level:     string(level),
        Service:   l.service,
        Version:   l.version,
        Message:   message,
        Context:   context,
        Data:      data,
    }

    if duration > 0 {
        entry.DurationMs = duration.Milliseconds()
    }

    jsonBytes, err := json.Marshal(entry)
    if err != nil {
        log.Printf("Failed to marshal log entry: %v", err)
        return
    }

    fmt.Println(string(jsonBytes))
}

func (l *Logger) Info(message string, context map[string]interface{}, data map[string]interface{}) {
    l.log(LogLevelInfo, message, context, data, 0)
}

func (l *Logger) Error(message string, context map[string]interface{}, data map[string]interface{}) {
    l.log(LogLevelError, message, context, data, 0)
}

func (l *Logger) WithRequestID(requestID string) *Logger {
    // Return a new logger with request ID
    // In practice, you'd use context propagation
    return l
}

// Middleware for request logging
func RequestLogger(logger *Logger) func(http.Handler) http.Handler {
    return func(next http.Handler) http.Handler {
        return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
            start := time.Now()

            // Generate request ID
            requestID := generateRequestID()
            r.Header.Set("X-Request-ID", requestID)

            // Log request
            logger.Info(
                "HTTP request started",
                map[string]interface{}{
                    "action":    "request_start",
                    "method":    r.Method,
                    "path":      r.URL.Path,
                    "query":     r.URL.RawQuery,
                    "ip_address": r.RemoteAddr,
                    "user_agent": r.UserAgent(),
                },
                nil,
                0,
            )

            // Wrap response writer
            rw := &responseWriter{ResponseWriter: w, statusCode: 200}

            // Process request
            next.ServeHTTP(rw, r)

            // Log response
            duration := time.Since(start)
            logger.Info(
                "HTTP request completed",
                map[string]interface{}{
                    "action":      "request_end",
                    "method":      r.Method,
                    "path":        r.URL.Path,
                    "status_code": rw.statusCode,
                    "duration_ms": duration.Milliseconds(),
                },
                nil,
                0,
            )
        })
    }
}
```

### **Logging Implementation (Laravel)**
```php
<?php

namespace App\Logging;

use Monolog\Logger;
use Monolog\Handler\StreamHandler;
use Monolog\Processor\IntrospectionProcessor;
use Monolog\Processor\WebProcessor;

class StructuredLogger
{
    protected $logger;
    protected $service;
    protected $version;

    public function __construct($service, $version)
    {
        $this->service = $service;
        $this->version = $version;

        $this->logger = new Logger($service);
        $this->logger->pushHandler(new StreamHandler(
            'php://stdout',
            Logger::INFO
        ));

        $this->logger->pushProcessor(new IntrospectionProcessor());
        $this->logger->pushProcessor(new WebProcessor());
    }

    public function info($message, array $context = [], array $data = [])
    {
        $this->log('info', $message, $context, $data);
    }

    public function error($message, array $context = [], array $data = [])
    {
        $this->log('error', $message, $context, $data);
    }

    public function warning($message, array $context = [], array $data = [])
    {
        $this->log('warning', $message, $context, $data);
    }

    protected function log($level, $message, array $context, array $data)
    {
        $logEntry = [
            'timestamp' => now()->toISOString(),
            'level' => $level,
            'service' => $this->service,
            'version' => $this->version,
            'message' => $message,
            'context' => $context,
            'data' => $data,
        ];

        // Add request context if available
        if (request()->hasHeader('X-Request-ID')) {
            $logEntry['request_id'] = request()->header('X-Request-ID');
        }

        if (auth()->check()) {
            $logEntry['user_id'] = auth()->id();
        }

        $this->logger->info(json_encode($logEntry));
    }
}

// Middleware for request logging
class RequestLoggingMiddleware
{
    public function handle($request, Closure $next)
    {
        $startTime = microtime(true);
        $requestId = $this->generateRequestId();

        $request->headers->set('X-Request-ID', $requestId);

        logger()->info('HTTP request started', [
            'action' => 'request_start',
            'method' => $request->method(),
            'path' => $request->path(),
            'ip_address' => $request->ip(),
        ]);

        $response = $next($request);

        $duration = (microtime(true) - $startTime) * 1000;

        logger()->info('HTTP request completed', [
            'action' => 'request_end',
            'method' => $request->method(),
            'path' => $request->path(),
            'status_code' => $response->getStatusCode(),
            'duration_ms' => round($duration, 2),
        ]);

        return $response;
    }

    protected function generateRequestId()
    {
        return uniqid('req_', true);
    }
}
```

## 🔍 Log Management

### **ELK Stack Configuration**
```yaml
# Docker Compose for ELK Stack
version: '3.8'

services:
  elasticsearch:
    image: docker.elastic.co/elasticsearch/elasticsearch:8.5.0
    environment:
      - discovery.type=single-node
      - "ES_JAVA_OPTS=-Xms512m -Xmx512m"
    ports:
      - "9200:9200"
    volumes:
      - elasticsearch_data:/usr/share/elasticsearch/data

  logstash:
    image: docker.elastic.co/logstash/logstash:8.5.0
    ports:
      - "5044:5044"
    volumes:
      - ./logstash/pipeline:/usr/share/logstash/pipeline
      - ./logstash/config/logstash.yml:/usr/share/logstash/config/logstash.yml
    depends_on:
      - elasticsearch

  kibana:
    image: docker.elastic.co/kibana/kibana:8.5.0
    ports:
      - "5601:5601"
    environment:
      - ELASTICSEARCH_HOSTS=http://elasticsearch:9200
    depends_on:
      - elasticsearch

volumes:
  elasticsearch_data:
```

### **Logstash Configuration**
```ruby
# logstash/pipeline/logstash.conf
input {
  beats {
    port => 5044
  }

  tcp {
    port => 5000
    codec => json
  }
}

filter {
  # Parse JSON logs
  if [message] {
    json {
      source => "message"
    }
  }

  # Add timestamp
  if ![timestamp] {
    mutate {
      add_field => { "timestamp" => "%{@timestamp}" }
    }
  }

  # Parse log level
  if [level] == "error" {
    mutate { add_tag => ["error"] }
  } else if [level] == "warn" {
    mutate { add_tag => ["warning"] }
  }

  # Extract request ID for tracing
  if [request_id] {
    mutate {
      add_field => { "trace_id" => "%{request_id}" }
    }
  }
}

output {
  elasticsearch {
    hosts => ["elasticsearch:9200"]
    index => "akordium-logs-%{+YYYY.MM.dd}"
  }

  stdout {
    codec => rubydebug
  }
}
```

### **Filebeat Configuration**
```yaml
# filebeat.yml
filebeat.inputs:
  - type: log
    enabled: true
    paths:
      - /var/log/akordium/*.log
    fields:
      service: akordium-api
      environment: production
    fields_under_root: true

output.logstash:
  hosts: ["logstash:5044"]

processors:
  - add_docker_metadata: ~
  - add_host_metadata: ~
```

## 🚨 Alerting Strategy

### **Prometheus Alerting Rules**
```yaml
# alerts.yml
groups:
  - name: akordium_alerts
    rules:
      - alert: HighErrorRate
        expr: rate(http_requests_total{status_code=~"5.."}[5m]) / rate(http_requests_total[5m]) > 0.05
        for: 2m
        labels:
          severity: critical
          service: api
        annotations:
          summary: "High error rate detected"
          description: "Error rate is {{ $value | humanizePercentage }} (threshold: 5%)"

      - alert: HighResponseTime
        expr: histogram_quantile(0.95, rate(http_request_duration_seconds_bucket[5m])) > 1.0
        for: 3m
        labels:
          severity: warning
          service: api
        annotations:
          summary: "High response time detected"
          description: "95th percentile response time is {{ $value }}s (threshold: 1s)"

      - alert: DatabaseConnectionHigh
        expr: pg_stat_activity_count > 80
        for: 1m
        labels:
          severity: warning
          service: database
        annotations:
          summary: "High database connections"
          description: "{{ $value }} active connections (threshold: 80)"

      - alert: DiskSpaceLow
        expr: (1 - (node_filesystem_avail_bytes / node_filesystem_size_bytes)) > 0.85
        for: 5m
        labels:
          severity: critical
          service: infrastructure
        annotations:
          summary: "Low disk space"
          description: "Disk usage is {{ $value | humanizePercentage }} (threshold: 85%)"

      - alert: MemoryUsageHigh
        expr: (1 - (node_memory_MemAvailable_bytes / node_memory_MemTotal_bytes)) > 0.9
        for: 2m
        labels:
          severity: critical
          service: infrastructure
        annotations:
          summary: "High memory usage"
          description: "Memory usage is {{ $value | humanizePercentage }} (threshold: 90%)"

      - alert: ServiceDown
        expr: up == 0
        for: 1m
        labels:
          severity: critical
        annotations:
          summary: "Service is down"
          description: "{{ $labels.job }} service is down"
```

### **Alert Manager Configuration**
```yaml
# alertmanager.yml
global:
  smtp_smarthost: 'smtp.gmail.com:587'
  smtp_from: 'alerts@akordium.id'
  smtp_auth_username: 'alerts@akordium.id'
  smtp_auth_password: 'app-password'

route:
  group_by: ['alertname']
  group_wait: 10s
  group_interval: 10s
  repeat_interval: 1h
  receiver: 'web.hook'

receivers:
  - name: 'web.hook'
    webhook_configs:
      - url: 'http://localhost:5001/alerts'
        send_resolved: true

  - name: 'email.notifications'
    email_configs:
      - to: 'devops@akordium.id'
        subject: '[Akordium Alert] {{ .GroupLabels.alertname }}'
        body: |
          {{ range .Alerts }}
          Alert: {{ .Annotations.summary }}
          Description: {{ .Annotations.description }}
          Labels: {{ range .Labels.SortedPairs }}{{ .Name }}={{ .Value }} {{ end }}
          {{ end }}

inhibit_rules:
  - source_match:
      alertname: 'ServiceDown'
    target_match:
      alertname: 'HighErrorRate'
    equal: ['service']
```

## 📊 Dashboard Templates

### **Application Performance Dashboard**
```yaml
dashboard:
  title: "Application Performance Overview"
  tags: ["performance", "application"]
  panels:
    - title: "Request Rate"
      type: graph
      targets:
        - expr: "sum(rate(http_requests_total[5m])) by (method)"
          legendFormat: "{{method}}"

    - title: "Response Time Percentiles"
      type: graph
      targets:
        - expr: "histogram_quantile(0.50, rate(http_request_duration_seconds_bucket[5m]))"
          legendFormat: "50th percentile"
        - expr: "histogram_quantile(0.95, rate(http_request_duration_seconds_bucket[5m]))"
          legendFormat: "95th percentile"
        - expr: "histogram_quantile(0.99, rate(http_request_duration_seconds_bucket[5m]))"
          legendFormat: "99th percentile"

    - title: "Error Rate"
      type: graph
      targets:
        - expr: "sum(rate(http_requests_total{status_code=~\"4..\"}[5m])) by (status_code) / sum(rate(http_requests_total[5m]))"
          legendFormat: "{{status_code}}"

    - title: "Database Query Performance"
      type: graph
      targets:
        - expr: "histogram_quantile(0.95, rate(database_query_duration_seconds_bucket[5m])) by (query_type)"
          legendFormat: "{{query_type}}"
```

### **Infrastructure Health Dashboard**
```yaml
dashboard:
  title: "Infrastructure Health"
  tags: ["infrastructure", "system"]
  panels:
    - title: "CPU Usage"
      type: graph
      targets:
        - expr: "100 * (1 - avg(rate(node_cpu_seconds_total{mode='idle'}[5m])))"
          legendFormat: "{{instance}}"

    - title: "Memory Usage"
      type: graph
      targets:
        - expr: "100 * ((1 - (node_memory_MemAvailable_bytes / node_memory_MemTotal_bytes)))"
          legendFormat: "{{instance}}"

    - title: "Disk Usage"
      type: singlestat
      targets:
        - expr: "100 * (1 - (node_filesystem_avail_bytes / node_filesystem_size_bytes))"

    - title: "Database Connections"
      type: graph
      targets:
        - expr: "pg_stat_activity_count"
          legendFormat: "Active Connections"

    - title: "System Load"
      type: graph
      targets:
        - expr: "node_load1"
          legendFormat: "1m load"
        - expr: "node_load5"
          legendFormat: "5m load"
```

## 📱 Real User Monitoring (RUM)

### **Frontend Performance Monitoring**
```typescript
// JavaScript Performance Monitoring
class PerformanceMonitor {
    constructor() {
        this.metrics = [];
        this.setupPerformanceObserver();
        this.setupErrorTracking();
    }

    setupPerformanceObserver() {
        // Observe page navigation
        const navObserver = new PerformanceObserver((list) => {
            for (const entry of list.getEntries()) {
                if (entry.entryType === 'navigation') {
                    this.recordPageLoadMetrics(entry);
                }
            }
        });

        navObserver.observe({ entryTypes: ['navigation'] });

        // Observe resource loading
        const resourceObserver = new PerformanceObserver((list) => {
            for (const entry of list.getEntries()) {
                this.recordResourceMetrics(entry);
            }
        });

        resourceObserver.observe({ entryTypes: ['resource'] });
    }

    recordPageLoadMetrics(entry) {
        const metrics = {
            timestamp: Date.now(),
            type: 'page_load',
            url: entry.name,
            domContentLoaded: entry.domContentLoadedEventEnd - entry.domContentLoadedEventStart,
            loadComplete: entry.loadEventEnd - entry.loadEventStart,
            firstPaint: this.getFirstPaint(),
            firstContentfulPaint: this.getFirstContentfulPaint(),
        };

        this.sendMetrics(metrics);
    }

    recordResourceMetrics(entry) {
        const metrics = {
            timestamp: Date.now(),
            type: 'resource_load',
            url: entry.name,
            duration: entry.duration,
            size: entry.transferSize || entry.encodedBodySize,
            resourceType: this.getResourceType(entry.name),
        };

        this.sendMetrics(metrics);
    }

    setupErrorTracking() {
        window.addEventListener('error', (event) => {
            this.recordError({
                type: 'javascript_error',
                message: event.message,
                filename: event.filename,
                line: event.lineno,
                column: event.colno,
                stack: event.error?.stack,
            });
        });

        window.addEventListener('unhandledrejection', (event) => {
            this.recordError({
                type: 'promise_rejection',
                reason: event.reason,
                stack: event.reason?.stack,
            });
        });
    }

    recordError(error) {
        this.sendMetrics({
            timestamp: Date.now(),
            type: 'error',
            ...error,
        });
    }

    sendMetrics(metrics) {
        // Send to monitoring endpoint
        fetch('/api/v1/metrics', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(metrics),
        }).catch(err => {
            console.error('Failed to send metrics:', err);
        });
    }

    private getFirstPaint() {
        const paintEntries = performance.getEntriesByType('paint');
        return paintEntries.length > 0 ? paintEntries[0].startTime : 0;
    }

    private getFirstContentfulPaint() {
        const paintEntries = performance.getEntriesByType('paint');
        return paintEntries.length > 1 ? paintEntries[1].startTime : 0;
    }

    private getResourceType(url) {
        if (url.includes('.css')) return 'stylesheet';
        if (url.includes('.js')) return 'script';
        if (url.includes('.jpg') || url.includes('.png') || url.includes('.svg')) return 'image';
        if (url.includes('.woff') || url.includes('.ttf')) return 'font';
        return 'other';
    }
}

// Initialize monitoring
const performanceMonitor = new PerformanceMonitor();
```

## 🔧 Monitoring Tools Setup

### **Docker Compose Monitoring Stack**
```yaml
# monitoring-stack.yml
version: '3.8'

services:
  prometheus:
    image: prom/prometheus:latest
    ports:
      - "9090:9090"
    volumes:
      - ./prometheus.yml:/etc/prometheus/prometheus.yml
      - ./alerts.yml:/etc/prometheus/alerts.yml
      - prometheus_data:/prometheus

  grafana:
    image: grafana/grafana:latest
    ports:
      - "3001:3000"
    environment:
      - GF_SECURITY_ADMIN_PASSWORD=admin
      - GF_USERS_ALLOW_SIGN_UP=false
    volumes:
      - grafana_data:/var/lib/grafana
      - ./grafana/dashboards:/etc/grafana/provisioning/dashboards
      - ./grafana/datasources:/etc/grafana/provisioning/datasources

  alertmanager:
    image: prom/alertmanager:latest
    ports:
      - "9093:9093"
    volumes:
      - ./alertmanager.yml:/etc/alertmanager/alertmanager.yml
      - alertmanager_data:/alertmanager

  node-exporter:
    image: prom/node-exporter:latest
    ports:
      - "9100:9100"
    volumes:
      - /proc:/host/proc:ro
      - /sys:/host/sys:ro
      - /:/rootfs:ro

  postgres-exporter:
    image: prom/postgres-exporter:latest
    ports:
      - "9187:9187"
    environment:
      - DATA_SOURCE_NAME=postgresql://postgres:password@postgres:5432/postgres
    depends_on:
      - postgres

volumes:
  prometheus_data:
  grafana_data:
  alertmanager_data:
```

## 📋 Monitoring Checklist

### **Production Monitoring Requirements**
- [ ] **System Metrics:** CPU, memory, disk, network
- [ ] **Application Metrics:** Response time, error rate, throughput
- [ ] **Business Metrics:** User registrations, transactions, revenue
- [ ] **Database Monitoring:** Connection pool, query performance
- [ ] **Log Aggregation:** Centralized log collection and search
- [ ] **Alerting:** Critical alerts with proper escalation
- [ ] **Dashboards:** Real-time and historical dashboards
- [ ] **RUM:** Frontend performance monitoring
- [ ] **Health Checks:** Application health endpoints
- [ ] **Backup Monitoring:** Backup success verification
- [ ] **Security Monitoring:** Anomaly detection dan security events

### **Monitoring Best Practices**
- **Structured Logging:** Consistent log format dengan proper context
- **Metric Naming:** Standardized metric naming conventions
- **Alert Fatigue Prevention:** Intelligent alerting dengan thresholds
- **Retention Policies:** Appropriate data retention periods
- **Performance Baselines:** Establish normal performance benchmarks
- **Documentation:** Clear monitoring documentation dan runbooks

---

**Remember:** Monitoring is not just about collecting data - it's about gaining insights that enable proactive management and continuous improvement. Good monitoring turns reactive operations into proactive optimization.

*Related Documentation:* [Database Conventions](./database-conventions.md) | [Testing Strategy](./testing-strategy.md) | [Incident Response](../01-SOP/incident-response.md) | [Performance Guidelines](./performance-guidelines.md)