# 🎯 Namerics

> AI-Powered Username Generator & Profile Platform untuk Digital Identity Management

## 🏷️ Product Identity

- **Nama Produk:** Namerics
- **Status:** 📋 Planning Phase
- **Repo Code:** `github.com/akordium/namerics` (To be created)
- **Live Site:** https://namerics.com
- **Staging:** https://staging.namerics.com
- **Project Management:** [Link ke GitHub Project Board]

## 📋 Quick Overview

**Tagline:** Username Generator Cerdas dengan Profile Page & Analytics

**Deskripsi Singkat:** Platform SaaS freemium yang membantu content creator, gamer, dan startup founder generate username yang memorable dan brandable dengan AI. Dilengkapi fitur availability checker multi-platform, profile page hosting (namerics.com/username), dan analytics untuk mengukur potensi SEO dan popularity score username.

**Target Market:**

- **Primary:** Content creators (YouTuber, TikToker, Instagram influencers) yang membutuhkan username yang catchy dan konsisten di semua platform
- **Secondary:** Gamers dan streamers yang ingin username yang mudah diingat dan available di gaming platforms
- **Tertiary:** Startup founders dan brand agencies yang mencari brandable usernames untuk produk baru
- **Quaternary:** Social media managers dan marketing professionals yang manage multiple brand identities

**5 Fitur Utama:**

1. **AI Username Generator** - Generate creative, brandable usernames berdasarkan keyword, niche, desired vibe (professional, playful, mysterious, dll)
2. **Multi-Platform Availability Checker** - Real-time check ketersediaan username di Instagram, Twitter/X, TikTok, YouTube, dan domain TLDs
3. **Profile Page Hosting** - Subhosting profile page sederhana di namerics.com/username dengan custom domain support
4. **Username Analytics** - Popularity score, SEO potential, brandability metrics, dan trend analysis
5. **Bulk Generation & Export** - Generate 100+ username variations sekaligus dengan export ke CSV/JSON

**Fitur Tambahan (Post-MVP):**

- **AI Username Brokerage** (Marketplace) - Jual beli username yang sudah ada dengan premium valuation (TBD)
- **Brand Identity Suite** - Logo generator, color palette suggestions, brand voice alignment untuk username yang dipilih (TBD)
- **Social Media Integration** - One-click claim username di semua platforms dengan OAuth integration (TBD)
- **Username Monitoring** - Alerts ketika username yang diinginkan menjadi available (TBD)

**Problem yang Diselesaikan:**
- **Username brainstorming fatigue** - Creator menghabiskan hours mencoba kombinasi manual yang berulang-ulang
- **Platform inconsistency** - Username yang diinginkan available di Instagram tapi taken di Twitter, menyebabkan brand fragmentation
- **Lack of data-driven decisions** - Tidak tahu apakah username yang dipilih SEO-friendly atau punya high brandability score
- **No central profile** - Tidak ada satu tempat untuk showcase semua social media links dalam satu clean profile page
- **Missed opportunities** - Bagus username di-snap oleh orang lain karena tidak ada monitoring system

## 🛠 Tech Stack

### Backend

- **Framework/Language:** RedwoodSDK (TypeScript/JavaScript)
- **Runtime:** Cloudflare Workers (Edge computing)
- **Database:** Cloudflare D1 (SQLite at edge) + Durable Objects untuk state management
- **API:** GraphQL + RESTful hybrid

### Frontend

- **Framework:** RedwoodJS React components
- **Component Library:** Redwood UI + Custom Tailwind components
- **Styling:** Tailwind CSS 3
- **State Management:** React Query + Redwood Cells
- **AI Integration:** OpenAI GPT-4 API untuk creative username generation

### Infrastructure

- **Hosting:** Cloudflare Workers (Global edge deployment)
- **CDN:** Cloudflare CDN (included with Workers)
- **Deployment:** Wrangler CLI + CI/CD via GitHub Actions
- **Monitoring:** Cloudflare Analytics + Custom Sentry integration

