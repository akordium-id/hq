# 📊 ExcelCircle

> Generator Rumus Excel & Google Sheets dengan Bahasa Indonesia untuk Productivity Boost

## 🏷️ Product Identity

- **Nama Produk:** ExcelCircle
- **Status:** 🚧 In Development
- **Repo Code:** `github.com/akordium/excelcircle` (Private)
- **Live Site:** https://excelcircle.id
- **Staging:** https://staging.excelcircle.id
- **Project Management:** [Link ke GitHub Project Board]

## 📋 Quick Overview

**Tagline:** Ubah Bahasa Indonesia Menjadi Rumus Excel & Google Sheets dalam Sekejap

**Deskripsi Singkat:** Platform SaaS freemium yang mengubah natural language Bahasa Indonesia menjadi rumus Excel/Google Sheets yang kompleks. Dilengkapi dengan formula explainer, template library siap pakai, video tutorial singkat, dan Chrome extension untuk quick access. Fokus pada use case Indonesia seperti perhitungan pajak, gaji THR, dan laporan UMKM.

**Target Market:**

- **Primary:** Office workers (admin, HR, finance) yang menggunakan Excel/Sheets daily
- **Secondary:** Data analyst dan business intelligence professionals
- **Tertiary:** Mahasiswa (analisis data tugas kuliah, skripsi)
- **Quaternary:** UMKM owners (manage keuangan, inventory, laporan)

**5 Fitur Utama:**

1. **Natural Language to Formula** - "Jumlahkan kolom A jika kolom B berisi 'Jakarta'" → =SUMIF(B:B,"Jakarta",A:A)
2. **Formula Explainer** - Paste rumus kompleks → dapat penjelasan bahasa Indonesia + breakdown per bagian
3. **Template Library** - Siap pakai: invoice, laporan keuangan, attendance, payroll, inventory
4. **Video Tutorial** - Tutorial singkat 30-60 detik per formula (format bite-sized learning)
5. **Chrome Extension** - Quick access di Google Sheets tanpa pindah tab

**Fitur Tambahan (Post-MVP):**

- **Batch Formula Generation** - Generate multiple formulas sekaligus dari deskripsi panjang
- **Formula Optimization** - Analisis dan saran perbaikan formula yang inefficient
- **Custom Function Library** - Buat dan save custom functions untuk team/organization
- **Collaborative Templates** - Share dan fork templates antar users

**Problem yang Diselesaikan:**
- Difficulty mengingat rumus Excel yang kompleks (VLOOKUP, INDEX-MATCH, Pivot Table)
- Google/YouTube tutorials terlalu panjang dan tidak specific ke use case
- Lack of resources dalam Bahasa Indonesia untuk Excel/Google Sheets
- Waktu waste mencoba-coba formula yang tidak berfungsi
- Formula yang berfungsi di Excel tidak selalu work di Google Sheets (dan sebaliknya)

## 🛠 Tech Stack

### Backend

- **Framework/Language:** Go 1.21+
- **Database:** PostgreSQL 15
- **API:** RESTful API dengan standard JSON responses
- **Formula Engine:** Custom parser dengan ANTLR untuk natural language processing

### Frontend

- **Framework:** HTMX 1.9+ untuk dynamic interactions
- **Styling:** Tailwind CSS 3
- **State Management:** Alpine.js 3.4+
- **Architecture:** Server-side rendering dengan Go templates + HTMX untuk seamless UX
- **Chrome Extension:** Vanilla JavaScript (Manifest V3)

### Infrastructure

- **Hosting:** Oracle Cloud Infrastructure
- **Deployment:** Coolify
- **CDN:** Cloudflare
- **Monitoring:** Custom Dashboard + Error Tracking

### Third-party Services

- **AI/ML Services:**
  - **OpenAI GPT-4** (Optional) - Advanced natural language to formula conversion
  - **Local NLP Model** - Basic formula generation tanpa external API dependency
- **Email:** SendGrid
- **Storage:** Cloudflare R2 (video tutorials, template assets)
- **Analytics:** Google Analytics + Custom Analytics
- **Payment Gateway:** Midtrans (GoPay, OVO, DANA, Credit Cards, QRIS)

