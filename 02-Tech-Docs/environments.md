# 🌍 Environments Management

Comprehensive environment setup dan management strategy untuk Akordium Lab development workflow. Mencakup development, staging, dan production environments dengan konsisten configuration.

## 🎯 Environment Strategy

### **Environment Hierarchy**

```text
┌─────────────────────────────────────────┐
│           Production                     │
│    ┌─────────────────────────────────┐   │
│    │     Live User Data              │   │
│    │     Real Transactions           │   │
│    │     High Security               │   │
│    │     24/7 Monitoring             │   │
│    └─────────────────────────────────┘   │
└─────────────────┬───────────────────────┘
                  │ (Promote from Staging)
┌─────────────────▼───────────────────────┐
│             Staging                     │
│    ┌─────────────────────────────────┐   │
│    │     Pre-Production Testing      │   │
│    │     Production-like Data        │   │
│    │     Final Integration Tests     │   │
│    │     Performance Validation      │   │
│    └─────────────────────────────────┘   │
└─────────────────┬───────────────────────┘
                  │ (Deploy from Development)
┌─────────────────▼───────────────────────┐
│           Development                   │
│    ┌─────────────────────────────────┐   │
│    │     Feature Development         │   │
│    │     Unit Testing                │   │
│    │     Debugging                   │   │
│    │     Hot Reloading               │   │
│    └─────────────────────────────────┘   │
└─────────────────────────────────────────┘
```

### **Environment Philosophy**

- **Development:** Fast iteration, debugging capabilities, sample data
- **Staging:** Production mirror, integration testing, performance validation
- **Production:** Optimized untuk performance, security, reliability
- **Consistency:** Same infrastructure stack across all environments
- **Automation:** Automated deployment dan environment provisioning

## 🛠️ Development Environment

### **Local Development Setup**

```bash
# 1. Environment Setup
git clone <repository>
cd <project>

# 2. Install Dependencies
# PHP Projects
composer install
npm install

# Go Projects
go mod download
go mod tidy

# 3. Environment Configuration
cp .env.example .env.local
php artisan key:generate  # Laravel

# 4. Database Setup
docker-compose up -d postgres redis
# atau
createdb akordium_dev

# 5. Run Migrations
php artisan migrate  # Laravel
# atau
go run cmd/migrate/main.go  # Go

# 6. Seed Development Data
php artisan db:seed
# atau
go run cmd/seed/main.go
```

### **Docker Development Stack**

```yaml
# docker-compose.dev.yml
version: '3.8'

services:
  app:
    build:
      context: .
      dockerfile: Dockerfile.dev
    ports:
      - "3000:3000"
      - "9000:9000"
    volumes:
      - .:/var/www/html
      - /var/www/html/vendor
      - /var/www/html/node_modules
    environment:
      - APP_ENV=local
      - APP_DEBUG=true
      - DB_HOST=postgres
      - DB_PORT=5432
      - DB_DATABASE=akordium_dev
      - DB_USERNAME=dev
      - DB_PASSWORD=dev123
    depends_on:
      - postgres
      - redis
    networks:
      - akordium-network

  postgres:
    image: postgres:15-alpine
    ports:
      - "5432:5432"
    environment:
      - POSTGRES_DB=akordium_dev
      - POSTGRES_USER=dev
      - POSTGRES_PASSWORD=dev123
    volumes:
      - postgres_data:/var/lib/postgresql/data
      - ./scripts/init-dev-db.sql:/docker-entrypoint-initdb.d/init.sql
    networks:
      - akordium-network

  redis:
    image: redis:7-alpine
    ports:
      - "6379:6379"
    volumes:
      - redis_data:/data
    networks:
      - akordium-network

  nginx:
    image: nginx:alpine
    ports:
      - "8080:80"
    volumes:
      - ./docker/nginx/dev.conf:/etc/nginx/conf.d/default.conf
      - .:/var/www/html
    depends_on:
      - app
    networks:
      - akordium-network

volumes:
  postgres_data:
  redis_data:

networks:
  akordium-network:
    driver: bridge
```

### **Development Environment Configuration**

