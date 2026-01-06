# 📝 CaptionMania

> AI-Powered Caption & Description Generator untuk Marketplace Indonesia

## 🏷️ Product Identity

- **Nama Produk:** CaptionMania
- **Status:** 🚧 In Development
- **Repo Code:** `github.com/akordium/captionmania` (Private)
- **Live Site:** https://captionmania.id
- **Staging:** https://staging.captionmania.id
- **Project Management:** [Link ke GitHub Project Board]

## 📋 Quick Overview

**Tagline:** Tingkatkan Penjualan Online dengan Caption SEO-Optimized dalam Detik

**Deskripsi Singkat:** Platform SaaS freemium yang membantu online seller, dropshipper, dan social media manager generate caption menarik dan description SEO-optimized untuk Tokopedia, Shopee, dan TikTok Shop. Dilengkapi dengan AI yang trained khusus dengan data marketplace Indonesia, hashtag recommendation, dan bulk generation capability.

**Target Market:**

- **Primary:** TikTok Shop sellers (growing segment, high social commerce demand)
- **Secondary:** Tokopedia/Shopee power sellers (500+ products, need bulk generation)
- **Tertiary:** Dropshipper (multi-platform, need varied captions)
- **Quaternary:** Social media manager/agency (handle multiple clients)

**5 Fitur Utama:**

1. **AI Caption Generator** - Input foto/keyword → output caption menarik dalam berbagai tone (formal, casual, humorous, luxury)
2. **SEO-Optimized Description** - Generate produk description dengan keyword strategis untuk marketplace search ranking
3. **Hashtag Recommendation** - Trending hashtags + niche-specific hashtags untuk maximal reach
4. **Multi-Language Support** - Bahasa Indonesia & English dengan natural phrasing
5. **Bulk Generation** - Upload CSV dengan ratusan produk → generate semua captions sekaligus

**Fitur Tambahan (Post-MVP):**

- **Marketplace API Integration** - Direct posting ke Tokopedia/Shopee/TikTok Shop (single-click publish)
- **A/B Testing** - Test multiple caption variations untuk lihat performa terbaik
- **Analytics Dashboard** - Track caption performance (views, clicks, conversion)
- **Template Library** - Save & reuse favorite caption templates

**Problem yang Diselesaikan:**
- Writer's block saat menulis caption produk → tersedia dalam 5 detik
- Tidak paham SEO untuk marketplace → caption optimized untuk search ranking
- Terlalu banyak produk, capek nulis satu-satu → bulk generation ratusan produk
- Bahasa Indonesia yang kaku/ tidak natural → trained dengan data marketplace asli Indonesia
- Tidak tahu hashtag apa yang trending → automatic trending + niche hashtag recommendation

**Competitive Edge:**
- **Local Training Data:** Trained dengan thousands successful listings dari Tokopedia/Shopee/TikTok Shop Indonesia
- **Bahasa Gaul & Trend Lokal:** Mengerti bahasa sehari-hari Indonesia (bukan translated English)
- **Marketplace-Specific SEO:** Keyword optimization khusus untuk algorithm masing-masing marketplace
- **Bulk Processing:** Generate 100+ captions dalam satu klik
- **Tone Customization:** Sesuaikan tone dengan brand identity (formal untuk luxury, casual untuk everyday products)

**Viral Potential:**
- Testimoni seller: "Omzet naik 3x setelah pakai caption dari CaptionMania"
- Before/After comparison: Produk yang sama, caption berbeda → performa beda jauh
- Social proof: Gallery produk dengan caption CaptionMania yang berhasil viral

## 🛠 Tech Stack

### Backend

- **Framework/Language:** Go 1.21+ dengan Fiber v2
- **Database:** PostgreSQL 15
- **API:** RESTful API dengan Fiber framework

**Why Go + Fiber:**
- **Performance:** Fiber 10x faster than Node.js Express untuk AI processing workloads
- **Concurrency:** Handle bulk generation (100+ requests) dengan goroutines
- **Memory Efficiency:** Low memory footprint untuk cost-efficient hosting
- **Type Safety:** Strong typing mengurangi bugs di production
- **Fiber Framework:** Express-like API, fast development, built-in middleware

### Frontend