### Why Go + HTMX?

**Performance Advantages:**
- **Blazing Fast Load Times:** Go compiled binary + minimal JavaScript = < 100ms page load
- **Low Memory Footprint:** 10-20MB per request vs 100-200MB di Node.js/PHP
- **High Concurrency:** Handle 1000+ concurrent users dengan single instance
- **No Node.js Bloat:** Tidak perlu npm build steps, tidak ada bundle.js besar

**Development Benefits:**
- **Type Safety:** Compile-time error checking reduces bugs
- **Simple Deployment:** Single binary deployment - tidak perlu runtime dependencies
- **Clean Architecture:** Force separation of concerns dengan explicit interfaces
- **Fast Iteration:** HTMX enables dynamic UI tanpa writing custom JavaScript

## 💻 Local Development Setup

### Prerequisites

- [ ] Go 1.21+
- [ ] PostgreSQL 15
- [ ] Node.js 18+ (hanya untuk Chrome extension development)
- [ ] Docker & Docker Compose (optional)

### Installation Steps

1. **Clone repository**

   ```bash
   git clone https://github.com/akordium/excelcircle.git
   cd excelcircle
   ```

2. **Install Go dependencies**

   ```bash
   go mod download
   go mod tidy
   ```

3. **Environment setup**

   ```bash
   cp .env.example .env
   # Edit .env file dengan konfigurasi lokal
   ```

4. **Database setup**

   ```bash
   # Jalankan PostgreSQL (jika menggunakan Docker)
   docker-compose up -d postgres

   # Buat database
   createdb excelcircle_dev

   # Run migrations
   go run cmd/migrate/main.go

   # Seed data
   go run cmd/seed/main.go
   ```

5. **Install npm dependencies (untuk Chrome extension)**

   ```bash
   cd extension
   npm install
   npm run build
   cd ..
   ```

6. **Start development server**

   ```bash
   # Mode development dengan auto-reload
   go run cmd/server/main.go

   # Atau menggunakan air untuk hot reload
   air
   ```

7. **Aplikasi berjalan di:** http://localhost:8080

### Development Commands

```bash
# Run development server
go run cmd/server/main.go

# Run tests
go test ./...

# Run tests dengan coverage
go test -cover ./...

# Run tests dengan race detection
go test -race ./...

# Generate test coverage report
go test -coverprofile=coverage.out ./...
go tool cover -html=coverage.out

# Run linter
golangci-lint run

# Format code
go fmt ./...

# Run migrations
go run cmd/migrate/main.go

# Create new migration
go run cmd/migrate/create/main.go create_table_name

# Build production binary
go build -o bin/excelcircle cmd/server/main.go
```

### Project Structure

```
excelcircle/
├── cmd/                    # Application entry points
│   ├── server/            # Main web server
│   ├── migrate/           # Database migration tool
│   └── seed/              # Database seeder
├── internal/              # Private application code
│   ├── handler/           # HTTP handlers
│   ├── service/           # Business logic
│   ├── repository/        # Database operations
│   ├── model/             # Data models
│   ├── middleware/        # HTTP middleware
│   └── util/              # Utilities
├── pkg/                   # Public reusable packages
│   ├── formula/           # Formula parsing & generation
│   └── nlp/               # Natural language processing
├── web/                   # Static assets & templates
│   ├── templates/         # HTML templates
│   ├── static/            # CSS, JS, images
│   └── components/        # HTMX components
├── extension/             # Chrome extension
│   ├── manifest.json
│   ├── src/
│   └── dist/
├── migrations/            # SQL migration files
├── .env.example
└── go.mod
```

## 🧪 Testing

### Test Suite

- **Framework:** Go testing + testify
- **Coverage Target:** 80%
- **Test Types:**
  - Unit Tests: Service layer, formula parser, NLP components
  - Integration Tests: Database operations, API endpoints
  - End-to-End Tests: Critical user journeys dengan custom Go test helpers

### Running Tests

```bash
# Run semua tests
go test ./...

# Run specific test file
go test ./internal/service/formula_service_test.go

# Run dengan verbose output
go test -v ./...

# Run dengan coverage
go test -cover ./...

# Run dengan race detection
go test -race ./...

# Generate coverage report
go test -coverprofile=coverage.out ./...
go tool cover -html=coverage.out -o coverage.html

# Run benchmark tests
go test -bench=. -benchmem ./...
```

