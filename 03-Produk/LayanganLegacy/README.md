# 🪁 LayanganLegacy

> Toko Online Layang-Layang Aduan & Komunitas Pecinta Layang-Layang Indonesia

## 🏷️ Product Identity

- **Nama Produk:** LayanganLegacy
- **Status:** 📋 Planning Phase
- **Repo Code:** `github.com/akordium/layangan-legacy` (Private)
- **Live Site:** https://layanganlegacy.com
- **Staging:** https://staging.layanganlegacy.com
- **Project Management:** [Link ke GitHub Project Board]

## 📋 Quick Overview

**Tagline:** Platform E-Commerce & Komunitas Layang-Layang Aduan Terlengkap di Indonesia

**Deskripsi Singkat:** Platform marketplace dan komunitas untuk penggemar layang-layang aduan (fighting kites) di Indonesia. Menjual layang-layang custom dan ready-to-fly, menyediakan forum komunitas, tutorial pembuatan, event calendar festival, marketplace peer-to-peer untuk jual beli layang-layang bekas, dan leaderboard nasional untuk juara aduan.

**Target Market:**

- **Primary:** Komunitas layang-layang aduan lokal (umur 20-50 tahun, hobi serius)
- **Secondary:** Kolektor layang-layang unik & custom (middle-income, hobbyist)
- **Tertiary:** Pemula yang ingin belajar (beginner-friendly tutorials dan starter kits)
- **Quaternary:** International market (Malaysia, Brunei, Singapore) - ekspor budaya Indonesia

**5 Fitur Utama:**

1. **E-Commerce Layang-Layang** - Toko online untuk layang-layang custom & ready-to-fly dengan kategori: Bebean, Janggan, Pecukan, dan desain modern
2. **Forum Komunitas & Tutorial** - Diskusi teknik aduan, tutorial pembuatan, sharing pengalaman, dan tips perawatan
3. **Event Calendar** - Database festival layang-layang nasional & lokal, registration system, dan hasil kompetisi
4. **Marketplace Peer-to-Peer** - Platform jual beli layang-layang bekas antar komunitas dengan escrow system
5. **Leaderboard Nasional** - Peringkat juara aduan berdasarkan festival resmi, profil juara, dan dokumentasi pertandingan

**Fitur Tambahan:**

- **Video Tutorial Library** - Kumpulan video pembuatan layang-layang, teknik pemasangan senar, strategi aduan
- **Custom Order Builder** - Tool untuk desain layang-layang custom dengan spesifikasi ukuran, bahan, dan warna
- **Senar & Aksesoris Shop** - Jual senar aduan (glass-coated, nylon), benang, aksesoris, dan spare parts
- **Blog Budaya** - Artikel sejarah layang-layang aduan Indonesia, filosofi desain, dan pelestarian budaya

**Problem yang Diselesaikan:**
- Sulitnya menemukan toko layang-layang aduan berkualitas (limited physical stores)
- Kurangnya platform komunitas untuk sharing pengetahuan dan teknik aduan
- Tidak adanya database terpusat untuk festival dan kompetisi layang-layang
- Sulitnya menjual layang-layang bekas yang masih layak terbang (no secondary market)
- Hilangnya tradisi layang-layang aduan di generasi muda (lack of education & engagement)

## 🛠 Tech Stack

### Backend

- **Framework/Language:** Ruby on Rails 7.1+ (Ruby 3.2+)
- **Database:** PostgreSQL 15
- **API:** Rails API dengan Hotwire (Turbo + Stimulus)

### Frontend

- **Framework:** Rails ERB templates dengan Hotwire stack
- **Real-time Updates:** Turbo Frames & Turbo Streams
- **Interactive Components:** Stimulus.js controllers
- **Styling:** Tailwind CSS 3.4
- **State Management:** Stimulus + Turbo
- **Video Processing:** ActiveStorage + FFmpeg untuk video tutorials

### Infrastructure

- **Hosting:** Oracle Cloud Infrastructure
- **Deployment:** Coolify
- **CDN:** Cloudflare
- **Storage:** Cloudflare R2 untuk gambar & video
- **Email:** SendGrid

### Third-party Services

- **Payment Gateways:**
  - **Midtrans** - Payment gateway utama (GoPay, OVO, DANA, Credit Cards, QRIS)
  - **BCA KlikPay** - Alternative payment method
- **Shipping:**
  - **JNE** - Shipping partner untuk layang-layang (packaging khusus)
  - **SiCepat** - Alternative express shipping
- **Authentication:**
  - **Devise** - Authentication gem untuk Rails
  - **OAuth2** - Google & Facebook login opsi
