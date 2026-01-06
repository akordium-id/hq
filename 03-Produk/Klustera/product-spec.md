# 🏘️ Klustera.id - Product Specification

**Version:** 1.0.0-concept
**Last Updated:** 2026-01-06
**Status:** Product Definition Phase

---

## 1. Visi Produk

Menjadi platform manajemen kompleks perumahan **#1 di Indonesia** yang membantu pengelola kompleks mengotomasi administrasi, meningkatkan transparansi, dan memberikan pengalaman modern bagi warga. Berbasis open source untuk membangun kepercayaan dan memungkinkan kustomisasi sesuai kebutuhan setiap kompleks.

### Mission Statement

"Digitalisasi manajemen perumahan Indonesia satu kompleks pada satu waktu, dengan solusi yang terjangkau, mudah digunakan, dan dapat dipercaya."

---

## 2. Problem Statement

### Masalah Utama

**Current State (Manual Processes):**

1. **Manajemen Iuran Manual**
   - Pengelola kompleks mencatat iuran di Excel atau kertas
   - Penagihan manual via WhatsApp atau ketuk pintu
   - Laporan keuangan tidak real-time, sulit tracking
   - Banyak warga telat bayar atau lupa bayar

2. **Komunikasi Satu Arah**
   - Pengumuman kompleks via WhatsApp group mudah hilang/ter-bury
   - Tidak ada sistem voting untuk keputusan komunitas
   - Warga tidak update tentang kejadian kompleks
   - Transparansi penggunaan dana kurang

3. **Layanan Warga Tidak Terstruktur**
   - Keluhan (complaint) dilaporkan via WA/telepon, sulit ditrack
   - Booking fasilitas (gedung serbaguna, lapangan) manual via WA
   - Tidak ada prioritas atau SLA untuk penyelesaian masalah
   - Satpam dan cleaning service tidak terintegrasi dengan sistem

4. **Security & Access Control Manual**
   - Tamu dicatat manual di buku/guard
   - Tidak ada sistem QR code/barcode untuk access control
   - Log keamanan tidak terpusat
   - Difficult untuk tracking siapa yang masuk/keluar kompleks

5. **Multi-Complex Management Sulit**
   - Developer perumahan dengan 5-20 kompleks must manage separately
   - Tidak ada konsolidasi laporan keuangan
   - Standard operating procedures berbeda tiap kompleks
   - Skalability terbatas untuk growth

### Impact pada Target Market

- **Pengelola Kompleks:** Buang waktu 10-20 jam/minggu untuk admin work yang bisa diotomasi
- **Warga:** Frustrasi dengan kurangnya transparansi dan kesulitan mengakses informasi
- **Developer Perumahan:** Sulit scale business tanpa sistem terpusat
- **Ketua RT/RW:** Overwhelmed dengan tugas administratif di luar pekerjaan utama

---

## 3. Target Market

### Primary Market: Pengelola Kompleks (60% focus)

**Demographics:**
- Usia: 30-50 tahun
- Pendidikan: Minimal SMA, banyak sarjana
- Tech Savviness: Medium (bisa menggunakan WhatsApp, Excel, aplikasi)
- Pendapatan: Menengah ke atas (punya rumah di kompleks)

**Pain Points:**
- "Saya kehabisan waktu menagih iuran satu-satu"
- "Warga complain kenapa pengumuman tidak ada di WA group padahal sudah di-post"
- "Laporan keuangan bulanan memakan waktu 2 hari untuk compile"

**Use Cases:**
- Mengelola 100-500 unit hunian
- Mengumpulkan iuran bulanan (IPL, kebersihan, keamanan)
- Mengelola pengumuman dan voting untuk keputusan kompleks
- Tracking keluhan warga dan booking fasilitas

### Secondary Market: Developer Perumahan (25% focus)

**Demographics:**
- Company size: 10-50 employees
- Portfolio: 5-20 kompleks
- Revenue: Rp 1-10 Milyar/bulan