```bash
# .env.development
APP_NAME="Akordium Lab - Development"
APP_ENV=local
APP_DEBUG=true
APP_URL=http://localhost:3000

LOG_CHANNEL=stack
LOG_DEPRECATIONS_CHANNEL=null
LOG_LEVEL=debug

DB_CONNECTION=pgsql
DB_HOST=127.0.0.1
DB_PORT=5432
DB_DATABASE=akordium_dev
DB_USERNAME=dev
DB_PASSWORD=dev123

BROADCAST_DRIVER=log
CACHE_DRIVER=redis
FILESYSTEM_DISK=local
QUEUE_CONNECTION=sync
SESSION_DRIVER=redis
SESSION_LIFETIME=120

REDIS_HOST=127.0.0.1
REDIS_PASSWORD=null
REDIS_PORT=6379

MAIL_MAILER=smtp
MAIL_HOST=mailhog
MAIL_PORT=1025
MAIL_USERNAME=null
MAIL_PASSWORD=null
MAIL_ENCRYPTION=null
MAIL_FROM_ADDRESS="dev@akordium.local"
MAIL_FROM_NAME="${APP_NAME}"

# Payment Gateway (Sandbox)
MIDTRANS_ENVIRONMENT=sandbox
MIDTRANS_CLIENT_KEY=SB-Mid-client-DEV_KEY
MIDTRANS_SERVER_KEY=SB-Mid-server-DEV_KEY

# Storage (Local)
FILESYSTEM_CLOUD=local
AWS_ACCESS_KEY_ID=null
AWS_SECRET_ACCESS_KEY=null
AWS_DEFAULT_REGION=null
AWS_BUCKET=null
AWS_ENDPOINT=null

# Monitoring (Development)
SENTRY_LARAVEL_DSN=null
SENTRY_TRACES_SAMPLE_RATE=1.0

# Search (Elasticsearch - Local)
ELASTICSEARCH_HOST=localhost:9200
ELASTICSEARCH_USERNAME=null
ELASTICSEARCH_PASSWORD=null

# Feature Flags
FEATURE_PAYMENTS=false
FEATURE_EMAIL_VERIFICATION=false
FEATURE_ANALYTICS=false
FEATURE_CACHE_BUSTING=true
```

### **Development Tools Integration**

```json
// .vscode/settings.json
{
    "php.debug.executablePath": "/usr/bin/php",
    "php.validate.executablePath": "/usr/bin/php",
    "go.toolsManagement.checkForUpdates": "local",
    "go.useLanguageServer": true,
    "go.gopath": "",
    "go.goroot": "",
    "files.associations": {
        "*.env": "dotenv"
    },
    "files.exclude": {
        "**/vendor": true,
        "**/node_modules": true
    },
    "search.exclude": {
        "**/vendor": true,
        "**/node_modules": true
    }
}
```

```json
// .vscode/launch.json
{
    "version": "0.2.0",
    "configurations": [
        {
            "name": "Listen for Xdebug",
            "type": "php",
            "request": "launch",
            "port": 9003,
            "pathMappings": {
                "/var/www/html": "${workspaceFolder}"
            }
        },
        {
            "name": "Launch Go App",
            "type": "go",
            "request": "launch",
            "mode": "auto",
            "program": "${workspaceFolder}",
            "env": {
                "GIN_MODE": "debug"
            }
        }
    ]
}
```

## 🧪 Staging Environment

### **Staging Infrastructure**

```bash
# staging/docker-compose.yml
version: '3.8'

services:
  app:
    image: akordium/app:staging
    restart: unless-stopped
    environment:
      - APP_ENV=staging
      - APP_DEBUG=false
      - APP_URL=https://staging.akordium.id
      - DB_HOST=postgres-staging
      - REDIS_HOST=redis-staging
      - CACHE_DRIVER=redis
      - SESSION_DRIVER=redis
      - QUEUE_CONNECTION=redis
    depends_on:
      - postgres-staging
      - redis-staging
    networks:
      - staging-network
    deploy:
      replicas: 1
      resources:
        limits:
          memory: 512M
        reservations:
          memory: 256M

  postgres-staging:
    image: postgres:15-alpine
    restart: unless-stopped
    environment:
      - POSTGRES_DB=akordium_staging
      - POSTGRES_USER=staging
      - POSTGRES_PASSWORD=${STAGING_DB_PASSWORD}
    volumes:
      - postgres_staging_data:/var/lib/postgresql/data
    networks:
      - staging-network
    deploy:
      resources:
        limits:
          memory: 1G
        reservations:
          memory: 512M

  redis-staging:
    image: redis:7-alpine
    restart: unless-stopped
    command: redis-server --maxmemory 256mb --maxmemory-policy allkeys-lru
    volumes:
      - redis_staging_data:/data
    networks:
      - staging-network

  nginx:
    image: nginx:alpine
    restart: unless-stopped
    ports:
      - "80:80"
      - "443:443"
    volumes:
      - ./nginx/staging.conf:/etc/nginx/conf.d/default.conf
      - ./ssl/staging:/etc/nginx/ssl
    depends_on:
      - app
    networks:
      - staging-network

volumes:
  postgres_staging_data:
  redis_staging_data:

networks:
  staging-network:
    driver: bridge
```