- **Framework:** SvelteKit (Svelte 5)
- **Component Library:** Skeleton UI (Svelte component library) + Custom components
- **Styling:** Tailwind CSS 3
- **State Management:** Svelte stores (built-in reactivity)
- **AI Integration:** Server-side streaming responses untuk real-time generation

**Why SvelteKit:**
- **Performance:** Compile-time optimization, no virtual DOM overhead
- **Developer Experience:** Clean syntax, less boilerplate than React
- **Bundle Size:** Smallest bundle size among modern frameworks
- **SSR/CSR:** Seamless server-side & client-side rendering
- **TypeScript:** First-class TypeScript support

### Infrastructure

- **Hosting:** Oracle Cloud Infrastructure
- **Deployment:** Coolify
- **CDN:** Cloudflare
- **Monitoring:** Custom Dashboard + Error Tracking

### Third-party Services

- **AI/LLM Provider:**
  - **OpenAI GPT-4** - Primary caption generation engine
  - **Anthropic Claude 3.5** - Alternative model untuk variation
  - **OpenRouter API** - Unified API untuk multiple LLM providers (cost optimization)
- **Image Analysis:**
  - **Vision API** - Extract product details dari uploaded images
- **Marketplace APIs (Post-MVP):**
  - **Tokopedia API** - Direct product posting
  - **Shopee API** - Direct product posting
  - **TikTok Shop API** - Direct product posting
- **Trending Data:**
  - **Twitter/X API** - Trending hashtags Indonesia
  - **TikTok API** - Trending sounds & hashtags
- **Email:** SendGrid
- **Storage:** Cloudflare R2 (untuk image uploads)
- **Analytics:** Google Analytics + Custom analytics
- **Payment:**
  - **Midtrans** - Credit cards, GoPay, OVO, DANA
  - **QRIS** - Semua e-wallet & mobile banking

## 💻 Local Development Setup

### Prerequisites

- [ ] Go 1.21+
- [ ] PostgreSQL 15
- [ ] Node.js 20+ (untuk SvelteKit frontend)
- [ ] pnpm 8+ (recommended for SvelteKit)
- [ ] Docker & Docker Compose (optional)

### Installation Steps

1. **Clone repository**

   ```bash
   git clone https://github.com/akordium/captionmania.git
   cd captionmania
   ```

2. **Install backend dependencies**

   ```bash
   go mod download
   ```

3. **Install frontend dependencies**

   ```bash
   cd frontend
   pnpm install
   cd ..
   ```

4. **Environment setup**

   ```bash
   # Backend environment
   cp .env.example .env
   # Edit .env file dengan konfigurasi lokal

   # Frontend environment
   cp frontend/.env.example frontend/.env
   # Edit frontend/.env file
   ```

5. **Database setup**

   ```bash
   # Jalankan PostgreSQL (jika menggunakan Docker)
   docker-compose up -d postgres

   # Buat database
   createdb captionmania_dev

   # Run migrations
   go run cmd/migrate/main.go

   # Seed data (optional)
   go run cmd/seed/main.go
   ```

6. **Build frontend assets**

   ```bash
   cd frontend
   pnpm run build
   cd ..
   ```

7. **Start development servers**

   **Terminal 1 - Backend:**
   ```bash
   go run cmd/server/main.go
   # Backend runs on http://localhost:3000
   ```

   **Terminal 2 - Frontend:**
   ```bash
   cd frontend
   pnpm run dev
   # Frontend runs on http://localhost:5173
   ```

8. **Aplikasi berjalan di:** http://localhost:5173

### Development Commands

```bash
# Backend - Run server
go run cmd/server/main.go

# Backend - Run tests
go test ./...

# Backend - Run with hot reload (using air)
air

# Backend - Generate migration
go run cmd/migrate/create.go create_users_table

# Frontend - Dev server
cd frontend && pnpm run dev

# Frontend - Build for production
cd frontend && pnpm run build

# Frontend - Run tests
cd frontend && pnpm run test

# Frontend - Type checking
cd frontend && pnpm run check
```

### Project Structure

