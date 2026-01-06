# 💬 Katauser - Product Specification

**Version:** 1.0.0-concept
**Last Updated:** 2026-01-06
**Status:** Product Definition Phase

---

## 1. Visi Produk

Membantu SaaS Indonesia, startup, dan digital agency mengelola feedback pengguna dengan platform yang **terjangkau**, **lokal**, dan **mudah digunakan**. Menjadi alternatif UserJot/Canny yang 50-80% lebih murah dan disesuaikan dengan ekosistem tech Indonesia.

### Mission Statement

"Memberdayakan produk Indonesia untuk mendengar suara pengguna mereka tanpa beban biaya yang tidak terjangkau."

---

## 2. Problem Statement

### Masalah Utama

1. **Tools Terlalu Mahal**
   - UserJot: $15-79/month (Rp 240rb - 1.2 juta/bulan)
   - Canny: $99+/month (Rp 1.5 juta+/bulan)
   - Tidak terjangkau untuk startup Indonesia dengan budget terbatas

2. **Manajemen Manual Tidak Efisien**
   - Banyak perusahaan menggunakan email, WhatsApp, spreadsheet
   - Feedback tersebar, sulit dilacak, tidak terprioritaskan
   - Tidak ada visibility ke team lain (product, engineering, support)

3. **Kurangnya Lokalisasi**
   - Tools existing tidak support Bahasa Indonesia
   - Tidak ada integrasi dengan platform favorit komunitas Indo (Telegram)
   - Pricing tidak sesuai dengan daya beli pasar lokal

4. **Validasi Fitur Tidak Terstruktur**
   - Product managers tidak tahu fitur mana yang paling diminta
   - Tidak ada voting system untuk memprioritaskan request
   - Tidak ada sync otomatis ke roadmap

### Impact pada Target Market

- **SaaS Founders:** Buang waktu mengumpulkan feedback manual, sulit memutuskan fitur prioritas
- **Product Managers:** Tidak memiliki single source of truth untuk user requests
- **Startups:** Salah build fitur karena tidak validasi dengan user base
- **Agencies:** Sulit mengelola feedback multiple klien secara terstruktur

---

## 3. Target Market

### Primary Market: SaaS Companies Indonesia (60% focus)

**Demographics:**
- Company size: 1-50 employees
- Funding stage: Pre-seed ke Series A
- Revenue: < Rp 5 milyar/month
- Tech-savvy, menggunakan modern tools (GitHub, Slack, Telegram)

**Pain Points:**
- Budget terbatas untuk SaaS tools
- Perlu validasi fitur sebelum development
- Want transparency ke users tentang product direction

**Use Cases:**
- "Kita mau tau fitur mana yang paling diminta users"
- "Product kami banyak feature requests, susah manage-nya"
- "Warga Indonesia lebih suka kasih feedback via Telegram daripada form"

### Secondary Market: Digital Agencies (25% focus)

**Demographics:**
- Agency size: 5-20 employees
- Multiple active clients (5-20)
- Need white-label solution

**Pain Points:**
- Need feedback system untuk multiple brands/clients
- Want custom branding (remove Katauser logo)
- Need unlimited boards untuk setiap client

### Tertiary Market: E-commerce Sellers (15% focus)

**Demographics:**
- Tokopedia/Shopee/TikTok Shop sellers
- 1,000+ orders/month
- Want product feedback untuk improve

**Pain Points:**
- Tidak tahu apa yang users suka/tidak suka dari produk
- Want simple feedback system (no complex SaaS features)

---

## 4. MVP Features (v1.0)

### Core Features

#### 1. **Public Feedback Boards dengan Voting System**
- **Description:** Halaman publik dimana users bisa submit dan vote feedback
- **User Value:** Transparansi, users merasa didengar
- **Business Value:** Validasi fitur, engagement
- **Key Capabilities:**
  - Create feedback board dengan custom slug (e.g., katauser.com/feedback/company-name)
  - Anonymous atau authenticated feedback submission
  - Upvote/downvote system (one vote per user per feedback)
  - Status tracking: Open, Planned, In Progress, Completed
  - Comment thread untuk setiap feedback
