# 🏘️ Klustera.id

> Satu Aplikasi untuk Kompleks Anda - All-in-One Housing Management Platform

## 🏷️ Product Identity

- **Nama Produk:** Klustera.id
- **Status:** 🥚 Concept (Idea Phase)
- **Repo Code:** `github.com/akordium/klustera` (Not created yet)
- **Live Site:** https://klustera.id (Planned)
- **Staging:** https://staging.klustera.id (Planned)
- **Project Management:** [Link ke GitHub Project Board]

## 📋 Quick Overview

**Tagline:** Satu Aplikasi untuk Kompleks Anda

**Deskripsi Singkat:** Platform manajemen kompleks perumahan all-in-one yang membantu pengelola kompleks, developer perumahan, dan RT/RW mengelola iuran, pengumuman, keluhan, dan booking fasilitas dengan modern dan efisien. Berbasis open source untuk kepercayaan dan kustomisasi.

**Target Market:**

- **Developer Perumahan** (Primary) - Memiliki 5-20 kompleks, butuh sistem terpusat
- **Pengelola Kompleks** - Mengelola 100-500 unit, overwhelmed dengan admin manual
- **Ketua RT/RW** - Pemimpin komunitas, part-time, butuh tools yang simple
- **Property Management Companies** - Mengelola multiple kompleks untuk klien

**Problem yang Diselesaikan:** Manajemen kompleks perumahan masih manual (Excel, WhatsApp, kertas), iuran tertunggak, pengumuman tidak sampai, keluhan warga tidak ter-tracking, dan booking fasilitas ribet. Kompleks modern butuh solusi digital yang terjangkau dan mudah digunakan.

## 🛠 Tech Stack

### Backend

- **Framework/Language:** Laravel 10 (PHP 8.2)
- **Database:** PostgreSQL 15
- **API:** RESTful API dengan Laravel Sanctum (JWT authentication)

### Frontend

- **Framework:** Livewire 3 (Full-stack reactive UI tanpa Node.js)
- **Styling:** Tailwind CSS
- **JavaScript:** Alpine.js (lightweight interactivity)
- **UI Components:** FluxUI (Livewire component library)
- **Templates:** Blade (Server-side rendering)

### Infrastructure

- **Hosting:** Oracle Cloud Infrastructure
- **Deployment:** Coolify (PaaS)
- **CDN:** Cloudflare
- **Monitoring:** Sentry + Custom Dashboard

### Third-party Services

- **Payment:** Midtrans (GoPay, OVO, Dana, Bank Transfer, Credit Card)
- **Email:** SendGrid
- **Storage:** Cloudflare R2
- **Analytics:** Google Analytics 4
- **IoT (Future): MQTT protocol untuk smart home integration

## 💻 Local Development Setup

### Prerequisites

- [ ] PHP 8.2+
- [ ] Composer 2.0+
- [ ] PostgreSQL 15
- [ ] Node.js 18+ (untuk build assets)
- [ ] Redis (optional, untuk caching dan queue)

### Installation Steps

1. **Clone repository**

   ```bash
   git clone https://github.com/akordium/klustera.git
   cd klustera
   ```

2. **Backend Setup**

   ```bash
   composer install
   cp .env.example .env
   php artisan key:generate
   php artisan migrate
   php artisan db:seed
   ```

3. **Frontend Setup**

   ```bash
   npm install
   npm run dev
   ```

4. **Environment Configuration**

   ```bash
   # .env file
   APP_NAME=Klustera
   APP_ENV=local
   APP_DEBUG=true
   APP_URL=http://klustera.test

   DB_CONNECTION=pgsql
   DB_HOST=127.0.0.1
   DB_PORT=5432
   DB_DATABASE=klustera_dev
   DB_USERNAME=postgres
   DB_PASSWORD=password

   MIDTRANS_SERVER_KEY=your-midtrans-key
   MIDTRANS_CLIENT_KEY=your-midtrans-client-key
   ```

