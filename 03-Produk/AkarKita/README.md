# 🌳 AkarKita

> Platform Pencatat & Visualisasi Nasab/Pohon Keluarga dengan Dual License Open Source

## 🏷️ Product Identity

- **Nama Produk:** AkarKita
- **Status:** 🚧 In Development
- **Repo Code:** `github.com/akordium/akarkita` (Private)
- **Live Site:** https://akarkita.com
- **Staging:** https://staging.akarkita.com
- **Project Management:** [Link ke GitHub Project Board]

## 📋 Quick Overview

**Tagline:** Jaga Silaturahmi, Lestarikan Nasab Keluarga

**Deskripsi Singkat:** Platform SaaS freemium untuk memvisualisasikan dan mengelola pohon keluarga (family tree) dengan dukungan khusus format nasab Islam. Mendukung dokumentasi foto, arsip dokumen, timeline kehidupan, dan privasi kontrol. Model dual license: open source (MIT) untuk penggunaan dasar, dan proprietary untuk fitur premium.

**Target Market:**

- **Primary:** Keluarga besar Indonesia (manage 50-500+ anggota keluarga)
- **Secondary:** Genealogist profesional dan peneliti silsilah keluarga
- **Tertiary:** Komunitas marga (Batak, Minang, Makassar, dll) dan yayasan keluarga
- **Quaternary:** International diaspora Indonesians wanting to connect with roots

**5 Fitur Utama:**

1. **Family Tree Builder Interaktif** - Visualisasi pohon keluarga dengan drag-and-drop, zoom, dan format nasab Islam (ayah-ke-anak)
2. **Photo & Document Archive** - Upload foto dan scan dokumen per anggota keluarga dengan auto-tagging
3. **Timeline Kehidupan** - Catatan kelahiran, pernikahan, kematian, dan event penting lainnya
4. **DNA Matching (Optional)** - Integrasi dengan 23andMe/MyHeritage untuk verifikasi biologis
5. **Privacy Controls** - Cabang publik vs privat, kontrol akses per anggota keluarga

**Fitur Tambahan (Post-MVP):**

- **GEDCOM Export/Import** - Standar internasional untuk portabilitas data
- **Multi-Language Support** - Indonesia, daerah (Batak, Minang, Jawa, dll), Arab untuk nasab Islam
- **Collaborative Editing** - Multi-user editing dengan real-time updates
- **Smart Matching** - AI-powered suggestions untuk menghubungkan anggota keluarga yang terpisah
- **Mobile App** - Native iOS dan Android applications

**Problem yang Diselesaikan:**

- Kehilangan informasi silsilah keluarga antar generasi - data tertinggal di kertas/lemari
- Sulit memvisualisasikan hubungan keluarga besar - terutama dengan keluarga kompleks
- Tidak ada standardisasi format nasab - khusus untuk keluarga Muslim
- Kehilangan foto dan dokumen keluarga - tidak terorganisir dan tersebar
- Sulitnya menghubungkan keluarga di era diaspora - anak-anak pindah ke kota/luar negeri

## 🛠 Tech Stack

### Backend

- **Framework/Language:** Go 1.21+ (Gin framework)
- **Database:** PostgreSQL 15
- **API:** RESTful API dengan JWT authentication

### Frontend

- **Framework:** Tanstack Start (React Server Components)
- **Component Library:** Shadcn/ui + Custom Tailwind components
- **Styling:** Tailwind CSS 3
- **State Management:** Tanstack Query (React Query) + Zustand
- **Visualization:** D3.js atau React Flow untuk family tree rendering
- **Real-time:** WebSockets untuk collaborative editing (post-MVP)

### Infrastructure

- **Hosting:** Oracle Cloud Infrastructure
- **Deployment:** Coolify
- **CDN:** Cloudflare
- **Storage:** Cloudflare R2 untuk photos dan documents
- **Monitoring:** Custom Dashboard + Error Tracking

### Third-party Services

- **Email:** SendGrid
- **Payment Gateways:**
  - **Midtrans** - General payments (GoPay, OVO, DANA, Credit Cards)
  - **QRIS** - Indonesia standard QR payment
