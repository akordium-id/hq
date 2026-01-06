# 💒 Guestron

> Platform Buku Tamu Digital untuk Pernikahan & Acara Spesial dengan Template Kustomisasi

## 🏷️ Product Identity

- **Nama Produk:** Guestron
- **Status:** 🚧 In Development
- **Repo Code:** `github.com/akordium/guestron` (Private)
- **Live Site:** https://guestron.id
- **Staging:** https://staging.guestron.id
- **Project Management:** [Link ke GitHub Project Board]

## 📋 Quick Overview

**Tagline:** Buku Tamu Digital untuk Momen Tak Terlupakan

**Deskripsi Singkat:** Platform SaaS per-event yang menyediakan buku tamu digital dengan QR code access, template wedding website yang dapat dikustomisasi, RSVP management, dan live photo stream. Membantu calon pengantin, wedding organizer, dan venue pernikahan mengelola tamu dengan mudah dan menyimpan kenangan selamanya.

**Target Market:**

- **Primary:** Calon pengantin individu (prepare wedding 3-12 months ahead)
- **Secondary:** Wedding organizer (manage multiple client events)
- **Tertiary:** Venue pernikahan (hotel, restoran, garden venue)
- **Quaternary:** Event organizer untuk acara non-wedding (birthday, corporate events)

**5 Fitur Utama:**

1. **Digital Guestbook dengan QR Code** - Tamu scan QR code untuk mengisi buku tamu digital tanpa aplikasi
2. **Template Wedding Website** - Beragam desain kustomisasi (Modern, Traditional, Islamic) dengan countdown timer
3. **RSVP Management** - Tracking kehadiran tamu, konfirmasi kehadiran, dan guest list management
4. **Live Photo Stream** - Tamu upload foto acara secara real-time, semua foto terkumpul otomatis
5. **Ucapan & Doa Digital** - Pesan dan harapan dari tamu tersimpan selamanya dalam format digital

**Fitur Tambahan (Post-MVP):**

- **E-Invitation Integration** - Direct integration dengan layanan undangan digital (Bukute, Undangan Digital, dll)
- **Video Messages** - Tamu bisa kirim video ucapan pendek (15-30 detik)
- **Guest Analytics** - Statistik tamu yang hadir, waktu kedatangan, dan engagement metrics
- **Custom Domain** - Domain kustom untuk wedding website (e.g., romi-juli.wedding)

**Problem yang Diselesaikan:**
- Buku tamu fisik hilang atau rusak - kenangan tidak abadi
- Kesulitan tracking kehadiran tamu - manual dan tidak real-time
- Wedding website mahal dan rumit - perlu developer untuk customisasi
- Foto acara tersebar di banyak HP - sulit mengumpulkan semua momen
- Tidak ada record ucapan doa dari tamu - momen berharga hilang

## 🛠 Tech Stack

### Backend

- **Framework/Language:** Go 1.21+
- **Database:** PostgreSQL 15
- **API:** RESTful API dengan standard JSON responses

### Frontend

- **Framework:** Next.js 14 (App Router)
- **Language:** TypeScript 5+
- **Styling:** Tailwind CSS 3
- **State Management:** React Context + Server Components
- **UI Components:** Shadcn/ui (Radix UI primitives)
- **Form Handling:** React Hook Form + Zod validation

### Infrastructure

- **Hosting:** Oracle Cloud Infrastructure
- **Deployment:** Coolify
- **CDN:** Cloudflare
- **Monitoring:** Custom Dashboard + Error Tracking

### Third-party Services

- **Storage:** Cloudflare R2 (untuk photo uploads)
- **Email:** SendGrid (untuk RSVP notifications)
- **QR Code Generator:** Custom QR generation library
- **Analytics:** Google Analytics + Custom analytics
- **Payment Gateway:** Midtrans (untuk subscription payments)

## 💻 Local Development Setup

### Prerequisites

- [ ] Go 1.21+
- [ ] PostgreSQL 15
- [ ] Node.js 20+ (untuk frontend development)
- [ ] pnpm 8+ (package manager)
- [ ] Docker & Docker Compose (optional)