5. **Start Development Servers**

   ```bash
   # Terminal 1: Backend with Livewire hot-reload
   php artisan serve

   # Terminal 2: Asset compilation (jika diperlukan)
   npm run build -- --watch
   ```

6. **Aplikasi berjalan di:**
   - Frontend: http://klustera.test
   - Backend API: http://klustera.test/api

### Development Commands

```bash
# Run tests
php artisan test

# Code formatting
./vendor/bin/pint

# Clear cache
php artisan optimize:clear

# Generate Livewire components
php artisan make:livewire ComponentName

# Generate migration
php artisan make:migration create_table_name
```

## 🧪 Testing

### Test Suite

- **Framework:** Pest (PHP testing framework)
- **Coverage Target:** 80% (MVP), 90% (Production)
- **Test Types:**
  - Unit Tests: Models, Services, Utilities
  - Feature Tests: Livewire components, API endpoints
  - Browser Tests: Dusk untuk E2E testing

### Running Tests

```bash
# All tests
php artisan test

# With coverage
php artisan test --coverage

# Specific test file
php artisan test tests/Feature/BillingTest.php

# Dusk browser tests
php artisan dusk
```

## 🚢 Deployment

### Environments

- **Development:** Local development dengan PostgreSQL
- **Staging:** Oracle Cloud dengan staging database
- **Production:** Oracle Cloud dengan high-availability setup

### Deployment Process

1. **Automatic Deployment** (via Coolify)
   - Push ke `main` → deploy ke production
   - Push ke `develop` → deploy ke staging

2. **Environment Variables**
   - `APP_ENV=production`
   - `APP_DEBUG=false`
   - `DB_*` (Production database credentials)
   - `MIDTRANS_*` (Production payment keys)

### Performance Optimization

- **OPcache:** Enable PHP OPcache untuk production
- **Redis:** Caching database queries, sessions, queue
- **Queue:** Laravel Horizon untuk background jobs (billing, notifications)
- **CDN:** Cloudflare untuk static assets

## 📊 Key Metrics & Monitoring

### Business Metrics

- [ ] **Active Complexes:** Target 50 complexes di Year 1
- [ ] **Total Units Managed:** Target 10,000+ units di Year 1
- [ ] **Monthly Recurring Revenue (MRR):** Target Rp 25M/bulan di Year 1
- [ ] **Payment Collection Rate:** > 90% iuran collected on-time
- [ ] **Resident Engagement:** > 60% warga aktif di portal

### Technical Metrics