- **Success Metric:**
  - 50% boards memiliki 10+ feedbacks dalam 30 hari
  - 70% feedbacks memiliki minimal 1 vote

#### 2. **Automatic Roadmap Synchronization**
- **Description:** Feedbacks otomatis sync ke roadmap items
- **User Value:** Transparansi product development
- **Business Value:** Save time product managers
- **Key Capabilities:**
  - Convert feedback ke roadmap item dengan 1 click
  - Roadmap view dengan status columns: Backlog, Planned, In Progress, Completed
  - Drag-and-drop untuk update status
  - Target date setting untuk setiap roadmap item
  - Public roadmap page (shareable link)
- **Success Metric:**
  - 60% feedbacks yang di-vote 10+ times di-convert ke roadmap
  - Product managers spend < 5 minutes/week managing roadmap

#### 3. **Changelog Generator Otomatis**
- **Description:** Changelog entries otomatis dibuat dari completed roadmap items
- **User Value:** Users tahu fitur baru yang release
- **Business Value:** Save time, increase engagement
- **Key Capabilities:**
  - Auto-generate changelog dari roadmap items dengan status "Completed"
  - Changelog categories: Feature, Improvement, Bugfix
  - Public changelog page (shareable link)
  - Option untuk manual edit changelog entry sebelum publish
  - Changelog widget untuk embed di website
- **Success Metric:**
  - 90% completed roadmap items muncul di changelog
  - 40% users klik changelog link dalam 30 hari

### Anti-Features (Explicitly NOT in MVP)

- ❌ AI duplicate detection (deferred to v2.0)
- ❌ Telegram Bot integration (deferred to v2.0)
- ❌ WhatsApp notifications (deferred to v2.0)
- ❌ Private boards/password-protected (premium feature)
- ❌ Custom domain (premium feature)
- ❌ Custom branding (premium feature)
- ❌ In-app widget (deferred to v2.0)
- ❌ Email forwarding (deferred to v1.1)

---

## 5. Future Features (v2.0+)

### v1.1 (Month 2-3)
- Email notifications untuk new feedback
- Dark mode support
- Advanced filtering (by status, category, date range)
- Export feedback ke CSV
- User mentions in comments (@username)

### v1.2 (Month 4-5)
- **Telegram Bot Integration** ⭐ (high priority for Indonesian market)
  - Vote via Telegram
  - Comment via Telegram
  - Notifications new feedback ke Telegram channel
- **WhatsApp Notifications** (delayed due to API cost)
  - New feedback alerts
  - Status update notifications
- Feedback categorization dengan tags
- Search functionality
- API access untuk premium users

### v2.0 (Month 6+)
- **AI-Powered Duplicate Detection**
  - ML model untuk detect similar feedbacks
  - Auto-merge duplicate suggestions
- **Automatic Feedback Categorization**
  - AI classify feedbacks: bug, feature, improvement, question
- **In-App Widget**
  - Embeddable widget untuk feedback submission
  - Floating feedback button
- **Private Boards** (premium feature)
  - Password-protected boards
  - Invite-only access
- **Single Sign-On (SSO)** untuk teams
- **Tokopedia/Shopee/TikTok Shop Integration**
  - Auto-import reviews sebagai feedback
  - E-commerce analytics dashboard

---

## 6. Competitive Analysis

### Direct Competitors