### **Staging Environment Configuration**

```bash
# .env.staging
APP_NAME="Akordium Lab - Staging"
APP_ENV=staging
APP_DEBUG=false
APP_URL=https://staging.akordium.id

LOG_CHANNEL=stack
LOG_LEVEL=info

DB_CONNECTION=pgsql
DB_HOST=postgres-staging
DB_PORT=5432
DB_DATABASE=akordium_staging
DB_USERNAME=staging
DB_PASSWORD=${STAGING_DB_PASSWORD}

CACHE_DRIVER=redis
REDIS_HOST=redis-staging
REDIS_PASSWORD=null
REDIS_PORT=6379

# Email (SendGrid Test)
MAIL_MAILER=smtp
MAIL_HOST=smtp.sendgrid.net
MAIL_PORT=587
MAIL_USERNAME=apikey
MAIL_PASSWORD=${SENDGRID_API_KEY}
MAIL_ENCRYPTION=tls
MAIL_FROM_ADDRESS="staging@akordium.id"
MAIL_FROM_NAME="Akordium Staging"

# Payment Gateway (Sandbox)
MIDTRANS_ENVIRONMENT=sandbox
MIDTRANS_CLIENT_KEY=${STAGING_MIDTRANS_CLIENT_KEY}
MIDTRANS_SERVER_KEY=${STAGING_MIDTRANS_SERVER_KEY}

# Storage (Cloudflare R2)
FILESYSTEM_CLOUD=r2
AWS_ACCESS_KEY_ID=${R2_ACCESS_KEY}
AWS_SECRET_ACCESS_KEY=${R2_SECRET_KEY}
AWS_DEFAULT_REGION=auto
AWS_BUCKET=akordium-staging
AWS_ENDPOINT=https://your-account-id.r2.cloudflarestorage.com

# Monitoring (Sentry Test)
SENTRY_LARAVEL_DSN=${STAGING_SENTRY_DSN}
SENTRY_TRACES_SAMPLE_RATE=0.5

# Analytics (Test)
GOOGLE_ANALYTICS_ID=GA-TEST-ID
MIXPANEL_TOKEN=${STAGING_MIXPANEL_TOKEN}

# Feature Flags (Staging)
FEATURE_PAYMENTS=true
FEATURE_EMAIL_VERIFICATION=true
FEATURE_ANALYTICS=true
FEATURE_CACHE_BUSTING=true

# Rate Limiting
RATE_LIMITING_ENABLED=true
RATE_LIMIT_REQUESTS_PER_MINUTE=60
```

### **Staging Data Management**

```bash
#!/bin/bash
# scripts/staging-data-sync.sh

# Sync production data structure to staging (without sensitive data)
echo "🔄 Syncing production data structure to staging..."

# 1. Backup staging database
pg_dump -h localhost -U staging -d akordium_staging > backup_staging_$(date +%Y%m%d).sql

# 2. Export production schema
pg_dump -h ${PROD_DB_HOST} -U ${PROD_DB_USER} -d akordium_prod --schema-only > prod_schema.sql

# 3. Import schema to staging
psql -h localhost -U staging -d akordium_staging < prod_schema.sql

# 4. Run migrations
php artisan migrate --force

# 5. Seed anonymized data
php artisan db:seed --class=StagingDataSeeder

echo "✅ Staging data sync completed"
```

