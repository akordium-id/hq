# 🎂 BibiDiskon.id

> Platform Diskon Ulang Tahun - Diskon Spesial Hari Ini, Khusus yang Berulang Tahun!

## 🏷️ Product Identity

- **Nama Produk:** BibiDiskon
- **Tagline:** "Ultah Hari Ini? Diskon Spesial Menantimu!"
- **Status:** 💡 Concept Phase
- **Repo Code:** `github.com/akordium/bibidiskon` (Private)
- **Live Site:** https://bibidiskon.id
- **Staging:** https://staging.bibidiskon.id
- **Project Management:** [Link ke GitHub Project Board]

## 📋 Quick Overview

**Tagline:** Platform Diskon Ulang Tahun Terbesar di Indonesia

**Deskripsi Singkat:** Platform two-sided marketplace yang menghubungkan konsumen yang berulang tahun hari ini dengan merchant lokal yang menawarkan diskon eksklusif (10-50%). User mendaftar dengan tanggal lahir + verifikasi KTP, lalu mendapatkan daily list merchant diskon khusus ultah. Merchant mendapatkan customer baru dengan CAC rendah, konsumen mendapatkan diskon spesial hari ini. Platform mengambil fee 1% dari kedua pihak per transaksi.

**Target Market:**

- **Primary:** Konsumen Indonesia berusia 18-45 tahun yang aktif di social media
- **Secondary:** Merchant lokal F&B (kafe, restoran, kedai kopi)
- **Tertiary:** Retail lokal (fashion, beauty, electronics)
- **Quaternary:** Entertainment lokal (cinema, theme park, karaoke)

**5 Fitur Utama:**

1. **Registrasi dengan Verifikasi KTP** - User register dengan tanggal lahir + KTP verification untuk memastikan authentic birthday
2. **Daily Merchant List** - Setiap hari, user dapat list diskon khusus ultah dari berbagai merchant (10-50% off)
3. **QR Code Validation** - Validasi real-time di merchant dengan scan QR code dari user
4. **Gamification System** - Birthday leaderboard, biggest spender ultah bulan ini, achievement badges
5. **Merchant Dashboard** - Submit promo, analytics customer acquisition, redemption tracking

**Fitur Tambahan (Post-MVP):**

- **Gift Registry** - Wishlist hadiah ultah dari merchant yang bisa dibeli teman/keluarga
- **Group Birthday Deals** - Paket diskon untuk celebration bersama teman/keluarga
- **Birthday Cashback** - Cashback khusus ultah yang bisa dipakai bulan depan
- **Corporate Partnerships** - Integration dengan HR systems untuk employee birthday rewards

**Problem yang Diselesaikan:**

- **Konsumen:** Tidak ada platform khusus diskon ulang tahun di Indonesia - diskon tersebar di berbagai merchant tanpa centralization
- **Merchant:** Sulit mendapatkan customer baru dengan CAC rendah - platform ini提供 targeted marketing untuk birthday celebrants
- **Social Media Gap:** User suka share "happy birthday" experience tapi tidak ada platform yang facilitate viral sharing
- **Economic Inefficiency:** Merchant beri diskon random tanpa targeting → conversion rendah, bibidiskon provide targeted birthday discounts

**Competitive Edge:**

- **Viral Potential Sangat Tinggi:** User share "happy birthday + diskon" di Instagram/WhatsApp/TikTok → organic growth
- **Unit Economics Unik:** Fee 1% dari kedua pihak → margin 2% per transaksi (sustainable jika volume tinggi)
- **Network Effect:** Semakin banyak merchant → semakin menarik untuk user, dan vice versa
- **Data Richness:** Birthday data + purchase behavior → powerful segmentation untuk future features
- **Low CAC untuk Merchant:** Customer acquisition cost jauh lebih rendah vs traditional ads

## 🛠 Tech Stack

### Backend

- **Runtime:** Deno 2.x (TypeScript)
- **Framework:** Fresh 2.x (Deno web framework)
- **Database:** Supabase (PostgreSQL 15)
- **API:** RESTful API dengan Fresh handlers

### Frontend

- **Framework:** Fresh 2.x (Island architecture untuk interactive components)
- **Styling:** Tailwind CSS 3 (via Preact & Twind)
- **State Management:** Preact signals + Fresh islands
- **Real-time:** Supabase Realtime untuk live updates

