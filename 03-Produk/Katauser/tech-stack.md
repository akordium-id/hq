# 🛠️ Tech Stack - Katauser

> Technical Architecture & Implementation Details

## 📐 Architecture Overview

```
┌─────────────────────────────────────────────────────────────┐
│                         Client Layer                         │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐      │
│  │    Browser   │  │ Telegram Bot │  │    Email     │      │
│  │ (Tanstack    │  │   (Bot API)  │  │  (SendGrid)  │      │
│  │   Start)     │  │              │  │              │      │
│  └──────┬───────┘  └──────┬───────┘  └──────┬───────┘      │
│         │                  │                  │              │
│         └──────────────────┼──────────────────┘              │
│                            │                                 │
├────────────────────────────┼─────────────────────────────────┤
│                         CDN Layer                            │
│  ┌────────────────────────────────────────────────────┐     │
│  │           Cloudflare (SSL + DDoS Protection)       │     │
│  └────────────────────────┬───────────────────────────┘     │
│                           │                                 │
├───────────────────────────┼─────────────────────────────────┤
│                    Application Layer                        │
│  ┌────────────────────────────────────────────────────┐     │
│  │              Load Balancer (Nginx)                 │     │
│  └────────────────────────┬───────────────────────────┘     │
│                           │                                 │
│           ┌───────────────┴───────────────┐                 │
│           │                               │                 │
│  ┌────────┴─────────┐          ┌─────────┴────────┐         │
│  │  Frontend Server │          │  Backend Server  │         │
│  │ (Tanstack Start) │          │      (Go API)    │         │
│  │    - SSR/SSG     │          │   - REST API     │         │
│  │    - React 18    │          │   - JWT Auth     │         │
│  └────────┬─────────┘          └─────────┬────────┘         │
│           │                               │                  │
├───────────┼───────────────────────────────┼──────────────────┤
│           │         Data Layer            │                  │
│  ┌────────┴────────┐          ┌──────────┴────────┐         │
│  │  Redis Cache    │          │   PostgreSQL DB    │         │
│  │  - Sessions     │          │   - Primary Data   │         │
│  │  - Rate Limit   │          │   - Relationships  │         │
│  └─────────────────┘          └───────────────────┘         │
│                                                              │
└──────────────────────────────────────────────────────────────┘
```

## 🎯 Technology Choices

### Frontend: Tanstack Start

**Why Tanstack Start?**
- Modern React framework with first-class TypeScript support
- Built-in file-based routing (similar to Next.js)
- Server-side rendering (SSR) untuk SEO
- Static site generation (SSG) untuk performance
- Tanstack Query (React Query) untuk server state management
- Better developer experience than Next.js for our use case

**Tech Details:**
```typescript
// File structure
app/
├── routes/
│   ├── index.tsx           # Homepage/landing page
│  ── boards/
│   │   ├── $boardId.tsx    # Public feedback board
│   │   └── index.tsx       # Board listing
│   ├── roadmap.tsx         # Public roadmap
│   ├── auth/
│   │   ├── login.tsx
│   │   └── register.tsx
│   └── dashboard/
│       ├── index.tsx       # Admin dashboard
│       ├── settings.tsx
│       └── boards/
│           ├── new.tsx
│           └── $boardId.tsx
├── components/
│   ├── feedback-board/
│   ├── feedback-card/
│   ├── roadmap/
│   └── ui/                 # Reusable UI components
└── lib/
    ├── api.ts              # API client
    ├── auth.ts             # Authentication utilities
    └── utils.ts
```

**Key Libraries:**
- **UI:** Tailwind CSS + Headless UI + Heroicons
- **State:** Tanstack Query (React Query) + Zustand (client state)
- **Forms:** React Hook Form + Zod (validation)
- **Charts:** Recharts (analytics dashboard)
- **Markdown:** React Markdown (feedback descriptions, changelog)

---

