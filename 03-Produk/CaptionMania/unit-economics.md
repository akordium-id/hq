# CaptionMania - Unit Economics & Business Model

**Beads Task:** hq-17r.7 - Unit Economics & Business Model
**Status:** 🔄 In Progress
**Last Updated:** 2026-01-07

---

## Executive Summary

**Business Model:** SaaS Subscription (Rp 99k/month)

**Target LTV:CAC Ratio:** ≥3:1 (healthy SaaS benchmark)

**Breakeven Timeline:** 12-18 months for 1,000-5,000 user scale

**Key Assumptions:**
- Monthly Churn: 5-8%
- CAC: Rp 150k - Rp 300k per user
- ARPU: Rp 99k/month
- Gross Margin: 70%+

---

## Revenue Model

### Subscription Tiers

| Plan | Price | Target Users | ARPU | Expected Mix |
|------|-------|--------------|------|--------------|
| **Monthly** | Rp 99.000 | Standard users | Rp 99k | 70% |
| **Annual** | Rp 990.000 | Committed users | Rp 82.5k | 30% |
| **Weighted ARPU** | | | **Rp 94k** | 100% |

**Annual Discount:** 2 months free (17% discount)
**Expected Annual Conversion:** 30% of users

### Revenue Projections

**Year 1 (1,000 - 5,000 users):**

| Scenario | Users | Avg ARPU | MRR | ARR |
|----------|-------|----------|-----|-----|
| Conservative | 1,000 | Rp 94k | Rp 94M | Rp 1.13B |
| Moderate | 3,000 | Rp 94k | Rp 282M | Rp 3.38B |
| Optimistic | 5,000 | Rp 94k | Rp 470M | Rp 5.64B |

**Year 2 (5,000 - 15,000 users):**
- Conservative: Rp 5.64B ARR
- Moderate: Rp 11.28B ARR
- Optimistic: Rp 16.92B ARR

**Year 3 (15,000 - 50,000 users):**
- Conservative: Rp 16.92B ARR
- Moderate: Rp 37.6B ARR
- Optimistic: Rp 56.4B ARR

---

## Cost Structure

### Variable Costs (Per User/Month)

| Cost Item | Cost per User | Notes |
|-----------|---------------|-------|
| **OpenAI API** | Rp 5k - 25k | Depends on usage (with 80% cache hit) |
| **Server Costs** | Rp 3k - 10k | Go + SvelteKit hosting |
| **Database** | Rp 1k - 3k | PostgreSQL + Redis |
| **Support** | Rp 2k - 5k | Email/ticket support |
| **Payment Gateway** | Rp 3k | 3% MDR |
| **Total Variable Cost** | **Rp 14k - 46k** | Avg: **Rp 30k** |

**Gross Margin:** (Rp 94k - Rp 30k) / Rp 94k = **68%** ✅

### Fixed Costs (Monthly)

| Cost Item | Amount | Notes |
|-----------|--------|-------|
| **Hosting (Base)** | Rp 2M - 5M | Oracle Cloud infrastructure |
| **Development Tools** | Rp 1M - 2M | GitHub, Copilot, etc. |
| **Office/Workspace** | Rp 2M - 5M | Coworking or home office |
| **Internet/Utilities** | Rp 500k - 1M | High-speed internet |
| **Software Subscriptions** | Rp 500k - 1M | Design tools, monitoring, etc. |
| **Legal/Admin** | Rp 1M - 2M | Accounting, legal compliance |
| **Marketing (Base)** | Rp 2M - 5M | Content creation, basic ads |
| **Total Fixed Costs** | **Rp 9M - 21M** | Avg: **Rp 15M** |

---

## Unit Economics Analysis

### Customer Acquisition Cost (CAC)

**Organic Channels (Primary - Bootstrap):**

| Channel | Estimated CAC | % of Users | Weighted CAC |
|---------|---------------|------------|--------------|
| SEO/Content Marketing | Rp 50k - 100k | 40% | Rp 20k - 40k |
| Referrals | Rp 25k - 50k | 30% | Rp 7.5k - 15k |
| Community Engagement | Rp 75k - 150k | 20% | Rp 15k - 30k |
| Marketplace Partnerships | Rp 100k - 200k | 10% | Rp 10k - 20k |
| **Weighted CAC** | | | **Rp 53k - 105k** |