### Infrastructure

- **Hosting:** Deno Deploy (edge deployment)
- **Database:** Supabase (managed PostgreSQL)
- **CDN:** Deno Deploy edge network (global)
- **Storage:** Supabase Storage (KTP uploads, merchant images)
- **Monitoring:** Deno Deploy metrics + custom error tracking

### Third-party Services

- **Identity Verification:**
  - **Dukcapil API** (future) - KTP validation dengan government database
  - **OCR Space** - KTP OCR untuk auto-extract tanggal lahir
- **Payment Gateways:**
  - **Midtrans** - Payment processing untuk merchant transactions
  - **QRIS** - QR code payment standard Indonesia
- **Communication:**
  - **SendGrid** - Email notifications (3 days before birthday)
  - **WhatsApp Business API** - Push notifications untuk birthday reminders
- **Analytics:**
  - **Google Analytics 4** - User behavior tracking
  - **Supabase Analytics** - Real-time metrics dashboard
- **Maps:**
  - **Google Maps API** - Merchant location discovery

## 💻 Local Development Setup

### Prerequisites

- [ ] Deno 2.x
- [ ] Supabase CLI (untuk local development)
- [ ] Node.js 18+ (untuk Supabase UI jika perlu)
- [ ] Git

### Installation Steps

1. **Clone repository**

   ```bash
   git clone https://github.com/akordium/bibidiskon.git
   cd bibidiskon
   ```

2. **Install Deno (jika belum)**

   ```bash
   # Linux/Mac
   curl -fsSL https://deno.land/install.sh | sh

   # Windows (PowerShell)
   irm https://deno.land/install.ps1 | iex
   ```

3. **Environment setup**

   ```bash
   cp .env.example .env
   # Edit .env file dengan konfigurasi lokal
   ```

   Required environment variables:
   ```bash
   # Supabase Configuration
   SUPABASE_URL=your_supabase_url
   SUPABASE_ANON_KEY=your_supabase_anon_key
   SUPABASE_SERVICE_ROLE_KEY=your_supabase_service_role_key

   # App Configuration
   APP_URL=http://localhost:8000
   APP_NAME=BibiDiskon

   # External APIs
   SENDGRID_API_KEY=your_sendgrid_key
   MIDTRANS_SERVER_KEY=your_midtrans_key
   GOOGLE_MAPS_API_KEY=your_maps_key

   # JWT Secret (for Fresh sessions)
   JWT_SECRET=your_jwt_secret_here
   ```

4. **Start Supabase local (optional untuk development)**

   ```bash
   # Start Supabase stack
   supabase start

   # Run migrations
   supabase db reset

   # Link ke remote project (jika perlu)
   supabase link --project-ref your_project_ref
   ```

5. **Start development server**

   ```bash
   deno task start
   # atau
   deno run --allow-net --allow-env --allow-read main.ts
   ```

6. **Aplikasi berjalan di:** http://localhost:8000

### Development Commands

```bash
# Start development server with hot reload
deno task start

# Run database migrations
supabase db push

# Generate new migration
supabase migration new migration_name

# Open Supabase Studio (local database UI)
supabase db studio

# Format code
deno fmt

# Lint code
deno lint

# Run tests
deno task test

# Type checking
deno check main.ts
```

### Project Structure

```
bibidiskon/
├── main.ts                 # Entry point Fresh app
├── deno.json               # Deno configuration
├── import_map.json         # Import maps untuk dependencies
├── routes/                 # Fresh routes
│   ├── _404.tsx           # 404 page
│   ├── _app.tsx           # App wrapper
│   ├── index.tsx          # Homepage
│   ├── auth/              # Authentication routes
│   ├── merchant/          # Merchant dashboard
│   └── profile/           # User profile
├── islands/               # Interactive Preact components
│   ├── QRScanner.tsx      # QR code scanner component
│   └── MerchantList.tsx   # Merchant list with filters
├── components/            # React/Preact components
├── utils/                 # Helper functions
│   ├── supabase.ts       # Supabase client
│   ├── auth.ts           # Authentication utilities
│   └── validation.ts     # Input validation
├── supabase/             # Supabase functions & migrations
│   ├── functions/        # Edge functions (jika perlu)
│   └── migrations/       # SQL migrations
└── static/               # Static assets (images, CSS)
```

