# 🗺️ Klustera.id Roadmap

> Visi jangka panjang dan rencana pengembangan untuk Klustera.id - Platform Manajemen Perumahan

## 🎯 Product Vision

**Vision Statement:** Menjadi platform manajemen perumahan terdepan di Indonesia yang mentransformasi pengelolaan kompleks tradisional menjadi sistem digital yang transparan, efisien, dan terpercaya melalui kekuatan open-source dan mobile technology.

**Mission Statement:** Memberdayakan pengelola kompleks perumahan dan developer properti dengan teknologi modern untuk mengoptimalkan operasional, meningkatkan transparansi keuangan kepada warga, dan menciptakan lingkungan hunian yang aman dan nyaman.

**North Star Metric:** Jumlah unit perumahan yang dikelola melalui platform Klustera.id.

---

## 📅 Development Timeline

### 🥚 Phase 1: MVP Foundation (Months 1-4)

**Timeline:** Month 1-4 | **Status:** 🥚 Concept

#### Goals

- [ ] Meluncurkan platform manajemen perumahan dasar dengan 4 core features
- [ ] Akuisisi 5-10 pilot complexes (50% free tier, 50% paid)
- [ ] Validasi product-market fit dengan target market
- [ ] Establish basic multi-tenant architecture

#### Features

**Milestone 1: Foundation & Core Infrastructure (Month 1-2)**

**Technical Setup:**
- [ ] **Multi-tenant Architecture:** Laravel tenancy package (`stancl/tenancy`) - *Priority: P0*
- [ ] **User Authentication:** 3 user roles (Admin, Resident, Staff) - *Priority: P0*
- [ ] **Database Schema:** PostgreSQL dengan tenant isolation - *Priority: P0*
- [ ] **Admin Dashboard Scaffold:** FluxUI components integration - *Priority: P0*
- [ ] **Dev & Staging Environments:** Coolify deployment - *Priority: P0*

**Key Decisions:**
- Choose tenancy package: `stancl/tenancy` or `centralops/filament-tenancy`
- Define multi-tenant data isolation strategy (database-per-tenant vs schema-per-tenant)
- Set up CI/CD pipeline dengan GitHub Actions

