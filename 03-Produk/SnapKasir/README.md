# 🛒 SnapKasir

> Solusi Point of Sale Modern untuk UMKM Indonesia - Modern POS Solution for Indonesian SMEs

## 🏷️ Product Identity

- **Nama Produk:** SnapKasir
- **Status:** 🔍 In Validation (Product Concept Phase)
- **Repo Code:** `github.com/akordium/snapkasir` (Private - Not Yet Created)
- **Live Site:** https://snapkasir.com (Domain only - Not built yet)
- **Project Management:** `hq-bun` (Beads issue tracker)

## 📋 Quick Overview

**Tagline:** Solusi Point of Sale Modern untuk UMKM Indonesia

**Deskripsi Singkat:** Platform Point of Sale (POS) yang user-friendly, offline-first, dan terjangkau khusus untuk segmen F&B (warung, cafe, restoran) di Indonesia. Menggunakan Flutter untuk cross-platform coverage (iOS + Android + Web) dengan satu codebase.

**Target Market (F&B Focused):**

- **Primary:** Warung makan dan minuman (60% dari market)
- **Secondary:** Cafe dan kedai kopi kecil (25% dari market)
- **Tertiary:** Restoran kecil dan menengah (15% dari market)

**Problem yang Diselesaikan:** UMKM F&B Indonesia masih menggunakan sistem penjualan manual (kertas/buku), tidak efisien, sulit melacak inventaris, dan tidak memiliki data penjualan yang terstruktur untuk pengambilan keputusan bisnis. Solusi POS existing (Moka, Pawoon, Olsera) terlalu mahal, UX terlalu kompleks untuk ibu-ibu warung, dan sering tidak bekerja saat internet putus.

## 🛠️ Tech Stack

### Backend

- **Framework/Language:** Go 1.21+ (Golang) - RESTful API
- **Database:** PostgreSQL 15+ dengan proper indexing
- **Queue:** Redis 7+ untuk background jobs dan sync
- **Architecture:** Clean Architecture dengan domain-driven design

### Frontend (Flutter - Cross-Platform)

- **Framework:** Flutter 3.16+ with Dart 3.2+
- **Platform Coverage:**
  - **iOS:** Native build untuk iPhone/iPad
  - **Android:** Native build untuk phones/tablets
  - **Web:** Responsive web app (Flutter for Web)
- **State Management:** Riverpod (bloc pattern)
- **Local Storage:** Hive (offline-first storage)
- **Sync Mechanism:** Custom sync service dengan conflict resolution

### Infrastructure

- **Hosting:** Oracle Cloud Infrastructure
- **Deployment:** Coolify
- **CDN:** Cloudflare
- **Monitoring:** Sentry + Grafana

### Third-party Services

- **Payment Gateway:** Midtrans, Xendit
- **Printing:** Epson ePOS SDK, Bluetooth printing
- **SMS/WhatsApp:** Twilio, WABA
- **Analytics:** Google Analytics 4

## 💻 Local Development Setup

### Prerequisites

- [ ] Go 1.21+
- [ ] PostgreSQL 15
- [ ] Node.js 18+
- [ ] Redis 7+
- [ ] Docker & Docker Compose (optional)

### Installation Steps

1. **Clone repository**

   ```bash
   git clone https://github.com/akordium/snapkasir.git
   cd snapkasir
   ```

2. **Backend Setup**

   ```bash
   cd backend
   go mod download
   cp .env.example .env
   go run cmd/migrate/main.go
   go run cmd/seed/main.go
   ```

3. **Frontend Setup**

   ```bash
   cd frontend
   npm install
   cp .env.example .env.local
   ```

4. **Environment Configuration**

   ```bash
   # Backend .env
   DB_HOST=localhost
   DB_PORT=5432
   DB_DATABASE=snapkasir_dev
   DB_USER=postgres
   DB_PASSWORD=password
   REDIS_URL=redis://localhost:6379
   JWT_SECRET=your-secret-key
   MIDTRANS_SERVER_KEY=your-midtrans-key
   XENDIT_SECRET_KEY=your-xendit-key

   # Frontend .env.local
   NEXT_PUBLIC_API_URL=http://localhost:8080
   NEXT_PUBLIC_WS_URL=ws://localhost:8080
   NEXT_PUBLIC_MIDTRANS_CLIENT_KEY=your-midtrans-client-key
   ```

5. **Start Development Servers**

   ```bash
   # Terminal 1: Backend
   cd backend && go run cmd/server/main.go

   # Terminal 2: Frontend
   cd frontend && npm run dev

   # Terminal 3: Redis (jika tidak di Docker)
   redis-server
   ```

6. **SnapKasir berjalan di:**
   - Frontend: http://localhost:3000
   - Backend API: http://localhost:8080
   - API Documentation: http://localhost:8080/swagger/

### Development Commands

```bash
# Backend Testing
cd backend && go test ./...

# Frontend Testing
npm run test

# Go Build
cd backend && go build -o main ./cmd/server

# Run Production Build
./main
```

