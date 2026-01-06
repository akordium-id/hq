# 💰 Nanabung

> Platform Pencatat Cashflow Personal dengan Prediksi Masa Depan Berbasis AI

## 🏷️ Product Identity

- **Nama Produk:** Nanabung
- **Status:** 🚧 In Development
- **Repo Code:** `github.com/akordium/nanabung` (Private)
- **Live Site:** https://nanabung.com
- **Staging:** https://staging.nanabung.com
- **Project Management:** [Link ke GitHub Project Board]

## 📋 Quick Overview

**Tagline:** Catat Pengeluaran Cepat, Prediksi Masa Depan Pintar

**Deskripsi Singkat:** Platform pencatat cashflow personal freemium dengan kemampuan prediksi keuangan 30-90 hari ke depan menggunakan AI. Input transaksi super cepat (voice, OCR receipt, chatbot), kategorisasi otomatis, dan peringatan budget. Opsional BYOK AI untuk privasi maksimal.

**Target Market:**

- **Primary:** Individu usia 20-35 tahun yang ingin kontrol cashflow harian
- **Secondary:** Mahasiswa dengan budget terbatas yang ingin tracking pengeluaran
- **Tertiary:** Ibu rumah tangga yang mengelola keuangan keluarga
- **Quaternary:** Freelancers & gig workers yang butuh cashflow forecasting

**5 Fitur Utama:**

1. **Quick Expense Input** - Catat transaksi via voice command, OCR receipt scan, atau chatbot dalam < 5 detik
2. **AI Auto-Categorization** - Kategori pengeluaran otomatis (makanan, transport, hiburan, dll) tanpa manual tagging
3. **Cashflow Forecasting** - Prediksi cashflow 30-90 hari ke depan dengan machine learning
4. **Smart Budget Alerts** - Notifikasi ketika pengeluaran mendekati limit budget kategori
5. **Shared Wallet** - Kelola keuangan bersama (keluarga, partners, bisnis kecil) dengan multi-user access

**Fitur Tambahan (Premium):**

- **OCR Receipt Scanning** - Scan struk belanja otomatis (GoPay, OVO, bank transfers, retail receipts)
- **BYOK AI (Bring Your Own Key)** - Gunakan OpenAI API key sendiri untuk 100% data privacy
- **Advanced Analytics** - Spending patterns, trend analysis, dan personalized financial insights
- **Export Reports** - Export ke Excel/PDF untuk laporan bulanan dan tahunan

**Problem yang Diselesaikan:**
- Manual expense tracking terlalu ribet - most apps quit setelah 2 minggu
- Tidak visibility ke cashflow masa depan - tidak tahu apakah cukup uang untuk bulan depan
- Kategorisasi manual terlalu耗时 - users malas categorize transaksi satu per satu
- Aplikasi kompetitor terlalu kompleks - feature bloat membuat penggunaan berat

**Competitive Advantage vs Competitors:**

- **Simplicity first** - Clean UI, zero learning curve, record in < 5 seconds
- **AI-powered automation** - No manual categorization needed, smart predictions
- **Privacy-focused** - BYOK AI option untuk users yang paranoid tentang data privacy
- **Complementary dengan Anggarin** - Cross-sell opportunity: Nanabung untuk daily tracking, Anggarin untuk long-term planning
- **Local context** - Kategori dan insights sesuai pola belanja Indonesia (warung, gojek, grab, ovo, gopay)

## 🛠 Tech Stack

### Backend

- **Framework/Language:** Go 1.21+ (Gin framework)
- **Database:** PostgreSQL 15
- **API:** RESTful API dengan JSON responses
- **AI/ML Integration:**
  - OpenAI GPT-4 API (default, hosted by Nanabung)
  - BYOK AI support (users bring their own OpenAI API key)
  - TensorFlow Lite untuk on-device categorization (optional, offline mode)

### Frontend

- **Framework:** SvelteKit (Svelte 5)
- **Component Library:** Skeleton UI + Custom Tailwind components
- **Styling:** Tailwind CSS 3
- **State Management:** Svelte stores dengan persistent localStorage
- **PWA Support:** Service workers untuk offline functionality
- **Mobile-First:** Responsive design dengan native app feel

### Infrastructure