| Feature | UserJot | Canny | Katauser |
|---------|---------|-------|----------|
| **Price** | $15-79/mo | $99+/mo | Rp 299k/mo ($19) |
| **Public Boards** | ✅ | ✅ | ✅ |
| **Voting System** | ✅ | ✅ | ✅ |
| **Roadmap Sync** | ✅ | ✅ | ✅ |
| **Changelog Generator** | ✅ | ✅ | ✅ |
| **Telegram Bot** | ❌ | ❌ | ✅ (v2.0) |
| **Bahasa Indonesia** | ❌ | ❌ | ✅ |
| **Custom Domain** | ✅ (Premium) | ✅ (Enterprise) | ✅ (Premium) |
| **Private Boards** | ✅ | ✅ | ✅ (Premium) |

### Competitive Advantages

1. **Price Leadership**
   - 50-80% cheaper dari UserJot/Canny
   - Annual discount: 2 months free
   - Break-even point: 2 customers (vs infrastructure cost Rp 500k/month)

2. **Localization**
   - Full Bahasa Indonesia UI
   - Understanding of Indonesian business culture
   - Local payment methods (GoPay, OVO, Dana)

3. **Telegram Integration** ⭐
   - Indonesian tech communities heavily use Telegram
   - More popular than Slack/Discord in Indo ecosystem
   - Unique selling point vs global competitors

4. **Simplicity**
   - Less features = easier onboarding
   - Focus on what Indonesian SaaS actually need
   - No overwhelming enterprise features

### Indirect Competitors

- **Google Forms** - Free but manual management, no voting system
- **Typeform** - Beautiful but expensive ($29/mo basic), no roadmap sync
- **Trello** - Good for roadmap but not designed for feedback collection
- **Notion** - Flexible but manual, no dedicated voting system

### Why We Win

vs Google Forms: "Kami punya voting system dan automatic roadmap sync"
vs Typeform: "Kami 50% lebih murah dan focus ke SaaS, bukan general forms"
vs Trello: "Kami ada feedback submission layer, Trello manual semua"
vs Notion: "Kami specialized untuk feedback management, out-of-the-box"

---

## 7. Monetization Strategy

### Freemium Model

**Philosophy:** "Free untuk validasi ide, Premium untuk scale"

### Free Tier (Validasi)

**Limits:**
- 3 boards maximum
- 1,000 users/feedbacks combined
- Public boards only
- Basic branding (Katauser logo & link)

**Value:**
- Coba platform sebelum commit
- Validate idea dengan users
- Build initial audience
- Test fit dengan product workflow

**Conversion Trigger:**
- Hit 3 boards limit → upgrade untuk unlimited
- Hit 1,000 feedbacks limit → upgrade untuk unlimited
- Want custom branding → upgrade (remove logo)
- Want private board → upgrade (password protection)

### Premium Tier (Rp 299,000/month ≈ $19 USD)

**Features:**
- ✅ Unlimited boards
- ✅ Unlimited users dan feedbacks
- ✅ Private boards (password-protected)
- ✅ Custom domain (feedback.yourcompany.com)
- ✅ Custom branding (remove logo, custom colors)
- ✅ Telegram Bot integration (v2.0)
- ✅ WhatsApp notifications (v2.0)
- ✅ Priority email support
- ✅ API access (v2.0)

**Annual Pricing:**
- Rp 2,990,000/year (2 months free)
- Save Rp 598,000 vs monthly

### Payment Integration

**Provider:** Midtrans (Indonesian payment gateway)

**Payment Methods:**
- GoPay (QRIS)
- OVO
- Dana
- Bank Transfer (Virtual Account)
- Credit/Debit Card (Visa, Mastercard)

**Billing Cycle:**
- Monthly (auto-renew)
- Annual (auto-renew, 2 months free)
- Cancel anytime (no contract)

### Revenue Goals

**Year 1 Targets:**

| Metric | Target | Revenue |
|--------|--------|---------|
| Q1 2026 | 10 customers | Rp 2,990,000/month |
| Q2 2026 | 25 customers | Rp 7,475,000/month |
| Q3 2026 | 40 customers | Rp 11,960,000/month |
| Q4 2026 | 50 customers | Rp 14,950,000/month |