### Test Categories

**Unit Tests:**
- Formula generation logic
- Natural language parser
- Template rendering
- Utility functions

**Integration Tests:**
- Database CRUD operations
- API endpoint responses
- Authentication flows
- Payment gateway integration

**E2E Tests:**
- User registration → formula generation → save to library
- Formula explainer workflow
- Template download dan usage
- Chrome extension integration

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

   # Build production binary
   go build -ldflags="-s -w" -o bin/excelcircle cmd/server/main.go

   # Run migrations
   ./bin/excelcircle migrate up

   # Restart service
   systemctl restart excelcircle

   # Atau menggunakan Docker
   docker-compose down
   docker-compose up -d --build
   ```

### Environment Variables

**Required variables:**

- `DB_HOST` - Database host
- `DB_PORT` - Database port
- `DB_NAME` - Database name
- `DB_USER` - Database username
- `DB_PASSWORD` - Database password
- `SESSION_SECRET` - Session encryption key
- `MIDTRANS_SERVER_KEY` - Midtrans server key
- `SENDGRID_API_KEY` - SendGrid API key

**Optional variables:**

- `OPENAI_API_KEY` - OpenAI API key (untuk advanced NLP)
- `ENVIRONMENT` - Environment (development/staging/production)
- `LOG_LEVEL` - Log level (debug/info/warn/error)
- `CACHE_DRIVER` - Cache driver (redis/memory)

**Secret management:** Semua secrets disimpan di environment variables, tidak ada hardcoded secrets.

### Build Optimization

```bash
# Production build dengan optimizations
go build \
  -ldflags="-s -w -X main.Version=1.0.0 -X main.BuildTime=$(date -u +%Y-%m-%dT%H:%M:%SZ)" \
  -o bin/excelcircle \
  cmd/server/main.go

# Strip debug information untuk binary size reduction
upx --best --lzma bin/excelcircle
```

## 📊 Key Metrics & Monitoring

### Business Metrics

- [ ] **Active Users:** Target 1,000+ monthly active users (Month 3)
- [ ] **Formula Generation:** Target 50,000+ formulas generated/month (Month 6)
- [ ] **Template Downloads:** Target 5,000+ downloads/month (Month 3)
- [ ] **Chrome Extension Installs:** Target 500+ installs (Month 3)
- [ ] **Freemium Conversion:** Target 5-10% free-to-paid conversion rate
- [ ] **User Retention:** 40% monthly retention rate
- [ ] **Average Session Duration:** 5+ minutes per session
- [ ] **Video Tutorial Views:** Target 10,000+ views/month (Month 6)

### Technical Metrics

- [ ] **Response Time:** < 200ms average (Go + HTMX advantage)
- [ ] **Page Load Time:** < 500ms first contentful paint
- [ ] **Uptime:** 99.9% uptime
- [ ] **Error Rate:** < 0.5% error rate
- [ ] **Formula Generation Accuracy:** 95%+ correct formula generation
- [ ] **Concurrent Users:** Handle 1,000+ concurrent users

### Monitoring Setup

- **Error Tracking:** Custom Go error logging dengan Sentry integration
- **Performance Monitoring:** Custom middleware untuk response time tracking
- **Uptime Monitoring:** Cloudflare monitoring + custom health checks
- **Business Metrics:** Custom analytics dashboard untuk formula generation tracking

### Monitoring Endpoints

```go
// Health check endpoint
GET /health

// Metrics endpoint (Prometheus format)
GET /metrics