**Pain Points:**
- "Butuh sistem terpusat untuk semua kompleks yang saya kelola"
- "Investor minta laporan keuangan konsolidasi, susah compile dari Excel-Excel berbeda"
- "Standard procedures berbeda tiap kompleks, sulit manage quality"

**Use Cases:**
- Manage multiple complexes dari satu dashboard
- Standardize operating procedures across all complexes
- Real-time financial reporting ke investors
- Scale business tanpa proportional increase in admin cost

### Tertiary Market: Ketua RT/RW (10% focus)

**Demographics:**
- Usia: 35-60 tahun
- Pekerjaan: PNS, Wiraswasta, Pensiunan
- Tech Savviness: Low to Medium
- Pendapatan: Menengah

**Pain Points:**
- "Saya ketua RT part-time, punya pekerjaan utama lain"
- "Warga banyak complain, saya kewalahan tracking semuanya"
- "Butuh sistem yang simple dan mudah digunakan"

**Use Cases:**
- Manajemen iuran dan keuangan RT/RW
- Pengumuman dan komunikasi dengan warga
- Tracking keluhan dan aspirasi warga
- Simple reporting untuk ketua wilayah

### Quaternary Market: Property Management Companies (5% focus)

**Demographics:**
- Company size: 5-20 employees
- Clients: 10-50 complexes under management
- Services: Full-service property management

**Pain Points:**
- "Klien minta transparency dan reporting yang detail"
- "Need system yang bisa white-label untuk branding klien"
- "Must manage multiple properties dengan different requirements"

**Use Cases:**
- White-label solution untuk klien
- Bulk management dari dashboard
- Custom reporting per klien
- API access untuk integrasi dengan systems klien

---

## 4. MVP Features (v1.0)

### Core Features (4 Selected)

#### 1. Manajemen Iuran & Tagihan (Financial Management)

**Description:** Sistem lengkap untuk mengelola iuran bulanan warga (IPL, kebersihan, keamanan, dll) dengan automasi billing, payment tracking, dan financial reporting.

**User Value:**
- Pengelola: Otomatis penagihan, tracking pembayaran, laporan keuangan instan
- Warga: Mudah cek tagihan, bayar online, riwayat pembayaran

**Key Capabilities:**
- Setup jenis iuran (IPL, kebersihan, keamanan, dana darurat, dsb)
- Generate tagihan bulanan otomatis untuk setiap unit
- Payment gateway integration (Midtrans: GoPay, OVO, Dana, Bank Transfer)
- Automatic payment reminders via WhatsApp/Email
- Real-time tracking: Lunas, Pending, Telat
- Late fee calculation otomatis
- Financial dashboard: Pendapatan bulanan, tunggakan, collection rate
- Export laporan ke PDF/Excel

**Success Metric:**
- 90% iuran collected on-time (vs 60% manual)
- Pengelola save 15 hours/bulan di admin work
- Payment collection rate increases from 60% → 90%

#### 2. Portal Resident (Community Engagement)

**Description:** Web portal untuk warga mengakses informasi kompleks, melihat pengumuman, voting keputusan, dan komunikasi dengan pengelola.

**User Value:**
- Warga: Akses informasi real-time, partisipasi dalam voting
- Pengelola: Kurangi WhatsApp spam, transparansi meningkat

**Key Capabilities:**
- Pengumuman board (pengumuman resmi, kejadian, info darurat)
- Voting system untuk keputusan komunitas (contoh: kenaikan iuran, perubahan peraturan)
- Dokumen repository (peraturan kompleks, laporan keuangan, meeting minutes)
- Direct messaging ke pengelola
- Payment history untuk unit masing-masing
- Pengaduan masyarakat (complaint box)

**Success Metric:**
- 70% warga aktif di portal (login minimal sekali sebulan)
- Pengumuman read rate: 80% (vs 50% di WA group)
- Voting participation: 40% eligible warga (vs 10% manual meeting)