## 🧪 Testing

### Test Suite

- **Framework:** Go testing (native) + Jest (JavaScript/TypeScript)
- **Coverage Target:** 90%
- **Test Types:**
  - Unit Tests: Business logic, API handlers, utilities
  - Integration Tests: Database operations, API endpoints
  - E2E Tests: Critical user journeys dengan Playwright

### Running Tests

```bash
# Backend Tests
cd backend && go test ./...

# Frontend Tests
npm run test

# E2E Tests
npm run test:e2e

# All Tests (Backend + Frontend)
npm run test:all
```

## 🚢 Deployment

### Environments

- **Development:** Local development dengan PostgreSQL dan Redis
- **Staging:** Oracle Cloud dengan staging database
- **Production:** Oracle Cloud dengan high-availability setup

### Deployment Process

1. **Automatic Deployment** (via Coolify)
   - Frontend: Push ke `main` → deploy ke production
   - Backend: Push ke `main` → deploy ke production
   - Staging: Push ke `develop` → deploy ke staging

2. **Manual Deployment** (jika perlu)

   ```bash
   # Frontend
   npm run build
   npm run deploy

   # Backend
   go build -o main ./cmd/server
   ./main
   ```

### Environment Variables

**Required Backend Variables:**

- `DB_HOST`, `DB_PORT`, `DB_DATABASE`, `DB_USERNAME`, `DB_PASSWORD`
- `REDIS_URL`, `JWT_SECRET`, `MIDTRANS_SERVER_KEY`, `XENDIT_SECRET_KEY`
- `SENTRY_DSN`, `GOOGLE_APPLICATION_CREDENTIALS`

**Required Frontend Variables:**

- `NEXT_PUBLIC_API_URL`, `NEXT_PUBLIC_ENV`, `NEXT_PUBLIC_MIDTRANS_CLIENT_KEY`

**Secret Management:** Semua secrets stored di environment variables dengan secure management.

## 📊 Key Metrics & Monitoring

### Business Metrics

- [ ] **Active Users:** Target 10,000+ active UMKM users
- [ ] **Daily Transactions:** Target 500,000+ transactions per day
- [ ] **GMV (Gross Merchandise Value):** Target IDR 50 Milyar+ per month
- [ ] **Store Locations:** Target 5,000+ active store locations

### Technical Metrics

- [ ] **Response Time:** < 100ms average API response
- [ ] **Uptime:** 99.95% uptime SLA
- [ ] **Transaction Success Rate:** > 99.5%
- [ ] **Receipt Printing Success:** > 98% success rate

### Monitoring Setup

- **Error Tracking:** Sentry dengan performance monitoring
- **Analytics:** Google Analytics 4 + custom dashboard
- **Uptime Monitoring:** Cloudflare + custom health checks
- **Business Metrics:** Real-time transaction monitoring dashboard

## 🔐 Security

### Security Measures

- [ ] **Authentication:** JWT tokens dengan refresh mechanism
- [ ] **Authorization:** Role-based access (Admin, Kasir, Owner)
- [ ] **Data Encryption:** Sensitive data encrypted at rest
- [ ] **API Security:** Rate limiting, CORS, input validation
- [ ] **Payment Security:** PCI DSS compliance untuk payment processing
- [ ] **Audit Trail:** Complete audit trail untuk semua transactions

### Security Checklist

- [x] HTTPS enabled dengan Cloudflare SSL
- [x] Environment variables secured
- [x] Database connections encrypted
- [x] User passwords hashed dengan bcrypt
- [x] API rate limiting implemented
- [x] Input validation untuk semua API endpoints
- [ ] PCI DSS compliance assessment
- [ ] Regular security audits

## 💳 Payment Gateway Integration

### Supported Payment Methods

- **QRIS:** GoPay, OVO, Dana, ShopeePay
- **E-Wallet:** LinkAja, AstraPay
- **Virtual Account:** BCA, BNI, BRI, Mandiri
- **Credit/Debit Cards:** Visa, Mastercard, JCB
- **Bank Transfer:** Manual confirmation system

### Integration Partners

- **Midtrans:** Primary payment gateway
- **Xendit:** Alternative payment gateway
- **QRIS Integration:** Direct integration dengan BI

### Payment Features

- **Split Payments:** Multiple payment methods dalam satu transaksi
- **Partial Payments:** Down payments dan installments
- **Refunds:** Automated refund processing
- **Reconciliation:** Daily payment reconciliation reports

## 🖨️ Hardware Integration

### Receipt Printers

- **Epson:** TM-T82, TM-T83, TM-U220 series
- **Custom:** Bluetooth dan USB printer support
- **Mobile:** Android printing support

### Barcode Scanners

- **USB:** Standard USB barcode scanners
- **Bluetooth:** Wireless scanner support
- **Camera:** Mobile camera barcode scanning

### Cash Drawers