- **Media:**
  - **ImageMagick** - Image processing & thumbnails
  - **FFmpeg** - Video transcoding untuk tutorials
- **Analytics:** Google Analytics 4 + Custom Rails analytics
- **Forum/Community:**
  - **Thredded** - Forum engine gem (atau custom implementation)

## 💻 Local Development Setup

### Prerequisites

- [ ] Ruby 3.2+
- [ ] PostgreSQL 15
- [ ] Bundler 2.0+
- [ ] Node.js 18+ (untuk build assets)
- [ ] Redis 7+ (untuk background jobs & caching)
- [ ] FFmpeg (untuk video processing)
- [ ] ImageMagick (untuk image processing)
- [ ] Docker & Docker Compose (optional)

### Installation Steps

1. **Clone repository**

   ```bash
   git clone https://github.com/akordium/layangan-legacy.git
   cd layangan-legacy
   ```

2. **Install Ruby dependencies**

   ```bash
   bundle install
   ```

3. **Install JavaScript dependencies**

   ```bash
   npm install
   ```

4. **Environment setup**

   ```bash
   cp .env.example .env
   # Edit .env file dengan konfigurasi lokal
   ```

5. **Database setup**

   ```bash
   # Jalankan PostgreSQL & Redis (jika menggunakan Docker)
   docker-compose up -d postgres redis

   # Buat database
   rails db:create

   # Run migrations
   rails db:migrate

   # Seed data
   rails db:seed
   ```

6. **Setup storage & media**

   ```bash
   # Create directories untuk ActiveStorage
   mkdir -p storage/tmp
   ```

7. **Build frontend assets**

   ```bash
   npm run build
   ```

8. **Start development server**

   ```bash
   # Start Rails server
   rails server

   # Start background job processor (di terminal terpisah)
   rails jobs:work
   ```

9. **Aplikasi berjalan di:** http://localhost:3000

### Development Commands

```bash
# Console
rails console

# Testing
rails test

# System tests (browser-based)
rails test:system

# Generate scaffold
rails generate scaffold Product name:string description:text price:decimal

# Generate model
rails generate model User name:string email:string

# Run migrations
rails db:migrate

# Rollback migration
rails db:rollback

# Check routes
rails routes

# Precompile assets
rails assets:precompile

# Background jobs
rails jobs:work

# Log analysis
tail -f log/development.log
```

## 🧪 Testing

### Test Suite

- **Framework:** Minitest + RSpec (opsional)
- **Coverage Target:** 80%
- **Test Types:**
  - Unit Tests: Models, Services, Libraries
  - Functional Tests: Controllers, Views
  - Integration Tests: End-to-end user workflows
  - System Tests: Browser-based testing dengan Cuprite

### Running Tests

```bash
# Run semua tests
rails test

# Run specific test file
rails test test/models/product_test.rb

# Run dengan coverage
COVERAGE=true rails test

# Run system tests
rails test:system

# Run spesifik test line
rails test test/models/product_test.rb:25

# Run tests paralel (dengan parallel_tests gem)
parallel_rake test
```

### Testing Best Practices

- Write tests sebelum implementing features (TDD approach)
- Test edge cases dan error scenarios
- Mock external services (Midtrans, shipping APIs)
- Use factory_bot_rails untuk test data generation
- Test background jobs secara terpisah

## 🚢 Deployment

### Environments

