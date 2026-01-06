# 💬 Katauser

> Bantu Dengar Suara Penggunamu - Feedback Management Platform untuk SaaS Indonesia

## 🏷️ Product Identity

- **Nama Produk:** Katauser
- **Status:** 🧪 Validation Phase (Pre-Build Validation)
- **Repo Code:** `github.com/akordium/katauser` (Not created yet)
- **Live Site:** https://katauser.com (Planned)
- **Staging:** https://staging.katauser.com (Planned)
- **Project Management:** [Link ke GitHub Project Board]

## 📋 Quick Overview

**Tagline:** Bantu Dengar Suara Penggunamu

**Deskripsi Singkat:** Platform manajemen feedback untuk produk dan merk yang membantu SaaS Indonesia, startup, dan digital agency mengumpulkan, mengelola, dan memprioritaskan masukan dari pengguna dengan harga yang terjangkau. Alternatif UserJot yang lebih hemat dan disesuaikan untuk pasar Indonesia.

**Target Market:**

- **SaaS Companies Indonesia** (Series A ke bawah) yang membutuhkan sistem feedback terstruktur
- **Digital Agencies** yang mengelola feedback untuk klien multiple
- **Startups Indonesia** yang ingin validasi ide dan fitur dengan user base
- **E-commerce Sellers** (Tokopedia, Shopee, TikTok Shop) yang need product feedback

**Problem yang Diselesaikan:** Tools seperti UserJot dan Canny terlalu mahal ($15-79/bulan atau sekitar Rp 240rb - 1.2 juta/bulan) untuk startup Indonesia. Banyak perusahaan mengelola feedback manual via email, WhatsApp, atau spreadsheet yang tidak efisien dan sulit dilacak.

## 🛠 Tech Stack

### Backend

- **Framework/Language:** Go (Golang) 1.21+ - API Only
- **Database:** PostgreSQL 15
- **API:** RESTful API dengan JWT authentication
- **Web Framework:** Gin

### Frontend

- **Framework:** Tanstack Start (React-based SSR framework)
- **Styling:** Tailwind CSS
- **State Management:** Tanstack Query (React Query)
- **Type Safety:** TypeScript 5.2+ (strict mode)

### Infrastructure

- **Hosting:** Oracle Cloud Infrastructure - VM.Standard.A1.Flex
- **Deployment:** Coolify (PaaS)
- **CDN:** Cloudflare
- **Monitoring:** Sentry + Custom Dashboard

### Third-party Services

- **Payment:** Midtrans (GoPay, OVO, Dana, Bank Transfer, Credit Card)
- **Email:** SendGrid (planned)
- **Storage:** Cloudflare R2 (planned)
- **Analytics:** Google Analytics 4

## 💻 Local Development Setup

### Prerequisites

- [ ] Go 1.21+
- [ ] PostgreSQL 15
- [ ] Node.js 18+
- [ ] npm/yarn/pnpm

### Installation Steps

1. **Clone repository**

   ```bash
   git clone https://github.com/akordium/katauser.git
   cd katauser
   ```

2. **Backend Setup**

   ```bash
   cd backend
   go mod download
   cp .env.example .env
   # Edit .env file dengan konfigurasi lokal
   go run cmd/api/main.go
   ```

3. **Frontend Setup**

   ```bash
   cd frontend
   npm install
   cp .env.example .env.local
   npm run dev
   ```

4. **Environment Configuration**

   ```bash
   # Backend .env
   DB_HOST=127.0.0.1
   DB_PORT=5432
   DB_DATABASE=katauser_dev
   DB_USERNAME=postgres
   DB_PASSWORD=password
   JWT_SECRET=your-secret-key

   # Frontend .env.local
   VITE_API_URL=http://localhost:8080
   ```

5. **Start Development Servers**

   ```bash
   # Terminal 1: Backend
   cd backend && go run cmd/api/main.go

   # Terminal 2: Frontend
   cd frontend && npm run dev
   ```