#### 3. Complaint Tracking (Keluhan & Aspirasi)

**Description:** Sistem untuk warga melaporkan keluhan/aspirasi, track progress penyelesaian, dan pengelola manage SLA.

**User Value:**
- Warga: Mudah lapor keluhan, track progress, transparansi penyelesaian
- Pengelola: Prioritaskan pekerjaan, track tim (satpam, cleaning, maintenance)

**Key Capabilities:**
- Submit keluhan via portal (kategori: Kebersihan, Keamanan, Fasilitas, Lainnya)
- Upload foto sebagai bukti
- Ticket tracking system: Open, In Progress, Resolved, Closed
- SLA monitoring: Target resolusi berdasarkan kategori
- Assign ke tim yang tepat (satpam, cleaning, maintenance)
- Automatic notifications ke warga tentang progress
- Analytics: Keluhan berdasarkan kategori, area kompleks, waktu

**Success Metric:**
- 80% keluhan tertutup dalam 7 hari (vs tidak ter-tracking manual)
- Warga satisfaction: NPS > 40
- Response time: < 4 hours untuk acknowledge

#### 4. Facility Booking (Booking Fasilitas)

**Description:** Sistem reservasi online untuk fasilitas kompleks (gedung serbaguna, lapangan olahraga, ruang meeting, dsb).

**User Value:**
- Warga: Mudah booking tanpa WA ke pengelola, cek ketersediaan real-time
- Pengelola: Otomatisasi, hindari double-booking, revenue tracking

**Key Capabilities:**
- Calendar view untuk setiap fasilitas
- Real-time availability checker
- Booking request dengan approval workflow
- Payment integration (deposit atau full payment saat booking)
- Automatic reminder sebelum jadwal
- Usage analytics: Jam paling ramai, fasilitas terpopuler
- Rules engine (max booking hours, resident only vs non-resident pricing)

**Success Metric:**
- 60% booking dilakukan via portal (vs 100% manual via WA)
- Double-booking reduced to < 2% (vs 15% manual)
- Fasilitas utilization increases 30% (mudah akses)

### Anti-Features (Explicitly NOT in MVP)

- ❌ Guest management & access control (deferred to v2.0)
- ❌ QR/barcode access control system (deferred to v2.0)
- ❌ Mobile apps untuk satpam/cleaning service (deferred to v2.0)
- ❌ Smart home IoT integration (deferred to v3.0)
- ❌ Multi-tenant white-label untuk property management companies (deferred to v2.0)
- ❌ Advanced analytics & predictive insights (deferred to v2.0)

---

## 5. Future Features (v2.0+)

### v2.0 (Month 6-9)

**Guest Management & Access Control:**
- QR code/barcode generation untuk tamu
- Guard app untuk scan dan verify access
- Tamu registration oleh resident (host daftarkan tamu via portal)
- Access log: siapa masuk/keluar kompleks, jam berapa
- Temporary access pass (24 jam, 3 hari, dll)
- Blacklist: tamu yang dilarang masuk

**Mobile Apps untuk Satpam & Cleaning:**
- Satpam app: Access log, patrol checklist, incident reporting
- Cleaning service app: Task assignment, cleaning checklist, facility status
- Real-time notifications untuk job baru
- Photo evidence upload untuk completed tasks

### v2.1 (Month 9-12)

**Advanced Financial Features:**
- Auto-debit dari rekening bank warga
- Payment plan untuk tunggakan (cicilan 3-6 bulan)
- Multi-currency support (untuk kompleks ekspatriat)
- Tax calculation dan reporting (PPh 21/22 untuk pengelola)

**Multi-Complex Management:**
- Dashboard untuk developer perumahan
- Consolidated financial reporting across complexes
- Standard operating procedures (SOP) template
- Staff management across complexes