- **USB:** USB-powered cash drawers
- **Serial:** Traditional serial interface support
- **Network:** Network-enabled cash drawers

## 📱 Mobile Features

### Native Mobile App

- **iOS:** Support untuk iPad POS operations
- **Android:** Tablet dan phone support
- **Offline Mode:** Limited functionality tanpa internet
- **Sync:** Automatic sync saat koneksi tersedia

### Progressive Web App

- **Installable:** PWA support untuk desktop experience
- **Offline:** Basic transaction capability offline
- **Notifications:** Push notifications untuk low stock alerts

## 📚 Documentation

### Internal Documentation

- **Technical Specs:** [link ke technical documentation]
- **API Documentation:** [link ke API docs]
- **Database Schema:** [link ke database docs]
- **Deployment Guide:** [link ke deployment guide]

### User Documentation

- **User Guide:** [link ke user guide]
- **Video Tutorials:** [link ke video tutorials]
- **FAQ:** [link ke FAQ]
- **Support Center:** support.snapkasir.com

### Merchant Resources

- **Getting Started:** Panduan setup baru
- **Best Practices:** Tips optimasi penggunaan
- **Training Materials:** Video tutorials untuk staff
- **Business Insights:** Artikel tips bisnis

## 🤝 Team & Roles

### Development Team

- **Tech Lead:** [Nama] (Go Architecture & API Design)
- **Frontend Developer:** [Nama] (Next.js & User Experience)
- **Backend Developer:** [Nama] (Go API & Payment Integration)
- **Mobile Developer:** [Nama] (React Native Apps)
- **DevOps Engineer:** [Nama] (Infrastructure & Deployment)

### Business Team

- **Product Manager:** [Nama] (Product Strategy & User Experience)
- **UI/UX Designer:** [Nama] (Design System & Merchant Experience)
- **QA Engineer:** [Nama] (Testing & Quality Assurance)
- **Business Development:** [Nama] (Partnership & Payment Gateways)

## 🆘 Support & Troubleshooting

### Common Issues

1. **Payment Gateway Error**
   - Solution: Check internet connection, verify API keys, retry transaction

2. **Printer Not Working**
   - Solution: Check printer connection, restart printing service, verify paper

3. **Inventory Sync Issues**
   - Solution: Check internet connection, manual sync available

4. **App Crashes on Mobile**
   - Solution: Clear app cache, update to latest version, reinstall if needed

5. **Barcode Scanner Not Detected**
   - Solution: Check USB connection, verify scanner compatibility

### Getting Help

- **Support Portal:** support.snapkasir.com
- **WhatsApp Support:** +62 815-9988-995
- **Email:** support@snapkasir.com
- **Documentation:** docs.snapkasir.com
- **Video Tutorials:** youtube.com/c/snapkasir

## 📈 Roadmap

Lihat [roadmap.md](./roadmap.md) untuk detail perkembangan produk SnapKasir.

## 🔄 Changelog

Lihat [changelog.md](./changelog.md) untuk riwayat perubahan SnapKasir.

## 🐛 Known Issues

Lihat [known-issues.md](./known-issues.md) untuk daftar bug dan limitation yang diketahui.

## 💰 Pricing Model

### Usage-Based Structure (Paid Tiers)

**Tier 1 - Rp 49,000/bulan:**
- Up to 500 transactions per month
- 1 outlet location
- Core POS features
- Basic inventory (100 products)
- Daily sales reports
- Email support

**Tier 2 - Rp 99,000/bulan:**
- 500-2,000 transactions per month
- Up to 3 outlet locations
- Advanced inventory (unlimited products)
- Employee shift management
- Monthly reports & analytics
- WhatsApp support

**Tier 3 - Rp 199,000/bulan:**
- 2,000-5,000 transactions per month
- Up to 5 outlet locations
- Multi-outlet management
- Kitchen display system (KDS)
- Table management & split bill
- Priority support
- SMS notifications

**Tier 4 - Rp 299,000/bulan:**
- 5,000+ transactions per month
- Unlimited outlet locations
- Advanced analytics dashboard
- API access
- Custom integrations
- Dedicated account manager
- On-site training

### Discount Strategy

**Student Discount:** 30% off untuk student entrepreneurs dengan valid student ID

**UKM Certification:** 20% off untuk businesses dengan UKM certification dari pemerintah

**Annual Payment:** 2 months free (17% discount) untuk annual payment

**Early Adopter:** 50% off untuk first 100 users dalam geographic target area

### Additional Services

- **Hardware Bundle:** POS device + printer + barcode scanner ( Rp 2.5M )
- **On-site Training:** Rp 500,000 per session (max 3 hours)
- **Custom Development:** Custom quotes untuk enterprise clients
- **Data Migration:** Free untuk first 50 users, then Rp 250,000 per store

---

**Last Updated:** 2026-01-06
**Version:** 0.1.0-alpha (Validation Phase)
**Maintainer:** Najib Zain (Product Lead)
**Validation Issue:** `hq-bun` (18 child items for complete product validation)