## 🧪 Testing

### Test Suite

- **Framework:** Deno's built-in test runner
- **Coverage Target:** 80%
- **Test Types:**
  - Unit Tests: Utility functions, validation logic
  - Integration Tests: Supabase queries, API endpoints
  - E2E Tests: Critical user journeys dengan Deno's testing

### Running Tests

```bash
# Run semua tests
deno test --allow-all

# Run specific test file
deno test tests/auth_test.ts

# Run dengan coverage
deno test --allow-all --coverage

# Watch mode
deno test --allow-all --watch
```

### Test Coverage

```bash
# Generate coverage report
deno coverage --lcov --output=coverage.lcov
```

## 🚢 Deployment

### Environments

- **Development:** Local development dengan Deno + Supabase local
- **Staging:** Deno Deploy + Supabase staging project
- **Production:** Deno Deploy + Supabase production project

### Deployment Process

**Automated Deployment (via GitHub Actions):**

1. **Push ke branch `main`** → Deploy ke production
2. **Push ke branch `develop`** → Deploy ke staging

**Manual Deployment:**

```bash
# Login ke Deno Deploy
deno deploy login

# Deploy ke production
deno deploy deploy --project=bibidiskon --prod --allow-net --allow-env

# Deploy ke staging
deno deploy deploy --project=bibidiskon-staging --allow-net --allow-env
```

**Database Migrations:**

```bash
# Push migrations ke production
supabase db push --linked

# Generate migration dari schema changes
supabase db pull
```

### Environment Variables

**Production Variables (Deno Deploy):**

- `SUPABASE_URL` - Supabase project URL
- `SUPABASE_ANON_KEY` - Supabase anonymous key
- `SUPABASE_SERVICE_ROLE_KEY` - Supabase service role key
- `JWT_SECRET` - JWT secret untuk sessions
- `SENDGRID_API_KEY` - SendGrid API key
- `MIDTRANS_SERVER_KEY` - Midtrans server key
- `GOOGLE_MAPS_API_KEY` - Google Maps API key
- `DENO_DEPLOYMENT_ID` - Deno Deploy deployment ID (auto-injected)

**Secret management:** Semua secrets disimpan di Deno Deploy environment variables, tidak ada hardcoded secrets.

### Deployment Checklist

- [ ] Database migrations applied
- [ ] Environment variables configured
- [ ] Supabase RLS policies enabled
- [ ] CDN cache cleared (jika perlu)
- [ ] Monitoring dashboards setup
- [ ] Error tracking configured

## 📊 Key Metrics & Monitoring

### Business Metrics

- [ ] **Monthly Active Users (MAU):** Target 10,000+ users (Month 6)
- [ ] **Merchant Onboard:** Target 500+ active merchants (Month 6)
- [ ] **Monthly Transactions:** Target 10,000+ transactions (break-even point)
- [ ] **User Retention:** 60% users return untuk birthday berikutnya
- [ ] **Merchant Retention:** 80% merchants continue promo setelah 3 bulan
- [ ] **Viral Coefficient:** 1.5+ (setiap 1 user bring 1.5 new users)
- [ ] **Average Order Value:** Target Rp 150,000+ per transaction
- [ ] **Conversion Rate:** 15% dari daily merchant view ke actual visit

### Technical Metrics

- [ ] **Response Time:** < 300ms average (Deno Deploy edge)
- [ ] **Uptime:** 99.9% uptime (Deno Deploy SLA)
- [ ] **Error Rate:** < 0.5% error rate
- [ ] **Database Performance:** < 50ms query time (Supabase)
- [ ] **QR Scan Success Rate:** 95%+ successful scans

### Unit Economics

**Per Transaction (assume Rp 150,000 transaction value):**

- **Merchant Fee (1%):** Rp 1,500
- **Customer Fee (1%):** Rp 1,500
- **Total Revenue:** Rp 3,000 per transaction

**Break-even Analysis:**

- **Fixed Costs (monthly):** Rp 15,000,000 (infrastructure, team)
- **Variable Costs:** Rp 500 per transaction (payment gateway, etc.)
- **Net per Transaction:** Rp 2,500
- **Break-even Volume:** 6,000 transactions per month

**Profitability Scenarios:**