- **DNA Testing Services (Post-MVP):**
  - **23andMe** - DNA testing integration (optional)
  - **MyHeritage** - DNA matching dan historical records (optional)
- **Analytics:** Google Analytics + Custom Analytics
- **Translation (Post-MVP):** Google Cloud Translation API untuk multi-language support

## 💻 Local Development Setup

### Prerequisites

- [ ] Go 1.21+
- [ ] PostgreSQL 15
- [ ] Node.js 20+ (untuk build frontend assets)
- [ ] Docker & Docker Compose (optional)
- [ ] Make (untuk build automation)

### Installation Steps

1. **Clone repository**

   ```bash
   git clone https://github.com/akordium/akarkita.git
   cd akarkita
   ```

2. **Install backend dependencies**

   ```bash
   go mod download
   ```

3. **Install frontend dependencies**

   ```bash
   cd frontend
   npm install
   cd ..
   ```

4. **Environment setup**

   ```bash
   cp .env.example .env
   # Edit .env file dengan konfigurasi lokal
   ```

5. **Database setup**

   ```bash
   # Jalankan PostgreSQL (jika menggunakan Docker)
   docker-compose up -d postgres

   # Buat database
   createdb akarkita_dev

   # Run migrations
   make migrate-up

   # Seed data (optional)
   make seed-db
   ```

6. **Build frontend assets**

   ```bash
   cd frontend
   npm run build
   cd ..
   ```

7. **Start development server**

   ```bash
   # Backend (port 8080)
   make dev-backend

   # Frontend (port 3000) - di terminal lain
   cd frontend
   npm run dev
   ```

8. **Aplikasi berjalan di:** http://localhost:3000

### Development Commands

```bash
# Backend
make dev              # Start backend development server
make test             # Run backend tests
make test-coverage    # Run tests dengan coverage
make migrate-up       # Run database migrations
make migrate-down     # Rollback migration
make migrate-create   # Create new migration
make lint             # Run Go linter
make fmt              # Format Go code

# Frontend
cd frontend
npm run dev           # Start frontend dev server
npm run build         # Build untuk production
npm run test          # Run frontend tests
npm run lint          # Run ESLint
npm run type-check    # Run TypeScript type checking
```

## 🧪 Testing

### Test Suite

- **Backend:**
  - **Framework:** Go testing + testify
  - **Coverage Target:** 85%
  - **Test Types:**
    - Unit Tests: Service, Repository layer
    - Integration Tests: API endpoints, database interactions
    - E2E Tests: Complete user workflows

- **Frontend:**
  - **Framework:** Vitest + React Testing Library
  - **Coverage Target:** 75%
  - **Test Types:**
    - Unit Tests: Component logic, utilities
    - Integration Tests: Component interactions
    - E2E Tests: Playwright untuk critical user journeys

### Running Tests

```bash
# Backend tests
make test                    # Run semua backend tests
make test-coverage           # Run dengan coverage report
make test-unit              # Unit tests only
make test-integration       # Integration tests only

# Frontend tests
cd frontend
npm run test                # Run semua frontend tests
npm run test:coverage       # Run dengan coverage
npm run test:e2e           # E2E tests dengan Playwright
```

## 🚢 Deployment

### Environments

- **Development:** Local development dengan Docker Compose
- **Staging:** Oracle Cloud dengan staging database
- **Production:** Oracle Cloud dengan high-availability setup

### Deployment Process

1. **Automatic Deployment** (via Coolify)
   - Push ke branch `main` → deploy ke production
   - Push ke branch `develop` → deploy ke staging

2. **Manual Deployment** (jika perlu)

   ```bash
   # Backend
   docker build -t akarkita-backend:latest .
   docker push registry.akarkita.com/backend:latest

   # Frontend
   cd frontend
   npm run build
   docker build -t akarkita-frontend:latest .
   docker push registry.akarkita.com/frontend:latest
   ```

3. **Database Migrations**

   ```bash
   # Run migrations di production
   make migrate-up
   ```

### Environment Variables

**Required variables:**