### Installation Steps

1. **Clone repository**

   ```bash
   git clone https://github.com/akordium/guestron.git
   cd guestron
   ```

2. **Backend setup**

   ```bash
   cd backend
   go mod download
   cp .env.example .env
   # Edit .env file dengan konfigurasi lokal
   ```

3. **Database setup**

   ```bash
   # Jalankan PostgreSQL (jika menggunakan Docker)
   docker-compose up -d postgres

   # Buat database
   createdb guestron_dev

   # Run migrations
   go run cmd/migrate/main.go

   # Seed data
   go run cmd/seed/main.go
   ```

4. **Frontend setup**

   ```bash
   cd frontend
   pnpm install
   cp .env.example .env.local
   # Edit .env.local file dengan konfigurasi lokal
   ```

5. **Start development servers**

   **Backend (Terminal 1):**
   ```bash
   cd backend
   go run cmd/server/main.go
   # Backend runs on http://localhost:8080
   ```

   **Frontend (Terminal 2):**
   ```bash
   cd frontend
   pnpm dev
   # Frontend runs on http://localhost:3000
   ```

6. **Aplikasi berjalan di:** http://localhost:3000

### Development Commands

**Backend:**

```bash
# Run server
go run cmd/server/main.go

# Run tests
go test ./...

# Run tests dengan coverage
go test -cover ./...

# Run specific test
go test ./internal/module/handler

# Generate migration
go run cmd/migrate/create/main.go create_events_table

# Build production binary
go build -o bin/guestron cmd/server/main.go
```

**Frontend:**

```bash
# Development server
pnpm dev

# Build production
pnpm build

# Start production server
pnpm start

# Linting
pnpm lint

# Type checking
pnpm type-check

# Format code
pnpm format

# Run tests
pnpm test
```

## 🧪 Testing

### Backend Test Suite

- **Framework:** Go testing + testify
- **Coverage Target:** 80%
- **Test Types:**
  - Unit Tests: Service, Repository, Use Case layer
  - Integration Tests: API endpoints dengan database
  - Contract Tests: API contract validation

```bash
# Run semua tests
go test ./...

# Run dengan coverage
go test -coverprofile=coverage.out ./...
go tool cover -html=coverage.out

# Run specific package tests
go test ./internal/event/handler -v
```

### Frontend Test Suite

- **Framework:** Vitest + React Testing Library
- **Coverage Target:** 75%
- **Test Types:**
  - Unit Tests: Component logic, utilities
  - Integration Tests: Component interactions
  - E2E Tests: Critical user journeys dengan Playwright

```bash
# Run unit tests
pnpm test

# Run tests dengan coverage
pnpm test:coverage

# Run E2E tests
pnpm test:e2e

# Run tests di watch mode
pnpm test:watch
```

## 🚢 Deployment

### Environments

- **Development:** Local development dengan hot reload
- **Staging:** Oracle Cloud dengan staging database
- **Production:** Oracle Cloud dengan high-availability setup

### Deployment Process

1. **Automatic Deployment** (via Coolify)
   - Push ke branch `main` → deploy ke production
   - Push ke branch `develop` → deploy ke staging

2. **Backend Deployment**

   ```bash
   # Build Go binary
   go build -ldflags="-s -w" -o guestron cmd/server/main.go

   # Run migrations
   go run cmd/migrate/main.go

   # Restart service (systemd)
   sudo systemctl restart guestron
   ```

3. **Frontend Deployment**

   ```bash
   # Build Next.js production
   pnpm build

   # Start production server
   pnpm start
   ```

### Environment Variables

**Backend Required Variables:**

- `DB_HOST` - Database host
- `DB_PORT` - Database port (5432)
- `DB_NAME` - Database name
- `DB_USER` - Database username
- `DB_PASSWORD` - Database password
- `JWT_SECRET` - JWT signing secret
- `R2_ACCESS_KEY` - Cloudflare R2 access key
- `R2_SECRET_KEY` - Cloudflare R2 secret key
- `R2_BUCKET_NAME` - R2 bucket name
- `SENDGRID_API_KEY` - SendGrid API key
- `MIDTRANS_SERVER_KEY` - Midtrans server key

