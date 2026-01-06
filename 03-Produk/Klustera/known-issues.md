# ⚠️ Klustera.id - Known Issues & Limitations

**Version:** 1.0.0-concept
**Last Updated:** 2026-01-06
**Status:** Pre-Development

---

## 🚨 Critical Issues

### No Market Validation Yet

**Issue:** Produk ini berdasarkan asumsi, bukan validated problem.

**Description:**
- Tidak ada customer interviews yang dilakukan dengan pengelola kompleks
- Tidak ada landing page untuk measure interest
- Pricing (Rp 2-5K/unit/month) untested dengan target market
- Problem statement belum dikonfirmasi dengan pengelola kompleks
- Tidak ada data tentang willingness to pay dari housing complexes

**Impact:** High - Bisa jadi nobody wants this product at this price point

**Mitigation:**
- **Recommended (Sebelum Development):** Talk ke 10-20 housing complex managers/pengelola
  - Ask: "Bagaimana cara Anda manage iuran saat ini?"
  - Ask: "Berapa banyak waktu yang Anda habiskan untuk admin iuran?"
  - Ask: "Apakah Anda willing to pay untuk software solution? Berapa?"
  - Ask: "Apakah Anda pernah coba software sebelumnya? Kenapa tidak pakai?"
- **Alternative (Sebelum Development):** Create landing page dulu, measure conversion rate
- **Minimum (Beta Testing):** Recruit 3-5 pilot complexes sebelum public launch

**Timeline:** Should be resolved sebelum Milestone 1 completion (pre-development validation)

---

### Community Building from Scratch

**Issue:** Tidak ada existing audience atau network di Indonesian housing complex management community.

**Description:**
- Starting dari zero untuk customer acquisition
- Tidak ada partnerships atau affiliations dengan property management companies
- Social media following belum ada
- Tidak ada brand awareness di target market

**Impact:** High - Slow initial traction, long sales cycle

**Mitigation:**
- Aggressive community engagement:
  - Join Facebook groups: "Pengelola Kompleks Indonesia", "Property Management Indonesia"
  - Join LinkedIn groups: "Indonesian Real Estate Professionals"
  - Join Telegram groups: "Kompleks Perumahan", "RT/RW Indonesia"
- Partnership dengan property management companies (reseller model)
- "Building in Public" strategy (document development journey di Twitter/LinkedIn)
- Offer free lifetime premium untuk early adopters (first 50 complexes)
- Content marketing: Blog posts tentang "5 Masalah Manajemen Kompleks & Solusinya"

**Timeline:** Ongoing effort dari Month 1 onwards

---

## 🔄 Design Decisions & Trade-offs

### WhatsApp Integration Delayed to v2.0

**Issue:** WhatsApp notifications tidak included di MVP.

**Reason:**
- WhatsApp Business API memiliki per-conversation costs
- Meta charges untuk setiap message sent (estimated Rp 50-100 per message)
- Uncertain cost structure untuk startup stage
- Complex approval process untuk WhatsApp Business API (need Facebook Business account)

**Impact:** Medium - Missing popular Indonesian communication channel

**Workaround (v1.0):**
- Email notifications (SendGrid)
- SMS notifications (Nexmo/Twilio) untuk high-priority alerts
- In-app notifications (portal dashboard)

**Future Plan (v1.2 or v2.0):**
- Add WhatsApp notifications
- Pass API costs ke premium users (add-on feature)
- Atau absorb costs jika revenue sufficient

---

### No Native Mobile Apps di MVP

**Issue:** Mobile apps (iOS, Android) delayed to v2.0.

**Reason:**
- Mobile development significantly increases development time (React Native skill set needed)
- MVP focus pada web-based portal (responsive design)
- Resources constraint (solo founder atau small team)
- Want to validate product-market fit dulu before investing di mobile apps

**Impact:** Medium - Lower user engagement tanpa native mobile apps

**Workaround (v1.0):**
- Mobile-responsive web design (Progressive Web App capability)
- Mobile-optimized interface untuk residents
- Push notifications via email/SMS (bukan push notification)

**Future Plan (v2.0):**
- Launch React Native apps (iOS & Android)
- Native mobile features (biometric login, offline mode, push notifications)

---

### TALL Stack vs Next.js + Go Stack

**Issue:** TALL Stack (Laravel + Livewire) chosen over modern Next.js + Go stack.

**Risk:**
- PHP ecosystem perceived sebagai "legacy" oleh some developers
- Fewer third-party integrations vs Node.js ecosystem
- Steeper learning curve untuk frontend developers (Alpine.js vs React)
- Potentially harder to hire Laravel developers di Indonesia market

