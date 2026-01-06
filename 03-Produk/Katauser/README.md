# 💬 Katauser

> Platform Manajemen Feedback - Kelola Feedback User dengan Efisien & Berbahasa Indonesia

## 🏷️ Product Identity

- **Nama Produk:** Katauser
- **Status:** 🥚 Concept / Validasi
- **Repo Code:** `github.com/akordium/katauser` (Pending)
- **Live Site:** https://katauser.com (Pending)
- **Staging:** https://staging.katauser.com (Pending)
- **Project Management:** Beads Issue `hq-qi6`

## 📋 Quick Overview

**Tagline:** Platform Manajemen Feedback dengan Bahasa Indonesia & Integrasi Telegram

**Deskripsi Singkat:** Platform manajemen feedback yang memungkinkan SaaS companies dan digital startups mengumpulkan, mengorganisir, dan memprioritaskan feedback dari pengguna dengan fitur public board, voting system, dan roadmap otomatis. Dibuat khusus untuk pasar Indonesia dengan integrasi Telegram Bot dan UI/UX berbahasa Indonesia.

**Target Market:**

- SaaS companies Indonesia (early to growth stage)
- Digital agencies dengan banyak produk klien
- Startups yang membutuhkan feedback management system
- Product managers dan founders startup Indonesia

**Problem yang Diselesaikan:** Difficulty dalam mengelola feedback dari berbagai channel (email, WhatsApp, social media) menjadi satu sistem terpusat. Tools internasional seperti UserJot/Canny mahal dan tidak mendukung Bahasa Indonesia. Spreadsheet dan manual tracking tidak scalable dan tidak transparan ke users.

## 🎯 MVP Features (Fase 1)

### Core Features

1. **Public Feedback Board dengan Voting System**
   - Board publik untuk collect feedback dari users
   - Upvote/downvote system untuk prioritization
   - Comment dan discussion threads
   - Status tracking (requested, planned, in progress, completed)

2. **Roadmap Otomatis**
   - Roadmap publik yang sync dengan feedback status
   - Auto-update ketika feedback status berubah
   - Visual timeline untuk upcoming features
   - Filter berdasarkan category/tags

### Competitive Edge (MVP Only)

1. **Full Bahasa Indonesia Localization**
   - Seluruh UI/UX dalam Bahasa Indonesia
   - Bukan sekadar Google Translate, tapi natural Indonesian phrasing
   - Contextual help dan documentation dalam Bahasa Indonesia

2. **Telegram Bot Integration**
   - Users bisa submit feedback via Telegram bot
   - Notifications untuk update status via Telegram
   - Channel/Group integration untuk public feedback boards
   - Telegram sebagai favorite communication channel komunitas Indo

3. **Competitive Pricing**
   - Target: 30-40% lebih murah dari UserJot ($29 → $19-21)
   - Freemium model dengan generous free tier
   - Pricing dalam IDR untuk market Indonesia

## 🛠️ Tech Stack

### Backend

- **Framework/Language:** Go 1.21+ (Golang)
- **Database:** PostgreSQL 15
- **API:** RESTful API
- **ORM:** GORM atau sqlx (TBD)

### Frontend

- **Framework:** Tanstack Start (React-based SSR framework)
- **Language:** TypeScript (Strict mode)
- **Styling:** Tailwind CSS
- **State Management:** Tanstack Query (React Query)
- **Forms:** React Hook Form + Zod validation

### Infrastructure

- **Hosting:** Oracle Cloud Infrastructure
- **Deployment:** Coolify (PaaS)
- **CDN:** Cloudflare
- **Monitoring:** Sentry

### Third-party Services

- **Email:** SendGrid / Resend
- **Analytics:** Google Analytics 4 / Plausible
- **Telegram:** Telegram Bot API

## 💻 Local Development Setup

### Prerequisites

- [ ] Go 1.21+
- [ ] PostgreSQL 15
- [ ] Node.js 20+ (untuk Tanstack Start)
- [ ] pnpm/npm
- [ ] Docker & Docker Compose (optional)

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
   # Setup database connection di .env
   go run cmd/migrate/main.go
   go run cmd/seed/main.go
   ```

3. **Frontend Setup**

   ```bash
   cd frontend
   pnpm install
   cp .env.example .env.local
   # Setup API URL di .env.local
   ```

4. **Environment Configuration**

   ```bash
   # Backend .env
   DB_HOST=localhost
   DB_PORT=5432
   DB_DATABASE=katauser_dev
   DB_USER=postgres
   DB_PASSWORD=password
   JWT_SECRET=your-secret-key

   # Frontend .env.local
   VITE_API_URL=http://localhost:8080
   ```

5. **Start Development Servers**

   ```bash
   # Terminal 1: Backend
   cd backend && go run cmd/server/main.go

   # Terminal 2: Frontend
   cd frontend && pnpm dev
   ```

6. **Katauser berjalan di:**
   - Frontend: http://localhost:3000
   - Backend API: http://localhost:8080

## 🧪 Testing

### Test Suite

- **Framework:** Go testing (native) + Vitest (TypeScript)
- **Coverage Target:** 80%
- **Test Types:**
  - Unit Tests: API handlers, business logic, utilities
  - Integration Tests: API endpoints, database operations
  - E2E Tests: Critical user journeys dengan Playwright

### Running Tests

```bash
# Backend Tests
cd backend && go test ./...

