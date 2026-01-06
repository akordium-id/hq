# 📧 KoalaMail

> High-Performance Email Validation API untuk Clean & Deliverable Email Lists

## 🏷️ Product Identity

- **Nama Produk:** KoalaMail
- **Status:** 📋 In Planning
- **Repo Code:** `github.com/akordium/koalamail` (Private)
- **Live Site:** https://koalamail.com
- **API Endpoint:** https://api.koalamail.com
- **Documentation:** https://docs.koalamail.com
- **Project Management:** [Link ke GitHub Project Board]

## 📋 Quick Overview

**Tagline:** Rust-Based Email Validation API dengan Layered Algorithm & Sub-100ms Latency

**Deskripsi Singkat:** Platform validasi email berkinerja tinggi yang menyediakan API untuk memverifikasi alamat email secara real-time. Menggunakan backend Rust untuk kecepatan ekstrem dan serangkaian algoritma berlapis (syntax check, domain validation, SMTP verification) untuk akurasi maksimal. Solusi ideal untuk mengurangi bounce rate, meningkatkan deliverability, dan menghemat budget marketing.

**Target Market:**

- **Primary:** Developer & Software Engineers (integrasi API ke aplikasi)
- **Secondary:** SaaS Companies (email verification untuk user signups, marketing campaigns)
- **Tertiary:** Marketing Agencies (bulk email list cleaning untuk klien)
- **Quaternary:** E-commerce Platforms (reduce failed transactions karena email invalid)

**5 Fitur Utama:**

1. **Real-Time Email Validation API** - Syntax check, domain validation, SMTP verification dengan response time < 100ms
2. **Disposable Email Detection** - Identifikasi temporary email addresses (tempmail, guerrillamail, dll.)
3. **Role-Based Email Detection** - Flagging email peran seperti info@, admin@, support@ untuk strategi email marketing yang lebih baik
4. **Bulk Validation System** - Upload CSV/email list hingga 100,000+ email dengan processing parallel
5. **Multi-Language SDKs** - PHP, JavaScript, Python, Go SDKs dengan comprehensive documentation

**Fitur Tambahan:**

- **Catch-All Detection** - Identifikasi domain yang menerima semua email (valid tapi tidak deliverable)
- **Free Email Provider Detection** - Flagging Gmail, Outlook, Yahoo Mail untuk segmentation
- **MX Record Validation** - Cek DNS MX records untuk memastikan domain dapat menerima email
- **Typo Detection & Suggestion** - Saran perbaikan untuk common typos (gmal.com → gmail.com)
- **API Usage Analytics** - Dashboard monitoring API quota, success rate, dan error tracking

**Problem yang Diselesaikan:**

- **Bounce Rate Tinggi** - Email invalid meningkatkan hard bounces, merusak sender reputation
- **Wasted Marketing Budget** - Mengirim ke email invalid = buang uang untuk email service fees
- **Poor Deliverability** - Bounce rate tinggi membuat email masuk spam folder
- **Manual Verification Tidak Scalable** - Tidak mungkin mengecek ratusan/ratusan ribu email satu per satu
- **Expensive Competitors** - Hunter.io, ZeroBounce charge $0.01+/email = Rp 150+, terlalu mahal untuk Indonesian market

## 🛠 Tech Stack

### Backend

- **Language:** Rust 1.75+ (Performance critical)
- **Web Framework:** Actix-web 4.x (High-performance async framework)
- **Runtime:** Tokio (Async runtime)
- **Email Validation Libraries:**
  - `check-if-email-exists` (Multi-layer validation crate)
  - `trust-dns` untuk DNS queries
  - `lettre` untuk SMTP handshakes

### Frontend

- **Framework:** Vue 3 (Composition API)
- **UI Library:** Vuetify 3 (Material Design Components)
- **Build Tool:** Vite
- **State Management:** Pinia
- **HTTP Client:** Axios

### Infrastructure

- **Hosting:** Oracle Cloud Infrastructure
- **Deployment:** Coolify
- **CDN:** Cloudflare
- **Monitoring:** Custom dashboard dengan Grafana
- **Rate Limiting:** Redis-based token bucket

### Third-party Services

- **Database:** PostgreSQL 15 (user accounts, API logs, usage analytics)
- **Cache:** Redis (rate limiting, result caching untuk 24h)
- **Email:** SendGrid (email notifications, reports)
- **Storage:** Cloudflare R2 (bulk CSV uploads, result exports)
- **DNS:** Cloudflare DNS untuk DNS-over-HTTPS queries