- **5,000 transactions:** Rp 12,500,000 revenue - Rp 15M fixed - Rp 2.5M variable = **Loss Rp 5M**
- **10,000 transactions:** Rp 25M revenue - Rp 15M fixed - Rp 5M variable = **Profit Rp 5M**
- **20,000 transactions:** Rp 50M revenue - Rp 15M fixed - Rp 10M variable = **Profit Rp 25M**

### Monitoring Setup

- **Error Tracking:** Deno Deploy error logs + custom error handling
- **Performance Monitoring:** Deno Deploy metrics + Supabase analytics
- **Uptime Monitoring:** Deno Deploy health checks
- **Business Metrics:** Custom analytics dashboard (Supabase)

## 🔐 Security

### Security Measures

- [ ] **Authentication:** Supabase Auth dengan JWT tokens
- [ ] **Authorization:** Role-based access control (User, Merchant, Admin)
- [ ] **Data Encryption:** KTP images dan sensitive data encrypted di Supabase Storage
- [ ] **API Security:** Rate limiting, CORS proper configuration
- [ ] **Input Validation:** Zod validation untuk semua input forms
- [ ] **Row Level Security:** Supabase RLS policies untuk data isolation

### Security Checklist

- [x] HTTPS enabled (Deno Deploy auto SSL)
- [x] Environment variables secured (Deno Deploy secrets)
- [x] Database connections encrypted (Supabase)
- [x] User data properly hashed (bcrypt via Supabase Auth)
- [x] API rate limiting implemented (Supabase + custom middleware)
- [x] CORS properly configured
- [ ] CSRF token validation for all forms
- [ ] KTP data encrypted at rest
- [ ] Automatic deletion of KTP images setelah 30 hari

### Data Privacy

- **KTP Handling:** KTP hanya disimpan 30 hari untuk verification, lalu auto-delete
- **Data Minimization:** Hanya collect data yang benar-benar perlu (name, birthdate, phone)
- **User Consent:** Clear consent flow untuk data collection
- **GDPR/PDPA Compliance:** User bisa request data deletion anytime

## 🤝 Team & Roles

### Development Team

- **Tech Lead:** Najib (Backend & Architecture - Deno/Fresh)
- **Frontend Developer:** [Nama] (Preact/Fresh islands implementation)
- **Mobile Developer:** [Nama] (Future mobile app development)
- **DevOps Engineer:** [Nama] (Deno Deploy & Supabase management)

### External Stakeholders

- **Product Owner:** [Nama] (Business Requirements & Merchant Relations)
- **UI/UX Designer:** [Nama] (User experience & visual design)
- **QA Engineer:** [Nama] (Testing & quality assurance)
- **Marketing Lead:** [Nama] (User acquisition & viral campaigns)

## 🆘 Support & Troubleshooting

### Common Issues

1. **Supabase connection failed**
   - Solution: Check .env SUPABASE_URL & SUPABASE_ANON_KEY, ensure Supabase project is active

2. **QR code scanner not working**
   - Solution: Check browser permissions untuk camera, ensure HTTPS (required for camera access)

3. **KTP verification failed**
   - Solution: Check OCR Space API key, ensure KTP image quality is sufficient

4. **Deno Deploy build failed**
   - Solution: Check import_map.json dependencies, ensure all imports are correct

5. **Merchant redemption not working**
   - Solution: Check Supabase RLS policies, ensure merchant role has proper permissions

### Getting Help

- **Slack Channel:** #bibidiskon-development
- **Emergency Contact:** +62 815-9988-995 (via Akordium support)
- **Documentation:** [Link ke troubleshooting guide]

## 📈 Roadmap

### MVP Timeline (6 Months)

**M1 (Month 1): Foundation**
- [x] Project setup (Deno + Fresh + Supabase)
- [ ] Core database schema (users, merchants, promos, redemptions)
- [ ] Basic authentication (email/password)
- [ ] Simple user registration (name, birthdate, phone)

**M2 (Month 2): User Features**
- [ ] KTP upload & OCR verification
- [ ] Daily merchant list display
- [ ] User profile dashboard
- [ ] Birthday countdown & reminder

**M3 (Month 3): Merchant Features**
- [ ] Merchant registration & dashboard
- [ ] Promo submission system
- [ ] QR code generation & validation
- [ ] Redemption analytics