- **Development:** Local development dengan PostgreSQL
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
   bundle install --deployment --without development test

   # Build assets
   npm run build
   rails assets:precompile

   # Run migrations
   rails db:migrate RAILS_ENV=production

   # Restart application server
   touch tmp/restart.txt
   ```

3. **Zero-Downtime Deployment**

   ```bash
   # Preload aplikasi
   rails server -e production -p 3000

   # Nginx reload (tanpa downtime)
   sudo systemctl reload nginx
   ```

### Environment Variables

**Required variables:**

- `RAILS_ENV` - Rails environment (production/staging/development)
- `SECRET_KEY_BASE` - Rails secret key base
- `DATABASE_URL` - PostgreSQL connection string
- `REDIS_URL` - Redis connection string

**Payment & Shipping:**

- `MIDTRANS_SERVER_KEY` - Midtrans server key
- `MIDTRANS_CLIENT_KEY` - Midtrans client key
- `MIDTRANS_MERCHANT_ID` - Midtrans merchant ID
- `JNE_API_KEY` - JNE shipping API key

**Services:**

- `SENDGRID_API_KEY` - SendGrid API key
- `SENDGRID_FROM_EMAIL` - Default from email address
- `AWS_ACCESS_KEY_ID` - Cloudflare R2 access key
- `AWS_SECRET_ACCESS_KEY` - Cloudflare R2 secret key
- `AWS_BUCKET` - Storage bucket name

**Optional variables:**

- `RAILS_LOG_LEVEL` - Log level (debug/info/warn/error)
- `RAILS_SERVE_STATIC_FILES` - Enable static file serving
- `RAILS_LOG_TO_STDOUT` - Log to stdout untuk containerized env

**Secret management:** Semua secrets disimpan di environment variables, tidak ada hardcoded secrets.

## 📊 Key Metrics & Monitoring

### Business Metrics

- [ ] **Monthly Active Users:** Target 1,000+ MAU (Month 6)
- [ ] **Gross Merchandise Value (GMV):** Target IDR 50+ Juta/bulan (Month 6)
- [ ] **Marketplace Transaction Volume:** Target 20+ transaksi/bulan (Month 6)
- [ ] **Community Engagement:** 500+ forum posts/bulan, 100+ active discussions
- [ ] **Video Tutorial Views:** 5,000+ views/bulan
- [ ] **Conversion Rate:** Target 3-5% visitor-to-purchase
- [ ] **Repeat Purchase Rate:** Target 25% repeat customers
- [ ] **Average Order Value:** Target Rp 300,000-500,000

### Technical Metrics

- [ ] **Response Time:** < 400ms average
- [ ] **Uptime:** 99.5% uptime
- [ ] **Error Rate:** < 1% error rate
- [ ] **Database Performance:** < 80ms query time (P95)
- [ ] **Page Load Time:** < 2 seconds (homepage)
- [ ] **Time to Interactive:** < 3 seconds

### Monitoring Setup

- **Error Tracking:** Sentry untuk error tracking & alerting
- **Performance Monitoring:** Scout APM atau Skylight untuk Rails performance
- **Uptime Monitoring:** UptimeRobot + custom health check endpoint
- **Business Metrics:** Custom Rails dashboard dengan Grafana
- **User Analytics:** Google Analytics 4 + Hotjar untuk user behavior

## 🔐 Security

### Security Measures

- [ ] **Authentication:** Devise dengan secure password hashing (bcrypt)
- [ ] **Authorization:** Role-based access control (Admin, Seller, Buyer)
- [ ] **CSRF Protection:** Rails built-in CSRF token validation
- [ ] **SQL Injection:** Rails ActiveRecord parameterized queries
- [ ] **XSS Protection:** Rails built-in XSS protection & Content Security Policy
- [ ] **File Upload Security:** ActiveStorage validation untuk file types & sizes
- [ ] **API Security:** Rate limiting dengan rack-attack gem
- [ ] **Session Security:** Secure cookies dengan HttpOnly & SameSite flags
- [ ] **Payment Security:** PCI-DSS compliant via Midtrans (no card data stored)
- [ ] **Input Validation:** Strong parameters untuk mass assignment protection

### Security Checklist

- [x] HTTPS enabled (Cloudflare SSL)
- [x] Environment variables secured
- [x] Database connections encrypted
- [x] User passwords properly hashed (bcrypt cost factor 12)
- [x] API rate limiting implemented (rack-attack)
- [x] CORS properly configured (jika API public)
- [x] CSRF token validation for all forms
- [x] Content Security Policy headers
- [x] HTTP Strict Transport Security (HSTS)
- [ ] Regular security audits (bundle audit & brakeman scan)
- [ ] Dependency vulnerability scanning

### Security Commands

```bash
# Check untuk vulnerabilities di gems
bundle audit

# Static security analysis untuk Rails app
brakeman --no-pager

# Check outdated gems
bundle outdated