```php
<?php
// database/seeders/StagingDataSeeder.php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use App\Models\User;
use App\Models\WaqfProject;
use App\Models\Transaction;

class StagingDataSeeder extends Seeder
{
    public function run(): void
    {
        // Create test users
        $users = [
            [
                'name' => 'Admin User',
                'email' => 'admin@staging.akordium.id',
                'password' => Hash::make('staging123'),
                'email_verified_at' => now(),
                'role' => 'admin'
            ],
            [
                'name' => 'Test User',
                'email' => 'user@staging.akordium.id',
                'password' => Hash::make('staging123'),
                'email_verified_at' => now(),
                'role' => 'user'
            ]
        ];

        foreach ($users as $user) {
            User::create($user);
        }

        // Create sample waqf projects
        WaqfProject::factory()->count(10)->create([
            'status' => 'active',
            'target_amount' => rand(10000000, 100000000),
            'current_amount' => fn($project) => rand(0, $project->target_amount)
        ]);

        // Create sample transactions
        Transaction::factory()->count(50)->create([
            'status' => 'completed',
            'amount' => rand(50000, 5000000)
        ]);

        $this->command->info('✅ Staging test data created successfully');
    }
}
```

## 🚀 Production Environment

### **Production Infrastructure**

```bash
# production/docker-compose.yml
version: '3.8'

services:
  app:
    image: akordium/app:${VERSION}
    restart: always
    environment:
      - APP_ENV=production
      - APP_DEBUG=false
      - APP_URL=https://akordium.id
      - DB_HOST=postgres-primary
      - DB_READ_HOST=postgres-replica
      - REDIS_HOST=redis-cluster
      - CACHE_DRIVER=redis
      - SESSION_DRIVER=redis
      - QUEUE_CONNECTION=redis
    depends_on:
      - postgres-primary
      - redis-cluster
    networks:
      - production-network
    deploy:
      replicas: 3
      resources:
        limits:
          memory: 1G
          cpus: '0.5'
        reservations:
          memory: 512M
          cpus: '0.25'
      restart_policy:
        condition: on-failure
        delay: 5s
        max_attempts: 3

  postgres-primary:
    image: postgres:15-alpine
    restart: always
    environment:
      - POSTGRES_DB=akordium_prod
      - POSTGRES_USER=${PROD_DB_USER}
      - POSTGRES_PASSWORD=${PROD_DB_PASSWORD}
      - POSTGRES_REPLICATION_USER=replicator
      - POSTGRES_REPLICATION_PASSWORD=${REPLICATION_PASSWORD}
    volumes:
      - postgres_primary_data:/var/lib/postgresql/data
      - ./scripts/setup-replication.sh:/docker-entrypoint-initdb.d/setup-replication.sh
    networks:
      - production-network
    deploy:
      resources:
        limits:
          memory: 4G
          cpus: '2.0'
        reservations:
          memory: 2G
          cpus: '1.0'

  postgres-replica:
    image: postgres:15-alpine
    restart: always
    environment:
      - PGUSER=${PROD_DB_USER}
      - POSTGRES_PASSWORD=${PROD_DB_PASSWORD}
      - POSTGRES_MASTER_SERVICE=postgres-primary
      - POSTGRES_REPLICATION_USER=replicator
      - POSTGRES_REPLICATION_PASSWORD=${REPLICATION_PASSWORD}
    volumes:
      - postgres_replica_data:/var/lib/postgresql/data
    depends_on:
      - postgres-primary
    networks:
      - production-network
    deploy:
      resources:
        limits:
          memory: 2G
          cpus: '1.0'
        reservations:
          memory: 1G
          cpus: '0.5'

  redis-cluster:
    image: redis:7-alpine
    restart: always
    command: redis-server --cluster-enabled yes --cluster-config-file nodes.conf
    volumes:
      - redis_cluster_data:/data
    networks:
      - production-network
    deploy:
      replicas: 3

  nginx:
    image: nginx:alpine
    restart: always
    ports:
      - "80:80"
      - "443:443"
    volumes:
      - ./nginx/production.conf:/etc/nginx/conf.d/default.conf
      - ./ssl/production:/etc/nginx/ssl
      - static_files:/var/www/storage/app/public
    depends_on:
      - app
    networks:
      - production-network

volumes:
  postgres_primary_data:
  postgres_replica_data:
  redis_cluster_data:
  static_files:

networks:
  production-network:
    driver: bridge
```