- `DB_HOST` - Database host
- `DB_PORT` - Database port (5432)
- `DB_NAME` - Database name
- `DB_USER` - Database username
- `DB_PASSWORD` - Database password
- `JWT_SECRET` - JWT signing secret
- `R2_ACCESS_KEY` - Cloudflare R2 access key
- `R2_SECRET_KEY` - Cloudflare R2 secret key
- `SENDGRID_API_KEY` - SendGrid API key
- `MIDTRANS_SERVER_KEY` - Midtrans server key

**Optional variables:**

- `REDIS_HOST` - Redis host (untuk caching)
- `REDIS_PORT` - Redis port (6379)
- `LOG_LEVEL` - Log level (debug/info/warn/error)
- `ENVIRONMENT` - Environment (development/staging/production)

**Secret management:** Semua secrets disimpan di environment variables, tidak ada hardcoded secrets.

## 📊 Key Metrics & Monitoring

### Business Metrics

- [ ] **Active Family Trees:** Target 1,000+ active family trees (Year 1)
- [ ] **Total Family Members:** Target 50,000+ members documented (Year 1)
- [ ] **Photo/Document Uploads:** Target 100,000+ uploads (Year 1)
- [ ] **User Engagement:** 60% monthly active users
- [ ] **Freemium Conversion:** Target 8-12% free-to-paid conversion rate
- [ ] **Premium Subscriptions:** Target 100+ paying customers (Year 1)
- [ ] **GEDCOM Exports:** Target 5,000+ exports/month (post-MVP)

### Technical Metrics

- [ ] **Response Time:** < 300ms average (API), < 2s (page load)
- [ ] **Uptime:** 99.5% uptime
- [ ] **Error Rate:** < 1% error rate
- [ ] **Database Performance:** < 100ms query time
- [ ] **Image Upload Speed:** < 5s untuk 5MB photo

### Monitoring Setup

- **Error Tracking:** Custom Go error logging + Sentry (post-MVP)
- **Performance Monitoring:** Custom dashboard dengan response time tracking
- **Uptime Monitoring:** Cloudflare monitoring + custom health checks
- **Business Metrics:** Custom analytics dashboard

## 🔐 Security

### Security Measures

- [ ] **Authentication:** JWT token authentication dengan refresh token rotation
- [ ] **Authorization:** Role-based access control (Owner, Editor, Viewer)
- [ ] **Data Encryption:** Sensitive personal data di-encrypt di rest
- [ ] **API Security:** Rate limiting, CORS proper configuration
- [ ] **Input Validation:** Strict validation untuk semua inputs
- [ ] **Privacy Controls:** Family tree data ownership dengan granular permissions

### Security Checklist

- [x] HTTPS enabled (Cloudflare SSL)
- [x] Environment variables secured
- [x] Database connections encrypted
- [x] User passwords properly hashed (bcrypt)
- [x] API rate limiting implemented
- [x] CORS properly configured
- [ ] JWT token expiration dan refresh mechanism
- [ ] Photo/document access control (private family media)
- [ ] GDPR compliance untuk data export/deletion

### Privacy Features

- **Public vs Private Trees:**
  - Public trees: Siapapun bisa view (dengan limited info)
  - Private trees: Hanya family members dengan invite link
- **Branch Privacy:**
  - Beberapa branch bisa disembunyikan (contoh: mantan pasangan)
  - Living people: Info sensitif disembunyikan (tanggal lahir, alamat)
- **Data Ownership:**
  - User memiliki full control atas data keluarga mereka
  - GDPR-compliant data export dan deletion

## 🌍 Cultural Fit & Localization

### Indonesian Cultural Context

**Mengapa AkarKita cocok untuk Indonesia:**

1. **Budaya Silaturahmi** - Indonesia sangat peduli keluarga besar, Lebaran adalah momen kumpul keluarga terbesar
2. **Complex Family Structures** - Keluarga besar dengan ratusan anggota, sering tersebar di multiple cities
3. **Diaspora Phenomenon** - Banyak anak pindah ke kota besar atau luar negeri, kehilangan connection dengan roots
4. **Nasab Islam** - Format khusus untuk silsilah keluarga Muslim (ayah-ke-anak, bukan parental equal)
5. **Marga/Clan Culture** - Komunitas seperti Batak, Minang, Makassar punya struktur marga yang kompleks

