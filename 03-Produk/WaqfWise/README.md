# 🕌 WaqfWise

> Sistem Manajemen Wakaf Terpercaya & Transparan untuk Digital Islamic Economy

## 🏷️ Product Identity

- **Nama Produk:** WaqfWise
- **Status:** 🚧 In Development
- **Repo Code:** `github.com/akordium/waqfwise` (Private)
- **Live Site:** https://waqfwise.com
- **Staging:** https://staging.waqfwise.com
- **Project Management:** [Link ke GitHub Project Board]

## 📋 Quick Overview

**Tagline:** Sistem Manajemen Wakaf dengan PSAK 109 Compliance & Transparansi Publik

**Deskripsi Singkat:** Platform SaaS freemium yang membantu lembaga Nazhir (pengelola wakaf) mengelola aset wakaf, melaporkan donatur (Wakif), menyalurkan manfaat wakaf, dan menghasilkan laporan BWI otomatis. Terintegrasi dengan BWI (Badan Wakaf Indonesia) dan sesuai standar PSAK 109.

**Target Market:**

- **Primary:** Lembaga Nazhir perorangan / Masjid (manage 1-50 waqf assets)
- **Secondary:** Yayasan Islam skala kecil-menengah (50-500 assets)
- **Tertiary:** Lembaga pendidikan Islam (pesantren, universitas Islam)
- **Quaternary:** International waqf institutions (multi-currency support)

**5 Fitur Utama:**

1. **Registrasi Aset Wakaf** - Tanah, bangunan, uang (cash waqf), saham dengan document upload & GPS mapping
2. **Tracking Pemanfaatan & Distribusi** - Beneficiary management, distribution tracking, impact measurement
3. **Laporan Keuangan BWI** - PSAK 109 compliant accounting, automated report generation
4. **Portal Transparansi Publik** - Public dashboard untuk donors, asset & financial transparency
5. **Multi-Currency Support** - Wakaf internasional dengan IDR, USD, SGD, MYR, EUR, SAR, AED, KWD, JPY, CNY

**Fitur Tambahan (Post-MVP):**

- **Sertifikat Blockchain** (Optional) - Immutable certificate verification via Polygon (ERC-721 NFT) - Tersedia sebagai add-on premium

**Problem yang Diselesaikan:**
- Manual waqf management (Excel, kertas) - tidak transparan dan error-prone
- Lack of transparency untuk wakif (donors) - tidak tahu bagaimana wakaf digunakan
- Difficulty complying dengan BWI reporting standards - complex PSAK 109 requirements
- Managing international waqf - multi-currency challenges dan exchange rate volatility

## 🛠 Tech Stack

### Backend

- **Framework/Language:** Laravel 10 (PHP 8.2)
- **Database:** PostgreSQL 15
- **API:** RESTful API dengan Livewire 3

### Frontend

- **Framework:** Laravel Blade dengan Livewire 3
- **Component Library:** **FluxUI** (Livewire component library) + Custom Tailwind components
- **Styling:** Tailwind CSS 3
- **State Management:** Livewire + Alpine.js
- **Blockchain Integration:** Ethers.js v6 untuk certificate verification & wallet connection

### Infrastructure

- **Hosting:** Oracle Cloud Infrastructure
- **Deployment:** Coolify
- **CDN:** Cloudflare
- **Monitoring:** Custom Dashboard + Error Tracking

### Third-party Services

- **Payment Gateways:**
  - **Midtrans** - General online donations (GoPay, OVO, DANA, Credit Cards)
  - **Bank Syaria Indonesia (BSI)** - Primary sharia payment (VA, Mobile, Auto-Debit)
  - **BNI Syariah** - Alternative sharia payment (DPSN certified)
- **Post-MVP Blockchain Services (Optional):**
  - **Polygon (MATIC)** - Layer-2 Ethereum untuk certificate NFTs (ERC-721)
  - **IPFS/Pinata** - Decentralized storage untuk certificate metadata
  - **Infura/Alchemy** - Blockchain node providers
- **Email:** SendGrid
- **Storage:** Cloudflare R2
- **Analytics:** Google Analytics + Custom Analytics

## 💻 Local Development Setup

### Prerequisites

- [ ] PHP 8.2+
- [ ] PostgreSQL 15
- [ ] Composer 2.0+
- [ ] Node.js 18+ (untuk build assets)
- [ ] Docker & Docker Compose (optional)

### Installation Steps