**M4 (Month 4): Core Features**
- [ ] Real-time QR scanning (merchant side)
- [ ] Transaction processing (Midtrans integration)
- [ ] Fee calculation & split (1% + 1%)
- [ ] Basic gamification (birthday leaderboard)

**M5 (Month 5): Communication & Growth**
- [ ] Email notifications (3 days before birthday)
- [ ] WhatsApp integration
- [ ] Social sharing features
- [ ] Referral system

**M6 (Month 6): Launch Preparation**
- [ ] Performance optimization
- [ ] Security audit
- [ ] Beta testing dengan 50 users + 20 merchants
- [ ] Marketing landing page
- [ ] Official launch

### Post-MVP (Months 7-12)

**M7-M9: Growth Features**
- [ ] Mobile apps (iOS + Android)
- [ ] Gift registry & wishlist
- [ ] Group birthday deals
- [ ] Advanced gamification (achievements, badges)

**M10-M12: Monetization Expansion**
- [ ] Birthday cashback system
- [ ] Corporate partnerships (HR integration)
- [ ] Premium merchant features (featured placement, analytics)
- [ ] API untuk third-party integrations

## 🐛 Known Issues

Lihat [known-issues.md](./known-issues.md) untuk daftar bug dan limitation yang diketahui.

## 🔄 Changelog

Lihat [changelog.md](./changelog.md) untuk riwayat perubahan BibiDiskon.

## 💰 Pricing & Business Model

### Revenue Model

**Transaction Fees (Primary Revenue):**
- **Merchant Fee:** 1% dari transaction value
- **Customer Fee:** 1% dari transaction value
- **Total Revenue:** 2% per transaction

**Example:**
- Transaction value: Rp 150,000
- Merchant fee (1%): Rp 1,500
- Customer fee (1%): Rp 1,500
- **Total revenue:** Rp 3,000
- **Net revenue (after payment gateway ~0.7%):** Rp 1,950

### User Pricing

**Free untuk Users:**
- Registration: Gratis
- Daily merchant list access: Gratis
- QR code validation: Gratis
- 1% fee hanya dibayar saat ada transaksi (di-add ke bill)

### Merchant Pricing

**Free to Join:**
- Registration: Gratis
- Dashboard access: Gratis
- Promo submission: Gratis (limit 5 active promos)
- 1% fee hanya dibayar saat ada redemption

**Premium Merchant Plan (Future):**
- **Rp 500,000/month** - Up to 20 active promos
- **Rp 1,500,000/month** - Unlimited promos + featured placement + advanced analytics
- **Rp 3,000,000/month** - Premium placement + dedicated support + custom integrations

### Break-even Analysis

**Monthly Fixed Costs:**
- Infrastructure (Deno Deploy + Supabase): Rp 2,000,000
- Team salaries (3 people): Rp 12,000,000
- Marketing & operations: Rp 1,000,000
- **Total: Rp 15,000,000/month**

**Variable Costs per Transaction:**
- Payment gateway (Midtrans): ~Rp 300
- Server costs: ~Rp 50
- Support: ~Rp 150
- **Total variable cost: ~Rp 500/transaction**

**Break-even Calculation:**
- Net revenue per transaction: Rp 3,000 - Rp 500 = Rp 2,500
- Break-even transactions: Rp 15,000,000 / Rp 2,500 = **6,000 transactions/month**

**Profitability Targets:**
- **Month 6:** 6,000 transactions (break-even)
- **Month 9:** 10,000 transactions (Rp 10M profit)
- **Month 12:** 20,000 transactions (Rp 35M profit)

### Competitive Analysis

| Competitor | Pros | Cons | BibiDiskon Advantage |
|------------|------|------|---------------------|
| **GrabFood/GoFood** | Huge user base, delivery | Generic discounts, no birthday focus | Targeted birthday discounts, viral potential |
| **Traveloka Eats** | Strong brand, loyalty program | Not birthday-specific | Birthday-specific, F&B + retail + entertainment |
| **Social Media Promo** | Free, viral | Hard to track redemption, scattered | Centralized, trackable, verified |
| **Traditional Loyalty Programs** | Established customer base | Expensive for merchants, low engagement | Low cost (1%), high engagement (birthday) |

## 📚 Documentation

### Internal Documentation