### Algorithm Layers

KoalaMail menggunakan layered validation approach untuk maksimal akurasi:

1. **Syntax Check** (Regex) - Format email valid RFC 5322
2. **Domain Validation** - Domain exists, DNS records present
3. **MX Record Check** - Mail exchange records configured
4. **SMTP Verification** - Connect ke mail server, check mailbox existence
5. **Disposable Detection** - Cek database 5,000+ disposable domains
6. **Role-Based Detection** - Cek common role-based prefixes

## 💻 Local Development Setup

### Prerequisites

- [ ] Rust 1.75+ (rustup, cargo)
- [ ] PostgreSQL 15
- [ ] Redis 7+
- [ ] Node.js 20+ (untuk frontend development)
- [ ] Docker & Docker Compose (optional)

### Installation Steps

1. **Clone repository**

   ```bash
   git clone https://github.com/akordium/koalamail.git
   cd koalamail
   ```

2. **Backend setup (Rust)**

   ```bash
   # Install Rust toolchain (jika belum)
   curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

   # Build backend
   cd backend
   cargo build

   # Setup environment
   cp .env.example .env
   # Edit .env dengan konfigurasi lokal
   ```

3. **Database setup**

   ```bash
   # Jalankan PostgreSQL dan Redis (Docker)
   docker-compose up -d postgres redis

   # Run migrations
   cargo run -- migrate

   # Seed data
   cargo run -- seed
   ```

4. **Frontend setup (Vue 3)**

   ```bash
   cd frontend
   npm install
   cp .env.example .env
   npm run dev
   ```

5. **Start backend server**

   ```bash
   cd backend
   cargo run
   ```

6. **Aplikasi berjalan di:**
   - Frontend: http://localhost:5173
   - Backend API: http://localhost:8080
   - API Documentation: http://localhost:8080/swagger-ui

### Development Commands

**Backend (Rust):**

```bash
# Run development server dengan hot reload
cargo watch -x run

# Run tests
cargo test

# Run tests dengan coverage
cargo tarpaulin --out Html

# Check code quality
cargo clippy

# Format code
cargo fmt

# Build release binary
cargo build --release
```

**Frontend (Vue):**

```bash
# Development server
npm run dev

# Build for production
npm run build

# Preview production build
npm run preview

# Linting
npm run lint

# Type checking
npm run type-check
```

## 🧪 Testing

### Test Suite

**Backend (Rust):**
- **Framework:** Built-in Rust testing + `cargo tarpaulin` untuk coverage
- **Coverage Target:** 90%
- **Test Types:**
  - Unit Tests: Individual validation layers (syntax, domain, SMTP)
  - Integration Tests: API endpoint testing
  - Performance Tests: Load testing untuk <100ms latency target

**Frontend (Vue):**
- **Framework:** Vitest + Vue Test Utils
- **Coverage Target:** 80%
- **Test Types:**
  - Component Tests: Individual component behavior
  - E2E Tests: Critical user journeys dengan Playwright

### Running Tests

**Backend:**

```bash
# Run semua tests
cargo test

# Run specific test module
cargo test test_syntax_validation

# Run tests dengan output
cargo test -- --nocapture

# Run integration tests saja
cargo test --test integration
```

**Frontend:**

```bash
# Run component tests
npm run test

# Run dengan coverage
npm run test:coverage

# Run E2E tests
npm run test:e2e

# Run tests di watch mode
npm run test:watch
```

### Load Testing

```bash
# Using k6 untuk load testing API
k6 run tests/load/api-load-test.js

# Target: 1000 RPS dengan <100ms p95 latency
```

## 🚢 Deployment

### Environments

- **Development:** Local development dengan Docker Compose
- **Staging:** Oracle Cloud dengan staging database
- **Production:** Oracle Cloud dengan horizontal scaling

### Deployment Process

1. **Automatic Deployment** (via Coolify)
   - Push ke branch `main` → deploy ke production
   - Push ke branch `develop` → deploy ke staging

2. **Manual Deployment** (Production)

   **Backend:**
   ```bash
   # Pull latest code
   git pull origin main

   # Build release binary
   cargo build --release

   # Run migrations
   ./target/release/koalamail migrate

   # Restart service
   systemctl restart koalamail
   ```

   **Frontend:**
   ```bash
   # Pull latest code
   git pull origin main

   # Build for production
   npm run build

   # Deploy to CDN (Cloudflare R2)
   npm run deploy
   ```

### Environment Variables

**Required variables:**