1. **Clone repository**

   ```bash
   git clone https://github.com/akordium/waqfwise.git
   cd waqfwise
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
   createdb waqfwise_dev

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
php artisan test tests/Feature/WaqfProjectTest.php

# Run dengan coverage
php artisan test --coverage

# Run tests di watch mode
php artisan test --watch
```

## 🚢 Deployment

### Environments

- **Development:** Local development dengan SQLite
- **Staging:** Oracle Cloud dengan staging database
- **Production:** Oracle Cloud dengan high-availability setup

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
- `MIDTRANS_SERVER_KEY` - Midtrans server key
- `SENDGRID_API_KEY` - SendGrid API key

**Optional variables:**

- `MAIL_MAILER` - Mail driver (smtp/log)
- `CACHE_DRIVER` - Cache driver (redis/file)
- `SESSION_DRIVER` - Session driver (redis/file)

**Secret management:** Semua secrets disimpan di environment variables, tidak ada hardcoded secrets.

## 📊 Key Metrics & Monitoring

### Business Metrics

- [ ] **Active Nazhir:** Target 100+ active nazhir accounts (Year 1)
- [ ] **Total Wakaf Assets Managed:** Target IDR 100+ Milyar (Year 1)
- [ ] **Monthly Donations:** Target growth 20% month-over-month
- [ ] **User Engagement:** 80% monthly active users
- [ ] **Multi-Currency Transactions:** Target 10+ currencies supported by Year 2
- [ ] **Freemium Conversion:** Target 10-15% free-to-paid conversion rate
- [ ] **BWI Compliance Rate:** 100% PSAK 109 compliant reports (Year 1)

### Technical Metrics

- [ ] **Response Time:** < 500ms average
- [ ] **Uptime:** 99.5% uptime
- [ ] **Error Rate:** < 1% error rate
- [ ] **Database Performance:** < 100ms query time

### Monitoring Setup

- **Error Tracking:** Custom Laravel error logging
- **Performance Monitoring:** Custom dashboard dengan response time tracking
- **Uptime Monitoring:** Cloudflare monitoring + custom health checks
- **Business Metrics:** Custom analytics dashboard

## 🔐 Security

### Security Measures

- [ ] **Authentication:** Laravel Sanctum untuk API authentication
- [ ] **Authorization:** Role-based access control (Super Admin, Nazhir, Staff)
- [ ] **Data Encryption:** Sensitive financial data encrypted
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

## 📚 Documentation

### Internal Documentation

- **Technical Specs:** [link ke technical documentation]
- **API Documentation:** [link ke API docs]
- **Database Schema:** [link ke database docs]
- **Deployment Guide:** [link ke deployment guide]

### User Documentation

- **User Guide:** [link ke user guide]
- **FAQ:** [link ke FAQ]
- **Video Tutorials:** [link ke video tutorials]
- **Waqf Compliance Guide:** [link ke compliance documentation]

## 🤝 Team & Roles

### Development Team

- **Tech Lead:** Najib (Backend & Architecture)
- **Frontend Developer:** [Nama] (UI/UX Implementation)
- **DevOps Engineer:** [Nama] (Infrastructure & Deployment)

### External Stakeholders

- **Product Owner:** [Nama] (Business Requirements)
- **UI/UX Designer:** [Nama] (Design System)
- **QA Engineer:** [Nama] (Testing & Quality)
- **Domain Expert:** [Nama] (Waqf compliance & PSAK knowledge)

## 🆘 Support & Troubleshooting

### Common Issues

1. **Database connection failed**
   - Solution: Check .env database configuration, ensure PostgreSQL service is running

2. **Livewire components not loading**
   - Solution: Run `php artisan livewire:publish --config` and check configuration

3. **Asset compilation failed**
   - Solution: Clear npm cache, run `npm install` and `npm run build`

4. **Midtrans payment not working**
   - Solution: Verify Midtrans credentials and webhook configuration

### Getting Help

- **Slack Channel:** #waqfwise-development
- **Emergency Contact:** [contact info]
- **Documentation:** [link ke troubleshooting guide]

## 📈 Roadmap

Lihat [roadmap.md](./roadmap.md) untuk detail perkembangan produk WaqfWise.

## 🔄 Changelog

Lihat [changelog.md](./changelog.md) untuk riwayat perubahan WaqfWise.

## 🐛 Known Issues

Lihat [known-issues.md](./known-issues.md) untuk daftar bug dan limitation yang diketahui.

## 🔗 Blockchain Integration (Post-MVP Feature)

### Immutable Certificates (Optional Add-on)

**Status:** Post-MVP Enhancement (M9-M10) - Tidak diperlukan untuk core functionality