### Third-party Services

- **AI/ML:**
  - **OpenAI GPT-4** - Primary AI engine untuk creative username generation
  - **Anthropic Claude** (Backup) - Alternative AI model untuk diversity
- **Platform APIs:**
  - **Instagram Graph API** - Username availability check
  - **Twitter/X API** - Username availability check
  - **TikTok API** - Username availability check
  - **YouTube Data API** - Channel name availability check
- **Domain Services:**
  - **GoDaddy API** - Domain availability check
  - **Namecheap API** - Alternative domain checker
- **Email:** SendGrid / Cloudflare Email Routing
- **Storage:** Cloudflare R2 (untuk profile assets, images)
- **Analytics:** Cloudflare Web Analytics + Posthog (user behavior tracking)

## 💻 Local Development Setup

### Prerequisites

- [ ] Node.js 18+ (LTS recommended)
- [ ] pnpm 8+ (package manager)
- [ ] TypeScript 5+
- [ ] Cloudflare Account (untuk Workers deployment)
- [ ] Wrangler CLI (`npm install -g wrangler`)
- [ ] PostgreSQL 15+ (untuk local development, optional - bisa menggunakan SQLite)

### Installation Steps

1. **Clone repository**

   ```bash
   git clone https://github.com/akordium/namerics.git
   cd namerics
   ```

2. **Install dependencies**

   ```bash
   pnpm install
   ```

3. **Environment setup**

   ```bash
   cp .env.example .env
   # Edit .env file dengan konfigurasi lokal
   ```

4. **Database setup**

   ```bash
   # Run migrations
   pnpm rw prisma migrate dev

   # Seed data (optional)
   pnpm rw prisma db seed

   # Generate Prisma client
   pnpm rw prisma generate
   ```

5. **Start development server**

   ```bash
   # Start Redwood dev server
   pnpm rw dev

   # Atau start specific services
   pnpm rw dev web  # Frontend only
   pnpm rw dev api  # Backend only
   ```

6. **Aplikasi berjalan di:**
   - Frontend: http://localhost:8910
   - GraphQL Playground: http://localhost:8910/graphql
   - Backend API: http://localhost:8911

### Development Commands

```bash
# Generate new scaffold (page, cell, component, etc)
pnpm rw g page home /
pnpm rw g component UsernameGenerator
pnpm rw g cell usernameSuggestions

# Database operations
pnpm rw prisma studio  # Open Prisma Studio (database GUI)
pnpm rw prisma migrate reset  # Reset database

# Testing
pnpm rw test

# Build for production
pnpm rw build

# Deploy to Cloudflare Workers
wrangler deploy
```

### Cloudflare Workers Setup

1. **Install Wrangler CLI**

   ```bash
   npm install -g wrangler
   ```

2. **Authenticate dengan Cloudflare**

   ```bash
   wrangler login
   ```

3. **Configure Wrangler**

   ```bash
   # Copy wrangler.example.toml ke wrangler.toml
   cp wrangler.example.toml wrangler.toml

   # Edit wrangler.toml dengan project settings
   ```

4. **Deploy Workers**

   ```bash
   # Deploy ke Cloudflare
   wrangler deploy

   # Deploy ke staging environment
   wrangler deploy --env staging
   ```

## 🧪 Testing

### Test Suite

- **Framework:** Jest + Testing Library (Redwood default)
- **Coverage Target:** 80%
- **Test Types:**
  - Unit Tests: Services, utilities, helper functions
  - Integration Tests: GraphQL queries/mutations, database operations
  - E2E Tests: Critical user journeys dengan Playwright
  - Component Tests: React component behavior

### Running Tests

```bash
# Run semua tests
pnpm rw test

# Run specific test file
pnpm rw test src/components/UsernameGenerator.test.tsx

# Run dengan coverage
pnpm rw test --coverage

# Run tests di watch mode
pnpm rw test --watch

# Run E2E tests
pnpm rw test e2e
```