### Seasonal Marketing Opportunities

- **Ramadhan/Lebaran:** Peak season untuk silaturahmi dan kumpul keluarga
- **Libur Sekolah:** Moment liburan keluarga
- **Wedding Season:** Saat ada pernikahan, sering diskusi tentang family tree

### Multi-Language Support (Post-MVP)

- **Bahasa Indonesia** - Primary language
- **Bahasa Daerah:** Batak, Minang, Jawa, Sunda, Makassar, Bugis
- **Arabic:** Untuk format nasab Islam (nama-nama Arab)
- **English:** Untuk diaspora dan international users

## 💰 Pricing & Licensing

### Dual License Model

**Basic Tier (Free - Open Source):**

- **Price:** Rp 0 (gratis)
- **License:** MIT (fully open source, self-hostable)
- **Limits:** 50 family members max, 100 photos, basic features only
- **Features:** Family tree builder, photo uploads, basic timeline, manual editing
- **Storage:** 500MB cloud storage
- **Support:** Community only (GitHub Issues, Discord)
- **Purpose:** Untuk keluarga kecil, proof of concept, penggunaan personal

**Premium Tier (Paid - Proprietary):**

- **Small Plan:** Rp 300,000/month (up to 200 members)
- **Medium Plan:** Rp 900,000/month (up to 1,000 members)
- **Large Plan:** Rp 2,500,000/month (unlimited members)
- **License:** Proprietary (SaaS, hosted)
- **Features:**
  - Unlimited family members
  - Unlimited photo & document uploads
  - GEDCOM export/import (standard internasional)
  - Smart matching (AI-powered suggestions)
  - Multi-language support
  - Advanced privacy controls
  - Collaborative editing (multi-user)
  - Priority support
- **Storage:** Small: 10GB, Medium: 50GB, Large: 200GB
- **Support:** Priority email & WhatsApp
- **Discount:** 2 months free (17% discount) jika bayar tahunan

**DNA Matching Add-on (Post-MVP):**

- **Integration Fee:** Rp 500,000 one-time
- **Per Test Cost:** Biaya DNA testing service (23andMe/MyHeritage)
- **Features:** Verifikasi biologis hubungan keluarga, ethnicity breakdown

**Enterprise Plan (Custom Pricing):**

- **Pricing:** Rp 5-25M/year
- **Purpose:** Untuk yayasan keluarga, komunitas marga, lembaga penelitian
- **Features:** Unlimited everything + custom features, white-label option
- **Support:** Dedicated support, training, custom integrations
- **Deployment:** On-premise atau dedicated cloud instance

📖 **Detailed Pricing:** [pricing-model.md](./pricing-model.md) untuk complete pricing breakdown

## 🏛️ Competitive Edge

### Dual License Advantage

**Open Source Benefits:**
- **Trust:** Code bisa di-audit oleh anyone, no hidden surveillance
- **Self-Hosting:** Bisa di-host sendiri untuk data privacy extreme
- **Community:** Community contributions untuk features dan bug fixes
- **Cost-Free:** Keluarga kecil bisa pakai gratis selamanya

**Proprietary Benefits:**
- **Managed Service:** Tidak perlu manage server, kami yang handle
- **Premium Features:** Advanced features yang membutuhkan infrastructure (AI matching, large storage)
- **Support:** Dedicated support untuk masalah teknis
- **Updates:** Otomatis dapat updates dan new features

### Differentiation vs Competitors

**vs MyHeritage/Ancestry:**
- ✅ Fokus Indonesia dengan format nasab Islam
- ✅ Multi-language support (Indonesia + daerah)
- ✅ Lebih affordable untuk keluarga Indonesia
- ✅ Data stays in Indonesia (data sovereignty)
- ❌ Kurang database historis international (yang akan jadi kekuatan kami di masa depan)

