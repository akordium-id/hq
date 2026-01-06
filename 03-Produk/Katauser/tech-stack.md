# 💬 Katauser - Technical Architecture

**Version:** 1.0.0
**Last Updated:** 2026-01-06
**Status:** Architecture Planning Phase

---

## 🏗️ Architecture Overview

Katauser menggunakan **modern Go backend** dengan **React-based SSR frontend**, following Akordium Lab's migration strategy dari PHP/MySQL ke Go/PostgreSQL.

### High-Level Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                         Users                               │
│  (SaaS Founders, Product Managers, Agencies, E-commerce)    │
└────────────────────────┬────────────────────────────────────┘
                         │
                         ▼
┌─────────────────────────────────────────────────────────────┐
│                   Cloudflare CDN                            │
│              (SSL, DDoS Protection, Caching)                │
└────────────────────────┬────────────────────────────────────┘
                         │
                         ▼
┌─────────────────────────────────────────────────────────────┐
│              Frontend: Tanstack Start                        │
│          (React SSR, Tailwind CSS, Tanstack Query)          │
└────────────────────────┬────────────────────────────────────┘
                         │ HTTP/REST
                         ▼
┌─────────────────────────────────────────────────────────────┐
│               Backend: Go (Gin Framework)                    │
│         (JWT Auth, API Controllers, Services Layer)          │
└─────┬───────────────┬───────────────┬───────────────────────┘
      │               │               │
      ▼               ▼               ▼
┌───────────┐  ┌───────────┐  ┌─────────────┐
│PostgreSQL │  │  Redis   │  │ Midtrans API│
│ (Primary) │  │ (Cache)  │  │ (Payments)  │
└───────────┘  └───────────┘  └─────────────┘
```

---

## 🖥️ Backend Stack

### Framework & Language

**Go (Golang) 1.21+**

**Why Go?**
- ✅ **High Performance:** Compiled language, fast execution (critical untuk voting system dengan high concurrency)
- ✅ **Concurrency:** Goroutines untuk handle multiple requests efficiently
- ✅ **Type Safety:** Catch errors at compile time, reduce runtime bugs
- ✅ **Standard Library:** Rich built-in libraries (HTTP, JSON, crypto)
- ✅ **Company Strategy:** Aligns dengan Akordium's PHP-to-Go migration

**Web Framework:** Gin
- Fast HTTP framework (10x faster than Express.js)
- Middleware support (auth, CORS, logging)
- JSON validation dan binding
- Route grouping untuk versioning (`/api/v1/`)

### Project Structure (Standard Go Layout)

```
katauser-backend/
├── cmd/
│   └── api/
│       └── main.go              # Entry point
├── internal/
│   ├── config/
│   │   └── config.go            # Viper configuration
│   ├── handlers/
│   │   ├── auth.go              # Authentication endpoints
│   │   ├── boards.go            # Board CRUD
│   │   ├── feedback.go          # Feedback submission
│   │   ├── votes.go             # Voting system
│   │   ├── roadmap.go           # Roadmap sync
│   │   └── changelog.go         # Changelog generator
│   ├── models/
│   │   ├── user.go
│   │   ├── board.go
│   │   ├── feedback.go
│   │   └── vote.go
│   ├── repositories/
│   │   ├── user_repository.go
│   │   ├── board_repository.go
│   │   └── feedback_repository.go
│   ├── services/
│   │   ├── auth_service.go
│   │   ├── board_service.go
│   │   └── vote_service.go
│   └── middleware/
│       ├── auth.go
│       ├── cors.go
│       └── ratelimit.go
├── migrations/
│   └── *.sql                    # Database migrations
├── pkg/
│   └── utils/
│       ├── validator.go
│       └── slugify.go
└── go.mod
```

### Key Go Libraries

```go
module github.com/akordium/katauser-backend

go 1.21

require (
    github.com/gin-gonic/gin v1.9.1              // HTTP framework
    github.com/golang-jwt/jwt/v5 v5.0.0         // JWT authentication
    github.com/lib/pq v1.10.9                    // PostgreSQL driver
    github.com/go-redis/redis/v8 v8.11.5         // Caching layer
    github.com/google/uuid v1.3.0                // UUID generation
    github.com/spf13/viper v1.16.0               // Configuration
    github.com/go-playground/validator/v10       // Validation
    gorm.io/gorm v1.25.4                         // ORM (optional)
    gorm.io/driver/postgres v1.5.2               // PostgreSQL driver for GORM
    golang.org/x/crypto v0.14.0                  // bcrypt hashing
)
```

### Authentication & Authorization

**JWT (JSON Web Tokens)**

- **Access Token:** 7 days expiration
- **Refresh Token:** Not implemented (simple JWT enough untuk MVP)
- **Secret Key:** Environment variable (`JWT_SECRET`)
- **Algorithm:** HS256 (HMAC-SHA256)

**Implementation:**
```go
type Claims struct {
    UserID string `json:"user_id"`
    Email  string `json:"email"`
    jwt.RegisteredClaims
}

