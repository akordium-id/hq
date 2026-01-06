# 💰 Klustera.id - Pricing Model

**Version:** 1.0.0-concept
**Last Updated:** 2026-01-06
**Status:** Pre-Development

---

## 📋 Overview

Dokumen ini menjelaskan secara detail model pricing Klustera.id. Kami menggunakan **Per-Unit Pricing Model** sebagai model utama, dengan opsi SaaS Subscription sebagai alternatif.

**Core Philosophy:** Harga yang terjangkau dan adil - kompleks kecil tidak membayar subsidi kompleks besar.

---

## 💵 Per-Unit Pricing Model (Primary)

### Pricing Tiers

**Volume-based pricing** - Semakin besar kompleks, semakin murah harga per unit:

| Complex Size | Unit Count | Price per Unit | Example Monthly Cost |
|--------------|------------|----------------|----------------------|
| **Small** | < 100 units | **Rp 5,000/unit/month** | 50 units: Rp 250,000/month |
| **Medium** | 100-500 units | **Rp 3,000/unit/month** | 200 units: Rp 600,000/month |
| **Large** | 500+ units | **Rp 2,000/unit/month** | 1,000 units: Rp 2,000,000/month |

### Tier Definitions

**Small Complex (< 100 units):**
- Typical kompleks perumahan kecil di pinggiran kota
- Pengelola part-time (bukan full-time job)
- Lower operational complexity
- Higher per-unit cost karena economics of scale tidak tercapai

**Medium Complex (100-500 units):**
- Typical kompleks perumahan menengah di suburban
- Pengelola full-time (1-2 staff)
- Moderate operational complexity
- Optimal pricing tier untuk value-for-money

**Large Complex (500+ units):**
- Large residential complexes atau townships
- Professional management team (multiple staff)
- High operational complexity
- Lowest per-unit cost karena volume economies of scale

### Pricing Examples

**Example 1: Small Complex (50 units)**
```
Location: Tangerang Selatan
Type: Cluster kecil
Unit Count: 50
Pricing Tier: Small (Rp 5,000/unit)
Monthly Cost: 50 × Rp 5,000 = Rp 250,000
Annual Cost: Rp 3,000,000
```

**Example 2: Medium Complex (200 units)**
```
Location: Bekasi
Type: Kompleks perumahan menengah
Unit Count: 200
Pricing Tier: Medium (Rp 3,000/unit)
Monthly Cost: 200 × Rp 3,000 = Rp 600,000
Annual Cost: Rp 7,200,000
```

**Example 3: Large Complex (1,000 units)**
```
Location: Depok
Type: Large township
Unit Count: 1,000
Pricing Tier: Large (Rp 2,000/unit)
Monthly Cost: 1,000 × Rp 2,000 = Rp 2,000,000
Annual Cost: Rp 24,000,000
```

**Example 4: Developer dengan 5 Medium Complexes**
```
Developer: PT Bumi Sejahtera
Total Units: 5 × 200 = 1,000 units
Pricing: Rp 3,000/unit (medium tier)
Monthly Cost: 1,000 × Rp 3,000 = Rp 3,000,000
Annual Cost: Rp 36,000,000
Centralized Dashboard: Included (free)
```

---

## 🔄 Alternative: SaaS Subscription

Untuk kompleks yang prefer flat fee daripada per-unit pricing, kami tawarkan SaaS Subscription model.

### Subscription Tiers

| Plan | Unit Range | Monthly Fee | Annual Fee | Savings |
|------|-----------|-------------|------------|---------|
| **Small** | < 100 units | **Rp 500,000/month** | Rp 5,400,000 (2 months free) | 17% |
| **Medium** | 100-500 units | **Rp 1,500,000/month** | Rp 16,200,000 (2 months free) | 17% |
| **Large** | 500+ units | **Rp 3,000,000/month** | Rp 32,400,000 (2 months free) | 17% |

### When to Choose Subscription vs Per-Unit?

**Choose Per-Unit Pricing jika:**
- Occupancy rate fluktuatif (banyak unit kosong)
- Prefer flexible pricing (bayar sesuai penggunaan)
- Want accurate cost allocation per resident

**Choose Subscription jika:**
- Occupancy stabil (>90% occupied)
- Prefer predictable monthly cost
- Want simplicity (single fixed fee)

**Cost Comparison (200 units):**