**Paid Channels (Future - Growth):**

| Channel | Estimated CAC | Notes |
|---------|---------------|-------|
| Facebook/Instagram Ads | Rp 200k - 400k | Targeted ads to sellers |
| Google Ads | Rp 300k - 500k | High-intent keywords |
| Influencer Marketing | Rp 150k - 300k | Seller education content |
| **Average Paid CAC** | **Rp 217k - 400k** | |

**Bootstrap Target CAC:** Rp 75k - Rp 150k per user

### Customer Lifetime Value (LTV)

**LTV Formula:** LTV = ARPU × Gross Margin % / Churn Rate

**Assumptions:**
- ARPU: Rp 94k/month
- Gross Margin: 68%
- Churn: 6% monthly (industry avg for SaaS)

**Calculations:**
- Monthly Contribution Margin: Rp 94k × 68% = Rp 64k
- Average Customer Lifetime: 1 / 6% = 16.7 months
- **LTV:** Rp 64k × 16.7 = **Rp 1.07M**

### LTV:CAC Ratio Analysis

| Scenario | CAC | LTV | LTV:CAC | Assessment |
|----------|-----|-----|---------|------------|
| **Best Case** | Rp 75k | Rp 1.07M | **14.3:1** | ⭐⭐⭐ Excellent |
| **Target Case** | Rp 150k | Rp 1.07M | **7.1:1** | ⭐⭐ Very Good |
| **Worst Case** | Rp 300k | Rp 1.07M | **3.6:1** | ⭐ Good (≥3:1) |
| **Paid Case** | Rp 400k | Rp 1.07M | **2.7:1** | ⚠️ Marginal |

**Benchmark:**
- LTV:CAC ≥ 3:1 is healthy
- LTV:CAC ≥ 5:1 is very good
- LTV:CAC ≥ 8:1 is excellent

**Our Target:** 7:1 (very healthy for bootstrap SaaS)

---

## Payback Period

**Time to Recover CAC:**

| CAC Scenario | Monthly Contribution | Payback Period |
|--------------|---------------------|----------------|
| Rp 75k | Rp 64k | **1.2 months** ⭐ |
| Rp 150k | Rp 64k | **2.3 months** ⭐ |
| Rp 300k | Rp 64k | **4.7 months** ⚠️ |

**Target:** ≤3 months payback period ✅

---

## Churn Analysis

### Churn Assumptions

| Churn Rate | Monthly | Annual | Impact |
|------------|---------|--------|--------|
| **Best Case** | 4% | 39% | Excellent retention |
| **Target Case** | 6% | 53% | Good SaaS benchmark |
| **Worst Case** | 8% | 63% | Acceptable for Indonesia |

**Indonesia Context:** Churn typically higher due to:
- Payment method failures (common in emerging markets)
- Seasonal sellers (Ramadhan, Harbolnas)
- Smaller business failure rates

### Churn Reduction Strategies

1. **Annual Plans:** Lock in for 12 months (30% of users)
2. **Habit Formation:** Daily/weekly usage creates stickiness
3. **Success Metrics:** Show ROI (time saved, sales increase)
4. **Community:** Build seller community around product
5. **Grace Periods:** Auto-retry failed payments 3x before churn

**Target Net Churn:** 4-5% monthly (after expansion revenue)

---

## Breakeven Analysis

### User Breakeven

**Monthly Fixed Costs:** Rp 15M

**Contribution Margin per User:** Rp 64k

**Breakeven Users:** Rp 15M / Rp 64k = **234 users**

**Interpretation:** At 234 paying users, we cover fixed costs.

### Time to Breakeven

**Assumptions:**
- Month 1: 50 users
- Month 3: 150 users
- Month 6: 500 users
- Growth rate: 30-50% month-over-month

**Breakeven Timeline:**
- Conservative: Month 7-8
- Moderate: Month 4-5
- Optimistic: Month 3

**Target:** Breakeven by Month 6 ✅

---

## Growth Scenarios

### Scenario 1: Conservative (Bootstrap, No Paid Ads)

