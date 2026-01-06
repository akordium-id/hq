# 🛒 SnapKasir

> Solusi Point of Sale Modern untuk UMKM Indonesia - Modern POS Solution for Indonesian SMEs

## 🏷️ Product Identity

- **Nama Produk:** SnapKasir
- **Status:** 🚀 Active Development / Production Ready
- **Repo Code:** `github.com/akordium/snapkasir` (Private)
- **Live Site:** https://snapkasir.com
- **Staging:** https://staging.snapkasir.com
- **Project Management:** [Link ke GitHub Project Board]

## 📋 Quick Overview

**Tagline:** Solusi Point of Sale Modern untuk UMKM Indonesia

**Deskripsi Singkat:** Platform Point of Sale (POS) yang user-friendly, terjangkau, dan lengkap untuk UMKM Indonesia. Dibuat khusus untuk memudahkan transaksi penjualan, manajemen inventaris, dan analisis bisnis untuk pemilik usaha kecil dan menengah di Indonesia.

**Target Market:**

- Warung dan toko kelontong
- Cafe dan restoran kecil
- Butik dan toko retail
- Usaha jasa (salon, bengkel, dll)
- Startup dan online sellers dengan offline presence

**Problem yang Diselesaikan:** UMKM Indonesia masih menggunakan sistem penjualan manual yang tidak efisien, sulit melacak inventaris, dan tidak memiliki data penjualan yang terstruktur untuk pengambilan keputusan bisnis. Solusi POS existing terlalu mahal, terlalu kompleks, atau tidak support konteks lokal Indonesia.

## 🛠️ Tech Stack

### Backend

- **Framework/Language:** Go 1.21 (Golang)
- **Database:** PostgreSQL 15
- **API:** RESTful API + WebSocket (real-time updates)
- **Queue:** Redis dengan Bull Queue

### Frontend

- **Framework:** Next.js 14 with TypeScript
- **Styling:** Tailwind CSS + Headless UI
- **State Management:** Zustand
- **Charts:** Chart.js dengan custom plugins

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

### Freemium Structure

**Free Plan:**

- 1 store location
- Up to 100 products
- 500 transactions per month
- Basic reporting
- Email support

**Premium Plan - IDR 149,000/bulan:**

- Up to 5 store locations
- Unlimited products
- Unlimited transactions
- Advanced reporting & analytics
- Priority support
- SMS notifications
- Inventory management

**Enterprise Plan - Custom Pricing:**

- Unlimited store locations
- Advanced multi-store management
- API access
- Custom integrations
- Dedicated support
- On-premise deployment option

### Additional Services

- **Hardware Bundle:** POS device + printer + barcode scanner
- **Training:** On-site training untuk staff
- **Customization:** Custom features development
- **Integration:** ERP dan accounting system integration

---

**Last Updated:** 2024-12-01
**Version:** 2.1.0
**Maintainer:** SnapKasir Development Team