| Model | Calculation | Monthly Cost | Annual Cost |
|-------|-------------|--------------|-------------|
| **Per-Unit** | 200 × Rp 3,000 | Rp 600,000 | Rp 7,200,000 |
| **Subscription** | Flat fee | Rp 1,500,000 | Rp 16,200,000 |
| **Difference** | - | Rp 900,000 lebih mahal | Rp 9,000,000 lebih mahal |

**Insight:** Untuk kompleks 200 units, per-unit pricing jauh lebih hemat (Rp 600K vs Rp 1.5M). Subscription only makes sense untuk very large complexes (>500 units) atau those dengan extremely high occupancy rates (>95%).

---

## 🎯 Pricing Strategy Rationale

### Why Per-Unit Pricing?

**1. Fairness & Transparency:**
- Kompleks kecil tidak subsidi kompleks besar
- Harga proposional dengan value yang diterima
- Easy untuk explain ke pengelola ("bayar Rp 3,000 per unit per bulan")

**2. Alignment dengan Customer Revenue:**
- Pengelola kompleks collect iuran dari residents (per-unit basis)
- Easy untuk pass-through cost ke residents (e.g., tambah Rp 3,000 ke iuran bulanan)
- Natural alignment antara Klustera revenue dan customer revenue

**3. Incentivizes Growth:**
- Tidak ada penalty untuk growing complexes
- Per-unit cost decreases as complex grows (volume discount automatic)
- Encourages developers untuk add Klustera ke semua complexes mereka

**4. Competitive Advantage:**
- Most competitors charge flat fee (not per-unit)
- More attractive untuk small-medium complexes (<500 units)
- Unique positioning di market

### Market Positioning vs Competitors

| Competitor | Pricing Model | Example (200 units) | Klustera Advantage |
|------------|--------------|---------------------|-------------------|
| **Jelajah** | Unknown (likely high flat fee) | ~Rp 2-3M/month | 70-80% cheaper |
| **PropertiManager** | Flat fee starting Rp 1.5M/month | Rp 1.5M/month | 60% cheaper |
| **Manual (Excel/WA)** | "Free" tapi time cost | Pengelola salary Rp 3-5M/month | Systematized, saves time |

**Value Proposition:**
> "Dengan Rp 600,000/bulan (200 units × Rp 3,000), Klustera menghemat 10+ jam per minggu pengelola kompleks untuk admin manual. ROI tercapai dalam 1 bulan."

---

## 📈 Revenue Projections

### Year 1 Targets (Post-Launch)

**Conservative Scenario:**
- 20 complexes (average 150 units each)
- Total units: 3,000 units
- Average pricing: Rp 3,500/unit/month (mix of small/medium)
- **MRR:** Rp 10,500,000
- **Annual Revenue:** Rp 126,000,000

**Moderate Scenario:**
- 50 complexes (average 200 units each)
- Total units: 10,000 units
- Average pricing: Rp 3,000/unit/month
- **MRR:** Rp 30,000,000
- **Annual Revenue:** Rp 360,000,000

**Aggressive Scenario:**
- 100 complexes (average 250 units each)
- Total units: 25,000 units
- Average pricing: Rp 2,500/unit/month (more large complexes)
- **MRR:** Rp 62,500,000
- **Annual Revenue:** Rp 750,000,000

### Year 2-3 Projections

**Assumptions:**
- 80% customer retention rate (20% churn per year)
- New customer acquisition: 30 complexes Q1, 40 complexes Q2, 50 complexes Q3, 60 complexes Q4
- Average units per complex increases to 250 units (more large complexes)

**Year 2:**
- Existing complexes: 40 (dari 50 Year 1, 10 churned)
- New complexes: 180 (30+40+50+60)
- Total complexes: 220
- Total units: 55,000 units
- Average pricing: Rp 2,500/unit/month
- **MRR:** Rp 137,500,000
- **Annual Revenue:** Rp 1,650,000,000 (Rp 1.65M)

**Year 3:**
- Existing complexes: 176 (dari 220 Year 2, 44 churned)
- New complexes: 250 (growth dengan reputation dan referrals)
- Total complexes: 426
- Total units: 128,000 units (avg 300 units per complex)
- Average pricing: Rp 2,200/unit/month (lebih banyak large complexes)
- **MRR:** Rp 281,600,000
- **Annual Revenue:** Rp 3,379,200,000 (Rp 3.38M)

### Break-Even Analysis