### **Production Environment Configuration**

```bash
# .env.production
APP_NAME="Akordium Lab"
APP_ENV=production
APP_DEBUG=false
APP_URL=https://akordium.id

LOG_CHANNEL=stack
LOG_LEVEL=error

DB_CONNECTION=pgsql
DB_HOST=postgres-primary
DB_READ_HOST=postgres-replica
DB_PORT=5432
DB_DATABASE=akordium_prod
DB_USERNAME=${PROD_DB_USER}
DB_PASSWORD=${PROD_DB_PASSWORD}

CACHE_DRIVER=redis
REDIS_HOST=redis-cluster
REDIS_PASSWORD=${REDIS_PASSWORD}
REDIS_PORT=6379

# Email (SendGrid Production)
MAIL_MAILER=smtp
MAIL_HOST=smtp.sendgrid.net
MAIL_PORT=587
MAIL_USERNAME=apikey
MAIL_PASSWORD=${SENDGRID_API_KEY}
MAIL_ENCRYPTION=tls
MAIL_FROM_ADDRESS="noreply@akordium.id"
MAIL_FROM_NAME="Akordium Lab"

# Payment Gateway (Production)
MIDTRANS_ENVIRONMENT=production
MIDTRANS_CLIENT_KEY=${PROD_MIDTRANS_CLIENT_KEY}
MIDTRANS_SERVER_KEY=${PROD_MIDTRANS_SERVER_KEY}

# Storage (Cloudflare R2)
FILESYSTEM_CLOUD=r2
AWS_ACCESS_KEY_ID=${R2_ACCESS_KEY}
AWS_SECRET_ACCESS_KEY=${R2_SECRET_KEY}
AWS_DEFAULT_REGION=auto
AWS_BUCKET=akordium-production
AWS_ENDPOINT=https://your-account-id.r2.cloudflarestorage.com

# Monitoring (Sentry Production)
SENTRY_LARAVEL_DSN=${PROD_SENTRY_DSN}
SENTRY_TRACES_SAMPLE_RATE=0.1

# Analytics (Production)
GOOGLE_ANALYTICS_ID=${GOOGLE_ANALYTICS_ID}
MIXPANEL_TOKEN=${MIXPANEL_TOKEN}

# Feature Flags (Production)
FEATURE_PAYMENTS=true
FEATURE_EMAIL_VERIFICATION=true
FEATURE_ANALYTICS=true
FEATURE_CACHE_BUSTING=false

# Rate Limiting
RATE_LIMITING_ENABLED=true
RATE_LIMIT_REQUESTS_PER_MINUTE=120

# Security
FORCE_HTTPS=true
STRICT_TLS=true
SECURITY_HEADERS_ENABLED=true

# Performance
OPCACHE_ENABLED=true
OPCACHE_VALIDATE_TIMESTAMPS=false
```

### **Production Nginx Configuration**