### Backend: Go 1.21+

**Why Go?**
- Performance dan concurrency untuk real-time features
- Type safety dan compile-time error checking
- Standard library yang comprehensive (bukan perlu banyak dependencies)
- Easy deployment (single binary)
- Good ecosystem untuk web frameworks

**Framework Options:**

#### Option 1: Echo (Recommended)
```go
// Pros:
- Minimalist dan fast
- Good middleware ecosystem
- Easy routing
- Clean API design

// Cons:
- Less built-in features than Gin
```

#### Option 2: Gin
```go
// Pros:
- Most popular Go web framework
- Fast performance
- Large community

// Cons:
- More opinionated
- Struct binding could be better
```

#### Option 3: Fiber
```go
// Pros:
- Express.js-like API (familiar for Node.js developers)
- Built-in WebSocket support
- Fast

// Cons:
- Less mature than Echo/Gin
```

**Recommendation:** Start with **Echo** untuk balance of simplicity, performance, dan ecosystem.

**Project Structure:**
```
backend/
├── cmd/
│   ├── server/
│   │   └── main.go              # Application entry point
│   ├── migrate/
│   │   └── main.go              # Database migrations
│   └── seed/
│       └── main.go              # Seed data
├── internal/
│   ├── config/                  # Configuration
│   ├── models/                  # Database models
│   ├── handlers/                # HTTP handlers
│   │   ├── auth.go
│   │   ├── feedback.go
│   │   ├── boards.go
│   │   └── telegram.go
│   ├── services/                # Business logic
│   │   ├── auth_service.go
│   │   ├── feedback_service.go
│   │   └── telegram_service.go
│   ├── middleware/              # Middleware
│   │   ├── auth.go
│   │   ├── cors.go
│   │   └── rate_limit.go
│   └── repository/              # Database access
│       ├── feedback_repo.go
│       └── user_repo.go
├── pkg/                         # Public libraries
│   ├── database/
│   └── logger/
└── migrations/                  # SQL migration files
```

---

### Database: PostgreSQL 15

**Why PostgreSQL?**
- ACID compliance untuk data integrity
- Powerful JSON support (flexible schema untuk metadata)
- Full-text search (untuk search feedback)
- Excellent performance di read-heavy workloads
- Great tooling (pgAdmin, psql, etc.)
- Company standard (Oracle Cloud + Coolify support)

**Schema Design (Draft):**

```sql
-- Users table
CREATE TABLE users (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    full_name VARCHAR(255),
    avatar_url TEXT,
    role VARCHAR(50) DEFAULT 'user', -- 'admin', 'moderator', 'user'
    subscription_tier VARCHAR(50) DEFAULT 'free', -- 'free', 'premium', 'enterprise'
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

-- Boards table
CREATE TABLE boards (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    owner_id UUID REFERENCES users(id) ON DELETE CASCADE,
    name VARCHAR(255) NOT NULL,
    slug VARCHAR(255) UNIQUE NOT NULL,
    description TEXT,
    is_public BOOLEAN DEFAULT true,
    custom_domain VARCHAR(255), -- For white-label
    branding_options JSONB, -- Custom logo, colors, etc.
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

-- Feedback table
CREATE TABLE feedback (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    board_id UUID REFERENCES boards(id) ON DELETE CASCADE,
    user_id UUID REFERENCES users(id) ON DELETE SET NULL, -- Nullable untuk anonymous
    title VARCHAR(255) NOT NULL,
    description TEXT,
    status VARCHAR(50) DEFAULT 'requested', -- 'requested', 'planned', 'in_progress', 'completed', 'declined'
    category VARCHAR(100),
    tags TEXT[], -- Array of tags
    vote_count INTEGER DEFAULT 0,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

-- Votes table
CREATE TABLE votes (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    feedback_id UUID REFERENCES feedback(id) ON DELETE CASCADE,
    user_id UUID REFERENCES users(id) ON DELETE CASCADE,
    vote_type SMALLINT DEFAULT 1, -- 1 for upvote, -1 for downvote
    created_at TIMESTAMP DEFAULT NOW(),
    UNIQUE(feedback_id, user_id)
);

-- Comments table
CREATE TABLE comments (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    feedback_id UUID REFERENCES feedback(id) ON DELETE CASCADE,
    user_id UUID REFERENCES users(id) ON DELETE SET NULL,
    content TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

-- Telegram subscriptions table
CREATE TABLE telegram_subscriptions (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    board_id UUID REFERENCES boards(id) ON DELETE CASCADE,
    chat_id BIGINT NOT NULL, -- Telegram chat ID
    created_at TIMESTAMP DEFAULT NOW()
);

-- Indexes untuk performance
CREATE INDEX idx_feedback_board_id ON feedback(board_id);
CREATE INDEX idx_feedback_status ON feedback(status);
CREATE INDEX idx_feedback_created_at ON feedback(created_at DESC);
CREATE INDEX idx_votes_feedback_id ON votes(feedback_id);
CREATE INDEX idx_votes_user_id ON votes(user_id);

-- Full-text search index
CREATE INDEX idx_feedback_fulltext ON feedback USING gin(
    to_tsvector('english', title || ' ' || COALESCE(description, ''))
);
```

