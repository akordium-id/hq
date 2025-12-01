# ⚙️ SnapKasir Technology Stack

> Arsitektur teknologi dan implementasi untuk SnapKasir - Solusi Point of Sale Modern untuk UMKM Indonesia

## 🏗️ System Architecture Overview

### Architecture Pattern

**Pattern:** Microservices Architecture dengan API Gateway
**Style:** Event-Driven Architecture dengan CQRS pattern
**Deployment:** Container-based dengan Docker Swarm
**Data Flow:** REST API + WebSocket + Message Queue

### High-Level Architecture

```text
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Web Frontend  │    │  Mobile Apps    │    │  Admin Portal   │
│   Next.js       │    │ React Native    │    │   Next.js       │
└─────────────────┘    └─────────────────┘    └─────────────────┘
         │                       │                       │
         └───────────────────────┼───────────────────────┘
                                 │
                    ┌─────────────────┐
                    │   API Gateway   │
                    │   (Go + Envoy)  │
                    └─────────────────┘
                                 │
         ┌───────────────────────┼───────────────────────┐
         │                       │                       │
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│  Transaction    │    │   Inventory     │    │   Analytics     │
│    Service      │    │    Service      │    │    Service      │
│     (Go)        │    │     (Go)        │    │     (Go)        │
└─────────────────┘    └─────────────────┘    └─────────────────┘
         │                       │                       │
         └───────────────────────┼───────────────────────┘
                                 │
                    ┌─────────────────┐
                    │  Message Queue  │
                    │   Redis + Bull  │
                    └─────────────────┘
                                 │
                    ┌─────────────────┐
                    │   Databases     │
                    │ PostgreSQL +    │
                    │   TimescaleDB   │
                    └─────────────────┘
```

## 💻 Frontend Stack

### Web Application: Next.js 14

**Core Framework:**

- **Framework:** Next.js 14 dengan App Router
- **Language:** TypeScript 5.2+
- **Styling:** Tailwind CSS 3.3+ dengan custom components
- **State Management:** Zustand 4.4+ + React Query
- **Forms:** React Hook Form dengan Zod validation

### Key Frontend Dependencies

```json
{
  "dependencies": {
    "next": "^14.0.0",
    "react": "^18.2.0",
    "typescript": "^5.2.0",
    "tailwindcss": "^3.3.0",
    "@headlessui/react": "^1.7.0",
    "framer-motion": "^10.16.0",
    "chart.js": "^4.4.0",
    "react-chartjs-2": "^5.2.0",
    "@tanstack/react-query": "^5.0.0",
    "zustand": "^4.4.0",
    "react-hook-form": "^7.47.0",
    "zod": "^3.22.0",
    "@hookform/resolvers": "^3.3.0",
    "lucide-react": "^0.288.0",
    "clsx": "^2.0.0",
    "date-fns": "^2.30.0",
    "react-hot-toast": "^2.4.0"
  }
}
```

### Mobile Application: React Native

**Core Framework:**

- **Framework:** React Native 0.72+
- **Language:** TypeScript 5.2+
- **Navigation:** React Navigation 6
- **State Management:** Zustand + React Query
- **UI Components:** React Native Elements + Custom Components

### Mobile-Specific Libraries

```json
{
  "dependencies": {
    "react-native": "^0.72.0",
    "react-navigation": "^4.4.0",
    "@react-navigation/native": "^6.1.0",
    "@react-navigation/stack": "^6.3.0",
    "react-native-elements": "^3.4.0",
    "react-native-vector-icons": "^10.0.0",
    "react-native-camera": "^4.2.0",
    "react-native-bluetooth-serial": "^1.0.0",
    "react-native-thermal-printer": "^1.0.0",
    "@react-native-async-storage/async-storage": "^1.19.0"
  }
}
```

## 🖥️ Backend Stack

### Core Framework: Go 1.21

**Main Technologies:**

- **Language:** Go 1.21+
- **Framework:** Gin Web Framework
- **Architecture:** Clean Architecture + DDD
- **Validation:** Go-Playground Validator
- **Logging:** Logrus dengan structured JSON logs
- **Configuration:** Viper dengan environment variables

### Key Backend Dependencies

```go
module github.com/akordium/snapkasir-backend

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
    github.com/hibiken/asynq v0.24.1
    github.com/rabbitmq/amqp091-go v1.8.1
    github.com/go-playground/validator/v10 v10.15.0
    go.uber.org/zap v1.25.0
    github.com/prometheus/client_golang v1.17.0
)
```