```nginx
# nginx/production.conf
upstream app_servers {
    least_conn;
    server app:9000 max_fails=3 fail_timeout=30s;
    keepalive 32;
}

# Rate limiting
limit_req_zone $binary_remote_addr zone=api:10m rate=10r/s;
limit_req_zone $binary_remote_addr zone=login:10m rate=1r/s;

server {
    listen 80;
    server_name akordium.id www.akordium.id;
    return 301 https://$server_name$request_uri;
}

server {
    listen 443 ssl http2;
    server_name akordium.id www.akordium.id;

    # SSL Configuration
    ssl_certificate /etc/nginx/ssl/akordium.id.crt;
    ssl_certificate_key /etc/nginx/ssl/akordium.id.key;
    ssl_protocols TLSv1.2 TLSv1.3;
    ssl_ciphers ECDHE-RSA-AES256-GCM-SHA512:DHE-RSA-AES256-GCM-SHA512:ECDHE-RSA-AES256-GCM-SHA384;
    ssl_prefer_server_ciphers off;
    ssl_session_cache shared:SSL:10m;
    ssl_session_timeout 10m;

    # Security Headers
    add_header X-Frame-Options "SAMEORIGIN" always;
    add_header X-Content-Type-Options "nosniff" always;
    add_header X-XSS-Protection "1; mode=block" always;
    add_header Strict-Transport-Security "max-age=31536000; includeSubDomains" always;
    add_header Referrer-Policy "strict-origin-when-cross-origin" always;
    add_header Content-Security-Policy "default-src 'self'; script-src 'self' 'unsafe-inline' https://www.googletagmanager.com; style-src 'self' 'unsafe-inline'; img-src 'self' data: https:; font-src 'self'; connect-src 'self' https://api.stripe.com" always;

    # Gzip Compression
    gzip on;
    gzip_vary on;
    gzip_proxied any;
    gzip_comp_level 6;
    gzip_types text/plain text/css text/xml text/javascript application/json application/javascript application/xml+rss application/rss+xml application/atom+xml image/svg+xml;

    root /var/www/html/public;
    index index.php index.html;

    # Static Files with Cache
    location ~* \.(css|js|ico|gif|jpe?g|png|svg|eot|otf|woff2?)$ {
        expires 1y;
        add_header Cache-Control "public, immutable";
        add_header Vary Accept-Encoding;
        access_log off;
    }

    # API Endpoints with Rate Limiting
    location /api/ {
        limit_req zone=api burst=20 nodelay;
        try_files $uri $uri/ /index.php?$query_string;
    }

    # Login Rate Limiting
    location /api/auth/login {
        limit_req zone=login burst=5 nodelay;
        try_files $uri $uri/ /index.php?$query_string;
    }

    # Laravel Application
    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }

    location ~ \.php$ {
        fastcgi_pass app_servers;
        fastcgi_keep_conn on;
        fastcgi_index index.php;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        include fastcgi_params;
        fastcgi_read_timeout 300;
        fastcgi_buffer_size 128k;
        fastcgi_buffers 4 256k;
        fastcgi_busy_buffers_size 256k;
    }

    # Health Check
    location /health {
        access_log off;
        return 200 "healthy\n";
        add_header Content-Type text/plain;
    }

    # Security
    location ~ /\.ht {
        deny all;
    }

    location ~ /(config|\.env|storage|bootstrap/cache) {
        deny all;
    }
}
```

## 🔄 Deployment Workflow

### **CI/CD Pipeline**

```yaml
# .github/workflows/deploy.yml
name: Deploy to Environments

on:
  push:
    branches: [main, develop]
  pull_request:
    branches: [main]

env:
  REGISTRY: ghcr.io
  IMAGE_NAME: ${{ github.repository }}

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - name: Setup Go
        uses: actions/setup-go@v4
        with:
          go-version: '1.21'

      - name: Setup PHP
        uses: shivammathur/setup-php@v2
        with:
          php-version: '8.2'
          extensions: bcmath, ctype, fileinfo, json, mbstring, openssl, pdo, tokenizer, xml

      - name: Install Dependencies
        run: |
          composer install --prefer-dist --no-progress
          go mod download

      - name: Run Tests
        run: |
          composer test
          go test ./...

      - name: Run Security Audit
        run: |
          composer audit
          go list -json -m all | nancy sleuth

  build:
    needs: test
    runs-on: ubuntu-latest
    if: github.event_name == 'push'
    outputs:
      image-tag: ${{ steps.meta.outputs.tags }}
      image-digest: ${{ steps.build.outputs.digest }}
    steps:
      - uses: actions/checkout@v4

      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v3

      - name: Log in to Container Registry
        uses: docker/login-action@v3
        with:
          registry: ${{ env.REGISTRY }}
          username: ${{ github.actor }}
          password: ${{ secrets.GITHUB_TOKEN }}

      - name: Extract metadata
        id: meta
        uses: docker/metadata-action@v5
        with:
          images: ${{ env.REGISTRY }}/${{ env.IMAGE_NAME }}
          tags: |
            type=ref,event=branch
            type=ref,event=pr
            type=sha,prefix={{branch}}-
            type=raw,value=latest,enable={{is_default_branch}}

      - name: Build and push Docker image
        id: build
        uses: docker/build-push-action@v5
        with:
          context: .
          push: true
          tags: ${{ steps.meta.outputs.tags }}
          labels: ${{ steps.meta.outputs.labels }}
          cache-from: type=gha
          cache-to: type=gha,mode=max

  deploy-staging:
    needs: build
    runs-on: ubuntu-latest
    if: github.ref == 'refs/heads/develop'
    environment: staging
    steps:
      - uses: actions/checkout@v4

      - name: Deploy to Staging
        run: |
          echo "Deploying ${{ needs.build.outputs.image-tag }} to staging"
          # Coolify deployment API call
          curl -X POST "${{ secrets.COOLIFY_WEBHOOK_STAGING }}" \
            -H "Content-Type: application/json" \
            -d '{"image": "${{ needs.build.outputs.image-tag }}"}'

      - name: Run Staging Tests
        run: |
          # Wait for deployment
          sleep 60
          # Run integration tests
          npm run test:integration:staging

  deploy-production:
    needs: build
    runs-on: ubuntu-latest
    if: github.ref == 'refs/heads/main'
    environment: production
    steps:
      - uses: actions/checkout@v4

      - name: Deploy to Production
        run: |
          echo "Deploying ${{ needs.build.outputs.image-tag }} to production"
          # Coolify deployment API call
          curl -X POST "${{ secrets.COOLIFY_WEBHOOK_PRODUCTION }}" \
            -H "Content-Type: application/json" \
            -d '{"image": "${{ needs.build.outputs.image-tag }}"}'

      - name: Health Check
        run: |
          # Wait for deployment
          sleep 120
          # Verify deployment health
          curl -f https://akordium.id/health || exit 1
          curl -f https://akordium.id/api/v1/health || exit 1
```