**Conversion Funnel Assumptions:**
- Free signups: 500 users di year 1
- Free → Premium conversion: 10% (50 customers)
- Churn rate: 5% per month
- Average customer lifetime: 20 months
- Customer Lifetime Value (CLV): Rp 5,980,000 (20 months × Rp 299,000)

**Break-even Analysis:**
- Infrastructure cost: Rp 500,000/month (Oracle Cloud)
- Break-even point: 2 customers (Rp 598,000/month revenue)
- Profit margin: 97% (after infrastructure costs)

---

## 8. Success Metrics

### Product Metrics

**User Acquisition:**
- Week 1 (beta): 10 signups
- Month 1: 50 signups
- Month 6: 500 signups
- Year 1: 5,000 signups

**Engagement:**
- DAU/MAU ratio: > 20% (healthy engagement)
- Feedback submission rate: > 0.5 per user per week
- Vote rate: > 2 votes per feedback
- Board creation rate: > 30% of signups create a board

**Retention:**
- Day 7 retention: > 40%
- Day 30 retention: > 20%
- Day 90 retention: > 10%

### Business Metrics

**Revenue:**
- Month 1: Rp 0 (beta, free)
- Month 3: Rp 2,990,000 (10 customers)
- Month 6: Rp 7,475,000 (25 customers)
- Year 1: Rp 14,950,000/month (50 customers)

**Conversion:**
- Free → Premium conversion: > 10%
- Trial → Paid conversion: N/A (no trial, direct freemium)
- Churn rate: < 5% per month

**Unit Economics:**
- Customer Acquisition Cost (CAC): Target Rp 200,000
- Customer Lifetime Value (CLV): Rp 5,980,000 (20 months × Rp 299,000)
- LTV/CAC ratio: > 29:1 (very healthy)

### Technical Metrics

**Performance:**
- P50 response time: < 200ms
- P95 response time: < 500ms
- P99 response time: < 1000ms
- Uptime: > 99.9% (43.2 minutes downtime/month)

**Quality:**
- Bug reports: < 10 per month
- Critical bugs: < 1 per month
- Time to fix critical bugs: < 24 hours
- Test coverage: > 80%

---

## 9. Go-to-Market Strategy

### Pre-Launch (Beta Phase - Month 1)

**Beta Recruitment:**
- Direct outreach ke 20 Indonesian SaaS founders via LinkedIn/Email
- Offer: Free lifetime premium untuk beta testers
- Target: 10 active beta users

**Channels:**
- "Indonesian SaaS Founders" Facebook group
- "ID Startup Chat" Telegram group
- "Go Indonesia" Telegram group
- LinkedIn: Indonesian SaaS founders

**Beta Testing (4 weeks):**
- Weekly check-in via WhatsApp/Telegram
- Collect feedback on bugs dan UX issues
- Ship hotfixes within 24 hours

### Launch Week (Month 2, Week 1)

**Primary Launch Channels:**
1. **Product Hunt** (Day 1, 9:00 AM PST)
   - Prepare: Gallery images (5 screenshots), demo video (60s)
   - Goal: Top 5 Product of the Day

2. **Hacker News (Show HN)** (Day 1, 8:00 AM PST)
   - Title: "Show HN: Katauser.com - UserJot alternative for Indonesian SaaS"
   - Engage with all comments

3. **Indonesian Tech Media** (Week 1)
   - DailySocial.id - Pitch story about local SaaS tool
   - Tech in Asia Indonesia - Submit to startup coverage

4. **Social Media** (Ongoing)
   - Twitter/X: Post daily updates during launch week
   - LinkedIn: Article about Indonesian SaaS ecosystem

### Post-Launch (Month 2-12)

**Content Marketing:**
- Monthly case studies: "How [Startup] uses Katauser to manage feedback"
- Educational content: "Cara Mengumpulkan Feedback Pengguna dengan Efektif"
- Host webinar: "Product Management 101: Feedback Loop"