- **Hosting:** Oracle Cloud Infrastructure
- **Deployment:** Coolify
- **CDN:** Cloudflare
- **Monitoring:** Custom Dashboard + Error Tracking
- **Storage:** Cloudflare R2 (untuk receipt images)

### Third-party Services

- **AI Services:**
  - **OpenAI GPT-4 API** - Default AI engine untuk categorization & forecasting
  - **Tesseract.js** - Client-side OCR untuk receipt scanning
  - **Google Cloud Vision API** (backup) - Advanced OCR untuk low-quality receipts
- **Speech Recognition:**
  - **Web Speech API** - Browser-native voice input (Chrome/Edge)
  - **OpenAI Whisper API** - Backup untuk unsupported browsers
- **Email:** SendGrid
- **Analytics:** Google Analytics + Custom Analytics
- **Payment Gateway:** Midtrans (untuk premium subscription)

## 💻 Local Development Setup

### Prerequisites

- [ ] Go 1.21+
- [ ] PostgreSQL 15
- [ ] Node.js 20+ (untuk build SvelteKit frontend)
- [ ] Docker & Docker Compose (optional)

### Installation Steps

1. **Clone repository**

   ```bash
   git clone https://github.com/akordium/nanabung.git
   cd nanabung
   ```

2. **Backend setup**

   ```bash
   cd backend
   go mod download

   # Copy environment file
   cp .env.example .env
   # Edit .env file dengan konfigurasi lokal

   # Run database migrations
   make migrate-up

   # Seed data (optional)
   make seed
   ```

3. **Frontend setup**

   ```bash
   cd frontend
   npm install

   # Copy environment file
   cp .env.example .env
   # Edit .env file dengan API URL lokal
   ```

4. **Database setup**

   ```bash
   # Jalankan PostgreSQL (jika menggunakan Docker)
   docker-compose up -d postgres

   # Atau gunakan PostgreSQL lokal
   sudo -u postgres createdb nanabung_dev
   ```

5. **Start development servers**

   ```bash
   # Terminal 1: Backend
   cd backend
   make dev
   # Backend runs on http://localhost:8080

   # Terminal 2: Frontend
   cd frontend
   npm run dev
   # Frontend runs on http://localhost:5173
   ```

6. **Aplikasi berjalan di:** http://localhost:5173

### Development Commands

```bash
# Backend Commands
cd backend

# Run development server with hot reload
make dev

# Run tests
make test

# Run tests dengan coverage
make test-coverage

# Database migrations
make migrate-up    # Apply migrations
make migrate-down  # Rollback migrations

# Build production binary
make build

# Linting
go fmt ./...
go vet ./...

# Frontend Commands
cd frontend

# Development server
npm run dev

# Build for production
npm run build

# Preview production build
npm run preview

# Type checking
npm run check

# Linting
npm run lint
```

### Environment Variables

**Backend (.env):**

```bash
# Server
SERVER_PORT=8080
GIN_MODE=debug

# Database
DB_HOST=localhost
DB_PORT=5432
DB_USER=nanabung_user
DB_PASSWORD=your_password
DB_NAME=nanabung_dev

# AI Services
OPENAI_API_KEY=sk-your-openai-key
OPENAI_MODEL=gpt-4
OPENAI_MAX_TOKENS=500

# JWT Secret
JWT_SECRET=your-jwt-secret-key

# Email
SENDGRID_API_KEY=your-sendgrid-key

# Storage (R2)
R2_ACCOUNT_ID=your-r2-account
R2_ACCESS_KEY=your-r2-access-key
R2_SECRET_KEY=your-r2-secret
R2_BUCKET=nanabung-receipts
```

**Frontend (.env):**

```bash
VITE_API_BASE_URL=http://localhost:8080/api/v1
VITE_APP_URL=http://localhost:5173
```

## 🧪 Testing

### Test Suite

- **Backend:**
  - **Framework:** testify + go-test
  - **Coverage Target:** 80%
  - **Test Types:**
    - Unit Tests: Service layer, business logic
    - Integration Tests: API endpoints dengan database
    - E2E Tests: Critical user flows

- **Frontend:**
  - **Framework:** Vitest + Testing Library
  - **Coverage Target:** 70%
  - **Test Types:**
    - Unit Tests: Component logic, stores
    - Integration Tests: User interactions