// Ready check (dependency health)
GET /ready
```

## 🔐 Security

### Security Measures

- [ ] **Authentication:** JWT token-based authentication dengan httpOnly cookies
- [ ] **Authorization:** Role-based access control (Free, Premium, Admin)
- [ ] **Rate Limiting:** Per-user rate limiting (10 requests/day for free users)
- [ ] **Input Validation:** Strict validation untuk natural language input (prevent injection)
- [ ] **XSS Prevention:** HTMX built-in XSS protection + CSP headers
- [ ] **CSRF Protection:** Token validation untuk semua state-changing operations

### Security Checklist

- [x] HTTPS enabled (Cloudflare SSL)
- [x] Environment variables secured
- [x] Database connections encrypted
- [x] User passwords hashed (bcrypt)
- [x] API rate limiting implemented
- [x] XSS protection enabled (CSP headers)
- [x] CSRF token validation for all forms
- [x] SQL injection prevention (parameterized queries)
- [ ] Content Security Policy configured
- [ ] Security headers configured (HSTS, X-Frame-Options)

### Rate Limiting Strategy

**Free Tier:**
- 10 formula generations per day
- 5 template downloads per day
- 20 formula explainer queries per day

**Premium Tier:**
- Unlimited formula generations
- Unlimited template downloads
- Unlimited formula explainer queries

**Rate Limit Implementation:**
- Redis-based rate limiting untuk distributed systems
- Per-user tracking dengan IP address + user ID
- Sliding window algorithm untuk accurate rate limiting

## 📚 Documentation

### Internal Documentation

- **Technical Specs:** [link ke technical documentation]
- **API Documentation:** [link ke API docs]
- **Database Schema:** [link ke database docs]
- **Deployment Guide:** [link ke deployment guide]
- **Formula Engine Architecture:** [link ke formula engine docs]

### User Documentation

- **User Guide:** [link ke user guide]
- **Formula Library:** [link ke formula library docs]
- **Template Guide:** [link ke template documentation]
- **Video Tutorial Index:** [link ke video tutorials]
- **Chrome Extension Guide:** [link ke extension docs]

### Formula Documentation

Setiap formula dilengkapi dengan:
- Bahasa Indonesia penjelasan
- Syntax breakdown
- Contoh penggunaan praktis (use case Indonesia)
- Perbedaan Excel vs Google Sheets (jika ada)
- Video tutorial 30-60 detik

## 🤝 Team & Roles

### Development Team

- **Tech Lead:** Najib (Backend & Architecture)
- **Frontend Developer:** [Nama] (UI/UX + HTMX Implementation)
- **Chrome Extension Dev:** [Nama] (Browser Extension)
- **Content Creator:** [Nama] (Video tutorials, formula documentation)

### External Stakeholders

- **Product Owner:** [Nama] (Business Requirements)
- **UI/UX Designer:** [Nama] (Design System)
- **QA Engineer:** [Nama] (Testing & Quality)
- **Domain Expert:** [Nama] (Excel/Google Sheets expert)

### Partnership Opportunities

**Online Course Platforms:**
- **Skill Academy** (Ruangguru) - Co-branded Excel courses
- **Arkademi** - Professional certification tracks
- **Harisenin** - UMKM-focused Excel training
- **RevoU** - Data analytics with Excel track

## 🆘 Support & Troubleshooting

### Common Issues

1. **Formula generation tidak accurate**
   - Solution: Clear browser cache, gunakan lebih specific language, coba dengan OpenAI engine (premium)

2. **Chrome extension tidak muncul di Google Sheets**
   - Solution: Enable developer mode di Chrome, reload extension, clear browser cache

3. **Template download gagal**
   - Solution: Check file permissions, verify Cloudflare R2 connectivity

4. **Video tutorial tidak play**
   - Solution: Check internet connection, clear browser cache, try different browser

### Getting Help

- **Email:** support@excelcircle.id
- **WhatsApp:** +62 815-9988-995
- **Documentation:** [link ke help center]
- **YouTube Channel:** [link ke video tutorials]

## 📈 Roadmap

Lihat [roadmap.md](./roadmap.md) untuk detail perkembangan produk ExcelCircle.

## 🔄 Changelog

Lihat [changelog.md](./changelog.md) untuk riwayat perubahan ExcelCircle.

## 🐛 Known Issues

Lihat [known-issues.md](./known-issues.md) untuk daftar bug dan limitation yang diketahui.

## 💰 Pricing & Licensing

### Freemium Model

**Free Tier:**
- **Price:** Rp 0 (gratis)
- **Limits:**
  - 10 formula generations per day
  - 5 template downloads per day
  - 20 formula explainer queries per day
  - Basic formula engine (local NLP)
  - Community support only
- **Purpose:** Untuk students, individual users, proof of concept

**Premium Tier:**
- **Price:** Rp 29,000/month
- **Discount:** Rp 290,000/year (2 months free = 17% discount)
- **Features:**
  - Unlimited formula generations
  - Unlimited template downloads
  - Unlimited formula explainer queries
  - Advanced formula engine (OpenAI GPT-4)
  - Batch formula generation
  - Formula optimization suggestions
  - Custom function library
  - Priority email & WhatsApp support
  - Early access ke new features
  - Ad-free experience

**Enterprise Plan (Custom Pricing):**
- **Pricing:** Rp 500,000 - Rp 5,000,000/month
- **Purpose:** Untuk perusahaan, educational institutions
- **Features:**
  - Unlimited everything untuk team
  - Custom template creation
  - White-label solution
  - Dedicated support & training
  - API access
  - SSO integration
  - Custom branding
  - On-premise deployment option

### Payment Methods

- **Midtrans:** GoPay, OVO, DANA, LinkAja, QRIS, Credit Cards
- **Bank Transfer:** BCA, Mandiri, BNI, BRI
- **E-Wallet:** ShopeePay, AstraPay

### Refund Policy

- 7-day money back guarantee untuk Premium tier
- Pro-rated refund untuk annual subscriptions jika tidak puas

📖 **Detailed Pricing:** [pricing-model.md](./pricing-model.md) untuk complete pricing breakdown

## 🎯 Milestones

ExcelCircle dikembangkan dalam 10 milestones selama 12 bulan:

**M1-M3: Foundation (MVP)**
- Core formula generation engine
- Basic UI with Go + HTMX
- Formula explainer
- 10 templates dasar

**M4-M6: Feature Expansion**
- Template library (50+ templates)
- Video tutorial production (100+ videos)
- Chrome extension launch
- User accounts & authentication

**M7-M9: Scale & Monetization**
- Premium payment gateway
- Advanced OpenAI integration
- Batch formula generation
- Custom function library

**M10: Enterprise & Partnerships**
- Enterprise features
- Online course platform partnerships
- API access
- White-label solution

Detail milestones: [milestones.md](./milestones.md)

## 🏆 Competitive Advantages

### 1. **Local Relevance**
- Use case spesifik Indonesia (pajak, gaji THR, laporan UMKM)
- Bahasa Indonesia penjelasan, bukan translated English
- Template siap pakai untuk bisnis Indonesia

### 2. **Technical Excellence**
- Go + HTMX = extremely fast load times (< 200ms)
- Low resource usage → cheaper infrastructure
- No JavaScript framework bloat → simpler maintenance

### 3. **Comprehensive Learning**
- Video tutorial singkat 30-60 detik per formula
- Bite-sized learning untuk busy professionals
- Visual explanation, bukan hanya teks

### 4. **Chrome Extension**
- Quick access di Google Sheets tanpa pindah tab
- Seamless workflow integration
- Context-aware suggestions

### 5. **Freemium Model**
- Free tier generous (10 generates/day)
- Low barrier to entry
- Upgrade path natural saat users hit limits

## 📊 Success Metrics

**Month 1-3: Launch & Validation**
- 500 registered users
- 10,000 formulas generated
- 50 Chrome extension installs
- 20 template downloads/day

**Month 4-6: Growth**
- 2,000 registered users
- 50,000 formulas generated
- 500 Chrome extension installs
- 5% conversion to Premium
- 100 video tutorials published

**Month 7-12: Scale**
- 10,000 registered users
- 250,000 formulas generated
- 2,000 Chrome extension installs
- 8% conversion to Premium
- 3 online course partnerships

## 🔗 Integration Opportunities

### Google Workspace Marketplace
- Publish Chrome extension ke official store
- Google Sheets add-on (bukan hanya extension)
- Google Drive integration untuk template library

### Microsoft Office Add-in
- Excel add-in untuk desktop & web versions
- SharePoint integration untuk enterprise templates

### Educational Platforms
- LMS integration (Moodle, Canvas)
- Course platform partnerships (Skill Academy, Arkademi)
- Corporate training partnerships

## 📱 Chrome Extension Features

### Core Features
- **Sidebar Panel:** Quick formula generation tanpa离开 Google Sheets
- **Context Menu:** Right-click cell → generate formula untuk selected range
- **Keyboard Shortcut:** Alt+E untuk quick access
- **History:** Recent formulas yang digunakan
- **Favorites:** Save frequently used formulas

### Technical Implementation
- Manifest V3 compliance
- Content script untuk Google Sheets integration
- Background service worker untuk API calls
- Cross-origin communication dengan excelcircle.id

### Extension Metrics
- Install count tracking
- Active user tracking (DAU/MAU)
- Feature usage analytics
- A/B testing framework untuk UI improvements

## 🎓 Education Strategy

### Content Marketing

**YouTube Channel:**
- "Rumus Excel dalam 60 Detik" series
- Use case spesifik (Hitung PPH 21, Laporan Laba Rugi UMKM)
- Tutorial templates (Invoice otomatis, Attendance tracker)
- Target: 1,000 subscribers in 6 months

**Blog Articles:**
- "10 Rumus Excel yang Wajib Dikuasai HRD"
- "Cara Hitung Pajak dengan Excel Otomatis"
- "Template Laporan Keuangan UMKM Gratis"
- SEO-focused untuk Indonesian keywords

**Social Media:**
- Instagram/TikTok: Quick tips carousel & reels
- LinkedIn: B2B focused content untuk office workers
- Twitter/X: Daily formula tips

### Course Partnerships

**Skill Academy (Ruangguru):**
- "Excel for HR & Payroll" certification
- "Financial Modeling with Excel" for business owners
- Revenue share model: 30% platform, 70% ExcelCircle

**Arkademi:**
- "Excel for Data Analysis" course
- "Advanced Excel for Business" course
- White-label course package untuk corporate training

## 🚀 Go-Launch Strategy

**Pre-Launch (Month 1-2):**
- Beta testing dengan 100 users
- Content production (50 videos, 20 templates)
- SEO groundwork (blog, backlinks)
- Social media presence building

**Soft Launch (Month 3):**
- Launch ke existing network (friends, family, colleagues)
- Chrome extension submission to Chrome Web Store
- Initial marketing push (target 500 users)

**Public Launch (Month 4):**
- Product Hunt launch
- Tech in Indonesia media coverage (DailySocial, etc.)
- Online course partnership announcements
- Influencer collaboration (Excel trainers, productivity YouTubers)

**Post-Launch (Month 5-12):**
- Continuous content production
- Feature releases based on user feedback
- Partnership expansion
- Enterprise customer acquisition

---

**Last Updated:** 2026-01-06
**Version:** 0.1.0-alpha
**Maintainer:** Najib Zain (Lead Developer)

**MVP Timeline:**
- **M3 (12 weeks):** MVP Complete - Core formula generation + basic UI
- **M6 (24 weeks):** Feature Complete - Templates, videos, extension
- **M9-M10 (48 weeks):** Scale - Premium features, partnerships, enterprise

## 🎯 Next Steps

1. **Technical Setup:**
   - [ ] Initialize Go project dengan standard layout
   - [ ] Setup PostgreSQL database schema
   - [ ] Implement basic formula parser (ANTLR)
   - [ ] Build HTMX frontend structure

2. **MVP Development:**
   - [ ] Formula generation engine (local NLP)
   - [ ] Formula explainer logic
   - [ ] 10 core templates
   - [ ] User authentication system

3. **Content Production:**
   - [ ] Script & record 20 video tutorials
   - [ ] Create 10 template files (.xlsx, .gsheet)
   - [ ] Write formula documentation

4. **Testing:**
   - [ ] Alpha testing dengan internal team
   - [ ] Beta testing dengan 50 external users
   - [ ] Formula accuracy validation
   - [ ] Performance benchmarking

5. **Launch Preparation:**
   - [ ] Chrome extension development & submission
   - [ ] Payment gateway integration
   - [ ] Marketing materials preparation
   - [ ] Documentation completion

---

**Contact:** support@excelcircle.id
**Website:** https://excelcircle.id
**GitHub:** https://github.com/akordium/excelcircle