### Microservices Architecture

```go
// Service structure example
type Service struct {
    Config     *config.Config
    DB         *gorm.DB
    Redis      *redis.Client
    Queue      *asynq.Client
    Logger     *zap.Logger
    Validator  *validator.Validate
}

func NewService(cfg *config.Config) (*Service, error) {
    db, err := database.NewConnection(cfg.Database)
    if err != nil {
        return nil, err
    }

    redis, err := database.NewRedis(cfg.Redis)
    if err != nil {
        return nil, err
    }

    queue := asynq.NewClient(asynq.RedisClientOpt{
        Addr: cfg.Redis.Address,
    })

    return &Service{
        Config:     cfg,
        DB:         db,
        Redis:      redis,
        Queue:      queue,
        Logger:     zap.NewProduction(),
        Validator:  validator.New(),
    }, nil
}
```

## 🗄️ Database Stack

### Primary Database: PostgreSQL 15

**Configuration:**

- **Version:** PostgreSQL 15+ dengan TimescaleDB extension
- **Connection Pooling:** PgBouncer dengan transaction pooling
- **Backup:** pg_dump dengan nightly backups + point-in-time recovery
- **Monitoring:** pgBouncer + pg_stat_statements

### Database Schema Design

```sql
-- Products table
CREATE TABLE products (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    store_id UUID NOT NULL REFERENCES stores(id) ON DELETE CASCADE,
    sku VARCHAR(100) UNIQUE NOT NULL,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    category_id UUID REFERENCES categories(id),
    price DECIMAL(12,2) NOT NULL,
    cost DECIMAL(12,2),
    stock_quantity INTEGER DEFAULT 0,
    min_stock_level INTEGER DEFAULT 0,
    barcode VARCHAR(100),
    image_url TEXT,
    is_active BOOLEAN DEFAULT true,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Transactions table (time-series optimized)
CREATE TABLE transactions (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    store_id UUID NOT NULL REFERENCES stores(id) ON DELETE CASCADE,
    transaction_number VARCHAR(50) UNIQUE NOT NULL,
    customer_id UUID REFERENCES customers(id),
    staff_id UUID REFERENCES staff(id),
    subtotal DECIMAL(12,2) NOT NULL,
    tax_amount DECIMAL(12,2) DEFAULT 0,
    discount_amount DECIMAL(12,2) DEFAULT 0,
    total_amount DECIMAL(12,2) NOT NULL,
    payment_method VARCHAR(50) NOT NULL,
    payment_status VARCHAR(20) DEFAULT 'completed',
    notes TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Convert to TimescaleDB hypertable
SELECT create_hypertable('transactions', 'created_at');

-- Transaction items table
CREATE TABLE transaction_items (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    transaction_id UUID NOT NULL REFERENCES transactions(id) ON DELETE CASCADE,
    product_id UUID NOT NULL REFERENCES products(id),
    quantity INTEGER NOT NULL,
    unit_price DECIMAL(12,2) NOT NULL,
    total_price DECIMAL(12,2) NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Indexes for performance
CREATE INDEX idx_products_store_id ON products(store_id);
CREATE INDEX idx_products_sku ON products(sku);
CREATE INDEX idx_products_category ON products(category_id);
CREATE INDEX idx_transactions_store_created ON transactions(store_id, created_at DESC);
CREATE INDEX idx_transaction_items_transaction ON transaction_items(transaction_id);
```

### Caching Layer: Redis 7

**Use Cases:**

- Session management untuk multi-device access
- Real-time inventory cache untuk performance
- Payment transaction cache untuk offline capability
- API response caching dengan TTL
- Rate limiting untuk API endpoints

```go
// Redis client setup dengan cluster support
func NewRedis(cfg config.RedisConfig) (*redis.Client, error) {
    rdb := redis.NewClient(&redis.Options{
        Addr:     cfg.Address,
        Password: cfg.Password,
        DB:       cfg.DB,
        PoolSize: 100,
        MinIdleConns: 10,
    })

    // Test connection
    ctx, cancel := context.WithTimeout(context.Background(), 5*time.Second)
    defer cancel()

    _, err := rdb.Ping(ctx).Result()
    return rdb, err
}
```

### Message Queue: Redis + Bull

**Use Cases:**