- [ ] **Response Time:** < 500ms average page load
- [ ] **Uptime:** 99.5% uptime SLA
- [ ] **Error Rate:** < 1% error rate
- [ **Queue Throughput:** Process 1,000 billing events/hour
- [ **Database Performance:** < 100ms query time (p95)

### Monitoring Setup

- **Error Tracking:** Sentry dengan performance monitoring
- **Uptime Monitoring:** UptimeRobot + Cloudflare analytics
- **Business Metrics:** Custom dashboard untuk billing collection, resident engagement
- **Queue Monitoring:** Laravel Horizon dashboard

## 🔐 Security

### Security Measures

- [ ] **Authentication:** Laravel Sanctum (JWT tokens)
- [ ] **Authorization:** Role-based access (Admin, Pengelola, Resident, Satpam)
- [ ] **Data Encryption:** Sensitive financial data encrypted
- [ ] **API Security:** Rate limiting, CSRF protection, input validation
- [ ] **Payment Security:** PCI DSS compliance via Midtrans
- [ ] **Privacy Compliance:** Indonesian PDPA compliance

### Security Checklist

- [x] HTTPS enabled dengan Cloudflare SSL
- [x] Environment variables secured
- [x] Database connections encrypted
- [x] User passwords hashed dengan bcrypt
- [x] API rate limiting implemented (100 requests/minute)
- [x] CSRF protection enabled
- [ ] Input validation untuk semua form inputs
- [ ] SQL injection prevention dengan Eloquent ORM

## 📚 Documentation

### Internal Documentation

- **Product Specs:** [product-spec.md](./product-spec.md) - Fitur dan bisnis model
- **User Stories:** [user-stories.md](./user-stories.md) - Personas dan requirements
- **Technical Architecture:** [tech-stack.md](./tech-stack.md) - TALL Stack implementation
- **Roadmap:** [roadmap.md](./roadmap.md) - 10-milestone development plan
- **Pricing Model:** [pricing-model.md](./pricing-model.md) - Per-unit pricing strategy
- **API Documentation:** (Coming soon)

### User Documentation

- **User Guide:** (Coming soon) - Panduan untuk pengelola kompleks
- **Resident Guide:** (Coming soon) - Panduan untuk warga
- **FAQ:** (Coming soon) - Pertanyaan umum
- **Video Tutorials:** (Coming soon)

## 🤝 Team & Roles

### Development Team

- **Tech Lead:** Najib (Backend Architecture & API Design)
- **Frontend Developer:** (To be hired)
- **Backend Developer:** (To be hired)
- **DevOps Engineer:** (To be determined)

### External Stakeholders

- **Product Owner:** Najib (Product Strategy & Vision)
- **UI/UX Designer:** (To be hired)
- **QA Engineer:** (To be determined)
- **Domain Expert:** Pengelola kompleks (advisory role)

## 🆘 Support & Troubleshooting

### Common Issues

1. **Billing calculation error**
   - Solution: Check data migration scripts, verify unit count dan pricing tier

2. **Livewire component not updating**
   - Solution: Clear cache: `php artisan optimize:clear`, check network connection

3. **Payment notification not received**
   - Solution: Check Midtrans webhook configuration, verify server is accessible dari internet

4. **Queue jobs stuck**
   - Solution: Restart Horizon: `php artisan horizon:terminate`, check Redis connection

### Getting Help

- **Email:** support@klustera.id
- **WhatsApp:** +62 815-9988-995
- **GitHub Issues:** https://github.com/akordium/klustera/issues

## 📈 Roadmap

Lihat [roadmap.md](./roadmap.md) untuk detail perkembangan produk Klustera.id.

## 🔄 Changelog

Lihat [changelog.md](./changelog.md) untuk riwayat perubahan Klustera.id.

## 🐛 Known Issues

Lihat [known-issues.md](./known-issues.md) untuk daftar bug dan limitation yang diketahui.

## 🎯 Business Model

### Per-Unit Pricing (Primary Model)

**Pricing Tiers:**
- **Small Complexes (< 100 units):** Rp 5,000/unit/month
- **Medium Complexes (100-500 units):** Rp 3,000/unit/month
- **Large Complexes (500+ units):** Rp 2,000/unit/month

**Example:**
- kompleks A (200 units, medium tier): 200 × Rp 3,000 = Rp 600,000/bulan
- Kompleks B (1000 units, large tier): 1000 × Rp 2,000 = Rp 2,000,000/bulan

### SaaS Subscription (Alternative)

**Flat Fee Tiers:**
- **Small:** Rp 500,000/bulan (< 100 units)
- **Medium:** Rp 1,500,000/bulan (100-500 units)
- **Large:** Rp 3,000,000/bulan (500+ units)

### Revenue Targets

**Year 1:**
- 50 complexes × average 200 units = 10,000 units
- Average pricing: Rp 3,000/unit/month
- **Annual Revenue:** Rp 300,000,000 (~Rp 25M/bulan)

### Open Source Strategy

**What's Open Source:**
- Core platform code (MIT license)
- Documentation
- Community contributions

**What's Proprietary:**
- Production deployment configurations
- Performance optimization scripts
- Premium integrations (custom IoT providers)
- White-label branding untuk resellers

---

**Last Updated:** 2026-01-06
**Version:** 0.1.0-concept
**Maintainer:** Najib - Akordium Lab