```
captionmania/
├── cmd/                    # Application entry points
│   ├── server/            # HTTP server
│   ├── migrate/           # Database migrations
│   └── seed/              # Database seeding
├── internal/              # Private application code
│   ├── handler/           # HTTP handlers (controllers)
│   ├── service/           # Business logic
│   ├── repository/        # Data access layer
│   ├── model/             # Domain models
│   ├── middleware/        # Fiber middleware
│   └── config/            # Configuration
├── pkg/                   # Public reusable packages
│   ├── ai/               # AI generation utilities
│   ├── marketplace/       # Marketplace API clients
│   └── utils/            # Common utilities
├── frontend/              # SvelteKit frontend
│   ├── src/
│   │   ├── routes/       # SvelteKit routes
│   │   ├── lib/          # Utilities & stores
│   │   └── components/   # Svelte components
│   ├── static/           # Static assets
│   └── tests/            # Frontend tests
├── migrations/            # SQL migration files
├── docker-compose.yml     # Local development setup
└── .env.example          # Environment template
```

## 🧪 Testing

### Test Suite

- **Backend Testing:**
  - **Framework:** Go testing + testify
  - **Coverage Target:** 85%
  - **Test Types:**
    - Unit Tests: Service layer, repository layer
    - Integration Tests: API endpoints, database operations
    - Benchmark Tests: AI generation performance

- **Frontend Testing:**
  - **Framework:** Vitest + Testing Library
  - **Coverage Target:** 75%
  - **Test Types:**
    - Unit Tests: Component logic, stores
    - Integration Tests: User workflows
    - E2E Tests: Critical user journeys dengan Playwright

### Running Tests

**Backend Tests:**
```bash
# Run semua tests
go test ./...

# Run dengan coverage
go test -cover ./...

# Run specific test file
go test ./internal/service/...

# Run benchmarks
go test -bench=. ./...

# Generate coverage report
go test -coverprofile=coverage.out ./...
go tool cover -html=coverage.out
```

**Frontend Tests:**
```bash
cd frontend

# Run semua tests
pnpm run test

# Run dengan coverage
pnpm run test:coverage

# Run E2E tests
pnpm run test:e2e

# Run tests in watch mode
pnpm run test:watch
```

## 🚢 Deployment

### Environments

- **Development:** Local development dengan Docker Compose
- **Staging:** Oracle Cloud dengan staging database
- **Production:** Oracle Cloud dengan high-availability setup

### Deployment Process

**1. Backend Deployment (via Coolify)**

- Push ke branch `main` → automatic build & deploy
- Build process:
  ```bash
  # Build Go binary
  go build -o captionmania cmd/server/main.go

  # Run migrations
  ./captionmania migrate up

  # Start server
  ./captionmania server
  ```

**2. Frontend Deployment (via Coolify)**

- Push ke branch `main` → automatic build & deploy
- Build process:
  ```bash
   cd frontend
   pnpm install
   pnpm run build
  ```

**3. Manual Deployment (jika perlu)**

   ```bash
   # Pull latest code
   git pull origin main

   # Backend
   go build -o captionmania cmd/server/main.go
   ./captionmania migrate up
   systemctl restart captionmania

   # Frontend
   cd frontend
   pnpm install
   pnpm run build
   ```

### Environment Variables

**Required variables (Backend):**

- `DB_HOST` - PostgreSQL host
- `DB_PORT` - PostgreSQL port (5432)
- `DB_NAME` - Database name
- `DB_USER` - Database username
- `DB_PASSWORD` - Database password
- `OPENAI_API_KEY` - OpenAI API key untuk GPT-4
- `JWT_SECRET` - Secret untuk JWT token signing
- `MIDTRANS_SERVER_KEY` - Midtrans server key

**Required variables (Frontend):**

- `VITE_API_BASE_URL` - Backend API URL
- `VITE_APP_URL` - Frontend application URL

**Optional variables:**

- `REDIS_URL` - Redis connection untuk caching
- `S3_BUCKET` - Cloudflare R2 bucket name
- `S3_ACCESS_KEY` - R2 access key
- `S3_SECRET_KEY` - R2 secret key
- `SENDGRID_API_KEY` - SendGrid API key untuk emails

**Secret management:** Semua secrets disimpan di environment variables, tidak ada hardcoded secrets.

## 📊 Key Metrics & Monitoring

### Business Metrics