**Mitigation:**
- Proven success di WaqfWise (similar TALL Stack project)
- Team expertise dalam Laravel ecosystem
- Rapid development capability (MVP dalam 12 weeks)
- Sufficient performance untuk SaaS application (<500ms response time)
- Fallback plan: Migrate frontend ke Next.js jika needed (keep backend Laravel)

**Status:** Accepted risk - benefits outweigh drawbacks

---

### Single-Tenant vs Multi-Tenant Database Architecture

**Issue:** MVP menggunakan single-tenant database (all complexes di one database).

**Limitation:**
- Potential performance issues saat data grows (1000+ complexes)
- Data isolation concerns (complex A bisa theoretically see complex B data jika bug)
- Backup complexity (backup entire database vs per-complex backups)

**Reason:**
- Simplicity untuk MVP
- Faster development (single database schema)
- Sufficient untuk Year 1 scale (<100 complexes)

**Future Upgrade (Year 2+):**
- Implement multi-tenancy dengan schema-based isolation (`tenant.{complex_id}.tables`)
- Atau database sharding (separate database per complex)
- Per-complex backups

---

## 🐛 Potential Technical Issues

### Concurrent Payment Handling

**Issue:** Race conditions dalam payment processing.

**Description:**
Two residents pay bills simultaneously → potential payment count inconsistency atau double-payment recording

**Mitigation:**
- Database-level unique constraints (payment_id + bill_id)
- Transactions untuk payment operations
- Idempotent payment processing (Midtrans webhook handler)
- Atomic increment/decrement operations untuk payment amounts

**Status:** Will be tested thoroughly di Phase 2 (Milestone 2: Financial Management)

---

### Database Performance at Scale

**Issue:** Query performance degradation saat data grows.

**Potential Bottlenecks:**
- Large bills table (>100K rows)
- Large payments table (>100K rows)
- Vote count calculations (announcements dengan 1000+ votes)
- Facility availability check (concurrent booking requests)

**Mitigation:**
- Proper indexing (complex_id, due_date, status untuk bills)
- Denormalized fields (payment_count di bills table)
- Read replicas (Year 2+ untuk reporting queries)
- Caching layer (Redis untuk dashboard metrics)
- Query optimization dengan eager loading (avoid N+1 queries)

**Monitoring:**
- Query performance tracking (Sentry + slow query log)
- Regular index review (quarterly)
- Database performance tuning (monthly)

---

### Spam & Abuse Prevention

**Issue:** Public complaint system bisa disalahgunakan oleh spammers atau abusive residents.

**Potential Attacks:**
- Automated complaint submission (bots)
- Duplicate complaints
- Inappropriate content (profanity, harassment)
- Fake resident accounts

**Mitigation:**
- Rate limiting (100 requests/minute per IP)
- Honeypot fields (hidden form fields untuk bots)
- Email verification (optional untuk MVP)
- Report/flag system (pengelola can ban abusive residents)
- Manual moderation (pengelola control)
- Content filtering (profanity filter, blacklist words)

---

## 💼 Business Model Limitations

### Low Price Point Challenges

**Issue:** Rp 2-5K/unit/month might be too low untuk sustainable business.

**Considerations:**
- Infrastructure costs ~Rp 500K/month (Oracle Cloud + Coolify)
- Break-even at 2 complexes (400 units @ Rp 3K/unit = Rp 1.2M/month)
- Low margins untuk customer acquisition (CAC must be < Rp 500K)
- Need high volume (100+ complexes) untuk significant revenue

**Mitigation:**
- Focus on high volume strategy (1000+ customers di Year 2-3)
- Annual pricing (2 months free - improves cash flow)
- Premium add-ons (higher price point):
  - Priority support (WhatsApp/Phone): +Rp 200K/month
  - Custom integrations (IoT, smart locks): Custom pricing
  - White-label solution: 10x base price
- Developer/Agent referral program (20% commission first year)

**Contingency:**
- Monitor competitor pricing
- Be prepared to adjust pricing (up or down)
- Consider tiered pricing (Basic, Pro, Enterprise) if per-unit pricing tidak resonates

---

### Freemium Conversion Risk

**Issue:** Tidak ada free tier di current model (all paying customers).

**Considerations:**
- Higher barrier untuk entry (no free trial untuk long-term)
- Difficult untuk validate product-market fit
- Lower word-of-mouth growth (no free users spreading the word)