**Frontend Required Variables:**

- `NEXT_PUBLIC_API_URL` - Backend API URL
- `NEXT_PUBLIC_APP_URL` - Frontend application URL

**Secret management:** Semua secrets disimpan di environment variables, tidak ada hardcoded secrets.

## 📊 Key Metrics & Monitoring

### Business Metrics

- [ ] **Active Events:** Target 500+ events per month (Year 1)
- [ ] **Guest Book Entries:** Target 50,000+ entries per month (Year 1)
- [ ] **Photos Uploaded:** Target 100,000+ photos per month (Year 1)
- [ ] **User Engagement:** 70% guests scan QR code dan fill guestbook
- [ ] **Customer Satisfaction:** 4.5+ star rating
- [ ] **Repeat Customers:** 20% customers return untuk events lain
- [ ] **Conversion Rate:** 15% free trial ke paid conversion

### Technical Metrics

- [ ] **Page Load Time:** < 2s average (Next.js optimization)
- [ ] **Time to First Byte (TTFB):** < 500ms
- [ ] **Uptime:** 99.5% uptime
- [ ] **Error Rate:** < 1% error rate
- [ ] **API Response Time:** < 200ms average
- [ ] **Photo Upload Speed:** < 5s per photo

### Monitoring Setup

- **Error Tracking:** Custom error logging (Go) + Sentry (Next.js)
- **Performance Monitoring:** Custom dashboard dengan response time tracking
- **Uptime Monitoring:** Cloudflare monitoring + custom health checks
- **User Analytics:** Google Analytics + custom event tracking
- **Business Metrics:** Custom analytics dashboard untuk event metrics

## 🔐 Security

### Security Measures

- [ ] **Authentication:** JWT token-based authentication
- [ ] **Authorization:** Role-based access control (Host, Guest, Admin)
- [ ] **Data Encryption:** Sensitive user data encrypted di rest
- [ ] **API Security:** Rate limiting, CORS proper configuration
- [ ] **Input Validation:** Zod validation untuk semua inputs (frontend)
- [ ] **SQL Injection Prevention:** Parameterized queries (Go)
- [ ] **XSS Prevention:** Content Security Policy (Next.js)
- [ ] **Photo Security:** Virus scanning untuk uploaded photos

### Security Checklist

- [x] HTTPS enabled (Cloudflare SSL)
- [x] Environment variables secured
- [x] Database connections encrypted
- [x] User passwords properly hashed (bcrypt)
- [x] API rate limiting implemented
- [x] CORS properly configured
- [x] CSRF protection enabled
- [x] Content Security Policy configured
- [x] File upload validation (type, size)
- [ ] Security headers audit
- [ ] Penetration testing (sebelum production launch)

## 📚 Documentation

### Internal Documentation

- **Technical Specs:** [link ke technical documentation]
- **API Documentation:** [link ke API docs - Swagger/OpenAPI]
- **Database Schema:** [link ke database docs]
- **Deployment Guide:** [link ke deployment guide]

### User Documentation

- **User Guide:** [link ke user guide]
- **Template Customization Guide:** [link ke template docs]
- **FAQ:** [link ke FAQ]
- **Video Tutorials:** [link ke video tutorials]
- **Wedding Website Examples:** [link ke example galleries]

## 🤝 Team & Roles

### Development Team

- **Tech Lead:** Najib (Backend & Architecture)
- **Frontend Developer:** [Nama] (UI/UX Implementation)
- **UI/UX Designer:** [Nama] (Template Design & User Experience)

### External Stakeholders

- **Product Owner:** [Nama] (Business Requirements)
- **Wedding Consultant:** [Nama] (Domain Expertise)
- **QA Engineer:** [Nama] (Testing & Quality)
- **Customer Support:** [Nama] (User Success)

## 🆘 Support & Troubleshooting

