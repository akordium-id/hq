# 💰 DukunGPS - Business Model & Unit Economics

> **Last Updated:** 2026-01-06
> **Related Beads:**
> - [hq-4kb.19](https://github.com/akordium/hq/issues/4kb.19) - Unit Economics
> - [hq-4kb.20](https://github.com/akordium/hq/issues/4kb.20) - Pricing Strategy
> - [hq-4kb.23](https://github.com/akordium/hq/issues/4kb.23) - B2B Sales Strategy

---

## 📊 Business Model Overview

### Value Proposition

**For B2B Fleet Management Customers:**
- **Reduce Fuel Costs:** 15-30% fuel savings via route optimization & driver behavior monitoring
- **Increase Productivity:** 10-25% reduction in travel time with AI predictive routing
- **Prevent Theft:** Real-time alerts, geofencing, immediate recovery response
- **Improve Safety:** Driver behavior monitoring reduces accidents & insurance premiums
- **Streamline Operations:** Automated maintenance reminders, digital fleet oversight

**Primary Differentiator vs Competitors:**
- **AI Prediction Layer:** Not just tracking, but actively optimizing routes & predicting traffic
- **Affordable Pricing:** 60-70% cheaper than market leaders (TrackSolid, Geotab)
- **Modern UX:** User-friendly dashboard (not enterprise clunky interface)
- **Local Focus:** Indonesia-specific features (traffic patterns, anti-theft, WhatsApp alerts)

---

## 💵 Pricing Strategy

### Hardware Pricing (One-time Purchase)

| Device Type | Selling Price | Cost (White-label) | Gross Margin |
|-------------|---------------|-------------------|--------------|
| **OBD-II Scanner** | Rp 500k | Rp 300-350k | 30-40% |
| **Hardwired GPS** | Rp 500k | Rp 350-400k | 20-29% |
| **Portable Tracker** | Rp 600k | Rp 400-450k | 25-33% |
| **Mobile App Only** | Free | N/A | N/A (software) |

**Strategy:** Break-even or slight profit on hardware to drive subscription revenue (razor-and-blade model).

### Subscription Pricing (Per Device/Month)

#### **Starter Plan** (SME Fleets: 1-10 vehicles)
- **Price:** Rp 49,000/device/month
- **Billing:** Monthly, quarterly (5% discount), or annual (17% discount)
- **Features:**
  - Real-time GPS tracking (30-60 second updates)
  - 30-day history playback
  - 5 geofence zones max
  - Speed alerts & harsh braking detection
  - Email notifications only
  - 1 month GPS data retention
- **Target:** Small fleets, price-sensitive customers
- **Competitor Pricing:** Rp 49-79k (Orion, Lacak.io)

#### **Business Plan** (Mid-Market: 11-50 vehicles)
- **Price:** Rp 39,000/device/month (20% volume discount)
- **Billing:** Quarterly or annual required
- **Features:**
  - Everything in Starter, plus:
  - Real-time tracking (30-second updates)
  - 60-day history playback
  - Unlimited geofence zones
  - Driver behavior score & basic analytics
  - Maintenance reminders (mileage-based)
  - Email + SMS notifications
  - 3 months GPS data retention
- **Target:** Growing fleets, logistics companies
- **Competitor Pricing:** Rp 79-150k (Lacak.io, TrackSolid)

#### **Enterprise Plan** (Large Fleets: 50+ vehicles)
- **Price:** Rp 29,000/device/month (40% volume discount)
- **Billing:** Annual contract required
- **Features:**
  - Everything in Business, plus:
  - Real-time tracking (30-second updates)
  - 90-day history playback
  - **AI Predictive Routing** (core differentiator)
  - Advanced analytics dashboard
  - Custom reports & API access
  - WhatsApp + SMS + push notifications
  - 3 months GPS data retention
  - Dedicated account manager
  - SLA guarantee (99.5% uptime)
- **Target:** Large enterprises, rental companies
- **Competitor Pricing:** Rp 150-300k (TrackSolid, Geotab)

#### **Family Plan** (B2C: 5 devices bundle)
- **Price:** Rp 199,000/month for 5 devices (Rp 39,800/device/month)
- **Purpose:** Parenting & family safety
- **Features:** Business Plan features + SOS button, speed alerts for teens
- **Target:** Parents, elderly care
- **Launch:** Phase 4 (Months 19+)

### Volume Discount Tiers

| Fleet Size | Price Per Device | Discount vs Starter |
|------------|------------------|---------------------|
| 1-10 vehicles | Rp 49k | Baseline |
| 11-50 vehicles | Rp 39k | 20% |
| 51-100 vehicles | Rp 34k | 30% |
| 100+ vehicles | Rp 29k | 40% |
| 500+ vehicles | Custom (Rp 24k+) | 50%+ |

**Strategy:** Volume discounts incentivize larger fleets, increase account stickiness (switching costs).

---

## 📈 Unit Economics

### Customer Acquisition Cost (CAC)

**B2B Direct Sales (Fleets 10+ vehicles):**
- **Sales Activities:**
  - Cold outreach (LinkedIn, email): Rp 50k per prospect
  - Demo setup & presentation: Rp 100k per qualified lead
  - Onboarding & training: Rp 200k per new customer
  - Sales commission (10% of first-year revenue): Rp 150k avg
- **Total CAC:** **Rp 500k per customer** (average fleet size: 30 vehicles)
- **Payback Period:** 1.3 months (based on Rp 39k × 30 vehicles = Rp 1.17M MRR)

**B2C Digital Marketing (Family Plan, Phase 4):**
- **Customer Acquisition:**
  - Google Ads: Rp 75k per click, 5% conversion = Rp 1.5M per 10 customers
  - Facebook/Instagram Ads: Rp 50k per click, 8% conversion = Rp 625k per 10 customers
  - Referral program: Rp 50k credit per referral
- **Total CAC:** **Rp 200k per customer** (average LTV: Rp 1.2M, 6-month payback)

### Customer Lifetime Value (LTV)

**Assumptions:**
- **Average Fleet Size:** 30 vehicles (Business Plan: Rp 39k/device/month)
- **Monthly Revenue:** Rp 1,170,000 (30 vehicles × Rp 39k)
- **Retention:** 85% annual retention (15% churn, typical B2B SaaS)
- **Lifetime:** 67 months (~5.5 years)

**LTV Calculation:**
```
Monthly Revenue: Rp 1,170,000
Annual Revenue: Rp 14,040,000
Lifetime (years): 5.5
LTV: Rp 14,040,000 × 5.5 = Rp 77,220,000
```

**LTV:CAC Ratio:**
- **LTV:** Rp 77,220,000
- **CAC:** Rp 500,000 (one-time)
- **Ratio:** **154:1** (Excellent - industry standard is 3:1)

**Note:** LTV:CAC of 154:1 is unusually high because:
1. Fleet accounts have high MRR (multiple vehicles)
2. B2B churn is low (switching costs)
3. CAC is low (direct sales, not paid ads)

### Gross Margin

**Per Device Per Month:**
- **Revenue:** Rp 39,000 (Business Plan average)
- **COGS (Cost of Goods Sold):**
  - Infrastructure (server, database, WebSocket): Rp 5,000
  - Google Maps API (traffic data): Rp 2,000
  - SMS notifications (2 per day): Rp 3,000
  - Support cost (amortized): Rp 2,000
  - Total COGS: Rp 12,000
- **Gross Margin:** Rp 27,000 (69% gross margin)

**Contribution Margin (per customer, per month):**
- **Revenue:** Rp 1,170,000 (30 vehicles × Rp 39k)
- **COGS:** Rp 360,000 (30 vehicles × Rp 12k)
- **Gross Profit:** Rp 810,000 (69% margin)

---

## 🎯 Revenue Projections

### Year 1 Targets

**Conservative Scenario:**
| Metric | Target |
|--------|--------|
| Active Fleets | 20 fleets |
| Active Devices | 600 devices (avg 30 vehicles/fleet) |
| MRR | Rp 23,400,000 (600 devices × Rp 39k avg) |
| ARR | Rp 280,800,000 |
| Hardware Revenue (one-time) | Rp 300,000,000 (600 devices × Rp 500k) |
| **Total Revenue** | **Rp 580,800,000** |

**Moderate Scenario (Base Case):**
| Metric | Target |
|--------|--------|
| Active Fleets | 50 fleets |
| Active Devices | 1,500 devices (avg 30 vehicles/fleet) |
| MRR | Rp 58,500,000 (1,500 devices × Rp 39k avg) |
| ARR | Rp 702,000,000 |
| Hardware Revenue (one-time) | Rp 750,000,000 (1,500 devices × Rp 500k) |
| **Total Revenue** | **Rp 1,452,000,000** |

**Aggressive Scenario:**
| Metric | Target |
|--------|--------|
| Active Fleets | 100 fleets |
| Active Devices | 3,000 devices (avg 30 vehicles/fleet) |
| MRR | Rp 117,000,000 (3,000 devices × Rp 39k avg) |
| ARR | Rp 1,404,000,000 |
| Hardware Revenue (one-time) | Rp 1,500,000,000 (3,000 devices × Rp 500k) |
| **Total Revenue** | **Rp 2,904,000,000** |

### Year 2-3 Projections

**Assumptions:**
- **Growth Rate:** 100% YoY (Year 1→2), 80% YoY (Year 2→3)
- **Average Fleet Size:** Grows from 30 → 40 → 50 vehicles
- **Churn:** 15% annual (industry standard for B2B SaaS)

**Year 2 (Moderate Scenario):**
- Active Fleets: 100 fleets (50 new + 50 retained from Year 1)
- Active Devices: 4,000 devices (avg 40 vehicles/fleet)
- MRR: Rp 156,000,000
- ARR: Rp 1,872,000,000
- Hardware Revenue: Rp 800,000,000
- **Total Revenue:** **Rp 2,672,000,000** (84% YoY growth)

**Year 3 (Moderate Scenario):**
- Active Fleets: 180 fleets (80 new + 100 retained from Year 2)
- Active Devices: 9,000 devices (avg 50 vehicles/fleet)
- MRR: Rp 351,000,000
- ARR: Rp 4,212,000,000
- Hardware Revenue: Rp 1,350,000,000
- **Total Revenue:** **Rp 5,562,000,000** (108% YoY growth)

---

## 💸 Cost Structure

### Fixed Costs (Monthly)

| Expense Item | Monthly Cost | Annual Cost |
|--------------|--------------|-------------|
| **Infrastructure (OCI)** | Rp 5,000,000 | Rp 60,000,000 |
| • Servers (3 instances) | Rp 3,000,000 | Rp 36,000,000 |
| • Database (TimescaleDB) | Rp 1,000,000 | Rp 12,000,000 |
| • Storage (S3 GPS logs) | Rp 500,000 | Rp 6,000,000 |
| • CDN (Cloudflare) | Rp 500,000 | Rp 6,000,000 |
| **Software & APIs** | Rp 10,000,000 | Rp 120,000,000 |
| • Google Maps API | Rp 7,000,000 | Rp 84,000,000 |
| • SMS Gateway (Nexmo) | Rp 2,000,000 | Rp 24,000,000 |
| • Email (SendGrid) | Rp 500,000 | Rp 6,000,000 |
| • Monitoring (Sentry) | Rp 500,000 | Rp 6,000,000 |
| **Personnel (Founders)** | Rp 40,000,000 | Rp 480,000,000 |
| • Tech Lead (Najib) | Rp 25,000,000 | Rp 300,000,000 |
| • Sales/Business | Rp 15,000,000 | Rp 180,000,000 |
| **Office & Operations** | Rp 5,000,000 | Rp 60,000,000 |
| • Co-working space | Rp 2,000,000 | Rp 24,000,000 |
| • Legal, accounting | Rp 1,000,000 | Rp 12,000,000 |
| • Marketing, misc | Rp 2,000,000 | Rp 24,000,000 |
| **TOTAL FIXED COSTS** | **Rp 60,000,000** | **Rp 720,000,000** |

### Variable Costs (Per Device/Month)

| Cost Item | Cost Per Device/Month |
|-----------|----------------------|
| Infrastructure (amortized) | Rp 5,000 |
| Google Maps API | Rp 2,000 |
| SMS notifications | Rp 3,000 |
| Support (amortized) | Rp 2,000 |
| **Total Variable Cost** | **Rp 12,000** |

**Note:** Variable costs decrease with scale (economies of scale in infrastructure, API usage discounts).

---

## 📊 Profitability Analysis

### Break-Even Analysis

**Monthly Fixed Costs:** Rp 60,000,000
**Contribution Margin per Device:** Rp 27,000 (Rp 39k revenue - Rp 12k COGS)

**Break-Even Point (Devices):**
```
Break-Even Devices = Fixed Costs / Contribution Margin
                   = Rp 60,000,000 / Rp 27,000
                   = 2,223 devices

Break-Even MRR = 2,223 devices × Rp 39,000
               = Rp 86,697,000
```

**Break-Even Timeline:**
- **Month 10:** Break-even (assuming moderate scenario: 150 new devices/month)
- **Month 18:** Profitable (Year 2 expansion)

### Profit Margins (Year 1, Moderate Scenario)

**Revenue:**
- Subscription: Rp 702,000,000
- Hardware: Rp 750,000,000
- **Total Revenue:** Rp 1,452,000,000

**Costs:**
- Fixed: Rp 720,000,000
- Variable (COGS): Rp 216,000,000 (1,500 devices × Rp 12k × 12 months)
- **Total Costs:** Rp 936,000,000

**Profit:**
- **Gross Profit:** Rp 1,236,000,000 (85% gross margin)
- **Operating Profit:** Rp 516,000,000 (36% operating margin)
- **Net Profit (after 20% tax):** Rp 412,800,000 (28% net margin)

---

## 🎯 Go-to-Market Strategy

### Customer Acquisition Channels

**Primary Channel (70% of customers): Direct B2B Sales**

**Target Segments:**
1. **Logistics & Distribution Companies** (40%)
   - Examples: JNE, J&T, cargo companies
   - Pain points: Fuel costs, route optimization, theft prevention
   - Approach: Cold email → Demo → Pilot program → Contract

2. **Rental Companies** (30%)
   - Examples: Rental mobil (TRAC, Mobi), motor rental
   - Pain points: Fleet tracking, theft recovery, usage monitoring
   - Approach: Partnership proposals, white-label options

3. **SME Fleets** (30%)
   - Examples: Delivery fleets (Gojek, Grab), sales fleets
   - Pain points: Cost-effective tracking, basic analytics
   - Approach: Digital marketing (Google Ads), referrals

**Secondary Channel (20% of customers): Partnerships**

**Partnership Types:**
1. **Insurance Companies** (Primary target)
   - Value prop: Reduce theft risk → lower insurance premiums
   - Partnership: 10-15% discount for policyholders with DukunGPS
   - Target: Adira, Sinarmas, ACA, Asuransi Kendaraan
   - Revenue model: Revenue share (10% commission on referrals)

2. **Vehicle Dealerships** (Secondary)
   - Car dealers: Toyota, Honda, Daihatsu
   - Motor dealers: Honda, Yamaha
   - Offer: Bundle GPS device with new vehicle purchase
   - Commission: Rp 100k per device referral

3. **Fleet Management Consultants** (Tertiary)
   - Consultants specializing in logistics optimization
   - White-label solution for their clients
   - Revenue share: 20% commission

**Tertiary Channel (10% of customers): Digital Marketing** (Phase 4, Months 19+)

**Channels:**
1. **Google Ads:**
   - Keywords: "GPS tracker Indonesia", "pelacak mobil", "anti-theft GPS"
   - Budget: Rp 5-10M/month
   - Target CPA: Rp 200k per customer (Family Plan)

2. **Facebook/Instagram Ads:**
   - Target: Parents, car owners, elderly care
   - Content: Product demos, testimonials, use cases
   - Budget: Rp 3-5M/month

3. **Content Marketing:**
   - Blog: "How GPS tracking reduces fuel costs by 20%"
   - YouTube: Product demos, customer interviews
   - SEO: Rank for "GPS tracker Indonesia", "fleet management"

### Sales Process (B2B)

**Sales Funnel:**

```
1. Lead Generation (Cold Outreach)
   ├─ LinkedIn Sales Navigator (target fleet managers)
   ├─ Cold email (personalized, 2-3 touchpoints)
   └─ Industry events (logistics conferences)

2. Qualification (Discovery Call)
   ├─ Confirm fleet size (10+ vehicles)
   ├─ Identify pain points (theft, fuel, efficiency)
   ├─ Budget check (Rp 500k+/month spend)
   └─ Decision maker identification

3. Demo & Proposal
   ├─ Product demo (30-minute walkthrough)
   ├─ ROI calculation (fuel savings, time savings)
   ├─ Pricing proposal (volume-based)
   └─ Address objections (competitor comparison)

4. Pilot Program (Close)
   ├─ 3-month pilot (5-10 devices)
   ├─ Free setup & installation
   ├─ Measure results (fuel savings, route optimization)
   └─ Convert to full fleet contract

5. Onboarding & Success
   ├─ Hardware installation (1-2 days)
   ├─ User training (1-hour session)
   ├─ Ongoing support (WhatsApp, email)
   └─ Quarterly business reviews
```

**Sales Cycle:**
- **Average:** 3-6 months (B2B enterprise typical)
- **Shortest:** 1 month (SME ready to buy)
- **Longest:** 12 months (large enterprise, procurement process)

**Conversion Rates:**
- Lead → Qualified Lead: 30%
- Qualified Lead → Demo: 50%
- Demo → Pilot: 40%
- Pilot → Contract: 80% (pilot converts to customer)

**Overall Funnel Conversion:** 4.8% (30% × 50% × 40% × 80%)

**Example:** 100 leads → 30 qualified → 15 demos → 6 pilots → 5 customers

---

## 🤝 Partnership Strategy

### Insurance Partnerships (Strategic Priority)

**Value Proposition:**
- **For Insurance:** Reduce theft risk → Lower claims → Higher profit margins
- **For DukunGPS:** Customer acquisition (trust transfer from insurance) → Lower CAC
- **For Customer:** 10-15% insurance discount + GPS tracking = Win-win-win

**Partnership Model:**
```
Customer gets GPS device → Insurance premium discount (10-15%)
                                    ↓
          Insurance company pays DukunGPS referral fee (10% commission)
```

**Target Companies:**
1. **Adira Insurance:** Market leader in vehicle insurance
2. **Asuransi Sinarmas:** Strong distribution network
3. **ACA (Asuransi Central Asia):** Tech-forward, innovative
4. **Asuransi Kendaraan:** SME-focused, complementary

**Partnership Terms (Proposed):**
- **Referral Fee:** 10% of subscription revenue (first year)
- **Discount:** 10-15% premium discount for GPS-equipped vehicles
- **Co-Marketing:** Joint webinars, case studies, blog content
- **Data Sharing:** Aggregated theft statistics (anonymized)

**Implementation:**
```
Phase 1 (Months 4-6): Identify partners, pitch proposals
Phase 2 (Months 7-9): Pilot with 1 insurance company
Phase 3 (Months 10+): Roll out to 3-5 insurance partners
```

### Rental Company Partnerships

**Target Companies:**
- **TRAC-Astra:** Largest car rental in Indonesia (5,000+ vehicles)
- **Mobi:** Growing rental player (1,000+ vehicles)
- **SME Rental Companies:** 50-200 vehicles each ( fragmented market)

**Value Proposition:**
- **For Rental:** Real-time tracking → Theft prevention → Usage monitoring → Lower insurance
- **For DukunGPS:** High-volume B2B customer (100+ vehicles per contract)
- **White-label Option:** Rental company can brand the GPS system as their own

**Partnership Model:**
1. **Direct Sale:** Rental company buys devices + subscription (standard B2B)
2. **White-label:** Rental company resells DukunGPS under their brand (revenue share)
3. **Revenue Share:** DukunGPS provides free devices, shares subscription revenue 50/50

---

## 📈 Key Performance Indicators (KPIs)

### Business Metrics (Monthly)

| Metric | Target (Year 1) | Target (Year 2) |
|--------|-----------------|-----------------|
| **New Customers (Fleets)** | 5/month | 10/month |
| **New Devices** | 150/month | 400/month |
| **MRR Growth** | 20% MoM | 15% MoM |
| **Churn Rate** | <5% monthly | <3% monthly |
| **Expansion Revenue** | 10% of new sales | 20% of new sales |
| **NPS (Net Promoter Score)** | >40 | >50 |
| **CAC** | <Rp 500k | <Rp 400k |
| **LTV:CAC Ratio** | >3:1 | >5:1 |

### Sales Metrics (Weekly)

| Metric | Target |
|--------|--------|
| **Qualified Leads** | 20/week |
| **Demos Scheduled** | 10/week |
| **Pilots Started** | 2/week |
| **Contracts Signed** | 1/week |
| **Pipeline Value** | Rp 500M+ |

### Product Metrics (Daily)

| Metric | Target |
|--------|--------|
| **Active Devices** | Growing 5% daily |
| **GPS Points Ingested** | 1M+ per day |
| **WebSocket Connections** | <1% disconnection rate |
| **API Response Time** | <200ms p95 |
| **System Uptime** | >99.5% |

---

## 🚨 Risks & Mitigation

### Business Risks

**Risk 1: Slower Sales Cycle (B2B)**
- **Impact:** Delayed revenue, higher burn rate
- **Probability:** Medium
- **Mitigation:**
  - Start with SME fleets (shorter sales cycle)
  - Offer 3-month pilot program (reduce decision friction)
  - Month-to-month contracts (lower commitment barrier)

**Risk 2: Competitor Price War**
- **Impact:** Margin compression, pricing pressure
- **Probability:** Low (established players have higher costs)
- **Mitigation:**
  - Focus on AI differentiation (hard to replicate)
  - Volume discounts for large fleets (competitors can't match)
  - Long-term contracts (annual payment = price lock-in)

**Risk 3: Hardware Quality Issues**
- **Impact:** Returns, refunds, brand damage
- **Probability:** Medium (white-label supplier risk)
- **Mitigation:**
  - Test samples from 3+ suppliers
  - Quality control inspection before deployment
  - Warranty policy (replace defective devices)

### Technical Risks

**Risk 4: Infrastructure Scaling Challenges**
- **Impact:** System downtime, poor customer experience
- **Probability:** Low (tech stack proven, Go + Fiber)
- **Mitigation:**
  - Load testing for 10k concurrent devices
  - Horizontal scaling architecture (Redis pub/sub)
  - Proactive monitoring & alerting

**Risk 5: AI/ML Model Inaccuracy**
- **Impact:** Poor predictions, customer complaints
- **Probability:** Medium (traffic prediction is hard)
- **Mitigation:**
  - Start with Google Maps API (proven, reliable)
  - Custom ML model as Phase 2 (train on real data)
  - Show confidence levels to users (manage expectations)

---

## 🎯 Action Plan

### Phase 1: Validation (Months 1-3)
- [ ] Complete 20 customer interviews
- [ ] Finalize pricing based on feedback
- [ ] Secure 3-5 pilot customers
- [ ] Order hardware samples for testing

### Phase 2: MVP Launch (Months 4-6)
- [ ] Deploy MVP (core tracking + geofence + alerts)
- [ ] Onboard pilot customers
- [ ] Collect feedback, iterate quickly
- [ ] Measure initial ROI (fuel savings, time savings)

### Phase 3: Growth (Months 7-12)
- [ ] Hire 2-3 salespeople
- [ ] Launch insurance partnership pilot
- [ ] Scale to 50 fleets (1,500 devices)
- [ ] Achieve positive cash flow (break-even)

### Phase 4: Expansion (Months 13-18)
- [ ] Launch AI predictive routing (differentiator)
- [ ] Expand to Surabaya, Medan markets
- [ ] Add mobile apps (PWA or native)
- [ ] Scale to 100 fleets (4,000 devices)

---

## 📊 Financial Summary (Year 1-3)

### Year 1 (Moderate Scenario)
- **Revenue:** Rp 1,452,000,000
- **Costs:** Rp 936,000,000
- **Profit:** Rp 516,000,000 (36% margin)
- **Customers:** 50 fleets (1,500 devices)

### Year 2 (Moderate Scenario)
- **Revenue:** Rp 2,672,000,000 (84% growth)
- **Costs:** Rp 1,600,000,000
- **Profit:** Rp 1,072,000,000 (40% margin)
- **Customers:** 100 fleets (4,000 devices)

### Year 3 (Moderate Scenario)
- **Revenue:** Rp 5,562,000,000 (108% growth)
- **Costs:** Rp 3,200,000,000
- **Profit:** Rp 2,362,000,000 (42% margin)
- **Customers:** 180 fleets (9,000 devices)

---

**Related Documentation:**
- [Product README](./README.md)
- [Validation Progress](./validasi.md)
- [Competitive Analysis](./competitive-analysis.md)
- [Tech Stack](./tech-stack.md)

**Related Beads Items:**
- [hq-4kb.19](https://github.com/akordium/hq/issues/4kb.19) - Unit Economics
- [hq-4kb.20](https://github.com/akordium/hq/issues/4kb.20) - Pricing Strategy
- [hq-4kb.21](https://github.com/akordium/hq/issues/4kb.21) - Hardware Margin
- [hq-4kb.23](https://github.com/akordium/hq/issues/4kb.23) - B2B Sales Strategy
- [hq-4kb.24](https://github.com/akordium/hq/issues/4kb.24) - Partnership Opportunities

**Last Updated:** 2026-01-06
**Maintainer:** Najib Zain (Product & Business Lead)
**Review Cycle:** Monthly during validation, quarterly post-launch
