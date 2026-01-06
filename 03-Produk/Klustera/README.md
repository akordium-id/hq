# 🏘️ Klustera.id

> Platform Manajemen Kompleks Perumahan All-in-One dengan Open-Source Foundation

## 🏷️ Product Identity

- **Nama Produk:** Klustera.id
- **Status:** 🥚 Concept Phase
- **Repo Code:** `github.com/akordium/klustera` (Private - Coming Soon)
- **Live Site:** https://klustera.id (Coming Soon)
- **Project Management:** [Link ke GitHub Project Board]

## 📋 Quick Overview

**Tagline:** Manajemen Perumahan Modern dengan Transparansi & Kepercayaan

**Deskripsi Singkat:** Platform SaaS all-in-one untuk manajemen kompleks perumahan dengan model open-source (AGPL). Klustera membantu pengelola kompleks mengelola iuran, akses tamu, fasilitas, dan komunikasi warga dalam satu platform terintegrasi. Dilengkapi dengan native mobile apps untuk operational staff (satpam, cleaning service).

**Target Market:**

- **Primary:** Developer perumahan menengah (200-500 unit kompleks) di area urban Jabodetabek
- **Secondary:** Pengelola kompleks perumahan (property management companies, RT/RW modern)
- **Tertiary:** Real estate investment trusts (REITs) dengan multi-complex portfolio
- **Quaternary:** Apartment management & commercial property management

**6 Fitur Utama:**

1. **Manajemen Iuran & Tagihan** - Otomatisasi billing IPL, kebersihan, keamanan dengan integrasi Xendit (QRIS, VA, E-Wallet)
2. **Portal Resident & Komunikasi** - Dashboard penghuni, pengumuman, voting online, notifikasi WhatsApp
3. **Access Control System** - QR code untuk resident, guest pre-registration, guard mode untuk security posts
4. **Operations Management** - Complaint tracking, facility booking, cleaning & security task management
5. **Financial Analytics** - Executive dashboard untuk pengurus dengan laporan keuangan real-time
6. **Mobile Apps for Staff** - Native apps (Flutter/React Native) untuk satpam, cleaning service, facility staff

**Problem yang Diselesaikan:**
- Manual complex management (Excel, WhatsApp groups) - inefficient dan error-prone
- Tidak ada transparansi dalam penggunaan dana iuran - trust issues antara warga & pengurus
- Difficult access control & guest management - security risks dan administrative burden
- Poor communication antara pengurus & warga - announcements often missed
- Manual financial reporting - sulit track collection rates dan outstanding payments
- Lack of operational oversight - cleaning & security tasks tidak termonitor

**Competitive Advantage:**
- **Open-source transparency** - Code dapat dilihat, building trust di Indonesian market
- **Dual license model** - AGPL gratis untuk komunitas, commercial license untuk production use
- **TALL stack** - Rapid development dengan Livewire 3 + FluxUI component library
- **End-to-end solution** - Dari billing sampai access control dalam satu platform
- **Mobile-first operations** - Native apps untuk satpam & cleaning staff (offline-first)

## 🛠 Tech Stack

### Backend

- **Framework/Language:** Laravel 10+ (PHP 8.2)
- **Database:** PostgreSQL 15+
- **Multi-tenancy:** `stancl/tenancy` atau package alternatif
- **API:** RESTful API dengan Livewire 3

### Frontend

- **Framework:** Laravel Blade dengan Livewire 3
- **Component Library:** **FluxUI** (Livewire component library) + Custom Tailwind components
- **Styling:** Tailwind CSS 3
- **State Management:** Livewire + Alpine.js
- **Mobile:** Flutter atau React Native (untuk native operational apps)

### Infrastructure

- **Hosting:** Oracle Cloud Infrastructure
- **Deployment:** Coolify (PaaS)
- **CDN:** Cloudflare
- **Monitoring:** Custom Dashboard + Error Tracking

### Third-party Services