### Running Tests

```bash
# Backend tests
cd backend
go test ./... -v
go test ./... -cover

# Frontend tests
cd frontend
npm run test
npm run test:ui      # UI mode untuk debugging

# E2E tests (Playwright)
cd frontend
npm run test:e2e
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
   # Backend Deployment
   cd backend
   go build -o nanabung-api ./cmd/api
   systemctl restart nanabung-api

   # Frontend Deployment
   cd frontend
   npm run build
   # Sync static files ke server
   rsync -avz build/ user@server:/var/www/nanabung/
   ```

### Docker Deployment

```bash
# Build dan start semua services
docker-compose up -d

# View logs
docker-compose logs -f

# Scale API instances
docker-compose up -d --scale api=3
```

### Environment Variables (Production)

**Required variables:**

- `DB_HOST`, `DB_PORT`, `DB_USER`, `DB_PASSWORD`, `DB_NAME`
- `JWT_SECRET` - Strong random string
- `OPENAI_API_KEY` - OpenAI API key (atau kosongkan untuk BYOK-only mode)
- `SENDGRID_API_KEY` - SendGrid untuk email notifications
- `R2_*` - Cloudflare R2 credentials untuk receipt storage

**Optional variables:**

- `REDIS_URL` - Redis untuk caching & sessions
- `SENTRY_DSN` - Error tracking
- `ENABLE_SIGNUP` - Enable/disable public registration

**Secret management:** Semua secrets disimpan di environment variables, tidak ada hardcoded secrets.

## 📊 Key Metrics & Monitoring

### Business Metrics

- [ ] **Active Users:** Target 1,000+ MAU (Monthly Active Users) by Month 6
- [ ] **Transaction Recorded:** Target 100,000+ transactions per month by Month 12
- [ ] **User Retention:** 40% retention rate setelah 30 days
- [ ] **Freemium Conversion:** 8-12% free-to-paid conversion rate
- [ ] **ARPU (Avg Revenue Per User):** Rp 15,000/month (blended free+paid)
- [ ] **Daily Active Users:** 30% of registered users login daily
- [ ] **Avg Transactions/Day:** 3-5 transactions per active user per day

### Technical Metrics

- [ ] **Response Time:** < 200ms average (p95: < 500ms)
- [ ] **Uptime:** 99.5% uptime
- [ ] **Error Rate:** < 0.5% error rate
- [ ] **Database Performance:** < 50ms query time (p95)
- [ ] **AI Categorization Accuracy:** > 90% accuracy rate
- [ ] **OCR Accuracy:** > 85% accuracy untuk standard receipts

### Monitoring Setup

- **Error Tracking:** Custom Go error logging + Sentry
- **Performance Monitoring:** Custom dashboard dengan response time tracking
- **Uptime Monitoring:** Cloudflare monitoring + custom health checks
- **Business Metrics:** Custom analytics dashboard (user growth, engagement)
- **AI Cost Tracking:** Monitor OpenAI API usage & costs per user

## 🔐 Security

### Security Measures

- [ ] **Authentication:** JWT tokens dengan refresh token rotation
- [ ] **Authorization:** Role-based access control (Owner, Editor, Viewer untuk shared wallets)
- [ ] **Data Encryption:** Sensitive financial data encrypted at rest
- [ ] **API Security:** Rate limiting (100 req/min per user), CORS proper configuration
- [ ] **Input Validation:** Strict validation untuk semua inputs (Go structs)
- [ ] **Password Security:** bcrypt hashing dengan cost factor 12
- [ ] **HTTPS Only:** Force HTTPS di production dengan HSTS

### Privacy-First Design

- [ ] **BYOK AI** - Users dapat membawa OpenAI API key sendiri untuk 100% data privacy
- [ ] **Local Processing** - Categorization dapat dilakukan offline dengan TensorFlow Lite
- [ ] **Data Minimization** - Hanya collect data yang diperlukan untuk core features
- [ ] **GDPR Compliance** - Export & delete data upon request
- [ ] **No Third-Party Selling** - User data tidak dijual ke pihak ketiga

### Security Checklist