### Testing Strategy

**Unit Testing:**
- AI username generation logic
- Availability checker service untuk setiap platform
- Analytics scoring algorithm
- Utility functions (string manipulation, validation)

**Integration Testing:**
- GraphQL API mutations dan queries
- Database operations (CRUD username suggestions)
- Third-party API integrations (OpenAI, social platforms)

**E2E Testing:**
- User flows: Generate username → Check availability → Save to favorites
- User flows: Create profile page → Customize → Publish
- User flows: Upgrade ke premium → Payment → Feature access

## 🚢 Deployment

### Environments

- **Development:** Local development dengan SQLite atau PostgreSQL
- **Staging:** Cloudflare Workers dengan staging database (D1)
- **Production:** Cloudflare Workers dengan production database (D1)

### Deployment Process

**1. Automated Deployment** (via GitHub Actions)

   - Push ke branch `main` → deploy ke production (Cloudflare Workers)
   - Push ke branch `develop` → deploy ke staging
   - Pull request ke `main` → deploy preview environment

**2. Manual Deployment** (via Wrangler CLI)

   ```bash
   # Build untuk production
   pnpm rw build

   # Deploy ke Cloudflare Workers
   wrangler deploy

   # Deploy ke staging
   wrangler deploy --env staging

   # Deploy specific worker
   wrangler deploy worker-username-checker
   ```

**3. Database Migration**

   ```bash
   # Create migration
   pnpm rw prisma migrate dev --name add_usernames_table

   # Deploy migration ke production
   pnpm rw prisma migrate deploy
   ```

### Environment Variables

**Required variables:**

- `DATABASE_URL` - Database connection string (Cloudflare D1 atau PostgreSQL)
- `OPENAI_API_KEY` - OpenAI API key untuk AI generation
- `ANTHROPIC_API_KEY` - Anthropic API key (backup AI model)
- `INSTAGRAM_ACCESS_TOKEN` - Instagram Graph API access token
- `TWITTER_API_KEY` - Twitter/X API key
- `TIKTOK_API_KEY` - TikTok API key
- `YOUTUBE_API_KEY` - YouTube Data API key
- `GODADDY_API_KEY` - GoDaddy API key untuk domain check
- `SENTRY_DSN` - Sentry DSN untuk error tracking
- `CLOUDFLARE_ACCOUNT_ID` - Cloudflare Account ID
- `CLOUDFLARE_API_TOKEN` - Cloudflare API Token

**Optional variables:**

- `REDIS_URL` - Redis URL untuk caching (Cloudflare KV)
- `SENDGRID_API_KEY` - SendGrid API key untuk email
- `STRIPE_SECRET_KEY` - Stripe secret key untuk payments
- `WEBHOOK_SECRET` - Webhook secret untuk payment verification

**Secret management:** Semua secrets disimpan di Cloudflare Secrets Manager, tidak ada hardcoded secrets. Gunakan `wrangler secret put` untuk menyimpan secrets:

```bash
wrangler secret put OPENAI_API_KEY
wrangler secret put DATABASE_URL
```

## 📊 Key Metrics & Monitoring

### Business Metrics

- [ ] **MAU (Monthly Active Users):** Target 10,000+ users (Year 1)
- [ ] **Usernames Generated:** Target 1,000,000+ usernames generated (Year 1)
- [ ] **Profile Pages Created:** Target 5,000+ active profile pages (Year 1)
- [ ] **Freemium Conversion:** Target 8-12% free-to-paid conversion rate
- [ ] **ARPPU (Avg Revenue Per Paying User):** Target Rp 49,000/month
- [ ] **User Engagement:** 60% monthly active users
- [ ] **Viral Coefficient:** Target 1.5+ (setiap user brings 1.5 new users via sharing)
- [ ] **Availability Check Accuracy:** 95%+ accuracy rate