- **Payment Gateway:**
  - **Xendit** - Primary payment gateway (QRIS, Virtual Account, GoPay, OVO, DANA)
  - **Midtrans** - Backup payment gateway (fallback)
- **Communication:**
  - **WhatsApp Gateway** - [To be determined: Twilio, Waboxapp, atau local provider]
  - **Email:** SendGrid atau Amazon SES
- **Storage:** Cloudflare R2 atau Oracle Object Storage
- **Analytics:** Google Analytics + Custom Analytics

## 💻 Local Development Setup

### Prerequisites

- [ ] PHP 8.2+
- [ ] PostgreSQL 15
- [ ] Composer 2.0+
- [ ] Node.js 18+ (untuk build assets)
- [ ] Docker & Docker Compose (optional, untuk PostgreSQL)

### Installation Steps

1. **Clone repository**

   ```bash
   git clone https://github.com/akordium/klustera.git
   cd klustera
   ```

2. **Install dependencies**

   ```bash
   composer install
   npm install
   ```

3. **Environment setup**

   ```bash
   cp .env.example .env
   php artisan key:generate
   # Edit .env file dengan konfigurasi lokal
   ```

4. **Database setup**

   ```bash
   # Jalankan PostgreSQL (jika menggunakan Docker)
   docker-compose up -d postgres

   # Buat database
   createdb klustera_dev

   # Run migrations
   php artisan migrate

   # Seed data
   php artisan db:seed
   ```

5. **Build frontend assets**

   ```bash
   npm run build
   ```

6. **Start development server**

   ```bash
   php artisan serve
   ```

7. **Aplikasi berjalan di:** http://localhost:8000

### Development Commands

```bash
# Testing
php artisan test

# Linting
./vendor/bin/pint

# Generate IDE helper files
php artisan ide-helper:generate
php artisan ide-helper:models

# Create new migration
php artisan make:migration create_table_name

# Generate resource controller
php artisan make:controller ResourceController --resource
```

## 🧪 Testing

### Test Suite

- **Framework:** PHPUnit + Pest
- **Coverage Target:** 85%
- **Test Types:**
  - Unit Tests: Model, Service, Repository layer
  - Feature Tests: Application workflows
  - Browser Tests: Critical user journeys dengan Laravel Dusk

### Running Tests

```bash
# Run semua tests
php artisan test

# Run specific test file
php artisan test tests/Feature/BillingTest.php

# Run dengan coverage
php artisan test --coverage

# Run tests di watch mode
php artisan test --watch
```

## 🚢 Deployment

### Environments

- **Development:** Local development dengan SQLite atau PostgreSQL
- **Staging:** Oracle Cloud dengan staging database (auto-deploy dari branch `develop`)
- **Production:** Oracle Cloud dengan high-availability setup (auto-deploy dari branch `main`)

### Deployment Process

1. **Automatic Deployment** (via Coolify)
   - Push ke branch `main` → deploy ke production
   - Push ke branch `develop` → deploy ke staging

2. **Manual Deployment** (jika perlu)

   ```bash
   # Pull latest code
   git pull origin main

   # Install dependencies
   composer install --no-dev --optimize-autoloader
   npm run build

   # Run migrations
   php artisan migrate --force

   # Clear caches
   php artisan cache:clear
   php artisan config:clear
   php artisan view:clear
   ```

### Environment Variables

**Required variables:**

- `DB_CONNECTION` - Database connection type
- `DB_HOST` - Database host
- `DB_PORT` - Database port
- `DB_DATABASE` - Database name
- `DB_USERNAME` - Database username
- `DB_PASSWORD` - Database password
- `XENDIT_SECRET_KEY` - Xendit API secret key
- `XENDIT_WEBHOOK_TOKEN` - Xendit webhook verification token
- `WA_GATEWAY_API_KEY` - WhatsApp gateway API key

**Optional variables:**

- `MAIL_MAILER` - Mail driver (smtp/log)
- `CACHE_DRIVER` - Cache driver (redis/file)
- `SESSION_DRIVER` - Session driver (redis/file)

