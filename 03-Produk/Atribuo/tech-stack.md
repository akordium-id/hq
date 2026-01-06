# ⚙️ Atribuo Technology Stack

> Arsitektur teknologi dan implementasi untuk Atribuo - Real-Life RPG Skill Visualization Platform

## 🏗️ System Architecture Overview

### Architecture Pattern

**Pattern:** Microservices dengan API Gateway
**Style:** Event-Driven Architecture
**Deployment:** Container-based dengan Docker & Kubernetes
**Data Flow:** REST API + WebSocket untuk real-time features

### High-Level Architecture

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Frontend      │    │  API Gateway    │    │  Backend        │
│   Next.js       │◄──►│   (Go/Envoy)    │◄──►│  Services       │
│   TypeScript    │    │                 │    │  (Go Micro)     │
└─────────────────┘    └─────────────────┘    └─────────────────┘
                                                       │
                       ┌─────────────────┐            │
                       │   File Storage  │◄───────────┤
                       │  Cloudflare R2  │            │
                       └─────────────────┘            │
                                                       ▼
                                            ┌─────────────────┐
                                            │   Databases     │
                                            │  PostgreSQL +   │
                                            │     Redis       │
                                            └─────────────────┘
```

## 💻 Frontend Stack

### Core Framework

- **Framework:** Next.js 14 with App Router
- **Language:** TypeScript 5.2+
- **Styling:** Tailwind CSS 3.3+ dengan custom components
- **State Management:** Zustand 4.4+
- **Data Fetching:** TanStack Query (React Query) 5.0+

### UI Components & Libraries

```json
{
  "dependencies": {
    "next": "^14.0.0",
    "react": "^18.2.0",
    "typescript": "^5.2.0",
    "tailwindcss": "^3.3.0",
    "@headlessui/react": "^1.7.0",
    "framer-motion": "^10.16.0",
    "recharts": "^2.8.0",
    "d3": "^7.8.0",
    "@tanstack/react-query": "^5.0.0",
    "zustand": "^4.4.0",
    "react-hook-form": "^7.47.0",
    "zod": "^3.22.0",
    "@hookform/resolvers": "^3.3.0",
    "lucide-react": "^0.288.0",
    "clsx": "^2.0.0"
  }
}
```

### Visualization Libraries

- **Charts:** Recharts.js untuk radar charts
- **Custom Graphics:** D3.js untuk advanced visualizations
- **Animations:** Framer Motion untuk smooth transitions
- **SVG Manipulation:** React-SVG untuk custom charts

### Mobile Optimization & Cross-Device Sync

- **PWA:** Next.js PWA configuration dengan offline support
- **Responsive:** Mobile-first design approach
- **Touch Gestures:** React-Use-Gesture library
- **Performance:** Code splitting dan lazy loading
- **Cross-Device Sync:** Real-time synchronization via WebSocket + API polling

**PWA Configuration:**

```typescript
// next-pwa configuration
const withPWA = require('next-pwa')({
  dest: 'public',
  register: true,
  skipWaiting: true,
  disable: process.env.NODE_ENV === 'development',
  runtimeCaching: [
    {
      urlPattern: /^https:\/\/api\.atribuo\.com\/.*/
      handler: 'NetworkFirst',
      options: {
        cacheName: 'api-cache',
        expiration: {
          maxEntries: 64,
          maxAgeSeconds: 24 * 60 * 60 // 24 hours
        }
      }
    }
  ]
})

module.exports = withPWA(nextConfig)
```

**Cross-Device Sync Architecture:**

```typescript
// Sync service for cross-device data consistency
interface SyncService {
  // WebSocket for real-time updates
  subscribeToProfileUpdates(userId: string): WebSocket

  // API polling fallback for offline
  syncProfileData(userId: string): Promise<SyncResult>

  // Conflict resolution strategy
  resolveConflict(local: Profile, remote: Profile): Profile
}

// Sync strategies:
// 1. Real-time: WebSocket connection when online
// 2. Periodic: 5-minute API polling when WebSocket unavailable
// 3. On-demand: Manual refresh trigger
// 4. Conflict resolution: Last-write-wins with user notification
```

### Frontend Development Setup

```typescript
// next.config.js
const nextConfig = {
  experimental: {
    appDir: true,
  },
  images: {
    domains: ['atribuo.com', 'cdn.atribuo.com'],
  },
  compiler: {
    removeConsole: process.env.NODE_ENV === 'production',
  },
  poweredByHeader: false,
  compress: true,
}