// Generate token
func GenerateToken(user *User) (string, error) {
    claims := Claims{
        UserID: user.ID,
        Email:  user.Email,
        RegisteredClaims: jwt.RegisteredClaims{
            ExpiresAt: jwt.NewNumericDate(time.Now().Add(7 * 24 * time.Hour)),
        },
    }
    token := jwt.NewWithClaims(jwt.SigningMethodHS256, claims)
    return token.SignedString([]byte(os.Getenv("JWT_SECRET")))
}
```

**Authorization Model:**
- **Board Owner:** Full CRUD access ke their boards
- **Authenticated Users:** Can submit feedback, vote, comment
- **Anonymous Users:** Can view public boards, submit feedback (dengan email), vote (IP-based)
- **Premium Users:** Custom branding, private boards, Telegram notifications

### API Design

**RESTful API Structure:**

```
/api/v1/
├── auth/
│   ├── POST   /register        # Register new user
│   ├── POST   /login           # Login & get JWT token
│   └── GET    /me              # Get current user profile
├── boards/
│   ├── GET    /                # List public boards
│   ├── POST   /                # Create board (auth required)
│   ├── GET    /:slug           # Get board by slug (public)
│   ├── PUT    /:id             # Update board (owner only)
│   └── DELETE /:id             # Delete board (owner only)
├── feedbacks/
│   ├── POST   /boards/:slug/feedbacks  # Submit feedback
│   ├── GET    /boards/:slug/feedbacks  # List feedbacks
│   ├── PUT    /:id             # Update feedback (owner only)
│   └── DELETE /:id             # Delete feedback (owner only)
├── votes/
│   ├── POST   /feedbacks/:id/vote      # Vote on feedback
│   └── DELETE /feedbacks/:id/vote      # Remove vote
├── roadmap/
│   ├── GET    /boards/:slug/roadmap    # Get roadmap
│   ├── POST   /boards/:slug/roadmap    # Create roadmap item
│   └── PUT    /:id             # Update roadmap status
└── changelog/
    ├── GET    /boards/:slug/changelog  # Get changelog
    └── POST   /generate        # Generate from completed items
```

---

## 🌐 Frontend Stack

### Framework: Tanstack Start

**Why Tanstack Start over Next.js?**

1. **Type Safety:** End-to-end TypeScript type safety
2. **Debugging:** Integrated DevTools untuk route debugging
3. **Modular:** Use only what you need (smaller bundle)
4. **Future-Proof:** TanStack ecosystem growing rapidly
5. **Streaming:** Progressive page loading (better UX)

**Reference:** [TanStack Start Documentation](https://tanstack.com/start/latest)

### Project Structure

```
katauser-frontend/
├── app/
│   ├── routes/
│   │   ├── index.tsx                  # Landing page
│   │   ├── auth.login.tsx             # Login page
│   │   ├── auth.register.tsx          # Register page
│   │   ├── dashboard.index.tsx        # User dashboard
│   │   ├── boards.$slug.tsx           # Public board view
│   │   ├── boards.create.tsx          # Create board
│   │   └── boards.$slug.edit.tsx      # Board settings
│   ├── components/
│   │   ├── common/
│   │   │   ├── Button.tsx
│   │   │   ├── Input.tsx
│   │   │   └── Modal.tsx
│   │   ├── board/
│   │   │   ├── FeedbackList.tsx
│   │   │   ├── FeedbackCard.tsx
│   │   │   ├── VoteButton.tsx
│   │   │   └── AddFeedbackForm.tsx
│   │   ├── roadmap/
│   │   │   ├── RoadmapView.tsx
│   │   │   └── RoadmapItem.tsx
│   │   └── changelog/
│   │       ├── ChangelogList.tsx
│   │       └── ChangelogEntry.tsx
│   ├── hooks/
│   │   ├── useAuth.ts                 # Authentication hook
│   │   ├── useBoard.ts                # Board data fetching
│   │   └── useVote.ts                 # Vote mutation
│   └── utils/
│       ├── validation.ts              # Zod schemas
│       └── formatting.ts
├── public/
└── package.json
```

### Key Dependencies

```json
{
  "dependencies": {
    "@tanstack/start": "^1.0.0",
    "@tanstack/react-query": "^5.0.0",
    "@tanstack/react-router": "^1.0.0",
    "react": "^18.2.0",
    "react-dom": "^18.2.0",
    "typescript": "^5.2.0",
    "tailwindcss": "^3.3.0",
    "zod": "^3.22.0",
    "react-hook-form": "^7.47.0",
    "lucide-react": "^0.288.0",
    "clsx": "^2.0.0",
    "date-fns": "^2.30.0"
  }
}
```

### State Management

**Tanstack Query (React Query)**
- Server state management (API calls)
- Caching, refetching, optimistic updates
- Loading dan error states otomatis

**Local State:** React useState/useContext
- Form inputs
- Modal open/close
- UI states (dropdowns, tabs)

---

## 🗄️ Database Design

### PostgreSQL 15

**Why PostgreSQL?**
- ✅ Akordium's standard database (migrating dari MySQL)
- ✅ JSONB support untuk flexible data (custom branding)
- ✅ Reliable, battle-tested, ACID compliant
- ✅ Full-text search capabilities
- ✅ Excellent indexing options

### High-Level Schema

```sql
-- Core Tables (MVP)
users             -- User accounts
boards            -- Feedback boards
feedbacks         -- User feedbacks
votes             -- Voting system
comments          -- Feedback comments
roadmap_items     -- Roadmap synchronization
changelogs        -- Changelog entries