**Fixed Costs (Monthly):**
- Infrastructure (Oracle Cloud + Coolify): Rp 500,000
- Software licenses (Sentry, SendGrid): Rp 300,000
- Domain & SSL: Rp 50,000
- **Total Fixed Costs:** Rp 850,000/month

**Variable Costs (Per-Unit):**
- Midtrans transaction fee: 0% (payment fees ditanggung customer, bukan Klustera)
- Email/SMS notifications: Rp 50/unit/month (estimated, 1-2 emails per resident per month)
- Server resources: Rp 100/unit/month (estimated, bandwidth & storage)

**Total Variable Cost:** ~Rp 150/unit/month

**Break-Even Calculation:**
```
Contribution Margin per Unit = Rp 3,000 (avg pricing) - Rp 150 (variable cost) = Rp 2,850
Break-Even Volume = Fixed Costs / Contribution Margin
                = Rp 850,000 / Rp 2,850
                = 298 units

Break-Even Complexes = 298 units / 200 units per complex (avg)
                     = 1.5 complexes
```

**Insight:** Klustera breaks even dengan hanya 2 complexes (400 units). This is very achievable di Year 1.

---

## 💳 Payment Collection Strategy

### Payment Methods untuk Customers

**Payment Options:**
1. **Bank Transfer** (Primary untuk MVP)
   - Transfer ke rekening BCA/Mandiri
   - Manual confirmation oleh admin
   - Invoice kirim via email

2. **Midtrans Payment Link** (Recommended)
   - Automatic payment link di invoice
   - Support: VA, GoPay, OVO, Dana, Credit Card
   - Automatic payment confirmation (webhook)

3. **Auto-Debit** (Planned v1.1)
   - Recurring payments dari customer credit card/e-wallet
   - Reduce churn (automatic annual renewal)

4. **Invoice Payment Terms**
   - Net 30 (payment due within 30 days)
   - Late fee: 10% per month untuk overdue payments
   - Service suspension jika >60 days overdue (grace period)

### Billing Cycle

**Billing Schedule:**
- Invoices generated on tanggal 1 setiap bulan
- Payment due: Tanggal 15 setiap bulan (15 days terms)
- Late fee applied: Tanggal 16 (10% per month)
- Service suspension: Tanggal 45 (jika belum bayar)

**Annual Billing Option:**
- Customers bisa choose annual billing (2 months free = 17% discount)
- Invoiced di bulan January (atau bulan registration)
- Single payment untuk 12 months

---

## 🎁 Pricing Psychology & Tactics

### Anchor Pricing

**Marketing Strategy:** Position per-unit pricing sebagai "starting at"

```
"Starting at Rp 2,000/unit/month"
(akan tetapi most complexes pay Rp 3,000/unit)
```

This creates perception yang affordable ("hanya Rp 2,000!") meskipun actual average lebih tinggi.

### Volume Discount Visibility

**Showcase Savings:**
- Large complexes (500+ units) pay 60% less per-unit than small complexes
- Visual comparison di pricing page:
  ```
  Small Complex:  Rp 5,000/unit
  Medium Complex: Rp 3,000/unit (40% savings)
  Large Complex:  Rp 2,000/unit (60% savings)
  ```

### Free Trial Strategy

**Beta Testing (Milestone 5):**
- 3-month free trial untuk 5 pilot complexes
- No commitment required
- Feedback required sebagai "payment"
- Convert ke paying customers setelah trial (expected 80% conversion)

**Public Launch (Milestone 6):**
- 30-day free trial untuk semua new customers
- No credit card required untuk trial
- Automatic conversion ke paid plan setelah 30 days (jika tidak cancel)
- Email reminder 3 days sebelum trial ends

---

## 🏷️ Discounts & Promotions

### Early Adopter Discount

**First 50 Customers:**
- 20% discount untuk first 6 months
- Example: Medium complex (200 units) → Rp 600,000 × 80% = Rp 480,000/month untuk 6 months
- Lalu full price (Rp 600,000/month) starting month 7
- Rationale: Build initial customer base quickly, generate testimonials

### Referral Program

**Customer Referral:**
- Existing customer refers new customer
- Reward: 1 month free untuk referrer (max 1 free month per year)
- Example: Complex A refers Complex B → Complex A gets 1 month free (Rp 600,000 value)