---

### Telegram Bot Integration

**Tech Stack:**
- **Library:** `github.com/go-telegram-bot-api/telegram-bot-api/v5`
- **Webhook:** Receive updates via HTTPS webhook
- **Hosting:** Same backend server, dedicated `/telegram` endpoint

**Features:**
1. **Submit Feedback via Telegram**
   - User sends message to bot
   - Bot prompts untuk board selection (jika multiple)
   - Bot posts feedback ke selected board
   - Returns link ke feedback untuk voting

2. **Notifications**
   - Notify user ketika feedback status changes
   - Notify user ketika ada reply ke comment
   - Daily/weekly digest options

3. **Board Integration**
   - Connect bot ke specific board
   - Bot posts new feedback ke Telegram channel/group
   - Allow voting directly from Telegram (inline buttons)

**Implementation:**
```go
// Webhook handler
func HandleTelegramUpdate(c echo.Context) error {
    var update tgbotapi.Update
    if err := c.Bind(&update); err != nil {
        return err
    }

    if update.Message != nil {
        // Handle new message
        go processMessage(update.Message)
    } else if update.CallbackQuery != nil {
        // Handle inline button click
        go processCallback(update.CallbackQuery)
    }

    return c.NoContent(http.StatusOK)
}
```

---

### Infrastructure

#### Hosting: Oracle Cloud Infrastructure

**Why Oracle Cloud?**
- Company standard (existing infrastructure)
- Generous free tier (Always Free)
- Good performance untuk price
- PostgreSQL database service available
- Singapore region (low latency ke Indonesia)

**Services:**
- **Compute:** VM.Standard.E2.1.micro (Free tier) atau E2.1.small untuk production
- **Database:** Oracle Base Database Service (PostgreSQL)
- **Storage:** Object Storage untuk file uploads (avatars, attachments)
- **Load Balancer:** OCI Load Balancer (optional untuk scaling)

#### Deployment: Coolify

**Why Coolify?**
- Self-hosted PaaS (full control)
- Supports Go + PostgreSQL
- Automatic SSL via Let's Encrypt
- Easy deployment dari GitHub
- Built-in monitoring dan logging
- Company standard deployment platform

**Deployment Workflow:**
```yaml
# coolify.yaml
services:
  - type: rails # Supports Go as well
    name: katauser-api
    repo: https://github.com/akordium/katauser
    branch: main
    build_command: go build -o main ./cmd/server
    start_command: ./main
    env:
      - DATABASE_URL
      - JWT_SECRET
      - TELEGRAM_BOT_TOKEN

  - type: static
    name: katauser-frontend
    repo: https://github.com/akordium/katauser
    branch: main
    build_command: pnpm build
    output_directory: frontend/dist
```