- [x] HTTPS enabled (Cloudflare SSL)
- [x] Environment variables secured
- [x] Database connections encrypted
- [x] User data properly hashed (bcrypt)
- [x] API rate limiting implemented
- [x] CORS properly configured
- [x] SQL injection prevention (parameterized queries)
- [x] XSS prevention (input sanitization & CSP headers)
- [ ] Security headers audit (CSP, HSTS, X-Frame-Options)

## 💰 Pricing & Monetization

### Freemium Model

**Free Tier (Unlimited Transactions):**

- **Price:** Rp 0 (gratis selamanya)
- **Limits:** Unlimited transactions, basic categorization (rule-based), 30-day forecast only
- **Features:**
  - Manual expense input (unlimited)
  - Basic auto-categorization (keyword-based rules)
  - 30-day cashflow forecast (rule-based, tanpa AI)
  - Budget tracking (up to 5 categories)
  - Single wallet only (tidak bisa shared)
- **Storage:** Data retained 6 months
- **Support:** Community only

**Premium Tier (AI-Powered):**

- **Price:** Rp 29,000/bulan (atau Rp 290,000/tahun - diskon 17%)
- **Features:**
  - Semua Free Tier features
  - **AI Auto-Categorization** - GPT-4 powered categorization (90%+ accuracy)
  - **90-Day Cashflow Forecast** - Machine learning predictions
  - **OCR Receipt Scanning** - Scan struk otomatis (unlimited scans)
  - **Voice Input** - Catat transaksi via voice command
  - **Advanced Analytics** - Spending insights & trend analysis
  - **Shared Wallet** - Multi-user access (family, partners)
  - **Export Reports** - Excel/PDF export
  - **Budget Alerts** - Push notification & email alerts
  - **Custom Categories** - Unlimited kategori & sub-kategori
- **Storage:** Data retained selamanya
- **AI Cost:** Included dalam subscription (Nanabung hosts OpenAI API)
- **Support:** Priority email & WhatsApp support (response < 24 hours)
- **BYOK AI Option:** Gratis - Gunakan OpenAI API key sendiri untuk privacy (bayar ke OpenAI langsung)

### Pricing Strategy

**Why Freemium with Unlimited Free Transactions:**

1. **Lower Barrier to Entry** - Users tidak takut "running out of free credits"
2. **Habit Formation** - Users dapat menggunakan selamanya tanpa forced upgrade
3. **Viral Growth** - Satisfied users recommend ke teman/keluarga
4. **Premium Conversion** - Power users akan upgrade untuk AI features setelah melihat value

**Monetization Drivers:**

- **AI Features** - Primary conversion driver (90% users want AI categorization)
- **OCR Receipts** - High-value feature untuk busy professionals
- **Shared Wallet** - Family & small business use cases
- **Advanced Analytics** - Users yang serius tentang financial health

**Pricing Psychology:**

- **Anchor Price** - Rp 29k/bulan terasa sangat murah vs kompetitor (Rp 50k-150k/bulan)
- **Annual Discount** - 17% discount (2 months free) untuk upfront payment
- **No Free Trial** - Tidak perlu, free tier sudah cukup powerful untuk mencoba value
- **Price Anchoring** - Competitors charge Rp 50k-150k/bulan, kita Rp 29k = 50-80% lebih murah

### Revenue Projections

**Conservative (Year 1):**

- 1,000 free users × 10% conversion = 100 paid users
- 100 × Rp 29k = Rp 2.9M/month
- Annual: Rp 34.8M

**Moderate (Year 1):**

- 5,000 free users × 12% conversion = 600 paid users
- 600 × Rp 29k = Rp 17.4M/month
- Annual: Rp 208.8M

**Optimistic (Year 2):**

- 50,000 free users × 15% conversion = 7,500 paid users
- 7,500 × Rp 29k = Rp 217.5M/month
- Annual: Rp 2.61M

**Cross-Sell Opportunities (Anggarin):**

- 10% Nanabung users convert ke Anggarin (long-term planning)
- Anggarin pricing: Rp 99k-299k/bulan
- Additional revenue stream: 750 users × Rp 150k avg = Rp 112.5M/month (Year 2)

## 🎯 Go-to-Market Strategy

### Marketing Channels

**1. Content Marketing (Organic)**