- [ ] **Active Users:** Target 1,000+ active users (Month 3)
- [ ] **Captions Generated:** Target 100,000+ captions generated (Month 6)
- [ ] **User Engagement:** 70% monthly active users
- [ ] **Bulk Usage:** 40% dari total captions dari bulk generation
- [ ] **Freemium Conversion:** Target 8-12% free-to-paid conversion rate
- [ ] **Average Revenue Per User (ARPU):** Target Rp 75,000/user/month
- [ ] **Churn Rate:** < 5% monthly churn rate (paid users)
- [ ] **Viral Coefficient:** Target 1.2 (setiap user bring 0.2 user lain)

### Technical Metrics

- [ ] **Generation Speed:** < 3 seconds per caption (single)
- [ ] **Bulk Generation Speed:** < 30 seconds untuk 100 captions
- [ ] **Response Time:** < 500ms average API response
- [ ] **Uptime:** 99.5% uptime
- [ ] **Error Rate:** < 1% error rate
- [ ] **Concurrent Users:** Support 1,000+ concurrent generations

### Monitoring Setup

- **Error Tracking:** Custom Go error logging + Sentry
- **Performance Monitoring:** Custom dashboard dengan Fiber middleware
- **Uptime Monitoring:** Cloudflare monitoring + custom health checks
- **Business Metrics:** Custom analytics dashboard (user growth, caption generation, revenue)
- **AI Usage Tracking:** Token usage, cost per generation, model performance

## 🔐 Security

### Security Measures

- [ ] **Authentication:** JWT tokens untuk API authentication
- [ ] **Authorization:** Role-based access control (Free, Premium, Admin)
- [ ] **Rate Limiting:** Fiber rate limiter untuk API endpoints
- [ ] **Input Validation:** Struct validation untuk semua request payloads
- [ ] **SQL Injection Prevention:** Parameterized queries dengan pgx driver
- [ ] **XSS Prevention:** Input sanitization untuk AI-generated content
- [ ] **CORS Configuration:** Strict CORS untuk frontend-backend communication

### Security Checklist

- [x] HTTPS enabled (Cloudflare SSL)
- [x] Environment variables secured
- [x] Database connections encrypted
- [x] User passwords properly hashed (bcrypt)
- [x] API rate limiting implemented (100 requests/minute untuk free users)
- [x] CORS properly configured
- [ ] Content moderation untuk AI-generated captions (hate speech, spam detection)
- [ ] API key rotation mechanism

### Content Moderation

- **Profanity Filter:** Detect dan block inappropriate language
- **Spam Detection:** Prevent repetitive/generic captions
- **Hate Speech Detection:** Filter offensive content
- **Trademark Protection:** Prevent unauthorized brand usage

## 📚 Documentation

### Internal Documentation

- **Technical Specs:** [link ke technical documentation]
- **API Documentation:** [link ke API docs - Swagger/OpenAPI]
- **Database Schema:** [link ke database docs]
- **Deployment Guide:** [link ke deployment guide]
- **AI Model Training:** [link ke training data documentation]

### User Documentation

- **User Guide:** [link ke user guide]
- **FAQ:** [link ke FAQ]
- **Video Tutorials:** [link ke video tutorials]
- **Best Practices:** [link ke caption writing best practices]
- **Marketplace Guides:**
  - Tokopedia SEO Guide
  - Shopee Product Description Guide
  - TikTok Shop Caption Guide

## 🤝 Team & Roles

### Development Team

- **Tech Lead:** Najib (Backend Go & Architecture)
- **Frontend Developer:** [Nama] (SvelteKit UI/UX)
- **AI Engineer:** [Nama] (Prompt engineering, model fine-tuning)
- **DevOps Engineer:** [Nama] (Infrastructure & Deployment)

### External Stakeholders

- **Product Owner:** [Nama] (Business Requirements)
- **UI/UX Designer:** [Nama] (Design System)
- **QA Engineer:** [Nama] (Testing & Quality)
- **Domain Expert:** [Nama] (Marketplace seller experience, SEO knowledge)
- **Marketing:** [Nama] (Growth strategy, viral marketing)

## 🆘 Support & Troubleshooting

### Common Issues

1. **AI generation timeout**
   - Solution: Check OpenAI API quota, increase timeout di Fiber config

2. **Bulk generation slow**
   - Solution: Implement worker pool dengan goroutines, optimize database queries

3. **Frontend build failed**
   - Solution: Clear pnpm cache, run `pnpm install` dan `pnpm run build`

4. **Database connection failed**
   - Solution: Check .env database configuration, ensure PostgreSQL service is running