### Common Issues

1. **Database connection failed**
   - Solution: Check .env database configuration, ensure PostgreSQL service is running

2. **Photo upload failing**
   - Solution: Check R2 credentials, verify file size limits (max 10MB), ensure bucket exists

3. **QR code not generating**
   - Solution: Verify event URL is correct, check QR code library dependencies

4. **Next.js build failed**
   - Solution: Clear .next cache, run `pnpm install`, check TypeScript errors

5. **API rate limiting exceeded**
   - Solution: Implement proper rate limiting headers, use pagination for large datasets

### Getting Help

- **Slack Channel:** #guestron-development
- **Emergency Contact:** +62 815-9988-995 (via WhatsApp)
- **Documentation:** [link ke troubleshooting guide]
- **Email Support:** support@guestron.id

## 📈 Roadmap

Lihat [roadmap.md](./roadmap.md) untuk detail perkembangan produk Guestron.

## 🔄 Changelog

Lihat [changelog.md](./changelog.md) untuk riwayat perubahan Guestron.

## 🐛 Known Issues

Lihat [known-issues.md](./known-issues.md) untuk daftar bug dan limitation yang diketahui.

## 🎨 Template System

### Available Templates

**Modern Collection:**
- Minimalist Elegance - Clean lines, white space, subtle animations
- Bold & Beautiful - Large typography, vibrant colors
- Contemporary Chic - Modern layout dengan geometric patterns

**Traditional Collection:**
- Classic Romance - Timeless design dengan floral elements
- Vintage Charm - Retro aesthetic dengan muted colors
- Heritage Style - Batik/Javanese cultural motifs

**Islamic Collection:**
- Syariah Elegant - Islamic geometric patterns, calligraphy
- Traditional Muslim - Arabic-inspired design dengan modern touch
- Modern Islamic - Contemporary Islamic art fusion

### Template Customization

**Customizable Elements:**
- Color schemes (unlimited palettes)
- Typography (50+ font combinations)
- Layout options (single page, multi-section)
- Photo galleries (grid, slideshow, masonry)
- Music background (upload custom or choose from library)
- Countdown styles (analog, digital, custom)

**Custom Limits:**
- Free tier: 5 basic templates, limited customization
- Premium tier: 15+ templates, full customization
- Custom design: Available untuk enterprise clients (Rp 2,500,000+)

---

**Last Updated:** 2026-01-06
**Version:** 0.1.0-alpha
**Maintainer:** Najib Zain (Lead Developer)

**MVP Timeline:**
- **M3 (12 weeks):** MVP Complete - Core guestbook, basic templates, QR access
- **M6 (24 weeks):** Premium MVP - Advanced templates, live photos, RSVP management
- **M10 (40 weeks):** Full Product - E-invitation integration, video messages, analytics

## 💰 Pricing & Licensing

### Per-Event Pricing Model

**Starter Package - Rp 299,000/event**
- **Duration:** 1 month access
- **Guest Limit:** 100 guests
- **Templates:** 5 basic templates
- **Features:**
  - Digital guestbook
  - QR code access
  - Basic RSVP tracking
  - 50 photo uploads limit
  - Standard customization
- **Support:** Email support

**Premium Package - Rp 499,000/event**
- **Duration:** 3 months access
- **Guest Limit:** 300 guests
- **Templates:** 15+ premium templates
- **Features:**
  - Everything in Starter
  - Live photo stream (unlimited photos)
  - Advanced RSVP management
  - Custom domain support
  - Full customization
  - Priority photo processing
  - Guest analytics dashboard
- **Support:** Priority email + WhatsApp support

**Ultimate Package - Rp 999,000/event**
- **Duration:** 6 months access
- **Guest Limit:** Unlimited guests
- **Templates:** All templates + custom design
- **Features:**
  - Everything in Premium
  - Video message uploads (up to 50 videos)
  - Advanced analytics & insights
  - Custom domain included
  - White-label option (remove Guestron branding)
  - Priority processing
  - Download all data (full archive)