### v3.0 (Year 2+)

**Smart Home IoT Integration:**
- Smart lock integration (open gate dari app)
- Energy monitoring: Listrik per unit, air, gas
- Smart meter integration (automatic meter reading)
- Device control: Lampu taman, AC, CCTV
- Alert systems: Kebocoran, asap, keamanan

**AI-Powered Features:**
- Predictive maintenance: Prediksi fasilitas butuh perbaikan
- Demand forecasting: Prediksi kebutuhan dana berdasarkan tren
- Anomaly detection: Detect unusual activity (keamanan, kebocoran)
- Chatbot untuk tanya jawab umum

---

## 6. Competitive Analysis

### Direct Competitors

| Feature | Jelajah | Properti | Klustera |
|---------|---------|---------|----------|
| **Pricing** | Unknown | Unknown | Rp 2-5K/unit (open source) |
| **Iuran Management** | ✅ | ✅ | ✅ |
| **Resident Portal** | ❌ | ✅ | ✅ |
| **Complaint Tracking** | ✅ | ❌ | ✅ |
| **Facility Booking** | ❌ | ✅ | ✅ |
| **Access Control** | ✅ | ❌ | ❌ (v2.0) |
| **Open Source** | ❌ | ❌ | ✅ |
| **IoT Integration** | ✅ | ❌ | ❌ (v3.0) |
| **Customization** | Terbatas | Terbatas | ✅ (open source) |

### Competitive Advantages

1. **Open Source = Trust + Customization**
   - Core platform open source (transparansi, community contributions)
   - Customizable sesuai kebutuhan setiap kompleks
   - No vendor lock-in (host sendiri jika mau)
   - Developer ecosystem bisa add features

2. **Affordable & Scalable Pricing**
   - Per-unit pricing: Murah untuk kompleks kecil, scalable untuk besar
   - 50-80% lebih murah dari closed-source competitors
   - No hidden fees or long-term contracts

3. **Tails for Indonesian Market**
   - Bahasa Indonesia UI dan documentation
   - Payment methods: GoPay, OVO, Dana (favorite e-wallets)
   - Understand local regulations dan culture
   - Support via WhatsApp + Email (Indonesian prefer WhatsApp)

4. **All-in-One Solution**
   - Competitors specialize di 1-2 features
   - Klustera menggabungkan semua critical features di 1 platform
   - Seamless integration antar features (contoh: booking × iuran)

5. **TALL Stack Performance**
   - Proven di WaqfWise (similar management platform)
   - Fast development dan iteration
   - Mature Laravel ecosystem

### Indirect Competitors

- **Excel + WhatsApp** - Free but manual, no automation, no transparency
- **Facebook Groups** - Communication tapi no tracking/automation
- **PropertiMan (PropertyMan)** - Fokus ke jual beli properti, bukan management
- **Jualo.com** - Marketplace untuk sewa menyewa, bukan kompleks management

### Why We Win

vs Excel/WhatsApp: "Kami automasi semua manual work, save 15+ hours per month"
vs Jelajah/Properti: "Kami open source, lebih murah, dan bisa customize sendiri"
vs PropertiMan/Jualo: "Kami fokus ke kompleks management, bukan jual beli properti"

---

## 7. Monetization Strategy

### Per-Unit Pricing Model (Primary)

**Philosophy:** "Bayar sesuai ukuran, scalable seiring pertumbuhan"

**Pricing Tiers:**

| Complex Size | Price per Unit | Example (200 units) | Example (1000 units) |
|--------------|----------------|----------------------|-----------------------|
| **Small** (< 100 units) | Rp 5,000/unit/bulan | - | Rp 5M/bulan |
| **Medium** (100-500 units) | Rp 3,000/unit/bulan | Rp 600K/bulan | Rp 3M/bulan |
| **Large** (500+ units) | Rp 2,000/unit/bulan | Rp 400K/bulan | Rp 2M/bulan |