**Mitigation:**
- 30-day free trial untuk new customers (no credit card required)
- Beta testing phase (3-month free trial untuk 5 pilot complexes)
- Free tier untuk RT/RW yang dikelola secara sukarela (50% discount)
- University/student housing discounts (50% off)

**Alternative (Jika Conversion Low):**
- Introduce freemium model:
  - Free: 1 complex, max 50 units, basic features
  - Paid: Rp 3K/unit/month, all features

---

### Long Sales Cycle

**Issue:** Housing complexes adalah traditional industry, slow to adopt technology.

**Considerations:**
- Decision makers (pengelola, ketua RT/RW, developers) are busy dan conservative
- Trust issues dengan new SaaS products
- Price sensitivity (willingness to pay mungkin lower than expected)
- Sales cycle could be 3-6 months (vs 1-2 months untuk tech-savvy customers)

**Mitigation:**
- Focus on trust-building:
  - Case studies dari pilot complexes
  - Testimonials dari pengelola complexes
  - Transparent pricing (no hidden fees)
  - Money-back guarantee (30-day satisfaction guarantee)
- Provide demo videos dan walkthroughs
- Offer hands-on onboarding (free setup dan training)
- Start dengan free trial (reduce friction)

---

## 🌍 Regional Limitations

### Indonesia-Specific Challenges

**Payment Gateway Complexity:**
- Midtrans integration requires business registration (PT, NPWP)
- Different payment methods per region (GoPopuler di Jawa, OVO di kota besar)
- Transaction fees vary (2-3% tergantung metode)
- Settlement time (1-3 days kerja)

**Infrastructure:**
- Internet penetration tidak 100% (mobile users di rural areas)
- Device variety (low-end Android phones, slow internet)
- Data caps (some users have limited data quotas)

**Cultural:**
- Preference untuk WhatsApp vs Email (need WhatsApp integration di v2.0)
- Trust issues dengan new SaaS products (need strong social proof)
- Price sensitivity (willingness to pay lower than US/EU markets)
- Cash culture (some residents prefer cash payment ke pengelola, bukan transfer)

**Mitigation:**
- Mobile-first design (lightweight pages <200KB bundle)
- Offline mode considerations (future feature)
- Local payment methods (GoPay, OVO, Dana, QRIS)
- Social proof (testimonials dari Indonesian complexes)
- WhatsApp integration (prioritized di v2.0)

---

## 🚀 Post-Launch Considerations

### Scalability Unknowns

**Questions to Answer:**
- How many concurrent users can single VM handle?
- At what point do we need sharding?
- Can PostgreSQL handle 10M+ bills/payments records?
- What is the breaking point untuk Livewire real-time updates?

**Plan:**
- Load testing sebelum public launch (simulate 500 concurrent users)
- Monitor performance metrics closely (Sentry, custom dashboards)
- Scale horizontally when needed (add more application servers)
- Database partitioning strategy (Year 2+ jika needed)
- Consider migration ke microservices untuk payment processing (Year 3+)

---

### Customer Support Capacity

**Issue:** Solo founder atau small team cannot handle 24/7 support.

**Reality:**
- Users will have questions (how to use features, troubleshooting)
- Bugs will happen (inevitable di production)
- Feature requests akan masuk (user feedback)
- Payment issues (Midtrans errors, failed transactions)

**Mitigation:**
- Comprehensive documentation:
  - User guide untuk pengelola (PDF & online help center)
  - Resident guide (simple walkthrough)
  - Video tutorials (5-10 short videos, 2-5 minutes each)
  - FAQ section (common questions)
- Self-service onboarding:
  - Interactive walkthrough (guide new pengelola step-by-step)
  - Tooltips dan inline help
  - Sample data (sandbox environment untuk testing)
- Automated responses:
  - Auto-responder email (acknowledge support ticket within 1 hour)
  - Knowledge base search (self-service answers)
- Community support:
  - Telegram group untuk pengelola complexes (peer support)
  - Facebook group (user community)
- Hire part-time support di Year 2:
  - Expected cost: Rp 3-5M/month untuk 1 support agent
  - Handle tier-1 support (FAQ, basic troubleshooting)

---

### Competitive Response

**Risk:** Existing competitors (Jelajah, PropertiManager) might respond dengan price cuts atau feature additions.

**Scenario:**
- Competitor launches "Indonesia Pricing" at Rp 1K/unit/month (undercut Klustera)
- Competitor adds feature parity (guest management, mobile apps)

**Klustera's Advantage:**
- **Open Source:** Core platform is open source (trust + customization)
- **Per-Unit Pricing:** Still unique (competitors use flat fee)
- **Localization:** Bahasa Indonesia UI, local payment methods
- **Community:** Building in public, transparent development
- **Agility:** Smaller team = faster iteration