### Technical Metrics

- [ ] **Response Time:** < 200ms average (edge deployment advantage)
- [ ] **AI Generation Speed:** < 3 seconds untuk 50 username suggestions
- [ ] **Uptime:** 99.9% uptime (Cloudflare Workers SLA)
- [ ] **Error Rate:** < 0.5% error rate
- [ ] **Global Latency:** < 100ms p95 latency (worldwide edge coverage)
- [ ] **Database Performance:** < 50ms query time (D1 edge database)

### Monitoring Setup

- **Error Tracking:** Sentry integration dengan Cloudflare Workers
- **Performance Monitoring:** Cloudflare Analytics + Custom Web Vitals tracking
- **Uptime Monitoring:** Cloudflare monitoring + Pingdom untuk external monitoring
- **Business Metrics:** Posthog analytics untuk user behavior tracking
- **AI Usage Tracking:** OpenAI API usage monitoring untuk cost management

### Cloudflare-Specific Metrics

- **Workers Invocations:** Total function calls per day
- **Edge Response Hits:** Cache hit rate di Cloudflare CDN
- **D1 Database Queries:** Total database queries dan performance
- **KV Reads/Writes:** Key-value store operations untuk caching
- **Cold Starts:** Workers cold start frequency dan duration

## 🔐 Security

### Security Measures

- [ ] **Authentication:** Redwood Auth dengan JWT tokens + Social login (Google, GitHub)
- [ ] **Authorization:** Role-based access control (Free, Premium, Enterprise)
- [ ] **API Security:** Rate limiting, CORS proper configuration, API key rotation
- [ ] **Input Validation:** Zod validation schema untuk semua inputs
- [ ] **Data Encryption:** Sensitive user data encrypted at rest dan in transit
- [ ] **DDoS Protection:** Cloudflare DDoS protection (automatic dengan Workers)

### Security Checklist

- [x] HTTPS enabled (Cloudflare SSL automatically)
- [x] Environment variables secured (Cloudflare Secrets Manager)
- [x] Database connections encrypted (D1 encryption at rest)
- [x] User passwords properly hashed (bcrypt)
- [x] API rate limiting implemented (Cloudflare Rate Limiting)
- [x] CORS properly configured untuk Workers
- [x] CSRF token validation for all mutations
- [ ] Content Security Policy (CSP) headers configured
- [ ] Regular security audits via GitHub Dependabot
- [ ] API keys rotated setiap 90 days

### Rate Limiting Strategy

- **Free Tier:** 100 API requests/hour untuk username generation
- **Premium Tier:** 1,000 API requests/hour
- **Enterprise Tier:** Custom rate limits
- **Abuse Detection:** Automatic banning untuk suspicious patterns

## 📚 Documentation

### Internal Documentation

- **Technical Specs:** [link ke technical documentation]
- **API Documentation:** [link ke GraphQL docs at /graphql]
- **Database Schema:** [link ke Prisma schema docs]
- **Deployment Guide:** [link ke deployment guide]
- **AI Prompts:** [link ke prompt engineering documentation]

### User Documentation

- **User Guide:** [link ke user guide]
- **FAQ:** [link ke FAQ]
- **Video Tutorials:** [link ke video tutorials]
- **API Reference:** [link ke API reference untuk developers]

## 🤝 Team & Roles

### Development Team

- **Tech Lead:** Najib (Backend & Architecture)
- **Frontend Developer:** [Nama] (UI/UX Implementation)
- **AI Engineer:** [Nama] (Prompt Engineering & AI Integration)
- **DevOps Engineer:** [Nama] (Cloudflare Infrastructure & Deployment)

### External Stakeholders

- **Product Owner:** [Nama] (Business Requirements)
- **UI/UX Designer:** [Nama] (Design System & User Flows)
- **QA Engineer:** [Nama] (Testing & Quality Assurance)
- **Domain Expert:** [Nama] (Social Media & Branding Knowledge)
- **Growth Marketer:** [Nama] (Viral Marketing & Influencer Collaboration)