- `DATABASE_URL` - PostgreSQL connection string
- `REDIS_URL` - Redis connection string
- `JWT_SECRET` - Secret untuk JWT token generation
- `API_KEY_SALT` - Salt untuk API key hashing
- `SMTP_TIMEOUT_MS` - SMTP verification timeout (default: 5000ms)

**Optional variables:**

- `CORS_ORIGINS` - Allowed CORS origins
- `RATE_LIMIT_PER_MINUTE` - API rate limit (default: 60)
- `CACHE_TTL_SECONDS` - Result cache duration (default: 86400)
- `MAX_CONCURRENT_CHECKS` - Concurrent SMTP checks (default: 100)

**Secret management:** Semua secrets disimpan di environment variables, tidak ada hardcoded secrets.

### Scaling Strategy

- **Horizontal Scaling:** Multiple backend instances di belakang load balancer
- **Connection Pooling:** PostgreSQL connection pool untuk handle high concurrency
- **Caching:** Redis cache untuk 24h deduplication (same email = instant result)
- **Rate Limiting:** Per-IP dan per-API-key rate limiting dengan Redis

## 📊 Key Metrics & Monitoring

### Business Metrics

- [ ] **API Calls/month:** Target 1M+ verifications (Month 6)
- [ ] **Active API Keys:** Target 500+ active developers/companies (Month 6)
- [ ] **Average Latency:** < 100ms p95 response time
- [ ] **Success Rate:** > 95% email validations berhasil
- [ ] **Customer Acquisition Cost (CAC):** < Rp 50,000 per customer
- [ ] **Monthly Recurring Revenue (MRR):** Target Rp 50M+ (Month 12)
- [ ] **Free-to-Paid Conversion:** Target 5-10% conversion rate
- [ ] **API Accuracy:** > 98% validation accuracy (vs industry standard 95%)

### Technical Metrics

- [ ] **Response Time:** < 100ms p95 latency (target: 50ms average)
- [ ] **Uptime:** 99.9% uptime (max 43 minutes downtime/month)
- [ ] **Error Rate:** < 0.1% error rate
- [ ] **Throughput:** 1000+ requests/second per instance
- [ ] **SMTP Success Rate:** > 90% SMTP verifications berhasil
- [ ] **Cache Hit Rate:** > 30% cache hit rate untuk repeat validations

### Monitoring Setup

- **Error Tracking:** Sentry untuk Rust + Vue error tracking
- **Performance Monitoring:** Custom Grafana dashboard dengan metrics:
  - Request rate, latency histogram, error rate
  - SMTP validation success rate
  - Cache hit/miss ratio
- **Uptime Monitoring:** Better Uptime / UptimeRobot dengan status page
- **Business Metrics:** Custom dashboard untuk API usage, revenue tracking

## 🔐 Security

### Security Measures

- [ ] **API Authentication:** Bearer token (API Key) untuk semua endpoints
- [ ] **Rate Limiting:** Redis-based rate limiting (60 req/min default)
- [ ] **Input Validation:** Strict validation untuk semua email inputs
- [ ] **SQL Injection Prevention:** Prepared statements via Rust's diesel ORM
- [ ] **XSS Prevention:** Content Security Policy (CSP) headers
- [ ] **HTTPS Only:** TLS 1.3 untuk semua communications
- [ ] **API Key Rotation:** Automatic key expiration (90 days)

### Security Checklist

- [x] HTTPS enforced (Cloudflare SSL)
- [x] API keys hashed di database (bcrypt)
- [x] Rate limiting implemented (Redis-based)
- [x] CORS properly configured
- [x] Input sanitization untuk semua user inputs
- [x] SQL injection prevention (prepared statements)
- [x] Dependencies regularly updated (Dependabot)
- [ ] Security headers (HSTS, X-Frame-Options, CSP)
- [ ] API access logging dan audit trails
- [ ] Penetration testing sebelum production launch

### Privacy & Data Handling