- **TikTok Tutorials** - Short video tutorials (15-60 seconds):
  - "Cara catat pengeluaran dalam 5 detik"
  - "Kenapa kamu selalu kehabisan uang sebelum gajian"
  - "Budgeting tips untuk mahasiswa"
- **Instagram Reels** - Behind-the-scenes, tips, user testimonials
- **YouTube Long-form** - Deep dives financial literacy, app tutorials

**2. Influencer Collaborations**

- **Micro-Influencers** (10k-100k followers):
  - Personal finance content creators
  - Mom bloggers (ibu rumah tangga target)
  - Student influencers (mahasiswa target)
- **Commission Structure:** 30% referral commission untuk first-year subscription
- **Affiliate Program:** Trackable referral links dengan dashboard

**3. Social Media Strategy**

- **Hashtags:** #Nanabung #CatatPengeluaran #CashflowIndonesia #HematBujet
- **User-Generated Content:** Encourage users share progress testimonials
- **Viral Challenges:** "30-day tracking challenge" dengan hashtag #NanabungChallenge

**4. Partnership Strategy**

- **University Collaborations:** Free premium untuk student organizations
- **Financial Advisors:** Partner dengan financial planner Indonesia
- **Startup Communities:** Sponsor startup events & workshops
- **Cross-Promotion dengan Anggarin:** Bundle deal, cross-sell opportunities

### Launch Phases

**Phase 1: Beta Launch (Month 1-3)**

- Target: 100 beta testers
- Recruitment: Personal networks, Reddit groups, Discord communities
- Goal: Validate product-market fit, collect feedback, iterate quickly
- Incentive: Lifetime free premium untuk beta testers

**Phase 2: Public Launch (Month 4-6)**

- Target: 1,000 users (90% free, 10% paid)
- Launch tactics: Product Hunt launch, TikTok campaigns, press release
- PR Strategy: Tech in Indonesia media coverage (DailySocial, etc.)
- Goal: Achieve product-market fit, refine onboarding funnel

**Phase 3: Growth Phase (Month 7-12)**

- Target: 5,000 users (85% free, 15% paid)
- Scale marketing: Paid ads (Facebook & Google Ads), influencer campaigns
- Feature expansion: Advanced analytics, multi-currency support
- Goal: Positive unit economics, sustainable growth

**Phase 4: Expansion (Year 2+)**

- Target: 50,000+ users
- New features: Investment tracking, debt management, AI financial advisor
- Market expansion: Malaysia & Singapore (English & Bahasa Melayu support)
- Goal: Series A fundraising, regional expansion

### Competitive Positioning

**Direct Competitors:**

- **Money Lover** - Rp 50k-150k/bulan, feature bloated, UX kompleks
- **Wallet Indonesia** - Rp 29k-79k/bulan, mobile-only, kurang AI features
- **Andromoney** - Rp 60k-120k/bulan, dated UI, manual categorization

**Nanabung Differentiators:**

1. **Simplicity** - Zero learning curve vs competitors yang kompleks
2. **AI-Powered** - Auto-categorization vs manual tagging
3. **Privacy-First** - BYOK AI option, nobody offers this
4. **Freemium with Unlimited** - No transaction limits vs competitors yang limit
5. **Speed** - Record in < 5 seconds vs 30+ seconds di competitors

## 📈 Roadmap

Lihat [roadmap.md](./roadmap.md) untuk detail 10-milestone perkembangan produk Nanabung.

**High-Level Milestones:**

- **M1 (2 weeks):** MVP - Core expense tracking & manual categorization
- **M2 (4 weeks):** Quick Input - Voice, OCR receipt, chatbot input
- **M3 (6 weeks):** AI Integration - Auto-categorization & forecasting
- **M4 (8 weeks):** Premium Features - Budget alerts, shared wallet, analytics
- **M5 (10 weeks):** Advanced AI - BYOK support, advanced forecasting
- **M6 (12 weeks):** Mobile Optimization - PWA, offline mode, native feel
- **M7 (14 weeks):** Social Features - Shared wallet enhancements, collaboration
- **M8 (16 weeks):** Integrations - Bank sync, e-wallet import (Midtrans, GoPay, OVO)
- **M9 (18 weeks):** Advanced Analytics - Spending insights, trends, recommendations
- **M10 (20 weeks):** Scale & Optimize - Performance optimization, caching, multi-region