5. **Caption quality not good**
   - Solution: Adjust prompt templates, add more training data dari successful listings

### Getting Help

- **Slack Channel:** #captionmania-development
- **Emergency Contact:** [contact info]
- **Documentation:** [link ke troubleshooting guide]
- **AI Support:** [link ke AI tuning guide]

## 📈 Roadmap

Lihat [roadmap.md](./roadmap.md) untuk detail perkembangan produk CaptionMania.

**Milestone Highlights:**
- **M1-M3:** MVP Core (Single caption generation, basic AI models)
- **M4-M6:** Bulk Processing & Analytics (CSV upload, generation history)
- **M7-M9:** Marketplace Integration (Tokopedia/Shopee/TikTok Shop API)
- **M10:** Advanced Features (A/B testing, template library, analytics dashboard)

## 🔄 Changelog

Lihat [changelog.md](./changelog.md) untuk riwayat perubahan CaptionMania.

## 🐛 Known Issues

Lihat [known-issues.md](./known-issues.md) untuk daftar bug dan limitation yang diketahui.

## 💰 Pricing & Licensing

### Freemium Model

**Free Tier (Open Source):**
- **Price:** Rp 0 (gratis)
- **License:** MIT (fully open source)
- **Limits:** 10 captions/month, single generation only, basic tones only
- **Purpose:** Untuk seller baru, testing platform, proof of concept
- **Support:** Community only
- **AI Model:** GPT-3.5 Turbo (faster, cheaper)

**Credit-Based Pricing (Pay-Per-Use):**
- **Starter Pack:** Rp 49,000 untuk 100 credits (Rp 490/caption)
- **Standard Pack:** Rp 199,000 untuk 500 credits (Rp 398/caption - 19% discount)
- **Professional Pack:** Rp 490,000 untuk 1,500 credits (Rp 327/caption - 33% discount)
- **Usage:** 1 credit = 1 caption generation (single atau bulk)
- **Validity:** Credits valid selama 6 months
- **Features:** All tones, bulk generation, hashtag recommendation
- **AI Model:** GPT-4 Turbo (better quality)

**Subscription Pricing (Unlimited):**
- **Monthly Plan:** Rp 99,000/bulan (unlimited captions)
- **Annual Plan:** Rp 990,000/tahun (Rp 82,500/bulan - 17% discount)
- **Features:** Unlimited generations, priority processing, bulk unlimited, A/B testing (M7+), analytics dashboard (M8+)
- **Support:** Priority email & WhatsApp support
- **AI Model:** GPT-4 Turbo + Claude 3.5 Sonnet (best quality)

**Enterprise Plan (Custom Pricing):**
- **Pricing:** Rp 5-20M/month
- **Purpose:** Untuk agency, social media management company
- **Features:** API access, custom integrations, dedicated AI model fine-tuning, team collaboration, white-label option
- **Support:** Dedicated account manager, custom training sessions, SLA guarantee
- **AI Model:** Custom fine-tuned model untuk brand-specific tones

📖 **Detailed Pricing:** [pricing-model.md](./pricing-model.md) untuk complete pricing breakdown

### Revenue Model

**Primary Revenue Streams:**
1. **Credit Sales:** 60% dari revenue (pay-per-use model)
2. **Subscription:** 30% dari revenue (recurring revenue)
3. **Enterprise Plans:** 10% dari revenue (high-value clients)

**Cost Structure:**
- **AI API Costs:** ~40% dari revenue (OpenAI/Anthropic API costs)
- **Hosting & Infrastructure:** ~15% dari revenue
- **Development & Maintenance:** ~25% dari revenue
- **Marketing & Sales:** ~20% dari revenue

**Breakeven Analysis:**
- **Monthly Fixed Costs:** Rp 15,000,000 (development, hosting, marketing)
- **Variable Costs:** Rp 200 per caption (AI API cost)
- **Breakeven Point:** 75,000 captions/month @ Rp 490/caption (free tier conversion)

## 🎯 Growth Strategy

### Acquisition Channels

1. **Organic Social Media:**
   - TikTok: Before/After content, testimoni seller, tutorial videos
   - Instagram: Carousel tips, infographics, user-generated content
   - Twitter/X: Thread tentang marketplace tips, SEO strategies