## 🆘 Support & Troubleshooting

### Common Issues

1. **Cloudflare Workers deployment failed**
   - Solution: Check `wrangler.toml` configuration, verify Cloudflare API token permissions

2. **OpenAI API rate limit exceeded**
   - Solution: Implement retry logic dengan exponential backoff, consider upgrading API tier

3. **Social media API authentication failed**
   - Solution: Verify access tokens are valid dan not expired, check API quotas

4. **Database migration stuck**
   - Solution: Check D1 database status, ensure no ongoing migrations, retry deployment

5. **Profile page not loading**
   - Solution: Clear Cloudflare cache, check KV store values, verify DNS propagation

### Getting Help

- **Slack Channel:** #namerics-development
- **Emergency Contact:** [contact info]
- **Documentation:** [link ke troubleshooting guide]
- **Cloudflare Community:** https://community.cloudflare.com

## 📈 Roadmap

Lihat [roadmap.md](./roadmap.md) untuk detail perkembangan produk Namerics.

## 🔄 Changelog

Lihat [changelog.md](./changelog.md) untuk riwayat perubahan Namerics.

## 🐛 Known Issues

Lihat [known-issues.md](./known-issues.md) untuk daftar bug dan limitation yang diketahui.

## 🚀 Viral Growth Strategy

### TikTok/Instagram Influencer Collaboration

**Target Demographics:**
- Micro-influencers (10K-100K followers) yang struggle dengan username ideas
- Gen Z creators yang memulai channel baru
- Gamers yang rebranding atau membuat persona baru

**Collaboration Strategy:**
1. **Sponsored Challenge:** #NamericsUsernameChallenge - creators generate username untuk niche mereka
2. **Behind-the-Scenes Content:** Show creators menggunakan Namerics untuk brainstorm username
3. **Testimonial Campaign:** "I found my perfect username in 5 minutes dengan Namerics"
4. **Affiliate Program:** Creators dapat commission Rp 10,000 per referral yang convert ke premium

**Viral Hooks:**
- "Generate 50 creative usernames dalam 3 detik"
- "Cek ketersediaan username di semua platform sekaligus"
- "Dapatkan username .com yang masih available"
- "Profile page gratis di namerics.com/username"

### Social Proof Features

- **Trending Usernames:** Show username yang sedang populer (real-time)
- **Celebrity Username Analysis:** Breakdown why famous usernames work
- **Username Hall of Fame:** Showcase most creative usernames generated

### Word-of-Mouth Mechanics

- **Shareable Results:** "Bagikan hasil username generation" dengan shareable image cards
- **Username Comparison:** "Show friends 10 alternative usernames" - virality loop
- **Profile Page Bragging:** Users share profile page mereka → free marketing

---

**Last Updated:** 2026-01-06
**Version:** 0.1.0-planning (Pre-MVP)
**Maintainer:** Najib Zain (Lead Developer)

**MVP Timeline (Estimate):**
- **M1-M3 (3 months):** Core AI generation + availability checker
- **M4-M6 (3 months):** Profile page hosting + analytics
- **M7-M10 (4 months):** Premium features + marketplace (TBD)

## 💰 Pricing & Licensing

### Freemium Model

**Basic Tier (Free):**
- **Price:** Rp 0 (gratis)
- **Features:**
  - AI username generator (10 requests/hour)
  - Single-platform availability check (Instagram only)
  - Basic profile page (namerics.com/username)
  - Limited customization (5 themes)
  - No analytics
  - Community support
- **Purpose:** Untuk casual users, proof of concept