**Developer/Agent Referral:**
- Property developers atau agents yang refer multiple complexes
- Commission: 20% dari first-year revenue untuk each referred complex
- Example: Developer refers 5 complexes (total revenue Rp 36M/year) → Commission Rp 7.2M (one-time payment)

### Non-Profit/Community Discount

**RT/RW yang dikelola secara sukarela:**
- 50% discount untuk pengelola yang tidak dibayar (volunteer ketua RT/RW)
- Verification required (surat keterangan dari kelurahan)
- Example: 100 units → Rp 3,000 × 50% = Rp 1,500/unit/month

---

## 📊 Pricing Experimentation Strategy

### A/B Testing Plans

**Test Variables:**

**1. Price Point Testing:**
- Variant A: Current pricing (Small: Rp 5K, Medium: Rp 3K, Large: Rp 2K)
- Variant B: Slightly higher (Small: Rp 6K, Medium: Rp 4K, Large: Rp 2.5K)
- Metric: Conversion rate (visitor → paid customer)

**2. Annual Discount Testing:**
- Variant A: 2 months free (17% discount) - current
- Variant B: 3 months free (25% discount)
- Metric: Annual plan adoption rate

**3. Free Trial Duration Testing:**
- Variant A: 30-day free trial - current
- Variant B: 60-day free trial
- Metric: Trial-to-paid conversion rate

### Pricing Review Schedule

**Quarterly Review:**
- Review conversion rates, churn rates, customer feedback
- Adjust pricing jika needed (max 10% adjustment per quarter)
- Review competitor pricing changes

**Annual Review:**
- Comprehensive pricing analysis ( Year 1, Year 2, etc.)
- Consider major pricing changes jika market conditions change significantly
- Survey customers tentang pricing satisfaction

---

## 💡 Pricing FAQ

### Common Customer Questions

**Q: Apakah harga include payment gateway fees?**
A: Tidak. Payment gateway fees (Midtrans) ditanggung oleh residents (end users), bukan pengelola kompleks. Pengelola hanya bayar platform fee ke Klustera.

**Q: Apakah ada biaya setup atau implementation?**
A: Tidak ada biaya setup. Kami bantu migration data dan training secara gratis.

**Q: Apakah ada commit minimum (e.g., 1-year contract)?**
A: Tidak ada. Month-to-month payment, cancel anytime. Tapi kami sarankan annual billing untuk 17% discount.

**Q: Apa yang terjadi jika jumlah units berubah (e.g., ada pembangunan baru)?**
A: Harga akan di-adjust secara otomatis berdasarkan jumlah units aktif di sistem.

**Q: Apakah ada additional fee untuk multiple complexes (developer)?**
A: Tidak. Developer dapat centralized dashboard gratis, tinggal bayar per-unit pricing per complex.

**Q: Apakah support included dalam pricing?**
A: Yes. Email support (response dalam 24 hours) included. Priority support (WhatsApp/Phone) available untuk Enterprise plan (custom pricing).

---

## 🎯 Pricing Success Metrics

### Key Metrics untuk Track

**Acquisition Metrics:**
- Customer acquisition cost (CAC) - Target: < Rp 500,000 per complex
- Trial-to-paid conversion rate - Target: >20%
- Sales cycle length - Target: <30 days dari first contact ke paid

**Revenue Metrics:**
- Average revenue per complex (ARPC) - Target: Rp 600,000/month (Year 1)
- Monthly recurring revenue (MRR) growth - Target: >20% MoM (Year 1)
- Customer lifetime value (LTV) - Target: > Rp 10,000,000 (2+ tahun retention)

**Retention Metrics:**
- Monthly churn rate - Target: <2% per month
- Annual retention rate - Target: >80%
- Reasons untuk churn (track untuk improvement)

### Pricing Optimization Triggers

**Increase Pricing jika:**
- Churn rate <1% (very low churn = could increase price)
- Trial-to-paid conversion >30% (high demand = inelastic demand)
- Competitors increase prices (follow market)

**Decrease Pricing jika:**
- Churn rate >5% (high churn = price too high)
- Trial-to-paid conversion <10% (low conversion = price sensitive)
- Competitors significantly undercut (market pressure)

---

**Last Updated:** 2026-01-06
**Pricing Model Version:** 1.0.0
**Maintainer:** Najib - Akordium Lab

**Note:** Pricing model ini theoretical dan belum divalidasi dengan customers. Disarankan untuk melakukan customer research sebelum finalizing pricing. A/B testing recommended setelah launch untuk optimize pricing.