-- Future Tables (v2.0+)
categories        -- Feedback categorization
notifications     -- Email/Telegram notifications
integrations      -- Telegram, WhatsApp, e-commerce
```

**Key Concepts:**
- **Multi-tenancy:** All data scoped to `board_id`
- **Anonymous Support:** Optional `user_id` dalam feedbacks
- **Denormalization:** `vote_count` di feedbacks table (performance)
- **Audit Trail:** `created_at`, `updated_at` timestamps

**Note:** Detailed database schema (field definitions, indexes, constraints) akan dibuat saat development phase. Ini adalah high-level overview untuk product planning.

---

## 🚀 Infrastructure Stack

### Hosting: Oracle Cloud Infrastructure (OCI)

**Instance Type:** VM.Standard.A1.Flex
- **CPU:** 1-4 OCPU (configurable)
- **RAM:** 1-24 GB (configurable)
- **Storage:** 50 GB NVMe SSD
- **Cost:** ~Rp 300,000-500,000/month (Always Free tier available)

**Why Oracle Cloud?**
- ✅ Akordium's standard infrastructure
- ✅ Cost-effective vs AWS/GCP
- ✅ Indonesia region (Jakarta) available
- ✅ Always Free tier untuk testing

### Deployment: Coolify

**Why Coolify?**
- ✅ Self-hosted PaaS (Heroku alternative)
- ✅ No vendor lock-in
- ✅ Supports Docker, Node.js, Go, static sites
- ✅ Automatic SSL via Let's Encrypt
- ✅ Easy rollback & scaling

**Deployment Workflow:**
```yaml
# coolify.yaml
version: "1.0"
services:
  backend:
    type: "golang"
    build_command: "go build -o bin/api cmd/api/main.go"
    start_command: "./bin/api"
    environment:
      - DB_HOST=${DB_HOST}
      - JWT_SECRET=${JWT_SECRET}

  frontend:
    type: "node"
    build_command: "npm run build"
    start_command: "npm run start"
    environment:
      - VITE_API_URL=${VITE_API_URL}