**Community Building:**
- Share development progress on Twitter/X with hashtag #Katauser
- "Building in Public" updates in relevant communities
- Create "Katauser Users" Telegram group

---

## 10. Risk Assessment

### Business Risks

| Risk | Probability | Impact | Mitigation |
|------|-------------|--------|------------|
| UserJot lowers prices | Low | High | Differentiate dengan localization + Telegram, pricing tetap competitive |
| Low adoption rate | Medium | High | Beta testing dengan real users, iterate quickly |
| Competitor clones product | Medium | Medium | First-mover advantage, focus on Indonesian market |
| Difficulty acquiring 50 customers | High | Medium | Aggressive community building, partnerships dengan SaaS Indo communities |

### Technical Risks

| Risk | Probability | Impact | Mitigation |
|------|-------------|--------|------------|
| Tanstack Start ecosystem too small | Low | Medium | Use stable libraries, fallback to Next.js jika needed |
| PostgreSQL performance issues | Low | High | Proper indexing, read replicas, caching dengan Redis |
| DDoS attacks | Medium | High | Cloudflare DDoS protection, rate limiting |

### Operational Risks

| Risk | Probability | Impact | Mitigation |
|------|-------------|--------|------------|
| Solo founder burnout | Medium | High | Hire part-time developer untuk frontend, automate tasks |
| Payment gateway issues | Low | Medium | Multiple payment methods, manual fallback |
| Data breach | Low | Critical | Security audit, encryption, penetration testing |

---

## 11. Success Criteria

### MVP Success (Month 3)

✅ 10 active beta users
✅ All 3 core features working without critical bugs
✅ 50+ feedbacks submitted across all boards
✅ < 5 seconds page load time
✅ 99% uptime during beta period

### Product-Market Fit (Month 6)

✅ 25 paying customers
✅ < 5% monthly churn rate
✅ 40% DAU/MAU ratio
✅ Net Promoter Score (NPS) > 40

### Year 1 Success (Month 12)

✅ 50 paying customers
✅ Rp 15M+ MRR
✅ 5,000 total signups
✅ 10% free-to-premium conversion rate
✅ Profitable (revenue > costs)

---

## 13. Market Validation Strategy ⭐

**Philosophy:** Validate demand before heavy investment in development.

### Phase 1: Pre-Build Validation (Week 1-2)

**1. Landing Page Test**
- Create simple landing page dengan waitlist signup
- Share in: "Indonesia SaaS Founders" FB, "ID Startup Chat" Telegram, LinkedIn
- **Success Criteria:** 50+ email signups = PROCEED
- **Failure Criteria:** < 20 signups = RECONSIDER PRODUCT

**2. Problem Discovery Interviews**
- Interview 10 Indonesian SaaS founders (Series A ke bawah)
- Ask: "How do you currently manage user feedback?"
- Don't mention Katauser initially - understand pain first
- **Success Criteria:** 4/5 confirm "feedback management is major pain"
- **Failure Criteria:** 3/5 say "Google Sheets works fine" = RECONSIDER

**3. Competitive Analysis**
- Sign up for UserJot free trial
- Use for 1 week dengan real feedback
- Document: What sucks? What's missing?

**Go/No-Go Decision (End of Week 2):**
- ✅ **GO:** 50+ waitlist AND 4/5 pain confirmation
- ❌ **NO GO:** < 20 waitlist OR < 3/5 pain confirmation

### Phase 2: Build-Measure-Learn (Weeks 3-12)

**Weekly Validation Checkpoints:**
- Week 3: Share wireframes dengan 10 target users - do they "get it"?
- Week 6: Alpha version dengan 5 friendly users - can they use it without help?
- Week 9: Beta dengan 10 users - do they return next week?
- Week 12: Ask beta users: "Would you pay Rp 299k/month for this?"

### Phase 3: Post-Launch PMF Validation (Month 3-6)