**Secret management:** Semua secrets disimpan di environment variables, tidak ada hardcoded secrets.

## 📊 Key Metrics & Monitoring

### Business Metrics

- [ ] **Active Complexes:** Target 20+ active complexes (Year 1)
- [ ] **Total Units Managed:** Target 6,000+ units (Year 1)
- [ ] **Monthly Recurring Revenue (MRR):** Target Rp 50M+ (6 months post-launch)
- [ ] **Collection Rate:** Target 90%+ on-time payment collection
- [ ] **User Engagement:** 80% monthly active residents
- [ ] **Mobile App Adoption:** 90% operational tasks via mobile apps
- [ ] **Freemium Conversion:** Target 10-15% free-to-paid conversion rate

### Technical Metrics

- [ ] **Response Time:** < 500ms average untuk dashboard
- [ ] **Uptime:** 99.5% uptime SLA
- [ ] **Error Rate:** < 1% error rate
- [ ] **Database Performance:** < 100ms query time untuk billing queries

### Monitoring Setup

- **Error Tracking:** Custom Laravel error logging + monitoring
- **Performance Monitoring:** Custom dashboard dengan response time tracking
- **Uptime Monitoring:** Cloudflare monitoring + custom health checks
- **Business Metrics:** Custom analytics dashboard

## 🔐 Security

### Security Measures

- [ ] **Authentication:** Laravel Sanctum untuk API authentication
- [ ] **Authorization:** Role-based access control (Admin, Resident, Staff, Security, Cleaning)
- [ ] **Multi-tenancy:** Strict tenant data isolation (row-level security)
- [ ] **Data Encryption:** Sensitive financial data encrypted at rest
- [ ] **API Security:** Rate limiting, CORS proper configuration
- [ ] **Input Validation:** Laravel validation rules untuk semua inputs

### Security Checklist

- [x] HTTPS enabled (Cloudflare SSL)
- [x] Environment variables secured
- [x] Database connections encrypted
- [x] User data properly hashed (bcrypt)
- [x] API rate limiting implemented (throttle:60,1)
- [x] CORS properly configured
- [ ] CSRF token validation for all forms
- [ ] Multi-tenant data leakage prevention audits
- [ ] PDPA compliance untuk data privacy

## 📚 Documentation

### Internal Documentation

- **Technical Specs:** [tech-stack.md](./tech-stack.md) - Architecture dan technical decisions
- **Product Specs:** [product-spec.md](./product-spec.md) - Detailed feature specifications
- **User Stories:** [user-stories.md](./user-stories.md) - User personas dan requirements
- **API Documentation:** [Coming Soon]
- **Database Schema:** [Coming Soon]

### User Documentation

- **User Guide:** [Coming Soon]
- **FAQ:** [Coming Soon]
- **Video Tutorials:** [Coming Soon]
- **Admin Training:** [Coming Soon]

## 🤝 Team & Roles

### Development Team

- **Tech Lead:** Najib (Backend & Architecture)
- **Frontend Developer:** [To be hired] (UI/UX Implementation dengan FluxUI)
- **Mobile Developer:** [To be hired] (Flutter/React Native apps)
- **DevOps Engineer:** [To be determined] (Infrastructure & Deployment)

### External Stakeholders

- **Product Owner:** [To be determined] (Business Requirements)
- **UI/UX Designer:** [To be determined] (Design System)
- **QA Engineer:** [To be determined] (Testing & Quality)
- **Domain Expert:** Property managers, pengelola kompleks (customer discovery)

## 🆘 Support & Troubleshooting

### Common Issues

1. **Multi-tenant data isolation issues**
   - Solution: Verify tenancy package configuration, check tenant identification in middleware

2. **Xendit payment webhook not processing**
   - Solution: Verify webhook token, check Xendit signature validation

3. **Livewire components not loading**
   - Solution: Run `php artisan livewire:publish --config` and check configuration