| Month | Users | MRR | CAC (Cumulative) | Cash Flow |
|-------|-------|-----|------------------|------------|
| 1 | 50 | Rp 4.7M | (Rp 3.75M) | **(Rp 14.05M)** |
| 3 | 150 | Rp 14.1M | (Rp 11.25M) | **(Rp 12.15M)** |
| 6 | 500 | Rp 47M | (Rp 37.5M) | **(Rp 5.5M)** |
| 9 | 1,000 | Rp 94M | (Rp 75M) | **Rp 4M** ✅ |
| 12 | 1,500 | Rp 141M | (Rp 112.5M) | **Rp 13.5M** |

**Breakeven:** Month 9 (positive cash flow)

### Scenario 2: Moderate (Bootstrap + Light Paid)

| Month | Users | MRR | CAC (Cumulative) | Marketing Spend | Cash Flow |
|-------|-------|-----|------------------|-----------------|------------|
| 1 | 75 | Rp 7.05M | (Rp 11.25M) | Rp 5M | **(Rp 19.2M)** |
| 3 | 300 | Rp 28.2M | (Rp 45M) | Rp 15M | **(Rp 31.95M)** |
| 6 | 1,000 | Rp 94M | (Rp 150M) | Rp 30M | **(Rp 91M)** |
| 9 | 2,500 | Rp 235M | (Rp 375M) | Rp 45M | **(Rp 200M)** |
| 12 | 3,000 | Rp 282M | (Rp 450M) | Rp 60M | **(Rp 228M)** |

**Note:** Higher initial investment, faster growth, deeper cash flow negative initially
**Funding Needed:** Rp 200M - 250M for first year

### Scenario 3: Optimistic (Viral Growth)

| Month | Users | MRR | CAC (Cumulative) | Cash Flow |
|-------|-------|-----|------------------|------------|
| 1 | 100 | Rp 9.4M | (Rp 7.5M) | **(Rp 12.85M)** |
| 3 | 500 | Rp 47M | (Rp 37.5M) | **(Rp 5.5M)** |
| 6 | 2,000 | Rp 188M | (Rp 150M) | **Rp 23M** ✅ |
| 9 | 5,000 | Rp 470M | (Rp 375M) | **Rp 80M** |
| 12 | 8,000 | Rp 752M | (Rp 600M) | **Rp 137M** |

**Breakeven:** Month 5 (positive cash flow)

---

## Sensitivity Analysis

### Key Variables Impact

| Variable | -20% | Base | +20% | Most Impact |
|----------|------|------|------|-------------|
| **ARPU** | Rp 75k | Rp 94k | Rp 113k | ⭐⭐⭐ High |
| **Churn** | 4.8% | 6% | 7.2% | ⭐⭐⭐ High |
| **CAC** | Rp 60k | Rp 75k | Rp 90k | ⭐⭐ Medium |
| **Gross Margin** | 54% | 68% | 82% | ⭐⭐ Medium |

**Most Sensitive:** ARPU and Churn rate

**Insight:** Focus on retention (reduce churn) and upsells (increase ARPU)

---

## Benchmarking

### Indonesian SaaS Benchmarks

| Metric | Our Target | Indonesia Average | Global Average |
|--------|------------|-------------------|----------------|
| **LTV:CAC** | 7:1 | 3:1 - 5:1 | 3:1 - 5:1 |
| **Monthly Churn** | 6% | 8-10% | 5-7% |
| **Gross Margin** | 68% | 70-80% | 70-85% |
| **Payback Period** | 2.3 mo | 6-12 mo | 5-10 mo |
| **Breakeven Users** | 234 | 500-1000 | 500-1500 |

**Our Position:** Above average on LTV:CAC, faster payback, lower breakeven ✅

---

## Economic Moat

### Competitive Advantages

1. **Data Moat:** User data improves model quality over time
2. **Network Effects:** More users = better templates = better value
3. **Switching Costs:** Habit formation + history + templates
4. **Local Knowledge:** Indonesian marketplace nuances (hard to replicate)
5. **Cost Advantages:** Aggressive caching = lower COGS at scale

### Moat Strength Timeline