- **Technical Specs:** [technical-specs.md](./technical-specs.md)
- **API Documentation:** [api-docs.md](./api-docs.md)
- **Database Schema:** [database-schema.md](./database-schema.md)
- **Deployment Guide:** [deployment-guide.md](./deployment-guide.md)

### User Documentation

- **User Guide:** [user-guide.md](./user-guide.md)
- **Merchant Guide:** [merchant-guide.md](./merchant-guide.md)
- **FAQ:** [faq.md](./faq.md)
- **Video Tutorials:** [Link ke YouTube channel]

## 🎯 Marketing Strategy

### User Acquisition

**Organic Growth (Primary):**
- **Viral Loops:** User share "happy birthday + diskon" di Instagram Stories → Friends click link → Register
- **Birthday Timeline:** User register → 3 days before birthday dapat notification → Share countdown → Friends see
- **Social Proof:** Birthday leaderboard → Top spenders featured → Social media competition

**Paid Acquisition (Secondary):**
- **Facebook/Instagram Ads:** Target users dengan birthday di bulan ini
- **TikTok Challenges:** #UltahDiBibiDiskon challenge
- **Google Ads:** Keywords "diskon ulang tahun", "promo ultah"

**Partnerships:**
- **Corporate Partners:** HR departments → Employee birthday benefits
- **Universities:** Student birthday discounts
- **Communities:** Religious organizations, alumni associations

### Merchant Acquisition

**Direct Outreach:**
- **Field Sales:** Visit local F&B, retail, entertainment venues
- **Online Marketing:** LinkedIn ads untuk business owners
- **Merchant Referral:** Existing merchants refer new merchants (commission 20% dari fee selama 3 bulan)

**Value Proposition untuk Merchants:**
- **Low CAC:** Rp 1,500 fee vs Rp 50,000+ untuk traditional ads
- **Targeted:** Customer yang memang sedang ultah (high intent to celebrate)
- **Trackable:** Real-time analytics redemption
- **Viral:** User share experience → Free marketing untuk merchant

### Retention Strategy

**User Retention:**
- **Annual Recurrence:** User otomatis kembali setiap tahun saat birthday
- **Gamification:** Achievements, badges, leaderboard
- **Reminders:** Push notification 3 days before birthday
- **Social Sharing:** Share birthday celebration photos

**Merchant Retention:**
- **ROI Visibility:** Analytics dashboard menunjukkan customer acquisition cost
- **Success Stories:** Feature testimonials dari successful merchants
- **Seasonal Campaigns:** Special promos untuk holidays (Valentine, Christmas, etc.)
- **Performance Bonus:** Bonus exposure untuk top-performing merchants

## 🎉 Milestones (Up to 10)

### Development Milestones

**M1: Foundation (Week 1-4)**
- [ ] Project setup with Deno + Fresh + Supabase
- [ ] Core database schema design
- [ ] Basic authentication system
- [ ] User registration flow (name, birthdate, email)
- [ ] Development environment fully operational

**M2: User Onboarding (Week 5-8)**
- [ ] KTP upload interface
- [ ] OCR integration untuk KTP verification
- [ ] Manual verification workflow (admin side)
- [ ] User profile dashboard
- [ ] Birthday countdown timer

**M3: Merchant Onboarding (Week 9-12)**
- [ ] Merchant registration flow
- [ ] Merchant dashboard (basic)
- [ ] Promo creation system
- [ ] Category management (F&B, retail, entertainment)
- [ ] Location-based search

**M4: Core Feature - Daily Merchant List (Week 13-16)**
- [ ] Daily promo aggregation algorithm
- [ ] Merchant listing page dengan filters
- [ ] Individual merchant promo pages
- [ ] Distance calculation (user location to merchant)
- [ ] Favorites/bookmarks system

**M5: QR Code & Validation (Week 17-20)**
- [ ] QR code generation (user side)
- [ ] QR code scanner (merchant side)
- [ ] Redemption validation logic
- [ ] Anti-fraud measures (time limit, location check)
- [ ] Redemption history tracking

**M6: Payment Integration (Week 21-24)**
- [ ] Midtrans integration
- [ ] Fee calculation (1% + 1%)
- [ ] Transaction recording
- [ ] Payment status tracking
- [ ] Settlement reporting