4. **Asset compilation failed**
   - Solution: Clear npm cache, run `npm install` and `npm run build`

5. **WhatsApp notifications not sending**
   - Solution: Verify gateway API key, check message format compliance

### Getting Help

- **Slack Channel:** #klustera-development
- **Emergency Contact:** [contact info]
- **Documentation:** [link ke troubleshooting guide]

## 📈 Roadmap

Lihat [roadmap.md](./roadmap.md) untuk detail 10 milestones perkembangan produk Klustera.id.

## 🔄 Changelog

Lihat [changelog.md](./changelog.md) untuk riwayat perubahan Klustera.id.

## 🐛 Known Issues

Lihat [known-issues.md](./known-issues.md) untuk daftar bug dan limitation yang diketahui.

## 💰 Pricing & Licensing

### Open-Source Dual License Model

**Community Tier (Free - AGPL License):**
- **Price:** Rp 0 (gratis)
- **License:** AGPL v3 (fully open source)
- **Limits:** 50 units max, basic billing only, self-hosted, community support
- **Purpose:** Untuk kompleks kecil (<50 units), proof of concept, community testing
- **Support:** Community only (GitHub Issues, forums)

**Standard Tier (Paid - Commercial License):**
- **Price:** Rp 3,500 - Rp 5,000 per unit per bulan
- **License:** Commercial (source available tapi requires subscription)
- **Features:** Unlimited units, all features, Xendit integration, priority email & WhatsApp support
- **Setup Fee:** Rp 5,000,000 one-time (includes setup, training, configuration)
- **Discount:** 2 months free (17% discount) jika bayar tahunan
- **SLA:** 99.5% uptime, 24-hour response time

**Enterprise Tier (Custom Pricing):**
- **Pricing:** Rp 10-50M/bulan depending on units
- **Purpose:** Untuk property developers (multi-complex), REITs, large management companies
- **Features:** Unlimited everything + white-label branding, custom features, dedicated account manager
- **Setup Fee:** Rp 20-50M (includes onboarding, custom development, training)
- **Support:** Dedicated support & training, custom integrations, on-premise option

📖 **Detailed Pricing:** [pricing-model.md](./pricing-model.md) untuk complete pricing breakdown

### Revenue Model

**Recurring Revenue Streams:**
1. **Subscription Fees:** Rp 3,500-5,000/unit/month dari Standard tier
2. **Enterprise Commissions:** Custom pricing dari large property developers
3. **Marketplace Revenue:** 10-20% commission dari service provider transactions (Milestone 10+)

**One-Time Revenue Streams:**
1. **Setup Fees:** Rp 5M per complex (Standard), Rp 20-50M (Enterprise)
2. **Consulting Services:** Custom development, training, optimization (Rp 5-20M per engagement)

**Target Unit Economics:**
- **CAC (Customer Acquisition Cost):** ~Rp 5M per complex (marketing + sales)
- **LTV (Lifetime Value):** Rp 43.2M over 3 years (300 units × Rp 4,000 × 12 months × 3 years)
- **LTV:CAC Ratio:** 8.6:1 (excellent! SaaS benchmark is 3:1)

---

## 🏛️ Compliance & Standards

### Indonesian Data Privacy Law (PDPA)

- **Data Consent:** Explicit consent untuk data collection & processing
- **Data Encryption:** Sensitive data encrypted at rest dan in transit
- **Access Control:** Strict role-based access untuk financial data
- **Audit Trail:** Complete logging untuk 5-year retention
- **Right to Deletion:** Residents can request account deletion

### Financial Compliance

- **Tax Compliance:** PPN 11% pada subscription fees, proper e-faktur integration
- **Accounting Standards:** Double-entry bookkeeping untuk financial tracking
- **Audit Trail:** Complete transaction logging untuk audit purposes

---

**Last Updated:** 2026-01-06
**Version:** 0.1.0-concept
**Maintainer:** Najib Zain (Lead Developer)