## 🔄 Changelog

Lihat [changelog.md](./changelog.md) untuk riwayat perubahan Nanabung.

## 🐛 Known Issues

Lihat [known-issues.md](./known-issues.md) untuk daftar bug dan limitation yang diketahui.

## 🤝 Team & Roles

### Development Team

- **Tech Lead:** Najib (Backend Go & Architecture)
- **Frontend Developer:** [Nama] (SvelteKit UI/UX Implementation)
- **AI/ML Engineer:** [Nama] (OpenAI integration & categorization models)
- **DevOps Engineer:** [Nama] (Infrastructure & Deployment)

### External Stakeholders

- **Product Owner:** [Nama] (Business Requirements & GTM strategy)
- **UI/UX Designer:** [Nama] (Design System & User Experience)
- **QA Engineer:** [Nama] (Testing & Quality Assurance)
- **Financial Advisor:** [Nama] (Domain expertise & financial literacy content)

## 🆘 Support & Troubleshooting

### Common Issues

1. **Database connection failed**
   - Solution: Check .env database configuration, ensure PostgreSQL service is running
   - Command: `sudo systemctl status postgresql`

2. **Go modules dependency conflicts**
   - Solution: Run `go mod tidy` dan `go mod download`
   - Clear cache: `go clean -modcache`

3. **SvelteKit build failed**
   - Solution: Clear node_modules, run `npm install` dan `npm run build`
   - Check Node.js version: `node --version` (require 20+)

4. **OpenAI API rate limit exceeded**
   - Solution: Implement rate limiting di backend, atau switch ke BYOK mode
   - Monitor usage: Check OpenAI dashboard untuk usage stats

5. **OCR receipt scanning not working**
   - Solution: Ensure image quality baik (minimal 720p resolution)
   - Backup: Manual input sebagai fallback

### Getting Help

- **Slack Channel:** #nanabung-development
- **Emergency Contact:** [contact info]
- **Documentation:** [link ke troubleshooting guide]
- **User Support:** support@nanabung.com

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
- **Financial Tips Blog:** [link ke blog content]

## 🔗 Cross-Sell dengan Anggarin

### Strategic Positioning

**Nanabung vs Anggarin:**

- **Nanabung** - Daily expense tracking, cashflow forecasting, simplicity first
- **Anggarin** - Long-term financial planning, investment tracking, goal-based savings

### Cross-Sell Strategy

**Nanabung → Anggarin:**

- Users yang actively tracking daily expenses akan natural need long-term planning
- In-app recommendation: "Sudah catat harian, sekarang waktunya rencana masa depan"
- Exclusive offer: 50% discount first month Anggarin untuk Nanabung users
- Target: 10-15% Nanabung users convert ke Anggarin

**Anggarin → Nanabung:**

- Users yang goal-oriented butuh tracking aktual untuk monitor progress
- Onboarding: "Connect Nanabung untuk auto-sync daily expenses ke Anggarin goals"
- Bundle pricing: Get both Nanabung + Anggarin untuk Rp 99k/bulan (vs Rp 128k separately)

### Integration Opportunities

- **Unified Dashboard** - Single login untuk kedua apps
- **Data Sync** - Nanabung transactions auto-import ke Anggarin budgets
- **Smart Insights** - Combine daily data (Nanabung) + long-term goals (Anggarin)
- **Shared Subscription** - Single payment untuk kedua apps

---

**Last Updated:** 2026-01-06
**Version:** 0.1.0-alpha (Pre-MVP)
**Maintainer:** Najib Zain (Lead Developer)

**MVP Timeline:**
- **M1-M4 (8 weeks):** Core MVP - Expense tracking, quick input, basic AI
- **M5-M7 (14 weeks):** Premium MVP - Advanced AI, budgeting, shared wallet
- **M8-M10 (20 weeks):** Scale & Optimize - Integrations, analytics, optimization

**Next Steps:**
1. Finalize product requirements & user stories
2. Set up development environment & CI/CD pipeline
3. Design database schema & API architecture
4. Build MVP features (M1-M4)
5. Beta testing dengan 100 users
6. Public launch & marketing execution
7. Iterate based pada user feedback & metrics