**Success Metrics:**
- ✅ 3 user roles can log in and access appropriate dashboards
- ✅ Multi-tenant isolation verified (cannot access other tenants' data)
- ✅ Load time < 2 seconds for dashboard
- ✅ Coolify auto-deployment works (push → deploy)

---

**Milestone 2: Financial Core - Iuran & Billing Management (Month 3-4)**

**Core Financial Features:**
- [ ] **Invoice Generation:** Automated monthly billing (IPL, kebersihan, keamanan) - *Priority: P0*
- [ ] **Xendit Integration:** QRIS, Virtual Account, E-Wallet (GoPay, OVO, DANA) - *Priority: P0*
- [ ] **Payment Tracking:** Real-time payment status updates via webhook - *Priority: P0*
- [ ] **Payment Reminders:** WhatsApp & Email notifications untuk late payments - *Priority: P1*
- [ ] **Basic Financial Reports:** Cash in/out, outstanding AR tracking - *Priority: P1*

**Database Entities:**
- `invoices`, `payments`, `payment_methods`, `billing_cycles`
- `resident_accounts`, `fee_structures`

**User Stories:**
- "As a property manager, I want auto-generated invoices so I don't spend 10 hours/month on Excel"
- "As a resident, I want to pay via QRIS so I can use GoPay/OVO"
- "As a property manager, I want payment auto-reconciliation so I don't manually update spreadsheets"

**Success Metrics:**
- ✅ Can generate 1000+ invoices in < 10 seconds
- ✅ Xendit payment webhook processes correctly with signature verification
- ✅ Payment auto-reconciliation works (invoice status updated within 5 seconds of payment)
- ✅ Payment reminder WhatsApp sent to overdue residents

---

### 🚀 Phase 2: Core Product - Complete Basic Suite (Months 5-8)

**Timeline:** Month 5-8 | **Status:** 🔮 Planned

#### Goals

- [ ] Complete "Complete Basic Suite" MVP (Financial + Resident Portal + Access Control)
- [ ] Akuisisi 10-20 paying complexes
- [ ] Launch resident portal with communication features
- [ ] Deploy access control system in pilot complexes

#### Features

**Milestone 3: Resident Portal & Community Features (Month 5-6)**

**Resident Self-Service:**
- [ ] **Resident Dashboard:** View bills, payment history, announcements - *Priority: P0*
- [ ] **Announcement System:** Rich text announcements dengan WhatsApp notifications - *Priority: P0*
- [ ] **Online Voting:** Musyawarah kompleks decisions (one vote per unit) - *Priority: P1*
- [ ] **Document Repository:** Peraturan kompleks, policies (PDF upload) - *Priority: P2*
- [ ] **Resident Directory:** Opt-in resident contact list - *Priority: P2*

**Communication Features:**
- [ ] **WhatsApp Notifications:** Announcements, payment reminders, voting alerts - *Priority: P0*
- [ ] **Email Notifications:** Backup notifications untuk residents without WhatsApp - *Priority: P1*
- [ ] **Push Notifications:** In-app notifications untuk real-time updates - *Priority: P2*

**Success Metrics:**
- ✅ 80% of residents can log in and view bills within 1 week of launch
- ✅ Announcement reaches 90% of residents via WhatsApp
- ✅ Voting system achieves quorum (50%+ participation) untuk decisions
- ✅ Resident satisfaction score > 4.0/5

---

**Milestone 4: Access Control & Guest Management (Month 7-8)**

**Access Control Features:**
- [ ] **QR Code Generation:** Residents generate QR codes in portal (30-day validity) - *Priority: P0*
- [ ] **Guest Pre-Registration:** Residents register guests, guards verify dengan code - *Priority: P0*
- [ ] **Guard Mode Tablet:** Security post interface dengan QR scanner & code entry - *Priority: P0*
- [ ] **Access Logs:** Complete history of entries/exits with timestamps - *Priority: P1*
- [ ] **Temporary Access Codes:** Time-limited codes untuk delivery, service providers - *Priority: P1*

**Hardware Integrations (Future):**
- QR code scanners at gates (Phase 3)
- Automatic gate openers via IoT relay (Phase 3)

**Success Metrics:**
- ✅ Guest check-in time reduced from 3 minutes to 30 seconds
- ✅ 95% of residents use digital access codes (no more physical cards)
- ✅ Security guards report 50% time savings on guest processing
- ✅ Zero unauthorized access incidents in pilot complexes

---

### 🏆 Phase 3: Operations & Analytics (Months 9-14)

**Timeline:** Month 9-14 | **Status:** 🔮 Planned

#### Goals

- [ ] Add operations management (complaints, facilities, tasks)
- [ ] Launch analytics dashboards untuk pengurus
- [ ] Begin native mobile app development
- [ ] Akuisisi 20-50 paying complexes

#### Features

**Milestone 5: Operations & Service Management (Month 9-10)**

**Operational Features:**
- [ ] **Complaint/Ticketing System:** Resident complaints dengan SLA tracking - *Priority: P0*
- [ ] **Facility Booking:** Online booking untuk lapangan, hall, gym - *Priority: P0*
- [ ] **Staff Task Management:** Recurring tasks untuk cleaning & security - *Priority: P1*
- [ ] **Photo Verification:** Before/after photos untuk task completion - *Priority: P1*
- [ ] **Supply Requests:** Staff request materials (cleaning supplies, spare parts) - *Priority: P2*

**User Roles Added:**
- Cleaning Service Staff (view assigned tasks, mark complete)
- Security Guards (patrol logs, incident reports)
- Facility Technicians (maintenance tickets)

**Success Metrics:**
- ✅ Average complaint resolution time < 24 hours
- ✅ Facility booking utilization increases 40% (more residents booking)
- ✅ 80% of tasks completed dengan photo verification
- ✅ Staff report higher job satisfaction (less confusion about tasks)

---

**Milestone 6: Analytics & Executive Dashboard (Month 11-12)**

**Analytics Features:**
- [ ] **Financial Dashboards:** Revenue, expenses, collection rates, budget vs actual - *Priority: P0*
- [ ] **Payment Collection Analytics:** Trends, late payment analysis, top overdue units - *Priority: P0*
- [ ] **Resident Engagement Metrics:** Active users, complaint volume, voting participation - *Priority: P1*
- [ ] **Facility Usage Statistics:** Most booked facilities, utilization rates - *Priority: P1*
- [ ] **Exportable Reports:** PDF & Excel exports untuk board meetings - *Priority: P0*
- [ ] **Custom Report Builder:** Drag-and-drop report creator - *Priority: P2*

**Key Metrics Tracked:**
- **Collection Rate:** % of iuran collected on time
- **Resident Satisfaction:** NPS dari complaint resolution ratings
- **Financial Health:** Cash flow, reserves, outstanding AR
- **Operational Efficiency:** Response times, task completion rates

**Success Metrics:**
- ✅ Pengurus spend < 5 minutes daily reviewing dashboard
- ✅ Can drill down dari month → unit → individual payment
- ✅ Export reports in < 10 seconds untuk board meetings
- ✅ Custom report builder used by 30%+ of complexes

---

**Milestone 7: Native Mobile Apps - Operations Staff (Month 13-14)**

**Mobile Apps to Build (Flutter or React Native):**

**1. Satpam App (Security Guards):**
- [ ] Check-in/check-out dengan GPS location verification
- [ ] Patrol route tracking (map-based checkpoints, QR scanning)
- [ ] Incident reporting (photo + voice notes + GPS)
- [ ] Guest notifications (real-time guest arrival alerts)
- [ ] Offline-first (works without internet)

**2. Cleaning Service App:**
- [ ] Daily task checklist (area, frequency, standards)
- [ ] Photo verification (before/after photos)
- [ ] Supply requests (cleaning materials, tools)
- [ ] Time tracking (hours worked per area)

**3. Facility Staff App:**
- [ ] Maintenance ticket assignments
- [ ] Work order tracking (status updates)
- [ ] Parts/materials requests
- [ ] Completion photos & signatures

**Technical Decisions:**
- Choose Flutter or React Native (based on team preference)
- Offline-first architecture (critical untuk areas dengan poor connectivity)
- Background sync when connection restored
- Push notifications (Firebase Cloud Messaging)

**Success Metrics:**
- ✅ 90% of operational tasks completed via mobile app
- ✅ Offline sync success rate > 99%
- ✅ Guard patrol completion rate increases to 95%
- ✅ Staff report mobile app is easy to use (4.5/5 rating)

---

### 🌟 Phase 4: Growth & Scale (Months 15-20)

**Timeline:** Month 15-20 | **Status:** 🔮 Future Planning

#### Goals

- [ ] Scale ke 50-100 paying complexes
- [ ] Add enterprise features untuk large property developers
- [ ] Prepare untuk IoT integration (optional, based on traction)
- [ ] Explore marketplace model

#### Features

**Milestone 8: Smart Home IoT Integration (Months 15-16) - *Optional***

**IoT Features (Based on Milestone 1-7 Traction):**
- [ ] **Smart Lock Integration:** Open gates via resident app - *Priority: P2*
- [ ] **Energy Monitoring:** Per-unit electricity usage tracking - *Priority: P2*
- [ ] **Water Usage Tracking:** Leak detection, consumption analytics - *Priority: P3*
- [ ] **IoT Device Management:** Dashboard untuk IoT devices - *Priority: P2*
- [ ] **API untuk Integrators:** Third-party IoT vendors can integrate - *Priority: P1*
- [ ] **Premium Subscription Tier:** IoT features = +Rp 1,000/unit/month - *Priority: P1*

**IoT Platforms to Consider:**
- **Home Assistant** (open-source, self-hosted)
- **Tuya/Smart Life** (popular di Indonesia, cheap devices)
- **Custom MQTT-based** (full control, more dev effort)

**Decision Criteria:**
- Proceed dengan IoT hanya jika:
  - 50+ paying complexes achieved
  - Clear demand dari residents (survey shows >30% want IoT)
  - Competitors starting to offer IoT features

**Success Metrics (If Implemented):**
- ✅ 20% of residents adopt at least 1 IoT feature
- ✅ IoT contributes 15% of total revenue
- ✅ 99.9% uptime untuk IoT integrations
- ✅ Partner dengan 2-3 IoT hardware vendors

---

**Milestone 9: Enterprise Features & Multi-Complex (Months 17-18)**

**Enterprise Features:**
- [ ] **Multi-Complex Management:** One developer, many complexes view - *Priority: P0*
- [ ] **Advanced Permissions:** Granular role-based access control - *Priority: P0*
- [ ] **White-Label Branding:** Custom logo, colors, domain per complex - *Priority: P1*
- [ ] **Custom Workflow Automation:** Approval chains, escalation rules - *Priority: P1*
- [ ] **ERP/Accounting API:** Integration dengan Jurnal, Accurate, Zoho - *Priority: P1*
- [ ] **Bulk Deployment Tools:** Spin up new complex in minutes - *Priority: P0*
- [ ] **Consolidated Reporting:** Roll-up across all complexes - *Priority: P0*
- [ ] **Enterprise SLA:** Dedicated support, account manager - *Priority: P0*

**Target Customers:**
- Property Developers: Ciputra, Permata, Summarecon, etc.
- Management Companies: Manage multiple complexes
- REITs: Real estate investment trusts

**Pricing untuk Enterprise:**
- Custom pricing (Rp 10-50M/month depending on units)
- Minimum commitment: 12 months
- Includes: Setup fee (Rp 20-50M), training, dedicated support, custom features

**Success Metrics:**
- ✅ Onboard 5 enterprise customers
- ✅ Enterprise contributes 40% of total revenue
- ✅ Multi-complex deployment < 1 day
- ✅ Enterprise retention rate > 95% (annual contracts)

---

**Milestone 10: Marketplace & Ecosystem (Months 19-20)**

**Marketplace Features:**
- [ ] **Service Provider Marketplace:** Pre-vetted plumbers, electricians, cleaners - *Priority: P1*
- [ ] **Insurance Integration:** Home insurance, contents insurance untuk residents - *Priority: P2*
- [ ] **Utility Bill Aggregation:** Water, electricity, internet in one bill - *Priority: P2*
- [ ] **Community Features:** Neighbor marketplace, carpooling, classifieds - *Priority: P3*
- [ ] **Revenue Share:** 10-20% commission pada transactions - *Priority: P0*
- [ ] **Partner API:** Third-party developers can build on Klustera - *Priority: P2*

**Ecosystem Partnerships:**
- **Service Providers:** Pre-vetted plumbers, electricians, cleaning services
- **Insurance Companies:** Asuransi Takaful, Allianz, Prudential
- **Utility Providers:** PLN, PDAM, internet providers
- **E-commerce:** Tokopedia/Shopee integration untuk bulk orders

**Monetization:**
- Marketplace commission (10-20% on service transactions)
- Referral fees dari insurance policies
- Lead generation fees untuk service providers
- Premium placement untuk promoted services

**Success Metrics:**
- ✅ 30% of residents use marketplace monthly
- ✅ Marketplace contributes 25% of total revenue
- ✅ 50+ active service providers on platform
- ✅ Net Promoter Score (NPS) > 50

---

## 📊 Prioritization Framework

### Priority Levels

- **P0 - Critical:** Core functionality, regulatory compliance, blocking issues
- **P1 - High:** Important features, user acquisition, revenue impact
- **P2 - Medium:** Nice to have, planned improvements, operational efficiency
- **P3 - Low:** Future considerations, exploratory features

### Decision Criteria

1. **Customer Impact:** How many residents/pengurus will benefit?
2. **Revenue Value:** Direct impact pada subscription revenue atau retention
3. **Competitive Differentiation:** Does this set us apart dari competitors?
4. **Technical Debt:** Reduce complexity or improve stability
5. **Dependencies:** Required untuk other features
6. **Partnership Value:** Enables strategic partnerships

---

## 🔄 Release Schedule

### Current Development Plan

**Timeline:** 2026 Q1 - 2027 Q3 (20 months)

**Upcoming Releases:**

- **v0.1.0-alpha** (Month 2): Milestone 1 complete - Foundation
- **v0.2.0-beta** (Month 4): Milestone 2 complete - Financial Core
- **v0.3.0-beta** (Month 6): Milestone 3 complete - Resident Portal
- **v1.0.0** (Month 8): MVP Launch - Complete Basic Suite (Milestones 1-4)
- **v1.5.0** (Month 10): Milestone 5 - Operations Management
- **v2.0.0** (Month 12): Milestone 6 - Analytics Dashboard
- **v2.5.0** (Month 14): Milestone 7 - Mobile Apps Launch
- **v3.0.0** (Month 16): Milestone 8 - IoT Integration (Optional)
- **v3.5.0** (Month 18): Milestone 9 - Enterprise Features
- **v4.0.0** (Month 20): Milestone 10 - Marketplace Launch

---

## 📈 Success Metrics & KPIs

### Product Metrics

- **Active Complexes:** New complexes per month
- **User Engagement:** Daily/Monthly active residents & pengurus
- **Retention Rate:** 30/60/90 day retention untuk complexes
- **Feature Adoption:** Usage rate untuk key features (billing, access control, etc.)

### Business Metrics

- **Units Under Management:** Total units managed via platform
- **Monthly Recurring Revenue (MRR):** Subscription income
- **Customer Lifetime Value (CLV):** Average value per complex over 3 years
- **Customer Acquisition Cost (CAC):** Marketing spend per new complex

### Financial Metrics

- **Collection Rate:** % of iuran collected on time
- **Outstanding AR:** Total unpaid invoices
- **Payment Success Rate:** % of successful payments via Xendit
- **Average Revenue Per Unit (ARPU):** Rp 3,500-5,000/month

### Operational Metrics

- **Complaint Resolution Time:** Average time dari complaint submission to resolution
- **Facility Utilization:** % of booked hours vs available hours
- **Task Completion Rate:** % of tasks completed on time
- **Staff Productivity:** Tasks completed per staff per day

---

## 🚨 Risks & Mitigation

### Business Risks

| Risk | Probability | Impact | Mitigation |
|------|-------------|--------|------------|
| Slow market adoption | Medium | High | Strong pilot program, partnerships dengan property developers, freemium tier |
| Price sensitivity | Medium | High | Flexible pricing, volume discounts, freemium tier, prove ROI (time savings) |
| Competition dari prop-tech | High | Medium | Open-source transparency (trust), superior UX, mobile-first, faster deployment |
| Payment gateway dependency | Low | Medium | Multi-gateway support (Xendit + Midtrans), manual payment reconciliation |
| Non-payment of iuran | High | Medium | Auto-payment features, late fees, resident shaming (optional), legal support |

### Technical Risks

| Risk | Probability | Impact | Mitigation |
|------|-------------|--------|------------|
| Multi-tenant data leakage | Low | Critical | Strict tenant isolation, row-level security, regular security audits |
| Xendit downtime | Medium | High | Multi-gateway backup, manual payment reconciliation, clear error communication |
| Scalability bottlenecks | Medium | High | Performance testing, database indexing, caching strategy (Redis), load balancing |
| Mobile app complexity | High | Medium | Start dengan web, defer native until traction proven, hire experienced mobile dev |
| Data privacy (PDPA) | Medium | High | Encryption, access control, audit logs, explicit consent, right to deletion |

### Operational Risks

| Risk | Probability | Impact | Mitigation |
|------|-------------|--------|------------|
| Solo founder dependency | High | High | Document processes, hire contractors, build community, prioritize automation |
| Customer support burden | Medium | Medium | Self-service documentation, chatbot, community forum, prioritized support untuk paid |
| Feature creep | Medium | Medium | Strict roadmap discipline, prioritization framework, customer feedback loops |
| Open-source license violations | Low | Medium | Clear license documentation, compliance checks, AGPL enforcement |

---

## 🔄 Iteration Process

### Review Cadence

- **Weekly:** Team standup dan sprint progress review
- **Bi-weekly:** Sprint planning dan review
- **Monthly:** Roadmap review dan adjustment
- **Quarterly:** Strategic planning dan goal setting

### Feedback Loops

- **User Feedback:** Monthly user interviews dengan pilot complexes
- **Stakeholder Review:** Quarterly updates dengan property managers
- **Technical Review:** Monthly architecture dan performance reviews
- **Market Analysis:** Quarterly competitive landscape dan trends

---

## 📝 Change Management

### Roadmap Updates

- **Frequency:** Reviewed quarterly, updated as needed
- **Process:** User feedback → Team discussion → Stakeholder approval → Documentation update
- **Communication:** Changes communicated via monthly newsletter dan sprint planning

### Priority Changes

- **Triggers:** Customer feedback, technical constraints, market changes, competitor moves
- **Process:** Impact analysis → Team discussion → Decision → Communication
- **Documentation:** Updated in this roadmap dengan rationale dan timeline

---

## 🎯 Success Stories & Use Cases

### Target Success Stories

1. **Kompleks Graha Indah (300 units):**
   - Challenge: 65% collection rate, manual Excel billing, frequent conflicts
   - Solution: Klustera automated billing + transparent portal
   - Result: 92% collection rate, 8 hours/week saved, zero conflicts

2. **Permata Housing (5 complexes, 1,500 units):**
   - Challenge: Different systems per complex, no consolidated reporting
   - Solution: Klustera multi-complex management
   - Result: Unified dashboard, 50% reduction admin overhead, data-driven decisions

3. **Apartemen City View (200 units):**
   - Challenge: Security issues, manual guest log, no access tracking
   - Solution: Klustera QR access control + guest pre-registration
   - Result: 30-second guest processing, 100% access log coverage, improved security

### Expected Impact

- **Transparency:** 100% visibility untuk residents ke aggregate financial data
- **Efficiency:** 80% reduction dalam administrative work (billing, reporting)
- **Security:** Complete access log with audit trail
- **Collection:** 25-30% improvement in on-time payment collection
- **Satisfaction:** 4.5/5 resident satisfaction score

---

**Last Updated:** 2026-01-06
**Next Review Date:** 2026-04-01
**Owner:** Product Team (Klustera.id)
**Reviewers:** Development Team, Property Managers, Pilot Complex Representatives