```

### CDN & Security: Cloudflare

**Features:**
- **CDN:** Static asset caching (JS, CSS, images)
- **SSL:** TLS 1.3 encryption (automatic)
- **DDoS Protection:** Mitigation layer
- **Firewall:** WAF rules untuk SQL injection, XSS protection
- **DNS:** Managed DNS services

---

## 💳 Payment Integration

### Midtrans (Indonesian Payment Gateway)

**Supported Payment Methods:**
- **GoPay:** QRIS payment (most popular e-wallet)
- **OVO:** E-wallet
- **Dana:** E-wallet
- **Bank Transfer:** Virtual Account (Mandiri, BCA, BNI, BRI)
- **Credit Card:** Visa, Mastercard

**Integration Flow:**
1. User click "Upgrade ke Premium"
2. Frontend call backend API: `POST /api/v1/payments/create`
3. Backend create payment di Midtrans API
4. Midtrans return redirect URL
5. User redirect ke Midtrans payment page
6. User complete payment
7. Midtrans send webhook ke backend: `POST /api/v1/payments/webhook`
8. Backend verify signature dan upgrade user ke premium

**Transaction Fees:** 2-3% (tergantung payment method)

---

## 📊 Monitoring & Observability

### Error Tracking: Sentry

**Features:**
- Real-time error tracking
- Stack traces dan breadcrumbs
- Performance monitoring
- Release tracking

### Analytics: Google Analytics 4

**Metrics to Track:**
- Page views (landing, board views)
- User engagement (feedback submissions, votes)
- Conversion funnels (signup → upgrade)
- Retention (DAU, MAU, DAU/MAU ratio)

### Uptime Monitoring: UptimeRobot

**Checks:**
- HTTP endpoint monitoring (5-minute intervals)
- Keyword monitoring (check "API is healthy")
- SSL certificate monitoring
- Response time tracking

---

## 🔒 Security Measures

### Application Security

- **Authentication:** JWT tokens dengan 7-day expiration
- **Password Hashing:** bcrypt dengan cost factor 12
- **Rate Limiting:** 100 requests/minute per IP (Gin middleware)
- **Input Validation:** Zod schemas (frontend) + validator library (backend)
- **SQL Injection:** Parameterized queries (GORM/sqlc)
- **XSS Protection:** Input sanitization, CSP headers
- **CSRF Protection:** Token-based untuk state-changing operations

### Infrastructure Security

- **HTTPS:** TLS 1.3 via Cloudflare
- **Firewall:** Cloudflare WAF rules
- **Database:** PostgreSQL connections encrypted
- **Secrets Management:** Environment variables (no hardcoded secrets)
- **Backups:** Daily automated backups (pg_dump)

---

## 🚀 Deployment Strategy

### Environments

**Development:**
- Local machine (PostgreSQL, Redis locally)
- Hot reload: `air` untuk Go, `npm run dev` untuk Tanstack Start

**Staging:**
- Oracle Cloud VM (smaller instance)
- Automatic deployment dari `develop` branch
- Used untuk testing dengan beta users

**Production:**
- Oracle Cloud VM (larger instance, auto-scaling)
- Automatic deployment dari `main` branch
- Blue-green deployment (zero downtime)

### CI/CD Pipeline

**GitHub Actions:**

```yaml
name: Test & Deploy

on:
  push:
    branches: [main, develop]

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
        run: go test ./... -cover

  deploy:
    needs: test
    runs-on: ubuntu-latest
    if: github.ref == 'refs/heads/main'
    steps:
      - name: Deploy to Coolify
        run: |
          curl -X POST $COOLIFY_DEPLOY_WEBHOOK
```

---

## 📈 Performance Targets

### Backend Performance

- **API Response Time:** < 300ms (p95)
- **Database Query Time:** < 100ms (p95)
- **Concurrent Users:** 1000+ on single VM
- **Throughput:** 10,000 requests/minute

### Frontend Performance

- **Page Load Time:** < 3 seconds (3G connection)
- **Time to Interactive:** < 5 seconds
- **Lighthouse Score:** 85+ (Performance, Accessibility, Best Practices)
- **Bundle Size:** < 200KB (gzipped)

---

## 🔮 Future Architecture Considerations

### Scalability (Year 2+)

**If traffic > 10,000 concurrent users:**
- Add database read replicas (PostgreSQL streaming replication)
- Implement Redis Cluster (distributed caching)
- Add message queue (RabbitMQ/Redis Pub/Sub) untuk async tasks
- Microservices decomposition (separate voting service, notification service)

**If single database becomes bottleneck:**
- Database sharding by `board_id`
- Partition large tables (feedbacks, votes) by date
- Implement connection pooling (PgBouncer)

### Real-Time Features (v2.0+)

**WebSocket Implementation:**
- Gorilla WebSocket (Go backend)
- Socket.IO client (TypeScript)
- Redis Pub/Sub untuk multi-server support

**Use Cases:**
- Live vote count updates
- Real-time new feedback notifications
- Collaborative roadmap editing

---

## 📚 Development Resources

### Documentation

- [Go Documentation](https://golang.org/doc/)
- [Gin Web Framework](https://gin-gonic.com/docs/)
- [TanStack Start](https://tanstack.com/start/latest)
- [PostgreSQL 15 Docs](https://www.postgresql.org/docs/15/)
- [Midtrans Documentation](https://docs.midtrans.com/)

### Best Practices

- [Effective Go](https://go.dev/doc/effective_go)
- [TanStack Query Best Practices](https://tanstack.com/query/latest/docs/framework/react/overview)
- [PostgreSQL Performance Tuning](https://wiki.postgresql.org/wiki/Performance_Optimization)

---

**Document Status:** ✅ Ready for Development
**Next Step:** Detailed implementation planning (database schema, API specifications)