**Why Blockchain (Optional):**
- **Transparency:** Public verification untuk certificate authenticity
- **Trust:** Immutable proof yang certificate tidak dipalsukan
- **Accessibility:** Anyone can verify via blockchain explorer (Polygonscan)
- **Innovation:** Modern technology untuk traditional waqf institutions

**How It Works:**
1. Nazhir generates certificate → System uploads metadata ke IPFS
2. Smart contract mints ERC-721 NFT pada Polygon blockchain
3. Certificate PDF includes QR code → links to Polygonscan transaction
4. Public/Wakif scans QR code → verifies certificate authenticity instantly

**Benefits:**
- **Gas Fees:** Rp 50-100 per certificate (Polygon vs Rp 500,000+ on Ethereum)
- **Speed:** 2-5 seconds confirmation (vs 15-60 seconds on Ethereum)
- **Environment:** 99.9% more energy-efficient than Ethereum proof-of-work
- **Cost Recovery:** Charge Rp 50,000 per certificate → Rp 49,900 margin

**Note:** Blockchain certificates are optional add-ons. WaqfWise berfungsi penuh tanpa blockchain.

---

**Last Updated:** 2026-01-06
**Version:** 0.5.0-alpha (MVP Scope: M1-M7 - 7 months)
**Maintainer:** Najib Zain (Lead Developer)

**MVP Timeline:**
- **M4 (16 weeks):** MVP Complete - Core features + BWI compliance
- **M7 (28 weeks):** Premium MVP - Payments, multi-currency, public portal
- **M9-M10:** Post-MVP enhancements - Blockchain (optional), advanced features

## 💰 Pricing & Licensing

### Freemium Model

**Basic Tier (Free - Open Source):**
- **Price:** Rp 0 (gratis)
- **License:** MIT (fully open source)
- **Limits:** 10 waqf assets max, basic reporting only, single currency (IDR)
- **Purpose:** Untuk masjid kecil, nazhir perorangan, proof of concept
- **Support:** Community only

**Premium Tier (Paid - Proprietary):**
- **Small Plan:** Rp 500,000/month (up to 50 assets)
- **Medium Plan:** Rp 2,000,000/month (up to 200 assets)
- **Large Plan:** Rp 5,000,000/month (unlimited assets)
- **License:** Proprietary (source available tapi requires subscription)
- **Features:** BWI reporting templates, multi-currency, advanced analytics, public transparency portal
- **Support:** Priority email & WhatsApp
- **Discount:** 2 months free (17% discount) jika bayar tahunan
- **Optional Add-on:** Blockchain certificates (Rp 50,000 per certificate)

**Enterprise Plan (Custom Pricing):**
- **Pricing:** Rp 10-50M/month
- **Purpose:** Untuk yayasan besar, lembaga pendidikan Islam
- **Features:** Unlimited everything + custom features, on-premise deployment option
- **Support:** Dedicated support & training, custom integrations

📖 **Detailed Pricing:** [pricing-model.md](./pricing-model.md) untuk complete pricing breakdown

---

## 🏛️ Compliance & Standards

### BWI Compliance (Badan Wakaf Indonesia)

- **PSAK 109 Compliance:** Full accounting standard compliance untuk waqf
- **BWI Reporting Templates:** Automated report generation sesuai BWI standards
- **Double-Entry Bookkeeping:** Proper debit/credit handling untuk waqf accounting
- **Asset Valuation:** Fair market value calculations dengan auditable trail
- **Audit Trail:** Complete transaction logging untuk 10-year retention
- **Chart of Accounts:** PSAK 109 compliant structure

### Sharia Compliance

- **Sharia Payment Gateways:** BSI & BNI Syariah (100% syaria-compliant, no riba)
- **Sharia Certification:** DPSN (Dewan Syariah Nasional) certified payment methods
- **Asset Management:** Sesuai syariat Islam dalam pengelolaan aset wakaf
- **Zakat vs Wakf Classification:** Proper classification untuk different payment types
- **Fund Separation:** Automatic segregation based donation type (wakf vs non-wakf)

### Kemenag Integration

- **Wakaf Validasi:** Validasi status wakaf dengan Kementerian Agama database (future)
- **Ikrar Wakaf Digital:** Integration dengan Kemenag untuk online waqf pledges (future)

### Data Privacy

- **PDPA Compliance:** Compliance dengan Personal Data Protection Act
- **Data Encryption:** Sensitive data donor dan asset di-encrypt
- **Access Control:** Strict role-based access untuk data keuangan

---

**Last Updated:** 2024-12-01
**Version:** 0.2.0-alpha
**Maintainer:** Najib Zain (Lead Developer)