**Why Per-Unit Pricing?**
- **Fair:** Kompleks kecil tidak subsidi kompleks besar
- **Scalable:** Revenue scales dengan ukuran kompleks
- **Predictable:** Mudah calculate revenue: unit × harga × bulan
- **Affordable:** Untuk kompleks 200 unit: Rp 600K/bulan = Rp 3,000/unit → sangat terjangkau

**Unit Definition:**
- 1 unit = 1 rumah tapak (landed house)
- 1 unit = 1 apartemen
- 1 unit = 1 ruko (shop-house)
- Commercial units (ruko, rukan) charged 2× (multiplier)

### SaaS Subscription (Alternative)

**Target Customer:** Kompleks yang prefer flat fee

| Subscription Tier | Price Range | Target Complex Size |
|-------------------|------------|---------------------|
| **Small** | Rp 500K/bulan | < 100 units |
| **Medium** | Rp 1.5M/bulan | 100-500 units |
| **Large** | Rp 3M/bulan | 500+ units |

**When to Choose Per-Unit vs SaaS?**
- **Per-Unit:** Lebih murah untuk kompleks kecil (< 300 units)
- **SaaS:** Lebih murah untuk kompleks besar (> 700 units)
- Calculator tersedia di website untuk compare

### Revenue Model Examples

**Kompleks A (200 units, middle-class, Tangerang):**
- Per-unit: 200 × Rp 3,000 = Rp 600,000/bulan
- SaaS: Rp 1.5M/bulan
- **Choice:** Per-unit (save Rp 900K/bulan)

**Kompleks B (1000 units, premium, Jakarta Selatan):**
- Per-unit: 1000 × Rp 2,000 = Rp 2M/bulan
- SaaS: Rp 3M/bulan
- **Choice:** Per-unit (save Rp 1M/bulan)

**Kompleks C (50 units, subsiding, Bekasi):**
- Per-unit: 50 × Rp 5,000 = Rp 250,000/bulan
- SaaS: Rp 500K/bulan
- **Choice:** Per-unit (save Rp 250K/bulan) OR SaaS (kalau mau unlimited users)

**Developer Perumahan (5 kompleks, avg 200 units each):**
- Per-unit: 5 × (200 × Rp 3,000) = Rp 3M/bulan
- SaaS: 5 × Rp 1.5M = Rp 7.5M/bulan
- **Choice:** Per-unit (save Rp 4.5M/bulan)

### Revenue Projections

**Year 1 Targets:**

| Metric | Q1 | Q2 | Q3 | Q4 | Total |
|--------|-----|-----|-----|-----|-------|
| **New Complexes** | 5 | 15 | 20 | 10 | 50 |
| **Total Complexes** | 5 | 20 | 40 | 50 | 50 |
| **Total Units** | 1,000 | 4,000 | 8,000 | 10,000 | 10,000 |
| **MRR** | Rp 3M | Rp 12M | Rp 24M | Rp 30M | Rp 30M |
| **ARR** | Rp 36M | Rp 144M | Rp 288M | Rp 360M | Rp 360M |

**Growth Assumptions:**
- Churn rate: 5% per bulan (6% tahunan)
- Average complex size: 200 units
- Average pricing: Rp 3,000/unit/bulan
- Year 2 goal: 150 complexes (3× growth)

**Unit Economics:**
- **CAC (Customer Acquisition Cost):** Rp 500,000 (marketing, sales demo, onboarding)
- **LTV (Customer Lifetime Value):** Rp 3,000/unit × 200 units × 24 bulan = Rp 14.4M (4 years retention)
- **LTV/CAC Ratio:** 28.8:1 (very healthy)
- **Break-even Point:** 2 months (ROI dalam 2 bulan)

### Payment Collection Strategy