**M7: Gamification (Week 25-28)**
- [ ] Birthday leaderboard
- [ ] Biggest spender tracking
- [ ] Achievement badges system
- [ ] User points & rewards
- [ ] Social sharing features

**M8: Communication & Notifications (Week 29-32)**
- [ ] Email notification system (3 days before birthday)
- [ ] WhatsApp Business API integration
- [ ] Push notification setup
- [ ] Email templates design
- [ ] Notification preferences management

**M9: Analytics & Reporting (Week 33-36)**
- [ ] Merchant analytics dashboard
- [ ] User behavior tracking
- [ ] Conversion funnel analytics
- [ ] Revenue reporting (admin)
- [ ] Export functionality (CSV/PDF)

**M10: Launch Preparation (Week 37-40)**
- [ ] Performance optimization
- [ ] Security audit & penetration testing
- [ ] Beta testing (50 users + 20 merchants)
- [ ] Marketing landing page
- [ ] Official launch & press release

### Success Metrics per Milestone

| Milestone | Key Metric | Target |
|-----------|------------|--------|
| M1-M2 | Technical Readiness | 100% (all core systems working) |
| M3 | Merchant Onboarding | 20 beta merchants |
| M4-M5 | Feature Completeness | 100% (core features functional) |
| M6 | Payment Success Rate | 95%+ |
| M7 | User Engagement | 60% DAU/MAU |
| M8 | Notification Open Rate | 40%+ |
| M9 | Merchant Satisfaction | 4.5/5 rating |
| M10 | Live Transactions | 100+ transactions in launch week |

## 🌟 Success Criteria

### MVP Success (Month 6)

- **6,000 transactions per month** (break-even)
- **10,000 registered users**
- **500 active merchants**
- **60% user retention** (return untuk birthday berikutnya)
- **80% merchant retention** (continue promos setelah 3 months)
- **Viral coefficient 1.2+**

### Product-Market Fit (Month 12)

- **20,000 transactions per month** (Rp 35M profit)
- **50,000 registered users**
- **2,000 active merchants**
- **70% user retention**
- **90% merchant satisfaction**
- **Net Promoter Score (NPS) 50+**

### Series A Ready (Month 18)

- **50,000 transactions per month** (Rp 100M+ monthly revenue)
- **150,000 registered users**
- **5,000 active merchants**
- **Expansion ke 5 major cities (Jakarta, Bandung, Surabaya, Medan, Makassar)**
- **Mobile apps launched**
- **Clear path to profitability**

## 🔬 Hypothesis Validation

### Key Hypotheses to Test

**H1: Users want birthday-specific discounts**
- **Experiment:** A/B test generic vs birthday-specific messaging
- **Success Metric:** 20% higher conversion untuk birthday-specific
- **Validation Method:** User surveys + conversion data

**H2: Merchants will pay 1% fee untuk customer acquisition**
- **Experiment:** Offer 0% fee untuk first month, lalu 1% month 2
- **Success Metric:** <10% merchant churn setelah fee introduction
- **Validation Method:** Merchant retention data

**H3: Viral coefficient >1.0 through social sharing**
- **Experiment:** Track referral sources vs organic growth
- **Success Metric:** 30%+ new users dari referral links
- **Validation Method:** Referral tracking analytics

**H4: 1% customer fee won't deter transactions**
- **Experiment:** Test 0% vs 1% customer fee
- **Success Metric:** <5% difference dalam conversion rate
- **Validation Method:** A/B testing + user feedback

**H5: Daily merchant list drives repeat engagement**
- **Experiment:** Track daily active users vs monthly active users
- **Success Metric:** 40%+ DAU/MAU ratio
- **Validation Method:** Engagement analytics

---

**Last Updated:** 2026-01-06
**Version:** 0.1.0-concept
**Status:** MVP Planning Phase (M1-M10: 10 months)
**Maintainer:** Najib Zain (Lead Developer)

**Next Steps:**
1. Finalize database schema dan Supabase setup
2. Build MVP prototype (M1-M4: 4 months)
3. Beta testing dengan limited users (M5: 1 month)
4. Official launch (M6: Month 6)
5. Iterate based on user feedback (M7-M10)

**Contact:**
- **Product Inquiries:** product@bibidiskon.id
- **Merchant Partnership:** merchant@bibidiskon.id
- **Technical Support:** support@bibidiskon.id
- **Press:** press@bibidiskon.id