**vs Local Spreadsheets/Paper:**
- ✅ Visualisasi interaktif bukan list
- ✅ Collaborative editing (banyak orang bisa edit)
- ✅ Cloud backup (tidak hilang jika kertas rusak)
- ✅ Searchable dan filterable
- ✅ GEDCOM export (portable ke platform lain)

### Unique Features (Indonesia-Specific)

1. **Nasab Format** - Support format silsilah Islam (ayah-ke-anak strict, bukan parental equal)
2. **Marga System** - Support struktur marga (Batak: marga klan, Minang: suku, dll)
3. **Lebaran Mode** - Mode khusus untuk persiapan silaturahmi Lebaran (export kontak, print family tree)
4. **Diaspora Connection** - Feature untuk mencari kerabat jauh yang hilang contact
5. **Privacy by Culture** - Sesuai norma Indonesia (kontrol informasi sensitif tentang mantan pasangan, dll)

## 🚀 Marketing Strategy

### Launch Strategy

**Phase 1: Beta Testing (3 bulan)**
- Recruit 100 keluarga besar untuk beta testing
- Focus on keluarga dengan 50+ anggota
- Iterasi product based pada feedback

**Phase 2: Soft Launch (3 bulan)**
- Launch ke public dengan freemium model
- Content marketing: blog posts tentang pentingnya menjaga silsilah keluarga
- Social media campaigns: Instagram dan Facebook ads target audience 30-50 tahun

**Phase 3: Seasonal Push (Ramadhan/Lebaran)**
- "Lebaran Mode" campaign
- "Kenali Keluargamu sebelum Lebaran" messaging
- Influencer partnerships: mom bloggers, family influencers

### Content Marketing Ideas

- **Blog Series:**
  - "Cara Mencatat Silsilah Keluarga untuk Pemula"
  - "Pentingnya Menjaga Nasab dalam Islam"
  - "5 Cara Menghubungkan Kembali dengan Kerabat Jauh"
  - "Tips Mengorganisir Foto Keluarga Lama"

- **Video Content:**
  - Tutorial cara pakai AkarKita
  - Testimonial dari keluarga besar
  - Storytelling: "Kisah Reuni Keluarga Setelah 30 Tahun Terpisah"

- **Social Media:**
  - Before/after: foto lemari tua vs digital family tree
  - User stories: keluarga yang berhasil reconnect via AkarKita
  - Infographics: fakta tentang kehilangan silsilah keluarga

## 📚 Documentation

### Internal Documentation

- **Technical Specs:** [link ke technical documentation]
- **API Documentation:** [link ke API docs]
- **Database Schema:** [link ke database docs]
- **Deployment Guide:** [link ke deployment guide]
- **GEDCOM Standard:** [link ke GEDCOM documentation]

### User Documentation

- **User Guide:** [link ke user guide]
- **FAQ:** [link ke FAQ]
- **Video Tutorials:** [link ke video tutorials]
- **Nasab Islam Guide:** [link ke Islamic genealogy documentation]

## 🤝 Team & Roles

### Development Team

- **Tech Lead:** Najib (Backend & Architecture)
- **Frontend Developer:** [Nama] (UI/UX Implementation)
- **DevOps Engineer:** [Nama] (Infrastructure & Deployment)
- **UI/UX Designer:** [Nama] (Design System)

### External Stakeholders

- **Product Owner:** [Nama] (Business Requirements)
- **Genealogy Expert:** [Nama] (Domain expertise)
- **Cultural Consultant:** [Nama] (Indonesian family structure expert)
- **Islamic Scholar (Ustadz):** [Nama] (Nasab format validation)

## 🆘 Support & Troubleshooting

### Common Issues

1. **Family tree tidak loading**
   - Solution: Clear browser cache, check internet connection, verify API endpoint

2. **Photo upload gagal**
   - Solution: Check file size (max 10MB per photo), verify R2 storage credentials

3. **GEDCOM import gagal**
   - Solution: Validate GEDCOM format, check encoding (UTF-8), verify file structure

4. **Performance lambat untuk large trees**
   - Solution: Enable virtualization, limit initial load depth, use pagination

### Getting Help