# Frontend Tests
pnpm test

# E2E Tests
pnpm test:e2e
```

## 🚢 Deployment

### Environments

- **Development:** Local development dengan PostgreSQL
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
   pnpm build
   pnpm deploy

   # Backend
   go build -o main ./cmd/server
   ./main
   ```

## 📊 Key Metrics & Monitoring

### Business Metrics

- [ ] **Active Boards:** Target 100+ active feedback boards
- [ ] **Feedback Submitted:** Target 1,000+ feedback per month
- [ ] **User Engagement:** Average 10+ votes per feedback
- [ ] **Conversion Rate:** 5% free to paid conversion

### Technical Metrics

- [ ] **Response Time:** < 200ms average API response
- [ ] **Uptime:** 99.9% uptime SLA
- [ ] **Page Load Speed:** < 2 seconds LCP
- [ ] **Bot Response Time:** < 500ms Telegram bot response

### Monitoring Setup

- **Error Tracking:** Sentry dengan performance monitoring
- **Analytics:** Google Analytics 4 / Plausible (privacy-friendly)
- **Uptime Monitoring:** Cloudflare + custom health checks
- **Business Metrics:** Custom dashboard di admin panel

## 🔐 Security

### Security Measures

- [ ] **Authentication:** JWT tokens dengan refresh mechanism
- [ ] **Authorization:** Role-based access (Admin, Moderator, User)
- [ ] **Rate Limiting:** API rate limiting untuk prevent abuse
- [ ] **Input Validation:** Strict validation untuk semua inputs
- [ ] **XSS Protection:** Content Security Policy (CSP)
- [ ] **SQL Injection:** Parameterized queries via ORM

### Security Checklist

- [x] HTTPS enabled dengan Cloudflare SSL
- [ ] Environment variables secured
- [ ] Database connections encrypted
- [ ] User passwords hashed dengan bcrypt
- [ ] API rate limiting implemented
- [ ] Input validation untuk semua API endpoints

## 💰 Business Model

### Freemium Model

**Free Features:**

- 1 public feedback board
- Up to 50 feedback per month
- Basic voting system
- Public roadmap view
- Community support

**Premium Features (IDR 249,000/bulan atau IDR 2,490,000/tahun - 20% diskon):**

- Unlimited feedback boards (public & private)
- Unlimited feedback submissions
- Custom branding (white-label option)
- Telegram Bot integration
- Email forwarding & notifications
- Advanced analytics & insights
- Remove Katauser branding
- Priority support
- Custom domain (CNAME)
- Export data (CSV, JSON)
- SSO (Single Sign-On) untuk team
- API access

**Enterprise (Custom Pricing):**

- Everything in Premium
- Unlimited team members
- Advanced permissions & roles
- Custom integrations
- Dedicated account manager
- SLA guarantee
- On-premise/self-hosted option

### Revenue Streams

- **Subscription Revenue:** 85% dari total revenue (Freemium conversion)
- **Enterprise Plans:** 10% dari total revenue
- **White-Label Solutions:** 5% dari total revenue

## 🤝 Team & Roles

### Development Team

- **Tech Lead:** Najib (Go Architecture & API Design)
- **Frontend Developer:** TBD (Tanstack Start & User Experience)
- **Backend Developer:** Najib (Go API & Database)
- **DevOps Engineer:** Najib (Infrastructure & Deployment via Coolify)

### External Stakeholders

- **Product Owner:** Najib (Product Strategy & User Experience)
- **UI/UX Designer:** TBD (Design System & User Interface)
- **QA Engineer:** TBD (Testing & Quality Assurance)
- **Marketing:** TBD (Go-to-market strategy & community building)

## 📚 Documentation

### Internal Documentation

- **Technical Specs:** [tech-stack.md](./tech-stack.md)
- **User Stories:** [user-stories.md](./user-stories.md)
- **Competitor Analysis:** [competitor-analysis.md](./competitor-analysis.md)
- **Roadmap:** [roadmap.md](./roadmap.md)

### User Documentation

- **User Guide:** TBD
- **FAQ:** TBD
- **Video Tutorials:** TBD (Bahasa Indonesia)
- **Telegram Bot Guide:** TBD

## 🆘 Support & Troubleshooting

### Common Issues

1. **Telegram bot tidak merespon**
   - Solution: Check bot token, verify webhook URL, check rate limits

2. **Feedback tidak muncul di board**
   - Solution: Check moderation settings, verify spam filters, refresh board

3. **Roadmap tidak sync**
   - Solution: Check feedback status, manual sync available di admin panel

### Getting Help

- **Email:** support@katauser.com
- **Telegram:** @katauser_support
- **Documentation:** [link ke help center]
- **Status Page:** https://status.katauser.com

## 📈 Roadmap

Lihat [roadmap.md](./roadmap.md) untuk detail perkembangan produk Katauser.

## 🔄 Changelog

Lihat [changelog.md](./changelog.md) untuk riwayat perubahan Katauser.

## 🐛 Known Issues

Lihat [known-issues.md](./known-issues.md) untuk daftar bug dan limitation yang diketahui.

---

**Last Updated:** 2026-01-06
**Version:** 0.1.0-concept
**Maintainer:** Katauser Development Team
**License:** Proprietary - All Rights Reserved