- **No Email Storage:** Email addresses tidak disimpan di database (kecuali customer's own uploaded CSVs)
- **Logs Retention:** API logs dihapus setelah 30 hari
- **GDPR Compliant:** Users dapat request deletion data mereka
- **No Third-Party Sharing:** Email data tidak dijual ke third parties

## 📚 Documentation

### Internal Documentation

- **Technical Specs:** [link ke technical documentation]
- **API Documentation:** https://docs.koalamail.com (Swagger/Redoc)
- **Database Schema:** [link ke database docs]
- **Deployment Guide:** [link ke deployment guide]

### User Documentation

- **Quick Start Guide:** [link ke getting started guide]
- **API Reference:** [link ke comprehensive API docs]
- **SDK Documentation:**
  - [PHP SDK](https://github.com/akordium/koalamail-php)
  - [JavaScript SDK](https://github.com/akordium/koalamail-js)
  - [Python SDK](https://github.com/akordium/koalamail-python)
  - [Go SDK](https://github.com/akordium/koalamail-go)
- **FAQ:** [link ke FAQ]
- **Video Tutorials:** [link ke video tutorials]

## 🤝 Team & Roles

### Development Team

- **Tech Lead:** Najib (Backend Rust & Architecture)
- **Frontend Developer:** [Nama] (Vue 3 + Vuetify)
- **DevOps Engineer:** [Nama] (Infrastructure & Deployment)

### External Stakeholders

- **Product Owner:** [Nama] (Business Requirements)
- **UI/UX Designer:** [Nama] (Dashboard Design)
- **QA Engineer:** [Nama] (Testing & Quality)
- **Marketing:** [Nama] (Go-to-Market Strategy)

## 🆘 Support & Troubleshooting

### Common Issues

1. **SMTP verification timeout**
   - Cause: Target mail server tidak merespon
   - Solution: Increase `SMTP_TIMEOUT_MS`, mark sebagai "unknown" status

2. **High memory usage during bulk validation**
   - Cause: Processing terlalu banyak concurrent checks
   - Solution: Reduce `MAX_CONCURRENT_CHECKS`, implement chunking

3. **API rate limit exceeded**
   - Solution: Upgrade plan, implement retry dengan exponential backoff

4. **Disposable domain false positives**
   - Solution: Kontribusi ke disposable domain database via GitHub

### Getting Help

- **Email:** support@koalamail.com
- **Documentation:** https://docs.koalamail.com
- **GitHub Issues:** [link ke issues]
- **Status Page:** https://status.koalamail.com

## 📈 Roadmap

Lihat [roadmap.md](./roadmap.md) untuk detail perkembangan produk KoalaMail.

**Milestone Preview:**

- **M1 (Month 1):** MVP - Core validation API (syntax, domain, SMTP)
- **M2 (Month 2):** Disposable detection + role-based email detection
- **M3 (Month 3):** Bulk validation system + CSV upload
- **M4 (Month 4):** Dashboard UI + API usage analytics
- **M5 (Month 5):** SDKs (PHP, JavaScript, Python, Go)
- **M6 (Month 6):** Public launch + marketing campaigns
- **M7-M10:** Advanced features (catch-all detection, typo suggestion, etc.)

## 🔄 Changelog

Lihat [changelog.md](./changelog.md) untuk riwayat perubahan KoalaMail.

## 🐛 Known Issues

Lihat [known-issues.md](./known-issues.md) untuk daftar bug dan limitation yang diketahui.

## 💰 Pricing & Licensing

### Freemium Model

**Free Tier (Developer):**
- **Price:** Rp 0 (gratis)
- **Limits:** 500 verifications/month
- **Features:** Core validation API, basic documentation
- **Rate Limit:** 10 requests/minute
- **Purpose:** Untuk development, testing, small projects
- **Support:** Community only

**Pay-Per-Use (On-Demand):**
- **Price:** Rp 100 per verification
- **No monthly commitment**
- **Features:** All validation layers, no rate limits
- **Purpose:** Untuk sporadic usage, bulk cleaning one-time
- **Payment:** Prepaid credits (min. Rp 50,000 = 500 verifications)

**Subscription (Monthly Recurring):**
- **Starter:** Rp 199,000/month (5,000 verifications = Rp 40/email)
- **Growth:** Rp 499,000/month (20,000 verifications = Rp 25/email)
- **Scale:** Rp 1,999,000/month (100,000 verifications = Rp 20/email)
- **Enterprise:** Custom pricing (unlimited verifications)
- **Features:** Priority support, custom SLA, dedicated infrastructure
- **Discount:** 2 months free (17% discount) untuk annual payment

### Competitive Pricing Comparison

| Service | Price per Email | 10,000 Emails |
|---------|----------------|---------------|
| **KoalaMail** | **Rp 40-100** | **Rp 400,000-1,000,000** |
| Hunter.io | Rp 150+ | Rp 1,500,000+ |
| ZeroBounce | Rp 175+ | Rp 1,750,000+ |
| NeverBounce | Rp 130+ | Rp 1,300,000+ |

**KoalaMail Advantage:** 30-75% lebih murah dari competitors dengan performance setara atau lebih baik (Rust backend).

### Licensing

- **Backend:** Proprietary (closed-source)
- **SDKs:** MIT License (open source)
- **Documentation:** Creative Commons BY 4.0

📖 **Detailed Pricing:** [pricing-model.md](./pricing-model.md) untuk complete pricing breakdown

## 🎯 Go-to-Market Strategy

### Marketing Channels

1. **Developer Communities**
   - GitHub trending (via high-quality SDKs)
   - Dev.to, Medium technical articles
   - Reddit r/rust, r/webdev

2. **Content Marketing**
   - "Why Email Validation Matters" blog series
   - Case studies: "Reduced bounce rate by 90% with KoalaMail"
   - Technical comparison: Rust vs Node.js for API performance

3. **Partnerships**
   - Laravel Indonesia community (PHP SDK)
   - Go Indonesia community (Go SDK)
   - Marketing agencies (bulk validation deals)

4. **SEO Strategy**
   - "Email validation API Indonesia" keywords
   - "Bulk email verification cheap" keywords
   - "Free email checker API" keywords

### Launch Strategy

**Phase 1 (Soft Launch - M5):**
- Beta testing dengan 10 selected companies
- Gather feedback, iterate on features
- Build case studies

**Phase 2 (Public Launch - M6):**
- Product Hunt launch
- Reddit communities promotion
- Free tier for first 1,000 users

**Phase 3 (Growth - M7+):**
- Paid ads (Google Ads, LinkedIn)
- Content marketing machine
- Partnership with marketing agencies

---

**Last Updated:** 2026-01-06
**Version:** 0.1.0-planning
**Maintainer:** Najib Zain (Lead Developer)

**Timeline:**
- **M1-M3 (Months 1-3):** MVP Development - Core API + basic features
- **M4-M5 (Months 4-5):** Beta testing + Dashboard UI
- **M6 (Month 6):** Public launch + marketing campaigns
- **M7-M10:** Advanced features + scale infrastructure

## 🌐 API Quick Example

### Single Email Validation

```bash
curl -X POST https://api.koalamail.com/v1/validate \
  -H "Authorization: Bearer YOUR_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "email": "user@example.com"
  }'
```

**Response:**

```json
{
  "email": "user@example.com",
  "status": "deliverable",
  "score": 0.95,
  "checks": {
    "syntax": "valid",
    "domain": "valid",
    "mx_records": "valid",
    "smtp": "deliverable",
    "disposable": false,
    "role_based": false,
    "free_provider": true
  },
  "processed_at": "2026-01-06T10:30:00Z",
  "processing_time_ms": 87
}
```

### Bulk Validation (PHP SDK Example)

```php
use KoalaMail\Client;

$client = new Client('YOUR_API_KEY');

$emails = [
    'user1@example.com',
    'user2@example.com',
    'user3@example.com'
];

$results = $client->validateBulk($emails);

foreach ($results as $result) {
    echo $result['email'] . ': ' . $result['status'] . "\n";
}
```

### JavaScript SDK Example

```javascript
import { KoalaMailClient } from '@koalamail/js';

const client = new KoalaMailClient('YOUR_API_KEY');

const result = await client.validate('user@example.com');

if (result.status === 'deliverable') {
  // Send email
} else {
  // Handle invalid email
}
```

## 🎯 Success Metrics

### Technical Success

- [x] **Performance:** < 100ms p95 latency (achieved dengan Rust)
- [x] **Accuracy:** > 98% validation accuracy (layered algorithm)
- [x] **Scalability:** 1000+ RPS per instance (horizontal scaling ready)
- [x] **Reliability:** 99.9% uptime target

### Business Success

- [x] **Month 6:** 500+ active API keys
- [x] **Month 6:** 1M+ verifications/month
- [x] **Month 12:** Rp 50M+ MRR
- [x] **Conversion:** 5-10% free-to-paid conversion
- [x] **CAC:** < Rp 50,000 per customer
- [x] **LTV:CAC Ratio:** > 3:1

### Market Position

- **Differentiation:** Rust-based = fastest di market
- **Price:** 30-75% lebih murah dari competitors
- **Localization:** Indonesian market focus + lower pricing
- **Developer Experience:** High-quality SDKs, comprehensive docs

---

## 🔗 Useful Links

- **Website:** https://koalamail.com
- **API Documentation:** https://docs.koalamail.com
- **GitHub:** https://github.com/akordium/koalamail
- **Status Page:** https://status.koalamail.com
- **Support:** support@koalamail.com
