# 💍 Sesarra

> All-in-One Wedding Planning Platform & Memory Preservation for Forever

## 🏷️ Product Identity

- **Nama Produk:** Sesarra
- **Status:** 📋 Planning Phase
- **Repo Code:** `github.com/akordium/sesarra` (Private)
- **Live Site:** https://sesarra.com
- **Staging:** https://staging.sesarra.com
- **Project Management:** [Link ke GitHub Project Board]

## 📋 Quick Overview

**Tagline:** Your Wedding Journey from Proposal to Forever Memories

**Deskripsi Singkat:** Platform all-in-one untuk perencanaan pernikahan mulai dari lamaran, akad nikah, resepsi, hingga penyimpanan foto dan video kenangan selamanya dengan unlimited cloud storage. Sesarra menggabungkan planning tools dengan emotional value memory preservation untuk pasangan pengantin Indonesia.

**Target Market:**

- **Primary:** Calon pengantin usia 22-35 tahun di kota-kota besar Indonesia (Jakarta, Surabaya, Bandung, Medan, dll.)
- **Secondary:** Wedding planner dan organizer (B2B2C model)
- **Tertiary:** Venue pernikahan dan vendor (integrated marketplace)
- **Quaternary:** Pasangan married yang ingin preserve wedding memories (anniversary market)

**5 Fitur Utama:**

1. **Wedding Timeline & Checklist** - Comprehensive planning dari lamaran hingga resepsi dengan auto-reminders
2. **Budget Planner & Vendor Management** - Track expenses, compare vendor prices, direct booking
3. **Guest Management** - RSVP tracking, seating arrangement, dietary requirements, gift registry
4. **Unlimited Cloud Storage** - Foto & video pernikahan selamanya dengan auto-album creation
5. **Memory Timeline** - Anniversary reminders, throwback memories, interactive wedding story

**Fitur Tambahan (Post-MVP):**

- **Collaborative Planning** - Share access dengan fiance, family, wedding planner
- **Vendor Reviews & Ratings** - Community feedback untuk vendor quality assurance
- **Real-time Chat** - Integrated communication dengan vendor dan guests
- **Wedding Website** - Custom wedding page dengan RSVP form dan live updates

**Problem yang Diselesaikan:**
- Fragmented wedding planning (Excel, WhatsApp, notes, multiple apps) - tidak terintegrasi
- Overwhelming vendor selection process - sulit compare prices dan quality
- Guest management chaos - manual RSVP tracking, seating arrangement nightmare
- Photo storage scattered across multiple platforms - tidak ada central memory hub
- Post-wedding memories fade away - no systematic memory preservation

## 🛠 Tech Stack

### Backend

- **Framework/Language:** Go 1.21+
- **Database:** PostgreSQL 15
- **API:** RESTful API dengan standard OpenAPI 3.0

### Frontend

- **Framework:** Tanstack Start (React Server Components)
- **Styling:** Tailwind CSS 3
- **State Management:** Tanstack Query (React Query)
- **Form Handling:** React Hook Form + Zod validation
- **UI Components:** Shadcn/ui (customized for wedding theme)

### Infrastructure

- **Hosting:** Oracle Cloud Infrastructure
- **Deployment:** Coolify
- **CDN:** Cloudflare
- **Monitoring:** Custom Dashboard + Error Tracking

### Third-party Services

- **Payment Gateways:**
  - **Midtrans** - Subscription payments (GoPay, OVO, DANA, Credit Cards)
  - **QRIS** - Instant payment untuk vendor bookings
- **Cloud Storage:**
  - **Cloudflare R2** - Primary storage untuk photos & videos (unlimited, cost-effective)
  - **Cloudflare Images** - Image optimization & CDN delivery
- **Email & Notifications:**
  - **SendGrid** - Transactional emails (RSVP reminders, anniversary alerts)
  - **WhatsApp Business API** - SMS notifications untuk critical updates
- **Analytics:** Google Analytics 4 + Custom analytics dashboard
- **Maps:** Google Maps API untuk vendor location

## 💻 Local Development Setup

### Prerequisites

- [ ] Go 1.21+
- [ ] PostgreSQL 15
- [ ] Node.js 20+ (untuk build frontend)
- [ ] Docker & Docker Compose (optional)

### Installation Steps

1. **Clone repository**

   ```bash
   git clone https://github.com/akordium/sesarra.git
   cd sesarra
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
   createdb sesarra_dev

   # Run migrations
   go run cmd/migrate/main.go up

   # Seed data
   go run cmd/seed/main.go
   ```