| Phase | Moat Strength | Description |
|-------|---------------|-------------|
| **Year 1** | Weak | Easy to copy features |
| **Year 2** | Medium | Data accumulation + user habits |
| **Year 3** | Strong | Network effects + brand + data moat |

---

## Risk Factors

### Economic Risks

| Risk | Probability | Impact | Mitigation |
|------|-------------|--------|------------|
| Higher OpenAI costs | Medium | High | Aggressive caching, open source fallback |
| Higher churn than expected | Medium | High | Success metrics, community building |
| Slower growth (low CAC efficiency) | Medium | Medium | Multiple acquisition channels |
| Price pressure (can't sustain Rp 99k) | Low | Medium | Value communication, feature differentiation |

### Sensitivity to OpenAI Costs

**Current:** Rp 30k/user/month (with 80% cache hit)

**If OpenAI prices 2x:** Rp 45k/user/month
- Gross margin: 52% (down from 68%)
- LTV: Rp 820k (down from Rp 1.07M)
- LTV:CAC: 5.5:1 (still healthy) ✅

**If OpenAI prices 3x:** Rp 60k/user/month
- Gross margin: 36% (marginal)
- LTV: Rp 570k
- LTV:CAC: 3.8:1 (still acceptable) ⚠️

**Mitigation:** Improve cache hit rate to 90% (reduce per-user cost by 50%)

---

## Funding Requirements

### Bootstrap Scenario (Preferred)

**Year 1 Cash Needs:**
- Development: Self-funded (Najib's time)
- Servers: Rp 2M - 5M/month
- Marketing: Rp 2M - 5M/month
- **Total Burn:** Rp 4M - 10M/month
- **Peak Cash Need:** ~Rp 50M - Rp 80M

**Funding Source:**
- Personal savings
- Revenue from consulting/services (Akordium Lab)
- Pre-sales (annual subscriptions upfront)

### External Funding (If Accelerating)

**Seed Round Target:** Rp 500M - Rp 1.5B

**Use of Funds:**
- 60%: Growth (hiring 1-2 devs, marketing)
- 20%: Product (features, integrations)
- 20%: Operations (tools, infrastructure)

**Runway:** 12-18 months to reach 3,000-5,000 users

---

## Key Metrics to Track

### North Star Metric

**Monthly Recurring Revenue (MRR) Growth**
- Target: 30% month-over-month (Year 1)
- Target: 15% month-over-month (Year 2)

### Health Metrics

| Metric | Target | Tracking Frequency |
|--------|--------|-------------------|
| MRR | Growth dashboard | Daily |
| Churn | <6% monthly | Weekly |
| LTV:CAC | >3:1 | Monthly |
| ARPU | Rp 94k+ | Monthly |
| CAC | <Rp 150k | Monthly |
| Cash Flow | Positive by Month 9 | Monthly |

### Leading Indicators

- Waitlist signups
- Free trial starts
- Trial-to-paid conversion
- Referral rate
- Feature usage patterns

---

## Validation Checklist

- [ ] **Unit economics model built and reviewed**
- [ ] **CAC estimates validated with real campaigns**
- [ ] **Churn assumptions tested with pilot users**
- [ ] **LTV:CAC ratio exceeds 3:1 base case**
- [ ] **Breakeven analysis completed**
- [ ] **Sensitivity analysis for key variables**
- [ ] **Funding requirements defined**
- [ ] **Metrics dashboard set up**

---

## Next Steps

1. ✅ Create unit economics framework
2. ⏳ Validate CAC with small marketing tests (Rp 500k - Rp 1M budget)
3. ⏳ Run pilot with 50 beta users for churn data
4. ⏳ Refine model with real data
5. ⏳ Build metrics dashboard
6. ⏳ Review and adjust projections monthly

---

**Beads Task Link:** [hq-17r.7](beads:show hq-17r.7)
**Dependencies:**
- [hq-17r.3](./market-sizing.md) - Market sizing informs growth projections
- [hq-17r.4](./pricing-validation.md) - Pricing determines ARPU
- [hq-17r.6](./customer-discovery.md) - Interview data informs CAC/churn assumptions

---

**Last Updated:** 2026-01-07
**Owner:** Najib Zain
**Status:** Framework Created - Awaiting Real Data for Validation
