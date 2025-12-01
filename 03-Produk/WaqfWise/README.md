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

**Tagline:** Sistem Manajemen Wakaf Terpercaya & Transparan

**Deskripsi Singkat:** Platform SaaS yang membantu lembaga Nazhir (pengelola wakaf) mengelola aset wakaf, melaporkan donatur (Wakif), dan menyalurkan manfaat wakaf secara transparan dan akuntabel sesuai standar PSAK 109.

**Target Market:**

- Lembaga Nazhir perorangan / Masjid
- Yayasan Islam skala kecil-menengah
- Pengelola wakaf di Indonesia

**Problem yang Diselesaikan:**
Manajemen wakaf tradisional yang manual, tidak transparan, dan sulit dilaporkan kepada stakeholders (donatur, regulator, masyarakat).

## 🛠 Tech Stack

### Backend

- **Framework/Language:** Laravel 10 (PHP 8.2)
- **Database:** PostgreSQL 15
- **API:** RESTful API dengan Livewire 3

### Frontend

- **Framework:** Laravel Blade dengan Livewire 3
- **Styling:** Tailwind CSS 3
- **State Management:** Livewire + Alpine.js

### Infrastructure

- **Hosting:** Oracle Cloud Infrastructure
- **Deployment:** Coolify
- **CDN:** Cloudflare
- **Monitoring:** Custom Dashboard + Error Tracking

### Third-party Services

- **Payment:** Midtrans (untuk donasi online)
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

- [ ] **Active Nazhir:** Target 100+ active nazhir accounts
- [ ] **Total Wakaf Assets Managed:** Target IDR 100+ Milyar
- [ ] **Monthly Donations:** Target growth 20% month-over-month
- [ ] **User Engagement:** 80% monthly active users

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

## 🏛️ Compliance & Standards

### Sharia Compliance

- **PSAK 109 Compliance:** Mengikuti standar akuntansi wakaf Indonesia
- **Wakaf Validasi:** Validasi status wakaf dengan Kementerian Agama
- **Asset Management:** Sesuai syariat Islam dalam pengelolaan aset

### Data Privacy

- **PDPA Compliance:** Compliance dengan Personal Data Protection Act
- **Data Encryption:** Sensitive data donor dan asset di-encrypt
- **Access Control:** Strict role-based access untuk data keuangan

---

**Last Updated:** 2024-12-01
**Version:** 0.2.0-alpha
**Maintainer:** Najib Zain (Lead Developer)