6. **Build frontend assets**

   ```bash
   cd frontend
   npm run build
   cd ..
   ```

7. **Start development server**

   ```bash
   # Terminal 1: Backend
   go run cmd/api/main.go

   # Terminal 2: Frontend dev server
   cd frontend
   npm run dev
   ```

8. **Aplikasi berjalan di:** http://localhost:3000

### Development Commands

```bash
# Backend testing
go test ./...

# Backend linting
golangci-lint run

# Generate mocks
go generate ./...

# Database migrations
go run cmd/migrate/main.go up
go run cmd/migrate/main.go down
go run cmd/migrate/main.go status

# Frontend testing
cd frontend
npm test

# Frontend linting
npm run lint

# Frontend type checking
npm run type-check
```

## 🧪 Testing

### Test Suite

- **Backend:**
  - Framework: Go testing + testify
  - Coverage Target: 80%
  - Test Types: Unit tests, Integration tests
- **Frontend:**
  - Framework: Vitest + React Testing Library
  - Coverage Target: 75%
  - Test Types: Component tests, E2E tests dengan Playwright

### Running Tests

```bash
# Backend tests
go test ./...
go test -v ./internal/service/
go test -cover ./...

# Frontend tests
cd frontend
npm test
npm run test:e2e

# Run tests dengan coverage
npm run test:coverage
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
   # Backend deployment
   docker build -t sesarra-api:latest .
   docker push sesarra-api:latest

   # Frontend deployment
   cd frontend
   npm run build
   ```

3. **Database migrations**

   ```bash
   # Run migrations di production
   go run cmd/migrate/main.go up
   ```

### Environment Variables

**Required variables:**

- `DB_HOST` - Database host
- `DB_PORT` - Database port
- `DB_NAME` - Database name
- `DB_USER` - Database username
- `DB_PASSWORD` - Database password
- `MIDTRANS_SERVER_KEY` - Midtrans server key
- `SENDGRID_API_KEY` - SendGrid API key
- `CLOUDFLARE_R2_ACCESS_KEY` - R2 access key
- `CLOUDFLARE_R2_SECRET_KEY` - R2 secret key
- `JWT_SECRET` - JWT signing secret

**Optional variables:**

- `REDIS_HOST` - Redis host untuk caching
- `REDIS_PORT` - Redis port
- `SENTRY_DSN` - Sentry error tracking DSN
- `ENVIRONMENT` - Environment (development/staging/production)

**Secret management:** Semua secrets disimpan di environment variables, tidak ada hardcoded secrets.

## 📊 Key Metrics & Monitoring

### Business Metrics

- [ ] **Active Couples:** Target 1,000+ active wedding accounts (Year 1)
- [ ] **Vendor Signups:** Target 500+ registered vendors (Year 1)
- [ ] **Premium Subscriptions:** Target 15-20% conversion rate
- [ ] **Photos Stored:** Target 10M+ photos uploaded (Year 1)
- [ ] **User Engagement:** 70% monthly active users
- [ ] **RSVP Response Rate:** Average 85%+ response rate
- [ ] **Budget Tracking:** Average Rp 100-500M managed per wedding

### Technical Metrics

- [ ] **Response Time:** < 300ms average
- [ ] **Uptime:** 99.9% uptime
- [ ] **Error Rate:** < 0.5% error rate
- [ ] **Image Upload Speed:** < 5 seconds per 10MB photo
- [ ] **Video Upload Speed:** < 30 seconds per 100MB video

### Monitoring Setup

- **Error Tracking:** Sentry untuk error monitoring
- **Performance Monitoring:** Custom dashboard dengan response time tracking
- **Uptime Monitoring:** Cloudflare monitoring + custom health checks
- **Business Metrics:** Custom analytics dashboard dengan Metabase
- **User Behavior:** Google Analytics 4 + custom event tracking

## 🔐 Security

### Security Measures

- [ ] **Authentication:** JWT-based authentication dengan refresh token rotation
- [ ] **Authorization:** Role-based access control (Couple, Vendor, Admin)
- [ ] **Data Encryption:** Encrypted storage untuk sensitive data (payment info, personal details)
- [ ] **API Security:** Rate limiting, CORS proper configuration, API key management
- [ ] **Input Validation:** Zod validation schema untuk semua inputs
- [ ] **File Upload:** Virus scanning, type validation, size limits
- [ ] **Privacy Settings:** Granular privacy controls untuk shared albums