**Integration dengan Midtrans:**
- Auto-debit: Warga authorize direct debit dari rekening/gopay
- Payment reminder: Automatic WA/Email 3 hari sebelum jatuh tempo
- Payment link: Direct payment link di portal
- Multiple payment methods: GoPay, OVO, Dana, Bank Transfer, Credit Card
- Late fee automation: Tambah Rp 50K/bulan untuk tunggakan > 30 hari

---

## 8. Success Metrics

### Product Metrics

**User Acquisition:**
- Month 1 (beta): 5 complexes
- Month 6: 25 complexes
- Year 1: 50 complexes
- Year 2: 150 complexes (3× growth)

**Engagement:**
- DAU/MAU ratio: > 30% (pengelola aktif daily)
- Resident adoption: > 60% warga terdaftar di portal
- Portal usage: > 70% warga login minimal sekali sebulan
- Feature usage:
  - Iuran payment online: > 80%
  - Complaint submission: > 70% via portal (vs WA)
  - Facility booking: > 60% via portal (vs manual)

**Retention:**
- Month 1 retention: > 80% (beta)
- Month 12 retention: > 70%
- Net Revenue Retention (NRR): > 110% (upselling ke higher tier, more units)

### Business Metrics

**Revenue:**
- Month 6: Rp 12M/month MRR (25 complexes)
- Year 1: Rp 30M/month MRR (50 complexes)
- Year 2: Rp 90M/month MRR (150 complexes)

**Financial Health:**
- Payment Collection Rate: > 90% iuran collected on-time
- ARPU (Average Revenue Per Unit): Rp 3,000/unit/bulan
- Gross Margin: > 90% (software: near-zero marginal cost)

**Operational Metrics:**
- Average onboarding time: < 2 minggu per kompleks
- Support ticket response: < 4 hours
- System uptime: > 99.5%

---

## 9. Go-to-Market Strategy

### Pre-Launch (Month 1-2)

**Product Development:**
- Build MVP dengan 4 core features
- Alpha testing dengan 2 friendly complexes
- Collect feedback dan iterate

**Market Research:**
- Survey 20 kompleks di Jakarta, Tangerang, Bekasi, Depok
- Understand current pain points dan pricing sensitivity
- Test pricing model (willingness to pay)

### Launch (Month 3-4)

**Beta Launch:**
- Recruit 5 beta complexes
- Offer: Free 6 months, setup gratis, training
- Requirements: Provide feedback, jadi case study

**Launch Channels:**
- Property management conferences/events
- Facebook groups: "Komunitas Pengelola Perumahan"
- WhatsApp broadcast ke kompleks target
- Partnership dengan developer perumahan

### Post-Launch (Month 5-12)

**Content Marketing:**
- Case studies: "Bagaimana Kompleks X meningkatkan collection rate dari 60% ke 90%"
- Educational content: "5 Tanda Kompleks Anda Butuh Manajemen Digital"
- Video testimonials dari beta users

**Sales Strategy:**
- Direct sales: Visit target kompleks, demo produk
- Referral program: Complex dapat diskon 20% untuk refer kompleks lain
- Partnership dengan developer perumahan (pre-install di new complexes)

**Community Building:**
- Create "Klub Klustera" - monthly gathering untuk pengelola kompleks
- Workshop: Best practices kompleks management
- Awards: "Top 100 Managed Housing in Indonesia"

---

## 10. Risk Assessment

### Business Risks

| Risk | Probability | Impact | Mitigation |
|------|-------------|--------|------------|
| Low willingness to pay | Medium | High | Beta testing untuk validate pricing, emphasize ROI |
| Long sales cycle | High | Medium | Focus pada early adopters, shorten time-to-value |
| Competition dari big players | Low | High | Open source differentiation, focus pada niche |
| Payment default rate | Medium | Medium | Auto-debit features, late fee automation |

### Technical Risks