# Update gems ke versi aman
bundle update
```

## 🤝 Team & Roles

### Development Team

- **Tech Lead:** Najib (Backend & Architecture - Ruby on Rails Specialist)
- **Frontend Developer:** [Nama] (Hotwire, Stimulus, Tailwind CSS)
- **UI/UX Designer:** [Nama] (Design System & User Experience)
- **DevOps Engineer:** [Nama] (Infrastructure & Deployment)

### External Stakeholders

- **Product Owner:** [Nama] (Business Requirements & Market Research)
- **Domain Expert:** [Nama] (Komunitas layang-layang aduan & budaya)
- **Content Creator:** [Nama] (Video tutorials & blog content)
- **Community Manager:** [Nama] (Forum management & social media)
- **QA Engineer:** [Nama] (Testing & Quality Assurance)

## 🆘 Support & Troubleshooting

### Common Issues

1. **Bundler cannot find gem**
   - Solution: Run `bundle install` dan cek Ruby version compatibility

2. **PostgreSQL connection failed**
   - Solution: Check `config/database.yml`, ensure PostgreSQL service running

3. **ActiveStorage attachments not uploading**
   - Solution: Check storage configuration, verify credentials untuk Cloudflare R2

4. **Background jobs not processing**
   - Solution: Start Redis server (`redis-server`) dan job processor (`rails jobs:work`)

5. **Turbo Streams not updating**
   - Solution: Verify WebSocket connection di browser console, check Turbo configuration

6. **Video upload too large**
   - Solution: Adjust `config/initializers/active_storage.rb` untuk max file size

7. **Midtrans payment failing**
   - Solution: Verify Midtrans credentials, check order ID format, test dengan Sandbox mode

### Getting Help

- **Slack Channel:** #layangan-legacy-development
- **Emergency Contact:** [contact info]
- **Documentation:** [link ke troubleshooting guide]
- **Community Forum:** [link ke internal dev forum]

## 📚 Documentation

### Internal Documentation

- **Technical Specs:** [link ke technical documentation]
- **API Documentation:** [link ke API docs]
- **Database Schema:** [link ke database docs]
- **Deployment Guide:** [link ke deployment guide]
- **Hotwire Patterns:** [link ke Hotwire best practices]

### User Documentation

- **User Guide:** [link ke user guide]
- **Seller Handbook:** [link ke seller documentation]
- **FAQ:** [link ke FAQ]
- **Video Tutorials:** [link ke video tutorials]

## 📈 Roadmap

Lihat [roadmap.md](./roadmap.md) untuk detail perkembangan produk LayanganLegacy.

## 🔄 Changelog

Lihat [changelog.md](./changelog.md) untuk riwayat perubahan LayanganLegacy.

## 🐛 Known Issues

Lihat [known-issues.md](./known-issues.md) untuk daftar bug dan limitation yang diketahui.

## 💰 Pricing & Monetization

### Revenue Streams

**1. Product Sales Margin (30-40%)**

- **Layang-Layang Custom:** Harga Rp 150,000-500,000, margin 40%
  - Bebean tradisional: Rp 150,000-250,000
  - Janggan besar: Rp 300,000-500,000
  - Pecukan competition grade: Rp 200,000-350,000
  - Desain modern/artistic: Rp 250,000-500,000

- **Layang-Layang Ready-to-Fly:** Harga Rp 75,000-200,000, margin 35%
  - Starter kit untuk pemula: Rp 75,000-150,000
  - Standard competition: Rp 100,000-200,000

- **Senar & Aksesoris:** Harga Rp 25,000-150,000, margin 30%
  - Senar glass-coated: Rp 50,000-100,000
  - Senar nylon premium: Rp 75,000-150,000
  - Benang & aksesoris: Rp 25,000-75,000

**2. Marketplace Fee (10%)**

- Peer-to-peer transactions fee untuk jual beli layang-layang bekas
- Escrow fee untuk keamanan transaksi
- Payment processing fee ditanggung buyer (2-3%)

**3. Custom Order Fee (20%)**

- Custom design requests dengan spesifikasi khusus
- Rush order fee untuk pengiriman cepat
- Consultation fee untuk beginner-friendly custom packages

### Marketplace Fee Structure

**Penjual (Seller):**
- Gratis listing produk
- 10% transaction fee dari harga jual
- Automatic payout setelah buyer confirmation (7 days hold period)

**Pembeli (Buyer):**
- Gratis browsing dan membuat offer
- Payment processing fee: 2-3% (Midtrans fee)
- Shipping cost ditanggung buyer (diestimasikan di checkout)

### Cost Structure

**COGS (Cost of Goods Sold):**
- Bahan baku layang-layang: 40-50%
- Tenaga kerja pembuatan: 20-30%
- Packaging: 5-10%

**Operational Costs:**
- Server hosting: Rp 500,000-1,000,000/bulan
- Payment gateway fees: 2-3% per transaction
- Shipping partner fees: Volume-based discounts
- Marketing & ads: 15-20% dari revenue
- Customer service: Rp 2,000,000-3,000,000/bulan

### Financial Projections

**Year 1 (Months 1-12):**

- **Month 1-3 (Launch):**
  - Target 50 orders/bulan
  - Average order value: Rp 300,000
  - Revenue: Rp 15,000,000/bulan
  - Gross profit: Rp 4,500,000/bulan (30% margin)

- **Month 4-6 (Growth):**
  - Target 150 orders/bulan
  - Revenue: Rp 45,000,000/bulan
  - Gross profit: Rp 13,500,000/bulan

- **Month 7-12 (Scale):**
  - Target 300 orders/bulan
  - Revenue: Rp 90,000,000/bulan
  - Gross profit: Rp 27,000,000/bulan

**Breakeven Analysis:**
- Fixed costs: Rp 10,000,000/bulan
- Variable costs: 65-70% dari revenue
- Breakeven point: ~Rp 33,000,000/bulan (~110 orders)

---

## 🌍 Cultural Impact & Mission

### Mission

**Melestarikan Tradisi Layang-Layang Aduan Indonesia Melalui Teknologi Modern**

LayanganLegacy bukan sekadar e-commerce, tapi platform untuk:
- **Mendokumentasikan** warisan budaya layang-layang aduan Indonesia
- **Mengedukasi** generasi muda tentang seni dan teknik pembuatan layang-layang
- **Menghubungkan** komunitas lokal dengan pasar nasional & internasional
- **Mempromosikan** budaya Indonesia ke negara tetangga (Malaysia, Brunei, Singapore)

### Cultural Significance

Layang-layang aduan adalah bagian dari warisan budaya Indonesia:
- **Sejarah:** Tradisi ini telah ada sejak ratusan tahun di berbagai daerah di Indonesia
- **Filosofi:** Melambangkan keterampilan, kesabaran, dan kebijaksanaan lokal
- **Komunitas:** Menghubungkan orang dari berbagai latar belakang & usia
- **Inovasi:** Menggabungkan tradisional dengan modern dalam desain & teknik

### Sustainability

**Environmental Commitment:**
- Gunakan bahan ramah lingkungan (bamboo, biodegradable materials)
- Kampanye "Layang-Layang, Bukan Plastik" - kurangi penggunaan plastik
- Recycle program untuk layang-layang bekas (upcycling projects)

**Social Impact:**
- Dukung pengrajin lokal dengan harga yang adil (fair trade)
- Training programs untuk pengrajin muda
- Donation campaigns untuk komunitas kurang mampu (layang-layang untuk anak-anak)

---

## 🚀 Competitive Advantage

### Why Ruby on Rails + Hotwire?

**Development Speed:**
- Rails scaffolding & conventions = 3-4x faster development
- Hotwire (Turbo + Stimulus) = dynamic UI tanpa complex frontend framework
- Real-time updates dengan Turbo Streams = live leaderboard, notifications

**Maintenance Cost:**
- Monolithic Rails app = lower operational complexity
- Gems ecosystem = rich functionality dengan minimal custom code
- Convention over configuration = easier onboarding untuk developers

**User Experience:**
- Fast page loads (server-side rendering)
- Smooth interactions (Turbo Frames untuk partial updates)
- Progressive enhancement (works tanpa JavaScript)

### Market Differentiation

**Niche Focus:**
- Satu-satunya platform khusus layang-layang aduan di Indonesia
- Low competition = easier market penetration
- Strong community engagement = high customer retention

**Content-Driven Commerce:**
- Video tutorials build trust & authority
- Forum create network effects & organic traffic
- Leaderboard gamification increase user engagement

**Cultural Authenticity:**
- Deep knowledge tentang tradisi layang-layang aduan
- Partnership dengan komunitas lokal
- Storytelling tentang sejarah & filosofi setiap jenis layang-layang

---

**Last Updated:** 2026-01-06
**Version:** 0.1.0-planning
**Maintainer:** Najib Zain (Lead Developer)

**MVP Timeline (Estimated 10 Milestones):**
- **M1-M3 (3 months):** Core e-commerce features + basic Hotwire implementation
- **M4-M6 (3 months):** Forum komunitas + video tutorial library + user accounts
- **M7-M8 (2 months):** Marketplace peer-to-peer + payment integration + shipping
- **M9-M10 (2 months):** Leaderboard + event calendar + advanced analytics

**Total MVP Timeline:** 10 months

---

## 📞 Contact & Support

**Business Inquiries:** hello@layanganlegacy.com
**Support:** support@layanganlegacy.com
**WhatsApp:** +62 815-9988-995 (sales inquiries)
**Office:** [Alamat Akordium Lab HQ]

**Follow Us:**
- Instagram: @layanganlegacy
- YouTube: LayanganLegacy Official
- Facebook: LayanganLegacy Community
- TikTok: @layanganlegacy

---

## 📜 License & Copyright

© 2025 Akordium Lab. All rights reserved.

LayanganLegacy is a product of Akordium Lab, part of the Indonesian digital heritage preservation initiative.