**Sean Ellis Test (Month 3 & 6):**
- Survey 40 active users: "How would you feel if Katauser disappeared?"
- **PMF Score:** % who say "very disappointed"
- **> 40%:** Strong PMF → Scale aggressively
- **25-40%:** Moderate PMF → Iterate on positioning
- **< 25%:** Weak PMF → Pivot or persevere

**Key Metrics to Track Weekly:**
- Weekly Active Users (WAU)
- Week 1, Week 4, Week 12 cohort retention
- Free → Paid conversion rate
- Net Promoter Score (NPS)
- Sean Ellis Test Score (monthly)

**Go/No-Go Gates:**
- **Month 3:** Sean Ellis > 40%? → Proceed to public launch
- **Month 6:** 25 paying customers + Sean Ellis > 40%? → Scale features
- **If PMF not achieved:** Iterate on value proposition, don't invest in advanced features

---

## 14. Risk Mitigation Plan

### Risk 1: Market Validation Fails (Primary Concern) 🔴

**Probability:** Medium | **Impact:** Critical

**Mitigation Strategy:**
1. **Pre-build validation** (Week 1-2) kills bad ideas early with minimal investment
2. **Beta testing** (Month 1) validates before public launch
3. **Monthly PMF surveys** track market fit continuously
4. **Pivot option:** If SaaS market doesn't work, pivot to e-commerce (Milestone 8)

**Exit Strategy:**
If Month 6 shows < 10 paying customers:
1. Reinterview customers: Why aren't you paying?
2. Test pricing: Is Rp 299k too high? Try Rp 99k
3. Test positioning: Is problem not painful enough?
4. **Final option:** Open-source Katauser, use as portfolio piece, learn from it

### Risk 2: Solo Founder Burnout

**Probability:** Medium | **Impact:** High

**Mitigation Strategy:**
- Hire part-time developer (Month 3): Frontend dev for UI, you focus on backend
- Customer support automation: FAQ, chatbot, canned responses
- Scope creep prevention: Strict milestone boundaries, say "no" to feature requests
- Community building: Empower users to help each other (Katauser Users Telegram group)
- **Critical:** Take 1 day off per week, no exceptions

### Risk 3: Competitor Response

**Probability:** Low | **Impact:** Medium

**Scenario:** UserJot launches Indonesian version at lower price

**Mitigation Strategy:**
- First-mover advantage: Capture market share before they respond
- Telegram Bot moat: UserJot can't easily replicate (Western-centric, not focus on Indo)
- Community relationships: Deep connections in Indonesian SaaS ecosystem
- Product superiority: Simpler, faster, better UX (no enterprise bloat)
- **Response time:** If they copy, differentiate further dengan integrations (Tokopedia, Shopee)

### Risk 4: Tanstack Start Ecosystem Too Small

**Probability:** Low | **Impact:** Medium

**Mitigation Strategy:**
- Fallback to Next.js: If Tanstack Start lacks libraries, switch in Month 2
- Use stable components: React Query, Zod, Tailwind (work everywhere)
- Monitor ecosystem: Weekly check on Tanstack Start GitHub issues

**Decision Point:** End of Month 2 - if > 10 blocking issues, switch to Next.js

### Risk 5: Low Free-to-Paid Conversion

**Probability:** Medium | **Impact:** High

**Mitigation Strategy:**
- Pricing experiments (Milestone 4): Test Rp 199k, Rp 299k, Rp 399k
- Value communication: Clearly show premium benefits on pricing page
- Upgrade triggers: Email when users hit 80% of free limits
- Annual discount: 2 months free (17% discount) untuk higher LTV
- Exit intent popups: Offer 20% discount when users leave pricing page

**Target:** 10% free-to-paid conversion (industry average for SaaS)

### Risk 6: Churn Rate Too High

**Probability:** Medium | **Impact:** High

**Mitigation Strategy:**
- Proactive customer success: Email new customers after 7 days, offer help
- Onboarding improvement: Tutorial videos, in-app guides
- Community building: Peer support reduces support burden
- Feature requests: Public roadmap shows users you're listening
- **Target:** < 5% monthly churn rate (healthy untuk SaaS)