- Asynchronous payment processing
- Email/SMS notification queue
- Inventory synchronization tasks
- Report generation jobs
- Data export/import operations

```go
// Queue setup example
type Queue struct {
    client *asynq.Client
    server *asynq.Server
}

func NewQueue(cfg config.QueueConfig) *Queue {
    client := asynq.NewClient(asynq.RedisClientOpt{
        Addr: cfg.RedisAddress,
    })

    server := asynq.NewServer(
        asynq.RedisClientOpt{Addr: cfg.RedisAddress},
        asynq.Config{
            Concurrency: cfg.Concurrency,
            Queues: map[string]int{
                "critical": 6,
                "default":  3,
                "low":      1,
            },
        },
    )

    return &Queue{client: client, server: server}
}
```

## ☁️ Infrastructure Stack

### Hosting Platform: Oracle Cloud Infrastructure (OCI)

**Compute Resources:**

- **Compute VM.Standard.A1.Flex:** ARM-based untuk cost efficiency
- **Autoscaling:** Kubernetes Horizontal Pod Autoscaler
- **Load Balancer:** OCI Load Balancer dengan health checks
- **Block Storage:** OCI Block Volume dengan automatic backups

### Container Orchestration: Docker Swarm

**Setup:**

- **Manager Nodes:** 3 nodes untuk high availability
- **Worker Nodes:** Variable scaling based on load
- **Service Mesh:** Nginx reverse proxy
- **Secret Management:** Docker secrets dengan encryption

### Deployment: Coolify Platform

**Features:**

- **Git-based Deployment:** Auto-deploy dari GitHub branches
- **Zero-Downtime:** Blue-green deployment strategy
- **Environment Management:** Dev, Staging, Production environments
- **Resource Monitoring:** Built-in resource usage monitoring

### Docker Configuration

```dockerfile
# Backend Dockerfile
FROM golang:1.21-alpine AS builder

WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download

COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -o main ./cmd/server/main.go

FROM alpine:latest
RUN apk --no-cache add ca-certificates tzdata
WORKDIR /root/

COPY --from=builder /app/main .
COPY --from=builder /app/.env .

EXPOSE 8080
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
ENV NODE_ENV production

CMD ["node", "server.js"]
```

## 🔒 Security Stack

### Authentication & Authorization

- **JWT:** JSON Web Tokens dengan RS256 signing
- **Refresh Tokens:** Secure token rotation dengan Redis storage
- **Multi-Factor Auth:** TOTP support untuk admin users
- **Session Management:** Redis-based sessions dengan device tracking

### Payment Security

- **PCI DSS Compliance:** Level 1 compliance requirements
- **Tokenization:** Payment token storage instead of raw card data
- **3D Secure:** Support untuk 3DS 2.0
- **Fraud Detection:** Basic fraud detection algorithms

### Data Security

```go
// Security middleware setup
func SecurityMiddleware() gin.HandlerFunc {
    return func(c *gin.Context) {
        c.Header("X-Content-Type-Options", "nosniff")
        c.Header("X-Frame-Options", "DENY")
        c.Header("X-XSS-Protection", "1; mode=block")
        c.Header("Strict-Transport-Security", "max-age=31536000; includeSubDomains")
        c.Header("Content-Security-Policy", "default-src 'self'; script-src 'self' 'unsafe-inline'")
        c.Next()
    }
}

// Encryption utilities
func EncryptSensitiveData(data string, key []byte) (string, error) {
    block, err := aes.NewCipher(key)
    if err != nil {
        return "", err
    }

    gcm, err := cipher.NewGCM(block)
    if err != nil {
        return "", err
    }

    nonce := make([]byte, gcm.NonceSize())
    if _, err = io.ReadFull(rand.Reader, nonce); err != nil {
        return "", err
    }

    ciphertext := gcm.Seal(nonce, nonce, []byte(data), nil)
    return base64.StdEncoding.EncodeToString(ciphertext), nil
}
```

## 📊 Monitoring & Analytics Stack

### Application Monitoring

- **Error Tracking:** Sentry dengan performance monitoring
- **Logging:** Structured JSON logging dengan ELK stack
- **Metrics:** Prometheus + Grafana dashboard
- **Health Checks:** Comprehensive health check endpoints
- **APM:** Application Performance Monitoring

### Business Intelligence