#### CDN: Cloudflare

**Features:**
- SSL/TLS termination
- DDoS protection
- Caching untuk static assets
- Web Application Firewall (WAF)
- Page Rules untuk routing

---

## 🔒 Security Architecture

### Authentication & Authorization

**JWT (JSON Web Tokens):**
```
Access Token: 15 minutes expiration
Refresh Token: 7 days expiration
```

**Implementation:**
```go
// Generate JWT pair
func GenerateTokenPair(user User) (accessToken, refreshToken string, err error) {
    // Access token
    accessToken, err = jwt.NewWithClaims(jwt.SigningMethodHS256, jwt.MapClaims{
        "user_id": user.ID,
        "role":    user.Role,
        "exp":     time.Now().Add(15 * time.Minute).Unix(),
    }).SignedString([]byte(os.Getenv("JWT_SECRET")))

    // Refresh token (stored in HTTP-only cookie)
    refreshToken, err = jwt.NewWithClaims(jwt.SigningMethodHS256, jwt.MapClaims{
        "user_id": user.ID,
        "exp":     time.Now().Add(7 * 24 * time.Hour).Unix(),
    }).SignedString([]byte(os.Getenv("JWT_SECRET")))

    return
}
```

**Role-Based Access Control (RBAC):**
```
Roles:
- admin: Full access to all boards (superuser)
- moderator: Manage specific boards (assigned by board owner)
- user: Submit feedback, vote, comment on public boards
- anonymous: View public boards only (no voting/commenting)

Permissions:
- create_board: Premium & Enterprise only
- unlimited_boards: Premium & Enterprise only
- private_boards: Premium & Enterprise only
- white_label: Enterprise only
```

### Rate Limiting

**Strategy:** Token bucket algorithm via Redis

```
Limits:
- Anonymous: 10 requests/minute
- Authenticated: 60 requests/minute
- Premium: 120 requests/minute
- Webhook endpoints: 1000 requests/hour
```

**Implementation:**
```go
func RateLimitMiddleware(limit int, window time.Duration) echo.MiddlewareFunc {
    return func(next echo.HandlerFunc) echo.HandlerFunc {
        return func(c echo.Context) error {
            key := c.RealIP()
            // Check Redis for request count
            // If over limit, return 429 Too Many Requests
            return next(c)
        }
    }
}
```

### Data Encryption

- **At Rest:** PostgreSQL encryption (managed by Oracle Cloud)
- **In Transit:** TLS 1.3 untuk semua connections
- **Password:** bcrypt dengan cost factor 12

---

## 📊 Monitoring & Observability

### Application Monitoring

**Sentry Integration:**
```go
// Initialize Sentry
func InitSentry() {
    err := sentry.Init(sentry.ClientOptions{
        Dsn:              os.Getenv("SENTRY_DSN"),
        Environment:      os.Getenv("ENV"),
        TracesSampleRate: 1.0,
    })
    if err != nil {
        log.Fatalf("Sentry initialization failed: %v", err)
    }
}
```

**Metrics to Track:**
- API response times (p50, p95, p99)
- Error rates by endpoint
- Database query performance
- Telegram bot latency
- User engagement (votes, comments, submissions)

### Logging

**Structured Logging dengan zerolog:**
```go
// Example usage
log.Info().
    Str("user_id", userID).
    Str("action", "create_feedback").
    Int("feedback_id", feedbackID).
    Msg("Feedback created successfully")
```

**Log Levels:**
- Debug: Development only
- Info: Important events (user actions, system events)
- Warn: Degraded performance (but not failure)
- Error: Errors that need attention
- Fatal: Application crashes

---

## 🚀 Performance Optimization

### Caching Strategy