6. **Aplikasi berjalan di:**
   - Frontend: http://localhost:3000
   - Backend API: http://localhost:8080

### Development Commands

```bash
# Backend Testing
cd backend && go test ./...

# Frontend Testing
npm run test

# Linting (Frontend)
npm run lint

# Backend Build
go build -o bin/api cmd/api/main.go

# Frontend Build
npm run build
```

## 🧪 Testing

### Test Suite

- **Framework:** Go testing + Vitest (TypeScript)
- **Coverage Target:** 80% (MVP), 90% (Production)
- **Test Types:**
  - Unit Tests: Services, repositories, utilities
  - Integration Tests: API endpoints
  - E2E Tests: Critical user journeys dengan Playwright

### Running Tests

```bash
# Backend Tests
go test ./... -cover

# Frontend Tests
npm run test

# E2E Tests
npm run test:e2e
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

2. **Manual Deployment** (jika perlu)

   ```bash
   # Frontend
   npm run build
   npm run deploy

   # Backend
   go build -o bin/api cmd/api/main.go
   ./bin/api
   ```

### Environment Variables

**Required Backend Variables:**

- `DB_HOST`, `DB_PORT`, `DB_DATABASE`, `DB_USERNAME`, `DB_PASSWORD`
- `JWT_SECRET`, `MIDTRANS_SERVER_KEY`

**Required Frontend Variables:**

- `VITE_API_URL`, `VITE_MIDTRANS_CLIENT_KEY`

**Secret Management:** Semua secrets stored di environment variables, tidak ada hardcoded secrets.

## 📊 Key Metrics & Monitoring

### Business Metrics

- [ ] **Active Users:** Target 5,000+ signups di year 1
- [ ] **Paying Customers:** Target 50 customers di year 1
- [ ] **Boards Created:** Target 500+ boards di year 1
- [ ] **Feedbacks Collected:** Target 50,000+ feedbacks di year 1
- [ ] **User Engagement:** DAU/MAU ratio > 20%

### Product-Market Fit Metrics ⭐

**Current Status:** Pre-Validation Phase

- [ ] **Sean Ellis Test Score:** Target > 40% (Month 3 & 6)
  - Question: "How would you feel if Katauser disappeared tomorrow?"
  - Very disappointed / Somewhat disappointed / Not disappointed
- [ ] **Pre-Validation Waitlist:** Target 50+ signups (Week 1-2)
- [ ] **Beta User PMF:** Target 5/10 say "I would pay" (Month 3)
- [ ] **Net Promoter Score (NPS):** Target > 40
- [ ] **Week 1 Retention:** Target > 40%
- [ ] **Week 4 Retention:** Target > 30%
- [ ] **Week 12 Retention:** Target > 20%
- [ ] **Free → Paid Conversion:** Target 10% (industry average)

**Go/No-Go Gates:**
- **Month 3:** Sean Ellis > 40% → Proceed to public launch
- **Month 6:** 25 paying customers + Sean Ellis > 40% → Scale features

### Technical Metrics

- [ ] **Response Time:** < 300ms average API response
- [ ] **Uptime:** 99.9% uptime SLA
- [ ] **Error Rate:** < 0.5% error rate
- [ ] **Page Load Speed:** < 3 seconds LCP (3G connection)
- [ **Mobile Performance:** 85+ Lighthouse score

### Monitoring Setup

- **Error Tracking:** Sentry dengan performance monitoring
- **Analytics:** Google Analytics 4
- **Uptime Monitoring:** Cloudflare + custom health checks
- **Business Metrics:** Custom dashboard dengan feedback KPIs

## 🔐 Security

### Security Measures

- [ ] **Authentication:** JWT tokens dengan 7-day expiration
- [ ] **Authorization:** Role-based access (Free vs Premium users)
- [ ] **API Security:** Rate limiting (100 req/min), CORS, input validation
- [ ] **Password Hashing:** bcrypt dengan cost factor 12
- [ ] **HTTPS:** TLS 1.3 via Cloudflare

### Security Checklist

- [x] HTTPS enabled via Cloudflare SSL
- [x] Environment variables secured
- [x] Database connections encrypted
- [x] User passwords hashed dengan bcrypt
- [x] API rate limiting implemented
- [x] CORS properly configured
- [ ] Input validation untuk semua API endpoints
- [ ] SQL injection prevention dengan parameterized queries

## 📚 Documentation

### Internal Documentation

- **Product Specs:** [product-spec.md](./product-spec.md) - Fitur dan monetisasi
- **User Stories:** [user-stories.md](./user-stories.md) - Personas dan requirements
- **Technical Architecture:** [tech-stack.md](./tech-stack.md) - Tech stack details
- **Roadmap:** [roadmap.md](./roadmap.md) - Development milestones

### User Documentation

- **User Guide:** (Coming soon)
- **FAQ:** (Coming soon)
- **Video Tutorials:** (Coming soon)

## 🤝 Team & Roles

### Development Team

- **Tech Lead:** Najib (Backend Architecture & API Design)
- **Frontend Developer:** (To be hired)
- **Backend Developer:** (To be hired)
- **DevOps Engineer:** (To be determined)

### External Stakeholders

- **Product Owner:** Najib (Product Strategy & User Experience)
- **UI/UX Designer:** (To be hired)
- **QA Engineer:** (To be determined)

## 🆘 Support & Troubleshooting

### Common Issues

1. **Backend API connection failed**
   - Solution: Check API URL di frontend .env.local, ensure backend running

2. **JWT Token expired**
   - Solution: Re-login, token valid untuk 7 days

3. **Database migration failed**
   - Solution: Check PostgreSQL connection, ensure database exists

4. **Feedback submission failed**
   - Solution: Check board visibility settings, ensure board is public

### Getting Help

- **Email:** support@katauser.com
- **GitHub Issues:** https://github.com/akordium/katauser/issues
- **Documentation:** [link ke troubleshooting guide]

## 📈 Roadmap

Lihat [roadmap.md](./roadmap.md) untuk detail perkembangan produk Katauser.

## 🔄 Changelog

Lihat [changelog.md](./changelog.md) untuk riwayat perubahan Katauser.

## 🐛 Known Issues

Lihat [known-issues.md](./known-issues.md) untuk daftar bug dan limitation yang diketahui.

## 🎯 Business Model

### Freemium Model

**Free Features:**

- 3 boards maximum
- 1,000 users/feedbacks combined
- Public boards only
- Basic branding (Katauser logo shown)
- Feedback submission & voting
- Roadmap synchronization
- Changelog generator

**Premium Features (IDR 299,000/bulan):**

- Unlimited boards
- Unlimited users and feedbacks
- Private boards (password-protected)
- Custom domain (e.g., feedback.yourcompany.com)
- Custom branding (remove Katauser logo, custom colors)
- Telegram Bot integration (coming in v2.0)
- WhatsApp notifications (coming in v2.0)
- Priority email support

**Annual Discount:**
- 2 months free if paid annually (Rp 2,990,000/year)

### Target Revenue Streams

- **Subscription Revenue:** 100% dari total revenue
- **Year 1 Goal:** 50 paying customers × Rp 299,000 = Rp 14,950,000/month MRR

### Competitive Advantage

vs UserJot ($15-79/month ≈ Rp 240rb - 1.2 juta):
- **Price:** 50-80% lebih murah (Rp 299k vs Rp 1.2 juta)
- **Localization:** Full Bahasa Indonesia support
- **Integrations:** Telegram Bot (Indonesian tech communities' favorite)
- **Market Focus:** Designed specifically for Indonesian SaaS ecosystem

---

**Last Updated:** 2026-01-06
**Version:** 0.2.0-validation
**Status:** 🧪 Validation Phase - Pre-build market validation
**Maintainer:** Najib - Akordium Lab
