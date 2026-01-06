# ⚙️ SnapKasir Technology Stack

> Arsitektur teknologi dan implementasi untuk SnapKasir - Solusi POS Modern untuk UMKM F&B Indonesia dengan Flutter Cross-Platform

## 🏗️ System Architecture Overview

### Architecture Pattern

**Pattern:** Microservices Architecture dengan API Gateway
**Style:** Event-Driven Architecture dengan CQRS pattern
**Deployment:** Container-based dengan Docker Swarm
**Data Flow:** REST API + WebSocket + Message Queue

### High-Level Architecture

```text
┌──────────────────────────────────────────────────────────────────┐
│                     Flutter App (Single Codebase)                │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐          │
│  │    iOS App   │  │ Android App  │  │   Web App    │          │
│  │  (Native)    │  │  (Native)    │  │ (Flutter Web)│          │
│  └──────────────┘  └──────────────┘  └──────────────┘          │
└──────────────────────────────────────────────────────────────────┘
                                │
                    ┌─────────────────────────┐
                    │   Offline Storage      │
                    │   (Hive - NoSQL)       │
                    └─────────────────────────┘
                                │
                    ┌─────────────────────────┐
                    │   Sync Service          │
                    │   (Background Worker)   │
                    └─────────────────────────┘
                                │
         ┌──────────────────────┼───────────────────────┐
         │                      │                       │
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│  Transaction    │    │   Inventory     │    │   Analytics     │
│    Service      │    │    Service      │    │    Service      │
│     (Go)        │    │     (Go)        │    │     (Go)        │
└─────────────────┘    └─────────────────┘    └─────────────────┘
         │                      │                       │
         └──────────────────────┼───────────────────────┘
                                │
                    ┌─────────────────┐
                    │  Message Queue  │
                    │  Redis (Bull)   │
                    └─────────────────┘
                                │
                    ┌─────────────────┐
                    │   Databases     │
                    │  PostgreSQL 15  │
                    └─────────────────┘
```

## 💻 Frontend Stack (Flutter - Cross-Platform)

### Framework: Flutter 3.16+

**Core Framework:**

- **Framework:** Flutter 3.16+ (Dart 3.2+)
- **State Management:** Riverpod 2.4+ (Provider pattern + code generation)
- **Local Storage:** Hive 2.2+ (NoSQL, offline-first storage)
- **Networking:** Dio 5.3+ (HTTP client dengan interceptors)
- **Dependency Injection:** GetIt 7.6+ + Injectable 2.3+

### Platform Targets

**iOS (Native Build):**
- **Minimum iOS:** iOS 12+
- **Build:** Xcode 15+ dengan Flutter build
- **Architecture:** Release builds menggunakan AOT compilation
- **Features:** Native performance, platform-specific APIs (Bluetooth, Camera)

**Android (Native Build):**
- **Minimum Android:** Android 5.0 (API 21) +
- **Target SDK:** Android 14 (API 34)
- **Build:** Gradle-based builds
- **Features:** Native performance, background services, hardware integration

**Web (Flutter Web):**
- **Browsers:** Chrome, Firefox, Safari, Edge (modern browsers)
- **Rendering:** CanvasKit (default) atau HTML renderer
- **PWA:** Progressive Web App capabilities
- **Limitations:** No Bluetooth/USB hardware access (web platform limitation)

### Key Flutter Dependencies

```yaml
# pubspec.yaml
dependencies:
  flutter:
    sdk: flutter

  # State Management
  flutter_riverpod: ^2.4.9
  riverpod_annotation: ^2.3.3

  # Local Storage (Offline-First)
  hive: ^2.2.3
  hive_flutter: ^1.1.0
  path_provider: ^2.1.1

  # Networking
  dio: ^5.3.4
  connectivity_plus: ^5.0.2

  # Dependency Injection
  get_it: ^7.6.4
  injectable: ^2.3.2

  # UI Components
  flutter_screenutil: ^5.9.0
  flutter_svg: ^2.0.9
  cached_network_image: ^3.3.0
  shimmer: ^3.0.0

  # Utilities
  freezed_annotation: ^2.4.1
  json_annotation: ^4.8.1
  intl: ^0.18.1
  uuid: ^4.2.2

  # Platform-Specific
  flutter_blue_plus: ^1.31.5  # Bluetooth for printing
  qr_code_scanner: ^1.0.1     # Barcode scanning
  image_picker: ^1.0.4         # Camera/Product images
  shared_preferences: ^2.2.2   # Simple key-value storage

  # Charts & Analytics
  fl_chart: ^0.65.0            # Beautiful charts
  syncfusion_flutter_charts: ^24.1.41  # Advanced charts

dev_dependencies:
  flutter_test:
    sdk: flutter

  # Code Generation
  build_runner: ^2.4.7
  riverpod_generator: ^2.3.9
  injectable_generator: ^2.4.1
  freezed: ^2.4.6
  json_serializable: ^6.7.1
  hive_generator: ^2.0.1

  # Linting
  flutter_lints: ^3.0.1
```

### Project Structure (Flutter)

```text
lib/
├── main.dart                 # App entry point
├── core/
│   ├── constants/            # App constants
│   ├── theme/                # App theming
│   ├── utils/                # Utility functions
│   └── network/              # Dio configuration, interceptors
├── data/
│   ├── models/               # Data models (with freezed)
│   ├── repositories/         # Repository implementations
│   └── services/             # API services, local storage services
├── domain/
│   ├── entities/             # Business entities
│   ├── repositories/         # Repository interfaces
│   └── usecases/             # Business logic use cases
├── presentation/
│   ├── providers/            # Riverpod providers
│   ├── pages/                # Full-screen pages
│   ├── widgets/              # Reusable widgets
│   └── dialogs/              # Custom dialogs
└── offline/
    ├── sync/                 # Background sync service
    ├── queue/                # Offline operation queue
    └── conflict/             # Conflict resolution
```