module.exports = nextConfig
```

## 🖥️ Backend Stack

### Core Framework

- **Language:** Go 1.21+
- **Framework:** Gin Web Framework
- **Architecture:** Clean Architecture dengan Repository Pattern
- **Validation:** Go-Playground Validator
- **Logging:** Logrus dengan structured logging

### Key Backend Libraries

```go
module github.com/akordium/atribuo-backend

go 1.21

require (
    github.com/gin-gonic/gin v1.9.1
    github.com/golang-jwt/jwt/v5 v5.0.0
    github.com/lib/pq v1.10.9
    github.com/go-redis/redis/v8 v8.11.5
    github.com/google/uuid v1.3.0
    github.com/spf13/viper v1.16.0
    gorm.io/gorm v1.25.4
    gorm.io/driver/postgres v1.5.2
    github.com/swaggo/gin-swagger v1.6.0
    github.com/swaggo/files v1.0.1
    github.com/swaggo/swag v1.16.1
)
```

### API Design

- **Style:** RESTful API dengan OpenAPI 3.0 documentation
- **Authentication:** JWT dengan refresh token mechanism
- **Rate Limiting:** Go-Redis based rate limiting
- **Middleware:** CORS, logging, error handling, recovery

### Database Integration

```go
// database setup example
func InitDB() *gorm.DB {
    dsn := fmt.Sprintf("host=%s user=%s password=%s dbname=%s port=%s sslmode=%s TimeZone=%s",
        viper.GetString("DB_HOST"),
        viper.GetString("DB_USER"),
        viper.GetString("DB_PASSWORD"),
        viper.GetString("DB_NAME"),
        viper.GetString("DB_PORT"),
        viper.GetString("DB_SSLMODE"),
        viper.GetString("DB_TIMEZONE"),
    )

    db, err := gorm.Open(postgres.Open(dsn), &gorm.Config{
        Logger: logger.Default.LogMode(logger.Info),
    })

    if err != nil {
        log.Fatal("Failed to connect database")
    }

    return db
}
```

## 🗄️ Database Stack

### Primary Database: PostgreSQL 15

**Configuration:**

- **Version:** PostgreSQL 15+
- **Extensions:** pg_trgm, uuid-ossp, btree_gin
- **Connection Pooling:** PgBouncer
- **Backup:** pg_dump dengan daily backups

### Database Schema Design

```sql
-- Users table
CREATE TABLE users (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    display_name VARCHAR(100),
    avatar_url TEXT,
    bio TEXT,
    privacy_settings JSONB DEFAULT '{"profile_visibility": "public"}',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Skills table
CREATE TABLE skills (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    level INTEGER CHECK (level >= 1 AND level <= 10),
    description TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Skill progress history
CREATE TABLE skill_progress (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    skill_id UUID NOT NULL REFERENCES skills(id) ON DELETE CASCADE,
    previous_level INTEGER,
    new_level INTEGER NOT NULL,
    note TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Indexes for performance
CREATE INDEX idx_skills_user_id ON skills(user_id);
CREATE INDEX idx_skills_category ON skills(category);
CREATE INDEX idx_skill_progress_skill_id ON skill_progress(skill_id);
```

### Caching Layer: Redis 7

**Use Cases:**

- Session management
- API response caching
- Rate limiting
- Real-time feature data

```go
// Redis client setup
func InitRedis() *redis.Client {
    rdb := redis.NewClient(&redis.Options{
        Addr:     viper.GetString("REDIS_ADDR"),
        Password: viper.GetString("REDIS_PASSWORD"),
        DB:       0,
    })

    return rdb
}
```

## ☁️ Infrastructure Stack

### Hosting Platform: Oracle Cloud Infrastructure (OCI)

**Compute:**

- **VM.Standard.A1.Flex:** ARM-based instances untuk cost efficiency
- **Autoscaling:** Based on CPU dan memory utilization
- **Load Balancer:** OCI Load Balancer dengan health checks

### Container Orchestration: Kubernetes

**Setup:**

- **Container Runtime:** containerd
- **Orchestration:** Kubernetes 1.28+
- **Service Mesh:** Istio untuk microservice communication
- **Ingress:** Nginx Ingress Controller

### Deployment Platform: Coolify

**Features:**

- **CI/CD Integration:** GitHub Actions
- **Zero-Downtime Deployment:** Rolling updates
- **Environment Management:** Dev, Staging, Production
- **Automatic Scaling:** Based on traffic patterns

### Docker Configuration

```dockerfile
# Backend Dockerfile
FROM golang:1.21-alpine AS builder

WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download

COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -o main cmd/server/main.go

FROM alpine:latest
RUN apk --no-cache add ca-certificates
WORKDIR /root/

COPY --from=builder /app/main .
COPY --from=builder /app/.env .

CMD ["./main"]
```

```dockerfile
# Frontend Dockerfile
FROM node:18-alpine AS builder

WORKDIR /app
COPY package*.json ./
RUN npm ci --only=production

COPY . .
RUN npm run build

FROM node:18-alpine AS runner
WORKDIR /app

RUN addgroup --system --gid 1001 nodejs
RUN adduser --system --uid 1001 nextjs

COPY --from=builder /app/public ./public
COPY --from=builder --chown=nextjs:nodejs /app/.next/standalone ./
COPY --from=builder --chown=nextjs:nodejs /app/.next/static ./.next/static

USER nextjs

EXPOSE 3000
ENV PORT 3000

CMD ["node", "server.js"]
```

## 🔒 Security Stack

### Authentication & Authorization

- **JWT:** JSON Web Tokens dengan RS256 signing
- **Refresh Tokens:** Secure token rotation mechanism
- **OAuth 2.0:** Google, Facebook, Discord integration
- **Session Management:** Redis-based session storage

### Data Security

- **Encryption:** AES-256 encryption untuk sensitive data
- **Hashing:** bcrypt untuk password hashing
- **API Security:** Input validation, SQL injection prevention
- **HTTPS:** TLS 1.3 dengan Cloudflare SSL

### Security Middleware

```go
// Security middleware setup
func SecurityMiddleware() gin.HandlerFunc {
    return func(c *gin.Context) {
        c.Header("X-Content-Type-Options", "nosniff")
        c.Header("X-Frame-Options", "DENY")
        c.Header("X-XSS-Protection", "1; mode=block")
        c.Header("Strict-Transport-Security", "max-age=31536000; includeSubDomains")
        c.Next()
    }
}
```

## 📊 Monitoring & Analytics Stack

### Application Monitoring

- **Error Tracking:** Sentry dengan performance monitoring
- **Logging:** Structured logging dengan ELK stack
- **Metrics:** Prometheus + Grafana dashboard
- **Health Checks:** Custom health check endpoints

### Performance Monitoring

```go
// Health check endpoint
func HealthCheck(c *gin.Context) {
    status := map[string]interface{}{
        "status":    "healthy",
        "timestamp": time.Now(),
        "version":   os.Getenv("APP_VERSION"),
        "database":  checkDatabase(),
        "redis":     checkRedis(),
    }

    c.JSON(200, status)
}
```

### User Analytics

- **Google Analytics 4:** Website traffic dan user behavior
- **Custom Analytics:** User engagement metrics tracking
- **Business Intelligence:** Custom dashboard untuk KPI tracking

## 🔧 Development Tools Stack

### Version Control

- **Git:** Git LFS untuk large files
- **Platform:** GitHub dengan protected branches
- **CI/CD:** GitHub Actions workflows
- **Code Review:** Pull request templates

### Development Environment

- **IDE:** VS Code dengan Go dan TypeScript extensions
- **Database GUI:** TablePlus, DBeaver
- **API Testing:** Postman collections
- **Container:** Docker Desktop

### Testing Stack

**Backend Testing:**

- **Framework:** Go testing package
- **HTTP Testing:** httptest package
- **Mock:** Testify/mock
- **Coverage:** Built-in Go coverage tool

**Frontend Testing:**

- **Framework:** Jest + React Testing Library
- **E2E:** Playwright
- **Visual Testing:** Storybook
- **Performance:** Lighthouse CI

## 🚀 Performance Optimization

### Frontend Optimization

- **Code Splitting:** Route-based dan component-based
- **Image Optimization:** Next.js Image component
- **Bundle Analysis:** Webpack Bundle Analyzer
- **Caching:** Service Worker dengan cache strategies

### Backend Optimization

- **Database Optimization:** Query optimization, connection pooling
- **API Caching:** Redis-based response caching
- **Compression:** Gzip compression untuk responses
- **CDN:** Cloudflare CDN untuk static assets

### Database Optimization

```sql
-- Optimized queries dengan proper indexing
EXPLAIN ANALYZE
SELECT u.*, COUNT(s.id) as skill_count
FROM users u
LEFT JOIN skills s ON u.id = s.user_id
WHERE u.created_at >= '2024-01-01'
GROUP BY u.id
ORDER BY skill_count DESC
LIMIT 100;
```

## 📱 Third-Party Integrations

### Authentication Providers

- **Google OAuth 2.0:** Google account login
- **Facebook Login:** Facebook authentication
- **Discord OAuth:** Gaming community integration

### Storage & CDN

- **File Storage:** Cloudflare R2 untuk assets
- **CDN:** Cloudflare CDN untuk global distribution
- **Image Processing:** Cloudflare Image Resizing

### Analytics & Monitoring

- **Sentry:** Error tracking dan performance
- **Google Analytics:** User behavior analytics
- **Hotjar:** User session recordings
- **Status Page:** Uptime monitoring dashboard

## 🔄 Deployment Pipeline

### CI/CD Workflow

```yaml
# .github/workflows/deploy.yml
name: Deploy to Production

on:
  push:
    branches: [main]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Setup Go
        uses: actions/setup-go@v4
        with:
          go-version: '1.21'
      - name: Run tests
        run: go test ./...

  deploy:
    needs: test
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Deploy to Coolify
        run: |
          curl -X POST "${COOLIFY_WEBHOOK_URL}" \
            -H "Authorization: Bearer ${COOLIFY_TOKEN}" \
            -H "Content-Type: application/json"
```

### Environment Configuration

```yaml
# docker-compose.prod.yml
version: '3.8'

services:
  app:
    image: atribuo/backend:latest
    environment:
      - DB_HOST=${DB_HOST}
      - DB_PASSWORD=${DB_PASSWORD}
      - REDIS_URL=${REDIS_URL}
      - JWT_SECRET=${JWT_SECRET}
    deploy:
      replicas: 3
      resources:
        limits:
          cpus: '0.5'
          memory: 512M
```

## 📋 Technology Decision Rationale

### Why Go for Backend?

- **Performance:** High performance untuk real-time features
- **Concurrency:** Excellent untuk handling concurrent users
- **Simplicity:** Clean syntax, easy maintenance
- **Ecosystem:** Rich standard library, growing ecosystem

### Why Next.js for Frontend?

- **Performance:** SSR/SSG capabilities
- **Developer Experience:** Excellent TypeScript support
- **Ecosystem:** Rich React ecosystem
- **SEO:** Built-in SEO optimization

### Why PostgreSQL for Database?

- **Reliability:** Proven enterprise-grade database
- **Features:** JSONB support, full-text search
- **Performance:** Excellent untuk complex queries
- **Compliance:** ACID compliant, strong consistency

### Why Redis for Caching?

- **Performance:** In-memory storage untuk speed
- **Flexibility:** Multiple data structures
- **Scalability:** Horizontal scaling support
- **Ecosystem:** Rich client library support

## 🔮 Future Technology Evolution

### Phase 2 Technical Enhancements

- **GraphQL:** API evolution untuk efficient data fetching
- **Event Sourcing:** Advanced audit trail dan replay capabilities
- **Read Replicas:** Database scaling untuk read-heavy workloads
- **Microservices:** Full microservices architecture adoption

### Phase 3 Advanced Features

- **Machine Learning:** Python integration untuk AI features
- **WebSocket:** Real-time collaboration features
- **Blockchain:** Skill verification integration
- **Edge Computing:** CDN edge functions untuk global performance

### Phase 4 Enterprise Features

- **Multi-tenancy:** SaaS architecture untuk B2B clients
- **API Gateway:** Advanced API management dan monetization
- **Data Lake:** Big data analytics platform
- **Kubernetes:** Full orchestration dengan service mesh

---

**Document Version:** 1.0
**Last Updated:** 2024-12-01
**Next Review:** 2025-01-15
**Owner:** Development Team
**Tech Lead:** Backend Engineer
**Maintainer:** DevOps Team