**Redis Caching:**
```
Cache Keys:
- board:{board_id}:feedback       - List of feedback (5 min TTL)
- board:{board_id}:stats          - Board statistics (10 min TTL)
- user:{user_id}:permissions      - User permissions (1 hour TTL)
- feedback:{feedback_id}:votes    - Vote count (5 min TTL)
```

**Cache Invalidation:**
- Write-through cache untuk critical data
- Cache invalidation on update/delete
- TTL-based expiration untuk less critical data

### Database Optimization

**Connection Pooling:**
```go
// Set connection pool
db.SetMaxOpenConns(25)
db.SetMaxIdleConns(25)
db.SetConnMaxLifetime(5 * time.Minute)
```

**Query Optimization:**
- Use indexes untuk frequently queried columns
- Avoid N+1 queries dengan JOIN atau preloading
- Pagination untuk large datasets
- Read replicas untuk scaling reads (future)

### Frontend Performance

**Tanstack Start Optimizations:**
- Static generation (SSG) untuk public boards
- Server-side rendering (SSR) untuk authenticated pages
- Image optimization dengan next/image equivalent
- Code splitting (lazy loading routes)
- Prefetching untuk faster navigation

---

## 🔄 Development Workflow

### Local Development

**Docker Compose Setup:**
```yaml
version: '3.8'
services:
  postgres:
    image: postgres:15
    environment:
      POSTGRES_DB: katauser_dev
      POSTGRES_USER: postgres
      POSTGRES_PASSWORD: password
    ports:
      - "5432:5432"
    volumes:
      - postgres_data:/var/lib/postgresql/data

  redis:
    image: redis:7-alpine
    ports:
      - "6379:6379"

  backend:
    build: ./backend
    ports:
      - "8080:8080"
    depends_on:
      - postgres
      - redis
    environment:
      DB_HOST: postgres
      REDIS_HOST: redis

  frontend:
    build: ./frontend
    ports:
      - "3000:3000"
    depends_on:
      - backend

volumes:
  postgres_data:
```

### Testing Strategy

**Backend Tests (Go):**
```go
// Unit test example
func TestCreateFeedback(t *testing.T) {
    // Setup test database
    db := setupTestDB()
    defer db.Close()

    // Create test service
    service := NewFeedbackService(db)

    // Test case
    feedback, err := service.CreateFeedback(context.Background(), CreateFeedbackRequest{
        Title:       "Test Feedback",
        Description: "This is a test",
        BoardID:     testBoardID,
    })

    assert.NoError(t, err)
    assert.Equal(t, "Test Feedback", feedback.Title)
}
```

**Frontend Tests (Vitest):**
```typescript
// Component test
describe('FeedbackCard', () => {
    it('renders feedback title and description', () => {
        render(<FeedbackCard feedback={mockFeedback} />)
        expect(screen.getByText('Test Feedback')).toBeInTheDocument()
    })
})
```

---

## 📦 Deployment Checklist

### Pre-Deployment
- [ ] Run all tests (`go test ./...`, `pnpm test`)
- [ ] Build production binaries (`go build -o main`)
- [ ] Build frontend bundle (`pnpm build`)
- [ ] Run database migrations
- [ ] Set environment variables
- [ ] Configure SSL certificates
- [ ] Setup monitoring (Sentry DSN)
- [ ] Backup database

### Post-Deployment
- [ ] Verify API health (`/health` endpoint)
- [ ] Test critical user flows
- [ ] Check error logs
- [ ] Monitor database connections
- [ ] Test Telegram bot webhook
- [ ] Verify email delivery
- [ ] Check CDN caching

---

**Last Updated:** 2026-01-06
**Version:** 0.1.0-architecture
**Status:** Draft - Awaiting Validation
**Next Steps:**
- Finalize Go framework selection (Echo vs Gin vs Fiber)
- Design Telegram Bot API flow
- Create detailed database migration plan
- Setup development environment