---

## 15. Exit Strategy

**Philosophy:** Know when to pivot, persevere, or stop.

### Scenarios and Responses

**Scenario A: Strong PMF (Month 6: Sean Ellis > 40%, 25+ customers)**
- **Action:** Scale aggressively, hire part-time developer, invest in features
- **Goal:** Reach 50 customers by Year 1, profitable business

**Scenario B: Moderate PMF (Month 6: Sean Ellis 25-40%, 10-25 customers)**
- **Action:** Iterate on positioning and pricing
- **Experiments:**
  - Test lower price point (Rp 99k-199k)
  - Test different positioning (focus on Telegram? focus on simplicity?)
  - Double down on what's working (if e-commerce integrations popular, pivot to that)
- **Timeline:** 3 more months to improve PMF, then re-evaluate

**Scenario C: Weak PMF (Month 6: Sean Ellis < 25%, < 10 customers)**
- **Action:** Pivot or stop
- **Pivot Options:**
  1. **Pivot to e-commerce:** Tokopedia/Shopee sellers need unified review management (Milestone 8)
  2. **Pivot to agency market:** White-label solution untuk digital agencies
  3. **Open-source:** Make Katauser open-source, build reputation, monetize via hosting/support
- **Stop Criteria:** If Month 9 still shows < 10 customers, discontinue project

### Learning Outcomes (Regardless of Success/Failure)

**If Katauser succeeds:**
- Validate Indonesian SaaS market appetite untuk affordable tools
- Build profitable SaaS business (Rp 15M+ MRR)
- Learn Go + Tanstack Start in production
- Build network in Indonesian tech community

**If Katauser fails:**
- Learn about product-market fit validation
- Build portfolio piece (Go + Tanstack Start)
- Write "post-mortem" blog post (builds credibility)
- Apply lessons to next project

**Net outcome:** Valuable learning experience regardless of commercial success

---

## 16. Notes & Design Decisions

### Why Go + Tanstack Start?

**Backend: Go (Golang)**
- High performance untuk concurrent operations
- Aligns dengan Akordium's PHP-to-Go migration strategy
- Strong standard library, minimal dependencies
- Good untuk microservices architecture

**Frontend: Tanstack Start**
- Superior type safety (end-to-end TypeScript)
- Better debugging dengan integrated DevTools
- Modular design (use only what you need)
- Future-proof: TanStack ecosystem growing rapidly

**PostgreSQL**
- Akordium's standard database (migrating from MySQL)
- JSONB support untuk flexible data (custom branding)
- Reliable, battle-tested

### Why Freemium?

**Rationale:**
- Lower barrier to entry untuk price-sensitive Indonesian market
- Users can validate platform sebelum committing financially
- Viral growth: free users promote platform ke teams
- Proven model: UserJot, Canny, Slack, Figma, etc.

**Why Not Free Trial?**
- Trial creates urgency to evaluate dalam 14-30 days
- Freemium allows long-term usage → deeper product understanding → higher likelihood to upgrade when hitting limits
- Indonesian users prefer "try before you buy" tanpa time pressure

### Why Midtrans?

**Rationale:**
- Indonesian payment gateway (understands local market)
- Supports GoPay, OVO, Dana (e-wallet favorites)
- Reasonable transaction fees (2-3%)
- Good documentation dan SDK

### Why Oracle Cloud + Coolify?

**Rationale:**
- Oracle Cloud: Always Free tier (2 VMs) + cost-effective paid instances
- Coolify: Self-hosted PaaS (Heroku alternative, no vendor lock-in)
- Akordium's standard infrastructure stack
- Proven in production: SnapKasir, Anggarin, Atribuo

---

**Document Status:** ✅ Ready for Development
**Next Step:** Create [roadmap.md](./roadmap.md) dengan detailed implementation phases