- **Support:** Dedicated support + setup assistance

**Add-ons:**
- **Extra Storage:** Rp 99,000/month untuk additional 10GB
- **Video Messages:** Rp 149,000 untuk 50 additional videos
- **Custom Design:** Rp 2,500,000+ (one-time fee)
- **Extended Access:** Rp 149,000 untuk additional 3 months

### Wedding Organizer / Venue Plans

**WO Starter - Rp 2,500,000/month**
- **Events:** Up to 5 active events
- **Features:** Premium package features untuk semua events
- **Dashboard:** Multi-event management dashboard
- **Branding:** Custom WO branding (white-label)
- **Support:** Dedicated account manager

**WO Professional - Rp 7,500,000/month**
- **Events:** Up to 20 active events
- **Features:** Ultimate package features untuk semua events
- **Dashboard:** Advanced team collaboration
- **Branding:** Full white-label + custom domain
- **Support:** Priority support + training session

**WO Enterprise - Rp 15,000,000/month**
- **Events:** Unlimited active events
- **Features:** Everything + custom integrations
- **Dashboard:** Custom reporting & analytics
- **Branding:** Full white-label + API access
- **Support:** 24/7 dedicated support + onboarding

### Refund Policy

- **Full Refund:** Jika claim dalam 24 jam pertama
- **Partial Refund (50%):** Jika claim dalam 7 hari pertama
- **No Refund:** Setelah 7 hari atau event sudah dimulai
- **Technical Issues:** Full refund jika technical problems prevent usage

📖 **Detailed Pricing:** [pricing.md](./pricing.md) untuk complete pricing breakdown

---

## 🎯 Market Opportunity

### Market Size

- **Indonesian Wedding Industry:** Rp 300 trillion per year
- **Digital Wedding Services:** Rp 5 trillion (growing 25% YoY)
- **Target Addressable Market (TAM):** 2.5 million weddings/year × 20% digital adoption = 500,000 events
- **Serviceable Addressable Market (SAM):** Urban Indonesia (Java, Bali, major cities) = 150,000 events/year
- **Serviceable Obtainable Market (SOM):** Year 1 target: 1,000 events (0.07% of SAM)

### Market Trends

**Post-Pandemic Digital Transformation:**
- 70% couples menggunakan digital wedding platform (2023 vs 20% di 2019)
- QR code adoption increased 300% di hospitality sector
- Contactless services menjadi standard expectation

**Wedding Industry Evolution:**
- Average wedding budget di urban Indonesia: Rp 80-150 million
- Digital services budget: 5-10% dari total budget (Rp 4-15 million)
- Growing preference untuk personalized, memorable experiences

**Competitive Landscape:**
- **Bukute:** Main competitor, established brand
- **Undangan Digital:** Focus di e-invitation, bukan guestbook
- **Traditional guestbook:** Physical alternatives (cost: Rp 150,000-500,000)
- **Guestron Differentiation:**
  - Next.js = faster loading, better SEO
  - Better template customization
  - Live photo stream (unique feature)
  - Per-event pricing (flexible untuk WOs)

### Go-to-Market Strategy

**Phase 1 (Months 1-3): Launch & Early Adopters**
- Target: 50 events
- Strategy: Free trial untuk first 100 users, social media marketing
- Channels: Instagram wedding community, TikTok wedding content

**Phase 2 (Months 4-6): Wedding Organizer Partnerships**
- Target: 500 events
- Strategy: Partner dengan 20 WOs, referral program
- Channels: Wedding expo, direct outreach ke WOs

**Phase 3 (Months 7-12): Scale & Expand**
- Target: 2,000 events
- Strategy: Venue partnerships, affiliate marketing
- Channels: Google Ads, influencer partnerships

**Phase 4 (Year 2): Market Leadership**
- Target: 5,000+ events
- Strategy: Brand building, product expansion
- Channels: PR campaigns, strategic partnerships

---

**Last Updated:** 2026-01-06
**Version:** 0.1.0-alpha
**Maintainer:** Najib Zain (Lead Developer)