```go
// Metrics collection setup
var (
    transactionsTotal = prometheus.NewCounterVec(
        prometheus.CounterOpts{
            Name: "snapkasir_transactions_total",
            Help: "Total number of transactions processed",
        },
        []string{"store_id", "payment_method"},
    )

    transactionDuration = prometheus.NewHistogramVec(
        prometheus.HistogramOpts{
            Name: "snapkasir_transaction_duration_seconds",
            Help: "Duration of transaction processing",
        },
        []string{"store_id"},
    )
)
```

### Database Monitoring

- **Query Performance:** pg_stat_statements monitoring
- **Connection Pooling:** PgBouncer metrics
- **Replication Lag:** TimescaleDB replication monitoring
- **Storage Usage:** Automated alerts untuk storage capacity

## 🖨️ Hardware Integration

### Receipt Printers

**Epson Integration:**

- **SDK:** Epson ePOS-Print SDK
- **Connection:** USB, Ethernet, Bluetooth
- **Formats:** Receipt, label, barcode printing
- **Features:** Logo printing, QR code support

```go
// Printer interface
type Printer interface {
    Connect() error
    PrintReceipt(receipt *Receipt) error
    PrintBarcode(data string) error
    CheckStatus() (PrinterStatus, error)
    Disconnect() error
}

// Epson printer implementation
type EpsonPrinter struct {
    IPAddress string
    Port      int
    client    *epos.EpsonClient
}
```

### Barcode Scanners

- **USB Scanners:** HID device integration
- **Camera Scanners:** Mobile camera dengan ZXing library
- **Bluetooth Scanners:** Bluetooth serial communication
- **Scanner Types:** 1D, 2D, QR code scanning

### Cash Drawers

- **Connection:** USB, Serial, Network-enabled
- **Integration:** Automatic open setelah payment completion
- **Security:** Access control dan audit logging
- **Multiple Drawers:** Support untuk multiple cash drawers

## 💳 Payment Gateway Integration

### Primary Gateway: Midtrans

**Supported Methods:**

- **QRIS:** GoPay, OVO, Dana, ShopeePay, LinkAja
- **Credit Cards:** Visa, Mastercard, JCB, Amex
- **Virtual Accounts:** BCA, BNI, BRI, Mandiri, Permata
- **E-wallets:** All major Indonesian e-wallets

```go
// Payment gateway interface
type PaymentGateway interface {
    CreateCharge(request *ChargeRequest) (*ChargeResponse, error)
    GetStatus(transactionID string) (*TransactionStatus, error)
    ProcessRefund(refundRequest *RefundRequest) (*RefundResponse, error)
    VoidTransaction(transactionID string) (*VoidResponse, error)
}

// Midtrans implementation
type MidtransGateway struct {
    ServerKey    string
    ClientKey    string
    Environment  string // sandbox or production
    HttpClient   *http.Client
}
```

### Alternative Gateway: Xendit

- **Fallback System:** Automatic failover dari Midtrans
- **Diversification:** Multiple payment gateway options
- **Cost Optimization:** Choose most cost-effective gateway per transaction

## 📱 Mobile-Specific Features

### Offline Capability

- **Local Storage:** SQLite untuk offline transactions
- **Sync Queue:** Queue transactions untuk sync saat online
- **Conflict Resolution:** Automatic conflict resolution
- **Data Validation:** Validate data sebelum sync

### Push Notifications

- **Firebase Cloud Messaging:** Real-time notifications
- **In-App Notifications:** Local notification system
- **Email Notifications:** Transaction receipts dan summaries
- **SMS Notifications:** Critical alerts via SMS

```javascript
// Push notification setup
import messaging from '@react-native-firebase/messaging';

// Request permission
const requestUserPermission = async () => {
  const authStatus = await messaging().requestPermission();
  return (
    authStatus === messaging.AuthorizationStatus.AUTHORIZED ||
    authStatus === messaging.AuthorizationStatus.PROVISIONAL
  );
};

// Get FCM token
const getFCMToken = async () => {
  const token = await messaging().getToken();
  return token;
};
```

## 🔧 Development Tools Stack

### Version Control & CI/CD

- **Git:** Git LFS untuk large files
- **Platform:** GitHub dengan protected branches
- **CI/CD:** GitHub Actions + Coolify deployment
- **Code Quality:** SonarQube untuk code quality analysis

### Development Environment

- **IDE:** VS Code dengan Go dan TypeScript extensions
- **Database:** Docker Compose dengan PostgreSQL dan Redis
- **API Testing:** Postman collections dengan automated tests
- **Local Development:** Docker-based development environment