### Security Checklist

- [x] HTTPS enabled (Cloudflare SSL)
- [x] Environment variables secured
- [x] Database connections encrypted
- [x] User passwords hashed (bcrypt with cost factor 12)
- [x] API rate limiting implemented (100 req/min per user)
- [x] CORS properly configured
- [x] CSRF protection for all forms
- [ ] Two-factor authentication (2FA) for admin accounts
- [ ] Content Security Policy (CSP) headers configured

## 📚 Documentation

### Internal Documentation

- **Technical Specs:** [link ke technical documentation]
- **API Documentation:** [link ke OpenAPI/Swagger docs]
- **Database Schema:** [link ke database docs]
- **Deployment Guide:** [link ke deployment guide]
- **Wedding Planning Best Practices:** [link ke domain knowledge]

### User Documentation

- **User Guide:** [link ke user guide]
- **Vendor Onboarding Guide:** [link ke vendor documentation]
- **FAQ:** [link ke FAQ]
- **Video Tutorials:** [link ke video tutorials]
- **Wedding Checklist Templates:** [link ke downloadable resources]

## 🤝 Team & Roles

### Development Team

- **Tech Lead:** Najib (Backend & Architecture)
- **Frontend Developer:** [Nama] (UI/UX Implementation)
- **DevOps Engineer:** [Nama] (Infrastructure & Deployment)
- **Mobile Developer:** [Nama] (Future mobile app development)

### External Stakeholders

- **Product Owner:** [Nama] (Business Requirements)
- **UI/UX Designer:** [Nama] (Design System & User Experience)
- **QA Engineer:** [Nama] (Testing & Quality)
- **Wedding Consultant:** [Nama] (Domain expertise & industry insights)
- **Photographer/Vendor Liaison:** [Nama] (Vendor relationships)

## 🆘 Support & Troubleshooting

### Common Issues

1. **Photo upload failed**
   - Solution: Check file size (max 50MB per photo), verify internet connection, ensure R2 credentials valid

2. **Vendor booking not confirmed**
   - Solution: Check Midtrans payment status, verify webhook configuration, contact vendor directly

3. **RSVP form not loading**
   - Solution: Clear browser cache, check JavaScript console for errors, verify wedding website URL

4. **Budget calculations incorrect**
   - Solution: Refresh page, clear local storage, contact support if persists

### Getting Help

- **Slack Channel:** #sesarra-development
- **Emergency Contact:** [contact info]
- **Documentation:** [link ke troubleshooting guide]
- **Vendor Support:** vendor@sesarra.com
- **User Support:** support@sesarra.com

## 📈 Roadmap

Lihat [roadmap.md](./roadmap.md) untuk detail perkembangan produk Sesarra.

## 🔄 Changelog

Lihat [changelog.md](./changelog.md) untuk riwayat perubahan Sesarra.

## 🐛 Known Issues

Lihat [known-issues.md](./known-issues.md) untuk daftar bug dan limitation yang diketahui.

## 💡 Competitive Positioning

### Market Differentiators

**Sesarra vs Guestron:**
- **Guestron:** Event-specific platform (focus pada single event management)
- **Sesarra:** End-to-end lifecycle platform (proposal → wedding → forever memories)
- **Positioning:** Sesarra lebih premium dengan emotional value memory preservation

**Sesarra vs Wedding Planners (Manual):**
- **Traditional:** Pen wedding planner, expensive (Rp 10-50M), limited tools
- **Sesarra:** Affordable digital platform (Rp 199k-499k), comprehensive tools, unlimited storage

**Sesarra vs Fragmented Apps:**
- **Competitors:** Spreadsheet, WhatsApp, Canva, Google Photos (separate tools)
- **Sesarra:** All-in-one integrated platform dengan seamless vendor marketplace

### Unique Selling Points

1. **Memory Preservation Forever:** "Forever" cloud storage - photos stay safe for lifetime
2. **Emotional Connection:** Anniversary reminders, throwback memories create emotional bond
3. **Vendor Marketplace:** Direct booking, transparent pricing, verified reviews
4. **Collaborative Planning:** Share dengan fiance, family, wedding planner in real-time
5. **Budget Conscious:** Track expenses, compare vendor prices, avoid overspending

---

**Last Updated:** 2026-01-06
**Version:** 0.1.0-planning
**Maintainer:** Najib Zain (Lead Developer)