| Risk | Probability | Impact | Mitigation |
|------|-------------|--------|------------|
| Data breach (financial data) | Low | Critical | Security audit, encryption, penetration testing |
| System downtime | Medium | High | Redundant servers, backup systems, SLA guarantees |
| IoT integration complexity | High | Medium | Plan carefully di v3.0, partner dengan IoT providers |

### Operational Risks

| Risk | Probability | Impact | Mitigation |
|------|-------------|--------|------------|
| Solo founder burnout | Medium | High | Hire part-time CS, automate tasks |
| Customer support overload | Medium | High | Self-service documentation, community support |
| Onboarding complexity | Medium | Medium | Standardized SOP, video tutorials, templates |

---

## 11. Open Source Strategy

### What's Open Source (MIT License)

- Core platform code
- Documentation
- Community-contributed modules
- Docker containers untuk deployment

**Benefits:**
- **Trust:** Kompleks bisa review code, ensure no backdoor
- **Customization:** Kompleks bisa hire developer untuk modifikasi
- **Community:** Ecosystem developer bisa contribute features
- **Transparency:** No vendor lock-in, hosting flexibility

### What's Proprietary

- **Production Deployment Configs:**
  - Optimized Nginx configuration
  - PostgreSQL tuning scripts
  - Redis cluster setup
  - SSL/TLS automation
  - Load balancing configs

- **Performance Optimization Scripts:**
  - Database query optimization
  - Caching strategies
  - Asset compilation dan minification

- **Premium Integrations:**
  - Custom IoT providers (specific hardware)
  - White-label branding untuk resellers
  - Custom payment gateways selain Midtrans

**Why Hybrid Model?**
- Open source builds trust dan community
- Proprietary parts protect IP dan sustain business
- Professional services revenue: Setup fee, customization, consulting

### Licensing Model

**Core Platform:** MIT License
- Bebas digunakan, dimodifikasi, didistribusikan
- Attribution required (keep "Powered by Klustera" footer)

**Premium Modules:** Commercial License
- Production deployment configs: Rp 5M one-time + 20% maintenance/year
- Custom integrations: Custom quote
- White-label: 50% markup dari base price

---

## 12. Notes & Design Decisions

### Why TALL Stack (Laravel + Livewire + Alpine + Tailwind)?

**Rationale:**
1. **Proven in WaqfWise:** Similar management platform, successfully deployed
2. **Rapid Development:** Livewire enables reactivity tanpa Node.js complexity
3. **Team Expertise:** Strong PHP/Laravel knowledge di Akordium Lab
4. **Mature Ecosystem:** Laravel packages untuk semua use cases (billing, queue, auth, etc.)
5. **Cost-Effective:** Deploy di standard shared hosting atau VPS
6. **Indonesian Talent:** Banyak PHP developers di pasar

### Why Per-Unit Pricing?

**Rationale:**
1. **Fair & Scalable:** Bayar sesuai ukuran, tidak ada subsidi silang
2. **Easy to Understand:** Kompleks bisa estimate cost: 100 unit × Rp 3K = Rp 300K
3. **Predictable Revenue:** Scale linearly dengan unit count
4. **Competitive:** 50-80% lebih murah dari flat subscription
5. **Indonesian Context:** Menyesuaikan dengan daya beli lokal

### Why Open Source?

**Rationale:**
1. **Trust:** Real estate managers conservative butuh transparency
2. **Customization:** Indonesia market punya unique requirements
3. **Community:** Larger ecosystem, faster innovation
4. **Vulnerability:** Security through transparency (many eyes on code)

### Payment Gateway Choice: Midtrans

**Why Midtrans?**
1. **Indonesian Specialist:** Mendukung all local payment methods
2. **Reasonable Fees:** 2-3% transaction fee (competitive)
3. **Easy Integration:** Laravel package tersedia
4. **Reputation:** Used by GoTo, Traveloka, Tokopedia

---

**Document Status:** ✅ Ready for Development
**Next Step:** Create [roadmap.md](./roadmap.md) dengan 10 development milestones