### Testing Stack

**Backend Testing:**

- **Unit Tests:** Go testing package dengan testify
- **Integration Tests:** Testcontainers untuk real databases
- **API Tests:** Postman Newman automation
- **Load Tests:** K6 untuk performance testing

**Frontend Testing:**

- **Unit Tests:** Jest + React Testing Library
- **E2E Tests:** Playwright untuk cross-browser testing
- **Visual Testing:** Storybook dengan Chromatic
- **Mobile Testing:** Detox untuk React Native apps

## 🚀 Performance Optimization

### Frontend Optimization

- **Code Splitting:** Route-based dan component-based splitting
- **Image Optimization:** Next.js Image component dengan WebP
- **Caching:** Service Worker dengan cache strategies
- **Bundle Analysis:** Webpack Bundle Analyzer integration

### Backend Optimization

```go
// Database query optimization
type TransactionRepository struct {
    db *gorm.DB
}

// Optimized query dengan indexes
func (r *TransactionRepository) GetTransactionsByStore(storeID string, limit, offset int) ([]models.Transaction, error) {
    var transactions []models.Transaction

    // Using raw SQL untuk complex queries
    query := `
        SELECT t.*, c.name as customer_name, s.name as staff_name
        FROM transactions t
        LEFT JOIN customers c ON t.customer_id = c.id
        LEFT JOIN staff s ON t.staff_id = s.id
        WHERE t.store_id = $1
        ORDER BY t.created_at DESC
        LIMIT $2 OFFSET $3
    `

    err := r.db.Raw(query, storeID, limit, offset).Scan(&transactions).Error
    return transactions, err
}
```

### Database Optimization

- **Query Optimization:** EXPLAIN ANALYZE untuk slow queries
- **Index Strategy:** Composite indexes untuk common query patterns
- **Connection Pooling:** PgBouncer dengan optimal pool size
- **Read Replicas:** Read-only replicas untuk reporting queries

## 📋 Technology Decision Rationale

### Why Go for Backend?

- **Performance:** High performance untuk transaction processing
- **Concurrency:** Excellent untuk handling concurrent transactions
- **Simplicity:** Easy maintenance dan deployment
- **Ecosystem:** Rich standard library, growing community

### Why Next.js for Frontend?

- **Performance:** SSR/SSG capabilities untuk fast loading
- **Developer Experience:** Excellent TypeScript support
- **SEO Benefits:** Important untuk marketing pages
- **Ecosystem:** Rich React ecosystem

### Why PostgreSQL + TimescaleDB?

- **Reliability:** Proven enterprise database
- **Time Series:** TimescaleDB untuk analytics optimization
- **ACID Compliance:** Critical untuk financial transactions
- **Extensions:** Rich extension ecosystem

### Why Redis for Caching?

- **Performance:** In-memory storage untuk speed
- **Data Structures:** Multiple data types untuk different use cases
- **Persistence:** Optional persistence untuk durability
- **Scalability:** Horizontal scaling support

### Why React Native for Mobile?

- **Code Reuse:** Share logic dengan web application
- **Performance:** Native performance untuk critical operations
- **Ecosystem:** Large library ecosystem
- **Development Speed:** Single codebase untuk iOS dan Android

## 🔮 Future Technology Evolution

### Phase 2 Technical Enhancements

- **GraphQL:** Migrasi dari REST ke GraphQL untuk efficient data fetching
- **Event Sourcing:** Advanced audit trail dan replay capabilities
- **Microservices:** Full microservices architecture adoption
- **Kubernetes:** Migration dari Docker Swarm ke Kubernetes

### Phase 3 Advanced Features

- **Machine Learning:** Python integration untuk AI features
- **IoT Integration:** Smart devices dan sensors
- **Edge Computing:** Local processing untuk offline-first architecture
- **Blockchain:** Supply chain transparency dan anti-counterfeiting

### Phase 4 Enterprise Features

- **Multi-tenancy:** Full SaaS architecture untuk enterprise clients
- **API Gateway:** Advanced API management dan monetization
- **Data Lake:** Big data analytics platform
- **Global Deployment:** Multi-region deployment dengan data residency

---

**Document Version:** 1.0
**Last Updated:** 2024-12-01
**Next Review:** 2025-01-15
**Owner:** Development Team
**Tech Lead:** Backend Engineer
**Maintainer:** DevOps Team