### Offline-First Architecture

```dart
// Offline storage service with Hive
class OfflineStorageService {
  late Box<Transaction> _transactionBox;
  late Box<Product> _productBox;
  late Box<SyncQueueItem> _syncQueueBox;

  Future<void> init() async {
    // Initialize Hive
    await Hive.initFlutter();

    // Register adapters
    Hive.registerAdapter(TransactionAdapter());
    Hive.registerAdapter(ProductAdapter());
    Hive.registerAdapter(SyncQueueItemAdapter());

    // Open boxes
    _transactionBox = await Hive.openBox<Transaction>('transactions');
    _productBox = await Hive.openBox<Product>('products');
    _syncQueueBox = await Hive.openBox<SyncQueueItem>('sync_queue');
  }

  // Save transaction offline
  Future<void> saveTransactionOffline(Transaction transaction) async {
    await _transactionBox.put(transaction.id, transaction);

    // Add to sync queue
    final queueItem = SyncQueueItem(
      action: SyncAction.create,
      entityType: 'transaction',
      data: jsonEncode(transaction.toJson()),
      timestamp: DateTime.now(),
    );
    await _syncQueueItem.add(queueItem);

    // Trigger background sync when online
    if (await _isOnline()) {
      await _syncService.processQueue();
    }
  }

  // Background sync service
  Future<void> syncWhenOnline() async {
    final connectivity = Connectivity();
    final subscription = connectivity.onConnectivityChanged.listen((result) {
      if (result != ConnectivityResult.none) {
        processSyncQueue();
      }
    });
  }
}
```

### Hardware Integration (Flutter)

```dart
// Bluetooth printer service
class PrinterService {
  final FlutterBluePlus _ble = FlutterBluePlus();

  Future<List<BluetoothDevice>> getAvailablePrinters() async {
    // Start scanning
    await _ble.startScan(timeout: Duration(seconds: 5));

    // Listen to scan results
    List<BluetoothDevice> printers = [];
    _ble.scanResults.listen((results) {
      for (ScanResult r in results) {
        if (r.device.localName.contains('Printer') ||
            r.device.localName.contains('EPSON') ||
            r.device.localName.contains('PT-')) {
          printers.add(r.device);
        }
      }
    });

    return printers;
  }

  Future<void> printReceipt(BluetoothDevice printer, Receipt receipt) async {
    // Connect to printer
    await printer.connect();

    // Send ESC/POS commands
    await printer.write(receipt.toEscPosCommands());

    // Disconnect
    await printer.disconnect();
  }
}

// Barcode scanner service
class BarcodeScannerService {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  Future<String?> scanBarcode(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BarcodeScannerView(),
      ),
    );
    return result;
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

### Why Flutter for Cross-Platform Frontend?

- **One Codebase, Three Platforms:** iOS, Android, dan Web dari single codebase (60% dev cost reduction vs native)
- **Native Performance:** AOT compilation produces native ARM/x64 code, bukan JavaScript interpretation
- **Beautiful UI:** Widget system enables pixel-perfect UI dengan smooth 60fps animations
- **Fast Development:** Hot reload enables instant feedback during development
- **Growing Ecosystem:** Flutter ecosystem maturing rapidly dengan 200K+ packages on pub.dev

**Flutter vs React Native vs Native:**

| Aspect | Flutter | React Native | Native (iOS + Android) |
|--------|---------|--------------|------------------------|
| **Codebase** | 1 codebase | 1 codebase | 2 separate codebases |
| **Performance** | Native (AOT) | Good (Bridge) | Best |
| **UI Consistency** | 100% pixel-perfect | ~90% consistent | Platform-specific |
| **Dev Cost** | $ (1 team) | $$ (1 team + RN expert) | $$$ (2 teams) |
| **Time to Market** | Fastest | Fast | Slowest |
| **Hardware Access** | Full access | Full access | Full access |
| **Learning Curve** | Medium (Dart) | Low (JavaScript) | High (Swift + Kotlin) |

**Decision:** Flutter provides optimal balance untuk SnapKasir:
- F&B UX requirements need pixel-perfect consistency across devices
- Offline-first architecture requires robust local storage (Hive) - Flutter excels here
- Limited development budget → 1 codebase vs 2 native teams
- Go backend + Flutter frontend = modern stack with strong type safety

### Why PostgreSQL + TimescaleDB?

- **Reliability:** Proven enterprise database
- **Time Series:** TimescaleDB untuk analytics optimization
- **ACID Compliance:** Critical untuk financial transactions
- **Extensions:** Rich extension ecosystem

### Why Redis for Caching & Sync?

- **Performance:** In-memory storage untuk speed
- **Data Structures:** Multiple data types untuk different use cases
- **Persistence:** Optional persistence untuk durability
- **Scalability:** Horizontal scaling support
- **Pub/Sub:** Real-time sync untuk multi-device updates

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

**Document Version:** 2.0.0-alpha (Flutter Migration)
**Last Updated:** 2026-01-06
**Next Review:** 2026-02-01 (Post-validation)
**Owner:** Najib Zain (Product Lead)
**Tech Lead:** Backend Engineer
**Maintainer:** DevOps Team
**Validation Status:** See `hq-bun` beads issue for complete validation