- **Email:** support@akarkita.com
- **WhatsApp:** +62 815-9988-995
- **Documentation:** [link ke knowledge base]
- **Community Forum:** [link ke forum/discord]

## 📈 Roadmap

Lihat [roadmap.md](./roadmap.md) untuk detail perkembangan produk AkarKita.

## 🔄 Changelog

Lihat [changelog.md](./changelog.md) untuk riwayat perubahan AkarKita.

## 🐛 Known Issues

Lihat [known-issues.md](./known-issues.md) untuk daftar bug dan limitation yang diketahui.

## 🧬 DNA Integration (Post-MVP Feature)

### DNA Matching (Optional Add-on)

**Status:** Post-MVP Enhancement (M9-M10) - Tidak diperlukan untuk core functionality

**Why DNA Matching (Optional):**
- **Verification:** Verify biological relationships untuk adopsi atau kasus khusus
- **Ethnicity:** Discover ethnic breakdown dan ancestral origins
- **Lost Relatives:** Connect dengan biological family untuk adopsi cases
- **Scientific Genealogy:** Modern approach untuk traditional family trees

**How It Works:**
1. User beli DNA test kit dari partner (23andMe/MyHeritage)
2. Test results di-upload ke AkarKita (via API integration)
3. System match DNA results dengan family tree database
4. Suggestions untuk missing connections atau adoptions

**Benefits:**
- **Verification:** Confirm biological relationships
- **Discovery:** Find unknown relatives via DNA matching
- **Ethnicity:** Understand ethnic composition
- **Adoption Cases:** Help adoptees find biological families

**Note:** DNA testing adalah optional add-on. AkarKita berfungsi penuh tanpa DNA integration.

## 📊 Milestones

**MVP Timeline:**

- **M1 (4 weeks):** Foundation & Basic Features
  - Setup project structure (Go + Tanstack Start)
  - Database schema design
  - Authentication & authorization
  - Basic family tree CRUD

- **M2 (8 weeks):** Core Features
  - Interactive family tree visualization (D3.js/React Flow)
  - Photo upload & storage (R2)
  - Timeline events (birth, marriage, death)
  - Basic search & filtering

- **M3 (12 weeks):** Advanced Features
  - Document upload & management
  - Privacy controls (public/private branches)
  - User roles (Owner, Editor, Viewer)
  - Family tree sharing via invite link

- **M4 (16 weeks):** MVP Polish
  - Performance optimization untuk large trees (1000+ members)
  - Mobile responsive design
  - Comprehensive testing (unit, integration, E2E)
  - Beta testing dengan 50 families
  - Bug fixes & refinements

- **M5 (20 weeks):** Launch Preparation
  - Payment integration (Midtrans)
  - Subscription management
  - Email notifications & onboarding flow
  - Marketing website & landing page
  - Documentation & help center

- **M6 (24 weeks):** Soft Launch
  - Public launch dengan freemium model
  - Initial marketing campaigns
  - Customer feedback collection
  - Iteration based pada feedback

- **M7 (28 weeks):** Premium Features
  - GEDCOM export/import
  - Multi-language support (Indonesia, Arab)
  - Advanced analytics & insights
  - Collaborative editing (real-time)

- **M8 (32 weeks):** Growth & Optimization
  - Smart matching (AI-powered suggestions)
  - SEO optimization untuk organic traffic
  - Referral program (invite family members)
  - Content marketing & thought leadership

- **M9 (36 weeks):** Advanced Integrations
  - DNA testing integration (23andMe/MyHeritage)
  - WhatsApp notifications untuk family events
  - Social media sharing features
  - Print & PDF export (untuk Lebaran)

- **M10 (40 weeks):** Enterprise & Scale
  - Enterprise features (white-label, on-premise)
  - API untuk third-party integrations
  - Mobile app (React Native) - MVP version
  - Advanced reporting & analytics

---

**Last Updated:** 2026-01-06
**Version:** 0.1.0-alpha
**Maintainer:** Najib Zain (Lead Developer)

**MVP Scope:** M1-M4 (16 weeks - 4 months)
**Full Launch:** M6 (24 weeks - 6 months)
**Maturity:** M10 (40 weeks - 10 months)