**Premium Tier (Paid):**
- **Price:** Rp 49,000/bulan atau Rp 490,000/tahun (2 months free = 17% discount)
- **Features:**
  - Unlimited AI username generation
  - Multi-platform availability check (Instagram, Twitter, TikTok, YouTube, Domain)
  - Advanced profile page dengan custom domain support
  - Username analytics (popularity score, SEO potential, brandability metrics)
  - Bulk generation (100+ usernames sekaligus)
  - Premium themes dan full customization
  - Export ke CSV/JSON
  - Priority email & WhatsApp support
- **Payment Methods:** GoPay, OVO, DANA, Credit Card (via Midtrans/Stripe)

**Enterprise Tier (Custom Pricing):**
- **Price:** Rp 500,000 - Rp 2,000,000/bulan
- **Purpose:** Untuk brand agencies, marketing agencies, enterprise companies
- **Features:**
  - Unlimited everything
  - API access untuk integrasi dengan internal tools
  - White-label profile pages
  - Team collaboration features
  - Dedicated account manager
  - Custom AI training (fine-tune untuk brand voice)
  - SLA guarantee
- **Contract:** Annual commitment required

### Early Bird Pricing (First 3 Months)

- **Lifetime Discount:** First 1,000 users dapat Rp 29,000/bulan (40% off forever)
- **Lifetime Free Tier:** Early adopters keep enhanced free tier features

📖 **Detailed Pricing:** [pricing-model.md](./pricing-model.md) untuk complete pricing breakdown

---

## 🎯 Milestones

### MVP Phase (M1-M6) - 6 months

**M1: Foundation (Month 1)**
- [ ] Project setup dengan RedwoodJS
- [ ] Database schema design (Prisma)
- [ ] Basic UI skeleton dengan Tailwind
- [ ] Cloudflare Workers deployment pipeline
- [ ] OpenAI API integration untuk basic generation

**M2: Core Features (Month 2)**
- [ ] AI username generation engine
- [ ] Instagram availability checker
- [ ] Basic user authentication
- [ ] Username suggestion storage
- [ ] Frontend generator interface

**M3: Platform Integration (Month 3)**
- [ ] Twitter/X availability checker
- [ ] TikTok availability checker
- [ ] YouTube availability checker
- [ ] Domain availability checker
- [ ] Multi-platform comparison UI

**M4: Profile Pages (Month 4)**
- [ ] Profile page creation interface
- [ ] Profile page routing (namerics.com/username)
- [ ] Basic customization (themes, colors)
- [ ] Social media links integration
- [ ] Profile page preview

**M5: Analytics & Scoring (Month 5)**
- [ ] Popularity score algorithm
- [ ] SEO potential analysis
- [ ] Brandability metrics
- [ ] Analytics dashboard UI
- [ ] Historical data tracking

**M6: Monetization (Month 6)**
- [ ] Payment gateway integration (Midtrans/Stripe)
- [ ] Premium tier access control
- [ ] Subscription management
- [ ] Bulk generation feature
- [ ] Export functionality

### Post-MVP Phase (M7-M10) - 4 months

**M7: Advanced Features (Month 7)**
- [ ] Custom domain support untuk profile pages
- [ ] Advanced analytics & insights
- [ ] Username monitoring & alerts
- [ ] Bulk operations optimization

**M8: Growth Features (Month 8)**
- [ ] Viral sharing features
- [ ] Social media integration (one-click posting)
- [ ] Referral program
- [ ] Affiliate system

**M9: Marketplace (Month 9)** - TBD
- [ ] Username brokerage marketplace
- [ ] Escrow system untuk username transactions
- [ ] Username valuation algorithm
- [ ] Dispute resolution system

**M10: AI Enhancements (Month 10)** - TBD
- [ ] Custom AI fine-tuning untuk enterprise clients
- [ ] Brand identity suite (logo, color palette generation)
- [ ] Advanced prompt engineering
- [ ] Multi-language support

---

**Last Updated:** 2026-01-06
**Version:** 0.1.0-planning
**Maintainer:** Najib Zain (Lead Developer)