### **Environment Promotion Script**

```bash
#!/bin/bash
# scripts/promote-to-production.sh

set -e

echo "🚀 Starting production deployment process..."

# 1. Pre-deployment checks
echo "📋 Running pre-deployment checks..."

# Check if staging is healthy
STAGING_HEALTH=$(curl -s -o /dev/null -w "%{http_code}" https://staging.akordium.id/health)
if [ "$STAGING_HEALTH" != "200" ]; then
    echo "❌ Staging health check failed: $STAGING_HEALTH"
    exit 1
fi

# Check if all tests pass
echo "🧪 Running test suite..."
composer test
go test ./...

# 2. Backup current production
echo "💾 Creating production backup..."
./scripts/backup-production.sh

# 3. Deploy to production
echo "🚀 Deploying to production..."
VERSION=$(git rev-parse --short HEAD)
docker-compose -f production/docker-compose.yml pull
docker-compose -f production/docker-compose.yml up -d

# 4. Post-deployment verification
echo "🔍 Running post-deployment verification..."

# Wait for application to start
sleep 60

# Health checks
PROD_HEALTH=$(curl -s -o /dev/null -w "%{http_code}" https://akordium.id/health)
if [ "$PROD_HEALTH" != "200" ]; then
    echo "❌ Production health check failed: $PROD_HEALTH"
    echo "🔄 Rolling back..."
    docker-compose -f production/docker-compose.yml down
    # Restore previous version
    docker-compose -f production/docker-compose.yml up -d
    exit 1
fi

# API health check
API_HEALTH=$(curl -s -o /dev/null -w "%{http_code}" https://akordium.id/api/v1/health)
if [ "$API_HEALTH" != "200" ]; then
    echo "❌ API health check failed: $API_HEALTH"
    exit 1
fi

# 5. Run smoke tests
echo "💨 Running smoke tests..."
npm run test:smoke:production

# 6. Notify team
echo "📧 Sending deployment notification..."
curl -X POST "${SLACK_WEBHOOK_URL}" \
  -H 'Content-type: application/json' \
  --data "{\"text\":\"✅ Production deployment successful! Version: $VERSION\"}"

echo "✅ Production deployment completed successfully!"
```

## 🔧 Environment Management

### **Configuration Management**

```bash
#!/bin/bash
# scripts/manage-config.sh

ENVIRONMENT=$1
ACTION=$2

case "$ACTION" in
    "encrypt")
        echo "🔒 Encrypting $ENVIRONMENT configuration..."
        ansible-vault encrypt "envs/$ENVIRONMENT/.env" --vault-password-file=.vault_pass
        ;;
    "decrypt")
        echo "🔓 Decrypting $ENVIRONMENT configuration..."
        ansible-vault decrypt "envs/$ENVIRONMENT/.env" --vault-password-file=.vault_pass
        ;;
    "view")
        echo "👁️ Viewing $ENVIRONMENT configuration..."
        ansible-vault view "envs/$ENVIRONMENT/.env" --vault-password-file=.vault_pass
        ;;
    "edit")
        echo "✏️ Editing $ENVIRONMENT configuration..."
        ansible-vault edit "envs/$ENVIRONMENT/.env" --vault-password-file=.vault_pass
        ;;
    *)
        echo "Usage: $0 <environment> <encrypt|decrypt|view|edit>"
        exit 1
        ;;
esac
```