**Development Timeline:**
- **Phase 1 (M1-M3):** Foundation & Core Planning Features
- **Phase 2 (M4-M6):** Vendor Marketplace & Booking System
- **Phase 3 (M7-M9):** Cloud Storage & Memory Features
- **Phase 4 (M10):** Premium Features & Launch

## 💰 Pricing & Licensing

### Freemium Model

**Basic Tier (Free - Limited):**
- **Price:** Rp 0 (gratis)
- **Limits:** 50 photos max, basic planning tools, 1 wedding event
- **Features:**
  - Wedding checklist template
  - Basic budget planner
  - Guest list management (max 100 guests)
  - 50 photo storage limit
- **Purpose:** Try before buy, simple wedding planning
- **Support:** Email only (48-hour response)

**Standard Tier (Rp 199,000 - One-time):**
- **Price:** Rp 199,000 (one-time payment, valid for 1 wedding event)
- **Storage:** 1,000 photos atau 10GB total storage
- **Features:**
  - Semua Basic features
  - Unlimited checklist items
  - Advanced budget tracker dengan expense categories
  - Unlimited guest management
  - Vendor directory access (view only)
  - RSVP tracking dengan automated reminders
  - Basic seating arrangement tool
  - Wedding website (sesarra.com/w/yourname)
  - 1-year photo storage
- **Support:** Priority email (24-hour response)

**Premium Tier (Rp 499,000 - Annual):**
- **Price:** Rp 499,000/tahun (atau Rp 249,000 one-time untuk 6-month access)
- **Storage:** Unlimited photos & videos selamanya
- **Features:**
  - Semua Standard features
  - Unlimited cloud storage selamanya (lifetime access)
  - Vendor booking integration (direct booking via Midtrans)
  - Advanced seating arrangement dengan drag-and-drop
  - Collaborative planning (share access dengan 5 users)
  - Memory timeline dengan anniversary reminders
  - Interactive wedding story (auto-generated from photos)
  - Priority vendor support
  - Custom domain untuk wedding website
  - Video upload support (max 50GB video storage)
  - Priority support (WhatsApp + Email, 12-hour response)
- **Bonus:** Anniversary reminder selamanya (setiap tahun di wedding date)

**Vendor Tier (B2B - Rp 999,000/tahun):**
- **Price:** Rp 999,000/tahun untuk vendor
- **Features:**
  - Verified vendor profile di marketplace
  - Direct booking integration
  - Analytics dashboard (views, bookings, revenue)
  - Customer reviews & ratings
  - Promotion tools (featured listings, discounts)
  - CRM integration
  - Calendar management
- **Commission:** 5-10% per booking via Sesarra

### Volume Discounts

**Wedding Planner/Organizer Referral Program:**
- 10% commission untuk setiap couple yang subscribe via referral link
- Bulk pricing untuk wedding planners (10+ couples = 20% discount)

**Corporate/Enterprise:**
- Custom pricing untuk venue pernikahan, hotel chains
- White-label solution untuk brand partnerships

📖 **Detailed Pricing:** [pricing-model.md](./pricing-model.md) untuk complete pricing breakdown

## 🎯 Revenue Model

### Revenue Streams

1. **Subscription Revenue:**
   - Standard Tier (Rp 199k one-time)
   - Premium Tier (Rp 499k/tahun)
   - Target: 70% Standard, 30% Premium mix

2. **Vendor Commission:**
   - 5-10% commission per vendor booking
   - Estimated transaction value: Rp 5-20M per wedding
   - Average commission: Rp 500k-2M per wedding

3. **Vendor Subscription:**
   - B2B vendor tier: Rp 999k/tahun
   - Target: 500+ vendors in Year 1

4. **Add-on Services (Future):**
   - Custom wedding website design (Rp 500k-2M)
   - Professional photo curation service (Rp 200k-500k)
   - Video editing service (Rp 1M-5M)

### Unit Economics (Year 1 Target)

- **CAC (Customer Acquisition Cost):** Rp 150k per couple
- **LTV (Lifetime Value):** Rp 350k per couple (average)
- **LTV:CAC Ratio:** 2.3:1 (healthy)
- **Payback Period:** 6 months
- **Gross Margin:** 75% (low variable costs, high fixed costs for storage)

### Break-even Analysis

- **Fixed Costs (Monthly):** Rp 25M (server, team, marketing)
- **Variable Costs (Per User):** Rp 50k (storage, payment processing)
- **Break-even Point:** ~1,000 paid users per month

---

**Last Updated:** 2026-01-06
**Version:** 0.1.0-planning
**Maintainer:** Najib Zain (Lead Developer)