**Contingency:**
- Differentiate on features, not just price:
  - Focus on user experience (better UX/UI)
  - Innovate faster (add features competitors don't have)
  - Build brand loyalty (superior support, customer success)
- Compete on quality, not price:
  - Higher uptime (99.5%+ vs competitors 99%)
  - Faster support (24 hour response vs 72 hours)
  - Better documentation (comprehensive vs minimal)

---

## 📊 Success Criteria Validation

### Assumptions to Validate

**Assumption 1:** "Pengelola kompleks willing to pay Rp 2-5K/unit/month"
- **Validation:** Talk ke 20 pengelola complexes, ask current admin costs, willingness to pay
- **Risk:** If they prefer Excel + WhatsApp (cost = Rp 0), positioning needs adjustment
- **Alternative:** Offer freemium model (free tier sampai 50 units)

**Assumption 2:** "Per-unit pricing is superior to flat fee pricing"
- **Validation:** A/B test pricing models (per-unit vs flat fee) setelah launch
- **Risk:** Customers might prefer predictable flat fee (Rp 500K/month vs 200 units × Rp 3K = Rp 600K)
- **Contingency:** Offer both pricing models (customer can choose)

**Assumption 3:** "30-day free trial sufficient untuk conversion"
- **Validation:** Measure trial-to-paid conversion rate (target: >20%)
- **Risk:** Low conversion (trial users leave setelah 30 days)
- **Alternative:** Extend trial ke 60 days atau offer freemium model

**Assumption 4:** "TALL Stack can handle 1000+ complexes"
- **Validation:** Load testing dengan 1000+ simulated complexes
- **Risk:** Performance degradation di scale
- **Plan M:** Migrate ke Next.js + Go stack jika needed (Year 2+)

---

## 🔄 Planned Improvements

### Short-Term (MVP - v1.1)

- [ ] Resolve market validation gap (talk ke 10-20 pengelola complexes)
- [ ] Add email notifications (SendGrid integration)
- [ ] Improve mobile responsiveness (tablet & mobile views)
- [ ] Implement dark mode support

### Medium-Term (v1.2 - v2.0)

- [ ] Add SMS notifications (Nexmo/Twilio)
- [ ] Implement search functionality
- [ ] Add WhatsApp Business integration
- [ ] Launch guest management system (QR code access control)
- [ ] Build mobile apps (React Native)

### Long-Term (v3.0+)

- [ ] IoT integration (smart locks, sensors)
- [ ] Advanced analytics (predictive models)
- [ ] Developer platform (API, webhooks, plugins)
- [ ] White-label solution (reseller program)

---

## 📝 Reporting Issues

### Found an Issue?

**Critical Bugs:**
- Email: support@klustera.id
- WhatsApp: +62 815-9988-995 (Emergency contact)

**Feature Requests:**
- GitHub Issues: https://github.com/akordium/klustera/issues
- Public Board: https://klustera.id/feedback

**General Inquiries:**
- Email: hello@klustera.id
- Telegram: @KlusteraSupport

---

## 🎯 Issue Priority Framework

### P0 - Critical (Fix Immediately)
- Security vulnerabilities
- Data loss
- Payment processing failures
- Complete system outage

### P1 - High (Fix Within 24 Hours)
- Broken core features (billing generation, payment processing)
- Performance degradation (>3s API response)
- User cannot access portal (login issues)
- Midtrans webhook failures (payments not recorded)

### P2 - Medium (Fix Within 1 Week)
- Non-breaking bugs (UI glitches, formatting issues)
- Minor performance issues (1-3s page load)
- Email notifications not delivered (intermittent)

### P3 - Low (Fix When Possible)
- Nice-to-have improvements
- Edge case bugs (rare scenarios)
- Cosmetic issues (styling inconsistencies)

---

## 📈 Issue Tracking Metrics

### Target Metrics (Post-Launch)

- **P0 Issues:** < 1 per month
- **P1 Issues:** < 5 per month
- **Mean Time to Resolution (MTTR):**
  - P0: < 4 hours
  - P1: < 24 hours
  - P2: < 1 week
- **Bug Report Response Time:** < 8 hours
- **Customer Satisfaction (CSAT):** > 4.0/5.0

---

**Last Updated:** 2026-01-06
**Document Version:** 1.0.0
**Maintainer:** Najib - Akordium Lab

**Note:** This document will be updated regularly as issues are discovered and resolved. Critical priority: Market validation harus dilakukan sebelum development starts.