### **Environment Monitoring**

```yaml
# monitoring/docker-compose.monitoring.yml
version: '3.8'

services:
  prometheus:
    image: prom/prometheus:latest
    ports:
      - "9090:9090"
    volumes:
      - ./prometheus/prometheus.yml:/etc/prometheus/prometheus.yml
      - prometheus_data:/prometheus
    command:
      - '--config.file=/etc/prometheus/prometheus.yml'
      - '--storage.tsdb.path=/prometheus'
      - '--web.console.libraries=/etc/prometheus/console_libraries'
      - '--web.console.templates=/etc/prometheus/consoles'

  grafana:
    image: grafana/grafana:latest
    ports:
      - "3001:3000"
    environment:
      - GF_SECURITY_ADMIN_PASSWORD=${GRAFANA_PASSWORD}
    volumes:
      - grafana_data:/var/lib/grafana
      - ./grafana/dashboards:/etc/grafana/provisioning/dashboards
      - ./grafana/datasources:/etc/grafana/provisioning/datasources

  node-exporter:
    image: prom/node-exporter:latest
    ports:
      - "9100:9100"
    volumes:
      - /proc:/host/proc:ro
      - /sys:/host/sys:ro
      - /:/rootfs:ro
    command:
      - '--path.procfs=/host/proc'
      - '--path.rootfs=/rootfs'
      - '--path.sysfs=/host/sys'
      - '--collector.filesystem.mount-points-exclude=^/(sys|proc|dev|host|etc)($$|/)'

volumes:
  prometheus_data:
  grafana_data:
```

## 📋 Environment Checklist

### **Development Environment Setup Checklist**

```markdown
- [ ] Git repository cloned
- [ ] Dependencies installed (Composer/npm/go mod)
- [ ] Environment file configured (.env.local)
- [ ] Database created and migrations run
- [ ] Development data seeded
- [ ] Docker containers running
- [ ] Local SSL certificates (if needed)
- [ ] IDE configured (VSCode settings)
- [ ] Debug tools configured (Xdebug/delve)
- [ ] Tests passing
- [ ] Application accessible locally
```

### **Staging Environment Deployment Checklist**

```markdown
- [ ] Code reviewed and approved
- [ ] All tests passing in CI/CD
- [ ] Build created successfully
- [ ] Docker image pushed to registry
- [ ] Staging environment provisioned
- [ ] Database schema updated
- [ ] Configuration variables set
- [ ] SSL certificates installed
- [ ] Smoke tests passing
- [ ] Performance tests passing
- [ ] Security scans passing
- [ ] Team notified of deployment
```

### **Production Environment Deployment Checklist**

```markdown
- [ ] All staging tests passed
- [ ] Production backup created
- [ ] Rollback plan prepared
- [ ] Maintenance window scheduled
- [ ] Production deployment approved
- [ ] Docker image deployed
- [ ] Database migrations applied
- [ ] Configuration updated
- [ ] SSL certificates valid
- [ ] Health checks passing
- [ ] Load balancer updated
- [ ] Monitoring configured
- [ ] Logs being collected
- [ ] Performance metrics normal
- [ ] Team notified of completion
- [ ] Post-deployment verification complete
```

---

**Environment Management Principles:**

- **Consistency:** Same infrastructure stack across all environments
- **Automation:** Manual intervention minimized wherever possible
- **Monitoring:** Comprehensive monitoring di semua environments
- **Security:** Configuration secrets properly managed
- **Rollback:** Always have a rollback plan
- **Documentation:** Keep environment configurations documented
- **Testing:** Test thoroughly di staging sebelum production

*Related Documentation:* [Database Conventions](./database-conventions.md) | [API Guidelines](./api-design-guidelines.md) | [Monitoring & Logging](./monitoring-logging.md) | [Backup & Recovery](./backup-recovery.md)