2. **Paid Advertising:**
   - Facebook Ads: Target online sellers, dropshipper
   - Google Ads: Target " Tokopedia caption generator", "Shopee description maker"
   - TikTok Ads: Target sellers & small business owners

3. **Partnership:**
   - Marketplace seller communities (Tokopedia/Shopee Seller Groups)
   - E-commerce course providers
   - Dropshipper communities
   - Reseller/Agency networks

4. **Content Marketing:**
   - Blog: "10 Caption Template untuk Produk Fashion"
   - YouTube: "Cara Menulis Caption Tokopedia yang Menjual"
   - Podcast: Guest di e-commerce podcasts

### Viral Mechanics

1. **Social Proof:**
   - Testimoni video: "Omzet naik 3x setelah pakai CaptionMania"
   - Before/After comparison: Screenshot produk view count
   - User-generated content: Seller share hasil caption mereka

2. **Referral Program:**
   - 10 free credits untuk setiap referral yang signup
   - Referrer dapat 5% dari semua pembelian referral (lifetime)

3. **Free Value:**
   - Free caption generator tool di website (with watermark/branding)
   - Free email course: "5 Hari Jago Jualan di Tokopedia dengan Caption"
   - Free downloadable PDF: "100 Template Caption untuk Produk Fashion"

### Retention Strategies

1. **Gamification:**
   - Daily streak rewards: Generate caption setiap hari → bonus credits
   - Achievement badges: "100 Captions Generated", "Bulk Master"
   - Leaderboard: Top generators bulan ini

2. **Habit Formation:**
   - Email reminder: "Waktunya upload produk hari ini, generate caption di CaptionMania!"
   - Push notification: "Trending hashtag hari ini: #FlashSale #BigSale"

3. **Feature Expansion:**
   - Template saving: Simpan favorite prompts untuk quick access
   - Generation history: Lihat semua caption yang pernah dibuat
   - Copy-paste friendly: One-click copy dengan formatting

---

**Last Updated:** 2026-01-06
**Version:** 0.1.0-alpha (MVP Scope: M1-M3 - 3 months)
**Maintainer:** Najib Zain (Lead Developer)

**MVP Timeline:**
- **M1-M3 (3 months):** MVP Core - Single generation, basic AI, free tier
- **M4-M6 (6 months):** Growth Stage - Bulk processing, credit system, basic analytics
- **M7-M9 (9 months):** Scale Stage - Marketplace integration, A/B testing, advanced features
- **M10 (12 months):** Maturity - Enterprise features, custom models, API access

## 🏆 Success Metrics (Year 1)

### User Metrics
- **Total Signups:** 5,000 users
- **Active Users (Monthly):** 1,500 users (30% activation rate)
- **Paid Users:** 300 users (20% conversion dari active users)

### Revenue Metrics
- **Monthly Recurring Revenue (MRR):** Rp 30,000,000 (300 paid users @ Rp 99,000 avg)
- **Annual Recurring Revenue (ARR):** Rp 360,000,000
- **Credit Sales Revenue:** Rp 15,000,000/bulan (additional to MRR)
- **Total Revenue Year 1:** Rp 500,000,000

### Product Metrics
- **Total Captions Generated:** 500,000 captions
- **Average Captions/User:** 333 captions/user (paid users)
- **Bulk Generation %:** 40% dari total captions
- **User Satisfaction:** 4.5/5 rating

### Growth Metrics
- **Viral Coefficient:** 1.2 (setiap user bring 0.2 user lain)
- **Month-Over-Month Growth:** 25% average
- **Churn Rate:** < 5% monthly churn (paid users)
- **Customer Acquisition Cost (CAC):** Rp 150,000
- **Lifetime Value (LTV):** Rp 1,200,000 (8 months average subscription)
- **LTV:CAC Ratio:** 8:1 (healthy benchmark)

---

**Next Steps:**
1. Finalize MVP scope (M1-M3 features)
2. Design database schema (users, credits, generations, templates)
3. Setup Go + Fiber backend structure
4. Setup SvelteKit frontend with Skeleton UI
5. Integrate OpenAI API untuk caption generation
6. Implement basic authentication & authorization
7. Build credit system & payment gateway (Midtrans)
8. Launch MVP ke beta users (20-30 seller friends)
9. Gather feedback & iterate
10. Public launch dengan social media campaign

**Questions?** Contact Najib di [email/WhatsApp/Slack]
