# Nanabung Design System

> Neurodesign-based visual hierarchy untuk Platform Bagi Hasil Pembiayaan Syariah

**Category:** Finance (Islamic Profit-Sharing/ARB)

**Related:** [neurodesign-uiux-guide.md](../_templates/neurodesign-uiux-guide.md)

---

## 1. Visual Identity

### Color Palette

| Role | Color | Hex | Neuroscience Rationale |
|------|-------|-----|------------------------|
| Primary | Growth Green | `#16A34A` | Memicu respons positif dan kepercayaan, diasosiasikan dengan keuntungan dan pertumbuhan investasi syariah |
| Secondary | Navy Trust | `#1E3A5F` | Warna biru tua meningkatkan rasa tenang dan stabilitas, penting untuk produk keuangan syariah yang berbasis kepercayaan |
| Accent | Gold Profit | `#F59E0B` | Untuk highlight profit/bagi hasil, warna emas diasosiasikan dengan kemakmuran dan keberhasilan |
| Background | Pure White | `#FFFFFF` | Kanvas bersih untuk data investasi yang kompleks |
| Surface | Light Gray | `#F9FAFB` | Memisahkan section tanpa kontras yang keras |
| Text Primary | Dark Navy | `#0F172A` | Kontras tinggi untuk keterbacaan data angka |
| Text Secondary | Slate Gray | `#64748B` | Informasi pendukung dengan kontras sedang |

#### Semantic Colors (Consistent Across All Akordium Products)

| Semantic | Color | Hex |
|----------|-------|-----|
| Success | Green | `#16A34A` |
| Warning | Amber | `#D97706` |
| Error/Destructive | Red | `#DC2626` |
| Info | Blue | `#2563EB` |

### Typography

| Element | Font | Size | Weight |
|---------|------|------|--------|
| Display/Hero | Geist / DM Sans | 48px | Bold (700) |
| H1 | Geist / DM Sans | 38px | Semibold (600) |
| H2 | Geist / DM Sans | 30px | Semibold (600) |
| H3 | Geist / DM Sans | 24px | Medium (500) |
| Body Large | Geist / DM Sans | 18px | Regular (400) |
| Body | Geist / DM Sans | 16px | Regular (400) |
| Caption/Meta | Geist / DM Sans | 12px | Regular (400) |

**Typography Rationale:** Geist dan DM Sans adalah geometric sans-serif yang bersih dan modern, sangat cocok untuk aplikasi keuangan syariah. Bentuk geometris yang konsisten memudahkan pembacaan angka dan persentase bagi hasil. Geist dirancang khusus untuk readability di UI digital, sedangkan DM Sans adalah alternatif open-source dengan karakteristik serupa. Keduanya memberikan kesan profesional dan trustworthy yang penting untuk produk keuangan berbasis syariah.

---

## 2. Visual Hierarchy (5-Layer)

### Layer Definitions

| Layer | Use Case | Size | Weight | Contrast |
|-------|----------|------|--------|----------|
| **1. Focal Point** | "Total Bagi Hasil" atau "Nilai Investasi" | 48px | Bold | 7:1 (AAA) |
| **2. Primary** | Metric utama (Modal Aktif, Profit Bulan Ini, ARB) | 30px | Medium | 4.5:1 (AA) |
| **3. Secondary** | Detail project, tanggal bagi hasil, persentase | 18px | Regular | 4.5:1 (AA) |
| **4. Supporting** | Meta info (timestamp, status project) | 14px | Light | 3:1 |
| **5. UI Chrome** | Navigation, borders, label sekunder | 12px | Regular | 3:1 |

### Focal Point Strategy

**Single Focal Element per Screen:** Angka "Total Bagi Hasil" atau "Nilai Investasi Saat Ini" yang paling menonjol di dashboard investor.

```
Example:
┌─────────────────────────────────────┐
│                                     │
│     RP 8.250.000                    │  ← Layer 1: Focal Point
│     Total Bagi Hasil Kamu           │     (Total Profit/Bagi Hasil)
│                                     │
│  ┌─────────┐  ┌─────────┐          │  ← Layer 2: Primary Metrics
│  │ Rp 25Jt │  │   12%   │          │     (Modal Aktif, ARB)
│  │ Invest  │  ARB/Tahun│          │
│  └─────────┘  └─────────┘          │
│                                     │
│  Bagi hasil terakhir:               │  ← Layer 3: Secondary Info
│  • Project Nana - Rp 1.250.000      │
│  • Pembiayaan UMKM - Rp 750.000     │
│                                     │
└─────────────────────────────────────┘
```

### Anti-Patterns to Avoid

- ❌ **Christmas Tree Effect:** Semua angka dan persentase bold/warnai = tidak ada fokus
- ❌ **Flat Hierarchy:** Semua elemen sama besar = user bingung mulai dari mana
- ❌ **Hidden CTA:** Tombol "Investasi Sekarang" tidak menonjol

---

## 3. Eye Tracking Pattern

### Primary Pattern: F-Pattern

**Rationale:** F-Pattern paling cocok untuk dashboard investasi syariah karena user scan data secara vertikal di sisi kiri untuk daftar project/pembiayaan, lalu membaca angka-angka penting (profit/ARB) secara horizontal di bagian atas.

### Pattern Application

#### F-Pattern - Dashboard Investor

```
┌──────────────────────────────────────┐
│ ████████████████████████████████████ │  ← Horizontal scan 1: Total Bagi Hasil (most important)
│ ████████████████████                 │  ← Horizontal scan 2: Metrics sekunder (Modal, ARB)
│ █                                    │
│ █  Project         │   Bagi Hasil    │  ← Vertical scan: List project investasi
│ █  Pembiayaan A    │   Rp 1.250.000  │
│ █  Pembiayaan B    │   Rp 750.000    │
│ █  Pembiayaan C    │   Rp 500.000    │
└──────────────────────────────────────┘
```

### Key Rules

- **Most important metric** (Total Bagi Hasil/Nilai Investasi) = top horizontal scan penuh
- **Most important action** (Investasi/Bagi Hasil) = left side atau prominent button
- **Never hide critical info** di bottom-right corner (blind spot area)

---

## 4. Motion Guidelines

### When to Use Motion

| Use Case | Animation Type | Duration |
|----------|---------------|----------|
| Loading states | Skeleton shimmer (green tint) | Continuous |
| Success feedback (investasi berhasil) | Micro-confetti (gold) + checkmark | 300ms max |
| Bagi hasil diterima (celebration) | Coin/gold particle effect | 400ms |
| Page transitions | Fade/slide | 250ms |
| Button hover | Scale/glow (green) | 150ms |
| Chart animations (ARB growth) | Progressive fill | 400ms |
| Countdown distribusi profit | Pulse animation | 1000ms loop |

### When NOT to Use Motion

- ❌ Background decorative animations
- ❌ Auto-playing carousels tanpa pause
- ❌ Continuous motion saat membaca angka investasi
- ❌ Animasi yang mengganggu focal point (Total Bagi Hasil)

### Easing Presets

```css
--ease-out: cubic-bezier(0, 0, 0.2, 1);     /* Elements appearing */
--ease-in: cubic-bezier(0.4, 0, 1, 1);      /* Elements disappearing */
--ease-in-out: cubic-bezier(0.4, 0, 0.2, 1); /* Moving elements */
```

---

## 5. Whitespace Strategy

### Density Level: Moderate

**Rationale:** Density moderate untuk aplikasi investasi syariah karena:
1. Cukup whitespace untuk readability data investasi yang kompleks
2. Tidak terlalu sparse agar investor bisa melihat banyak project sekaligus
3. Balance antara clarity (trust/syariah compliance) dan efficiency (investment decisions)

| Whitespace Type | Value | Application |
|-----------------|-------|-------------|
| **Macro** (section gaps) | 64-96px | Antara section major (Dashboard, Project, Bagi Hasil) |
| **Card padding** | 24px | Inside card project investasi |
| **Form group gaps** | 16px | Antara field form investasi |
| **List item gaps** | 12px | Antara item project/pembiayaan |
| **Micro** (tight) | 4-8px | Related inline elements (icon + text) |

### Density by Product Category

| Category | Density | Why |
|----------|---------|-----|
| Trust-based (Islamic Finance) | Moderate | Whitespace cukup untuk trust & transparency |
| Commerce/Action | Minimal | Density = energy & urgency |
| Standard | Moderate | Balance clarity & efficiency |

---

## 6. Design Tokens

```css
/* ===========================================
   NANABUNG DESIGN TOKENS
   Based on Akordium Neurodesign System
   =========================================== */

/* --- COLOR TOKENS --- */
--color-primary: #16A34A;
--color-primary-hover: #15803D;
--color-primary-light: #22C55E;
--color-secondary: #1E3A5F;
--color-accent: #F59E0B;  /* Gold untuk profit */

--color-background: #FFFFFF;
--color-surface: #F9FAFB;
--color-surface-elevated: #F0FDF4;

--color-text-primary: #0F172A;
--color-text-secondary: #64748B;
--color-text-muted: #94A3B8;

/* Semantic Colors (Consistent Across All Products) */
--color-success: #16A34A;
--color-warning: #D97706;
--color-error: #DC2626;
--color-info: #2563EB;

/* --- TYPOGRAPHY TOKENS --- */
--font-display: 'Geist', 'DM Sans', system-ui, sans-serif;
--font-body: 'Geist', 'DM Sans', system-ui, sans-serif;

--text-xs: 0.75rem;    /* 12px */
--text-sm: 0.875rem;   /* 14px */
--text-base: 1rem;     /* 16px */
--text-lg: 1.125rem;   /* 18px */
--text-xl: 1.25rem;    /* 20px */
--text-2xl: 1.5rem;    /* 24px */
--text-3xl: 2rem;      /* 32px */
--text-4xl: 2.5rem;    /* 40px */
--text-5xl: 3rem;      /* 48px */

--weight-light: 300;
--weight-regular: 400;
--weight-medium: 500;
--weight-semibold: 600;
--weight-bold: 700;

--line-height-tight: 1.25;
--line-height-normal: 1.5;
--line-height-relaxed: 1.75;

/* --- SPACING TOKENS --- */
--space-xs: 4px;
--space-sm: 8px;
--space-md: 16px;
--space-lg: 24px;
--space-xl: 48px;
--space-2xl: 64px;
--space-3xl: 96px;

/* Component Spacing */
--card-padding: 24px;
--section-gap: 64px;
--form-group-gap: 16px;
--list-item-gap: 12px;

/* --- VISUAL WEIGHT (5-LAYER HIERARCHY) --- */
--focal-size: 48px;       /* Layer 1: ONE per screen - "Total Bagi Hasil" */
--primary-size: 30px;     /* Layer 2: 2-3 elements - Metrics utama */
--secondary-size: 18px;   /* Layer 3: 4-6 elements - Detail project */
--supporting-size: 14px;  /* Layer 4: Supporting info */
--chrome-size: 12px;      /* Layer 5: UI Chrome */

/* --- CONTRAST RATIOS (WCAG) --- */
--contrast-focal: 7:1;      /* AAA - Focal points */
--contrast-primary: 4.5:1;  /* AA - Body text */
--contrast-secondary: 3:1;  /* Minimum - UI components */

/* --- MOTION TOKENS --- */
--duration-fast: 150ms;
--duration-normal: 250ms;
--duration-slow: 350ms;

--ease-out: cubic-bezier(0, 0, 0.2, 1);
--ease-in: cubic-bezier(0.4, 0, 1, 1);
--ease-in-out: cubic-bezier(0.4, 0, 0.2, 1);

/* --- BORDER RADIUS --- */
--radius-sm: 4px;
--radius-md: 8px;
--radius-lg: 12px;
--radius-xl: 16px;
--radius-full: 9999px;

/* --- SHADOWS --- */
--shadow-sm: 0 1px 2px rgba(0, 0, 0, 0.05);
--shadow-md: 0 4px 6px rgba(0, 0, 0, 0.1);
--shadow-lg: 0 10px 15px rgba(0, 0, 0, 0.1);
--shadow-xl: 0 20px 25px rgba(0, 0, 0, 0.15);

/* --- ISLAMIC FINANCE SPECIFIC TOKENS --- */
--profit-gold: #F59E0B;
--profit-gold-hover: #D97706;
--chart-line-width: 3px;
--chart-grid-color: #E2E8F0;
--positive-trend: #16A34A;  /* Profit naik */
--negative-trend: #DC2626;  /* Rugi (jarang terjadi di ARB) */
--neutral-trend: #64748B;

/* --- SYARIAH COMPLIANCE TOKENS --- */
--halal-indicator: #16A34A;
--status-active: #22C55E;
--status-pending: #F59E0B;
--status-completed: #1E3A5F;
```

---

## 7. Per-Screen Specifications

### Dashboard Investor

| Element | Specification |
|---------|---------------|
| **Focal Point** | "Total Bagi Hasil" atau "Nilai Investasi Saat Ini" - 48px bold, green (#16A34A) |
| **Eye Pattern** | F-Pattern - Total bagi hasil di top horizontal, project list di vertical left |
| **Primary Actions** | "Investasi di Project Baru" button dengan icon prominent |
| **Key Metrics** | Modal Aktif, ARB/Tahun, Bagi Hasil Bulan Ini (30px medium) |

### Detail Project Pembiayaan

| Element | Specification |
|---------|---------------|
| **Focal Point** | Estimasi Bagi Hasil atau Progress Funding - 48px bold |
| **Pattern** | F-Pattern - Funding progress di top, detail project di bawah |
| **CTAs** | Primary button "Investasi Sekarang", Secondary "Download Proposal" |

### List Project Tersedia

| Element | Specification |
|---------|---------------|
| **Focal Point** | Filter/sort control untuk project |
| **Pattern** | F-Pattern - Search/filter di top, project list di bawah |
| **CTAs** | "Lihat Detail" per project card, "Investasi" di detail page |

### Form Investasi

| Element | Specification |
|---------|---------------|
| **Focal Point** | Input nominal investasi (paling menonjol, large text) |
| **Pattern** | Z-Pattern - Nominal → Estimasi Bagi Hasil → Konfirmasi |
| **CTAs** | Primary button "Konfirmasi Investasi" dengan syariah checkbox |

### Riwayat Bagi Hasil

| Element | Specification |
|---------|---------------|
| **Focal Point** | Total Bagi Hasil Semua Waktu - 48px bold dengan gold accent |
| **Pattern** | F-Pattern - Total di top, list riwayat di bawah |
| **CTAs** | Filter bulan/tahun, "Download Laporan" |

---

## 8. Peak Moment Design

Based on Peak-End Rule: Users remember the **peak moment** and the **ending**, not the average.

### Peak Moment: Menerima Bagi Hasil

| Moment | Implementation |
|--------|----------------|
| **Trigger** | User menerima notifikasi bagi hasil diterima |
| **Visual** | Full-screen celebration dengan gold coin/confetti effect, angka bagi hasil muncul dengan animation |
| **Duration** | 400ms animation |
| **Micro-copy** | "Alhamdulillah! 💰 Bagi hasil Rp 1.250.000 telah masuk ke akun kamu" |

### Peak Moment: Investasi Berhasil

| Moment | Implementation |
|--------|----------------|
| **Trigger** | Investasi di project berhasil dikonfirmasi |
| **Visual** | Checkmark animation dengan green glow + gold accent, progress bar "Sedang diproses" |
| **Duration** | 300ms animation |
| **Micro-copy** | "Investasi berhasil! Semoga memberikan keberkahan 🌿" |

### Peak Moment: Project Terpenuhi (Fully Funded)

| Moment | Implementation |
|--------|----------------|
| **Trigger** | Project yang diikuti user mencapai 100% funding |
| **Visual** | Progress bar hijau penuh, confetti celebration |
| **Duration** | 400ms animation |
| **Micro-copy** | "Project sudah fully funded! Tinggal tunggu bagi hasilnya" |

### Ending Design

| Moment | Implementation |
|--------|----------------|
| **Trigger** | User logout atau menutup aplikasi |
| **Message** | "Sampai jumpa! Semoga investasinya berkah dan menguntungkan 🌿" |
| **Tone** | Warm, encouraging, Islamic-friendly |

---

## 9. Accessibility Requirements

| Requirement | Standard |
|-------------|----------|
| Contrast Ratio | WCAG AA minimum (4.5:1 for text) |
| Focal Points | AAA contrast (7:1) untuk Total Bagi Hasil dan metric penting |
| Interactive Elements | Minimum 44px touch target (mobile-friendly) |
| Focus States | Visible focus ring (green outline) |
| Motion | Respect `prefers-reduced-motion` for animations |
| Color Blindness | Gunakan icon/shape selain color untuk status (profit up/down) |
| Syariah Compliance | Label halal/compliant jelas dan accessible |

---

## 10. Implementation Checklist

- [ ] Colors match Islamic Finance palette (Green primary, Navy secondary, Gold accent)
- [ ] Single focal point per screen (Total Bagi Hasil/Nilai Investasi)
- [ ] F-Pattern applied for dashboard
- [ ] Moderate whitespace density
- [ ] Motion used sparingly dan purposeful
- [ ] Peak moment designed (bagi hasil diterima, investasi berhasil)
- [ ] Design tokens implemented in CSS/Tailwind
- [ ] Accessibility requirements met (contrast 7:1 untuk focal)
- [ ] Syariah compliance labels clear dan accessible

---

## 11. Behavioral Design Techniques

### Ethical Design Note

Islamic finance products should lean toward **Sticky** design karena membantu user build wealth secara halal, bukan gamified gambling mechanics. The goal is to build positive financial habits while maintaining syariah compliance.

### 11 Techniques Applied to Nanabung

| # | Technique | Status | Implementation for Nanabung |
|---|-----------|--------|----------------------------|
| **1** | **Anticipation Loop** | ✅ Applied | Investment confirmation loading dengan progress bar "Sedang memproses investasi...", countdown timer ke distribusi bagi hasil berikutnya ("7 hari lagi") untuk build anticipation |
| **2** | **Invisible Personalization** | ✅ Applied | Project recommendations berdasarkan risk profile user, filter project yang sesuai dengan budget dan preferensi sektor (UMMK, pertanian, dll) |
| **3** | **Streak + Loss Aversion** | ✅ Applied | Monthly investment streak counter ("6 bulan berturut-turut berinvestasi"), badge "Wealth Builder" untuk konsistensi, gentle reminder jangan putus streak |
| **4** | **Emotional Character** | ❌ NOT APPLICABLE | Islamic finance product - maintain serious, trustworthy tone tanpa anthropomorphic characters yang bisa trivialize keputusan finansial |
| **5** | **Variable Reward Notification** | ✅ Applied | Push notification "Bagi hasil Rp 1.250.000 telah diterima!" dengan varied amount dan timing (tak terduga tapi welcome), celebration animation saat bagi hasil masuk |
| **6** | **Social Proof Counter** | ✅ Applied | Real-time counter: "1,247 investor", "52 project terdanai", "Rp 8.5M bagi hasil didistribusikan", "5 orang baru saja investasi di project ini" |
| **7** | **Annual Wrapped** | ✅ APPLIED (Very Powerful) | Yearly investment summary dengan total portfolio growth, ARB comparison vs rata-rata, project terbaik tahun ini, badge achievement - ini sangat powerful untuk finance produk karena menunjukkan tangible progress |
| **8** | **Personalization Surprise** | ✅ Applied | "ARV kamu tahun ini: 12.5% - lebih tinggi dari rata-rata investor!", "Kamu top 10% investor di project ini", personalized insight tentang performa portfolio |
| **9** | **Flash Sale Countdown** | ✅ Applied | Countdown timer ke funding deadline project ("3 hari lagi penutupan"), progress bar funding yang mendekat 100% dengan urgency, "Hanya tersisa Rp 15M lagi" |
| **10** | **Social Commerce** | ❌ NOT APPLICABLE | B2C finance product - tidak perlu referral/affiliate mechanic yang bisa mengganggu trust dan syariah compliance |
| **11** | **Gentle Nudge** | ✅ Applied | Push notification "Ada project baru yang cocok dengan profilmu", "Sudah lama tidak investasi, yuk mulai lagi", "Diversifikasi portfoliomu dengan project sektor pertanian" |

### Technique Examples

#### Anticipation Loop - Investment Confirmation

```
┌─────────────────────────────────────┐
│                                     │
│    🔄 Memproses Investasi...        │
│    ████████████░░░░ 75%            │
│                                     │
│  Estimasi: 2 detik lagi            │
│                                     │
└─────────────────────────────────────┘
```

#### Streak + Loss Aversion - Monthly Investment Streak

```
┌─────────────────────────────────────┐
│  🔥 6 Bulan Streak!                 │
│                                     │
│  Kamu sudah berinvestasi 6 bulan    │
│  berturut-turut. Jangan putus now!  │
│                                     │
│  [Investasi Bulan Ini]              │
└─────────────────────────────────────┘
```

#### Annual Wrapped - Yearly Investment Summary

```
┌─────────────────────────────────────┐
│  📊 2025 Investment Summary         │
│                                     │
│  Total Portfolio Growth: +Rp 25M    │
│  ARB Kamu: 12.5% (top 15% 🎉)       │
│                                     │
│  Project Terbaik:                   │
│  • Pembiayaan UMKM A: +18% ARB     │
│  • Pertanian B: +15% ARB            │
│                                     │
│  Achievement Unlocked:              │
│  🏆 Wealth Builder - 1 Year Streak  │
│  🌱 Halal Investor - 100% Syariah   │
│                                     │
│  [Share Summary]                    │
└─────────────────────────────────────┘
```

#### Gentle Nudge - Investment Opportunity

```
┌─────────────────────────────────────┐
│  💡 Project Baru Tersedia!          │
│                                     │
│  "Pembiayaan Toko Kelontong Bu Aisyah"│
│  - Sektor: Retail UMKM              │
│  - Estimasi ARB: 13%                │
│  - Tenor: 12 bulan                  │
│  - Risiko: Menengah                 │
│                                     │
│  Sesuai dengan profilmu!            │
│                                     │
│  [Lihat Detail] [Lain Kali]         │
└─────────────────────────────────────┘
```

### Implementation Priority

| Priority | Technique | ROI | Effort |
|----------|-----------|-----|--------|
| **HIGH** | Annual Wrapped | Very High - powerful retention tool | Medium |
| **HIGH** | Social Proof Counter | High - builds trust | Low |
| **HIGH** | Variable Reward Notification | High - reinforces positive behavior | Low |
| **MEDIUM** | Anticipation Loop | Medium - improves UX | Low |
| **MEDIUM** | Streak + Loss Aversion | Medium - builds habit | Medium |
| **MEDIUM** | Gentle Nudge | Medium - increases engagement | Low |
| **LOW** | Invisible Personalization | Low - subtle benefit | Medium |
| **LOW** | Personalization Surprise | Low - delight moment | Low |
| **LOW** | Flash Sale Countdown | Low - urgency builder | Low |

### Ethical Design Guidelines

1. **Transparansi Total** - Semua mechanic terlihat jelas, tidak ada hidden algorithm
2. **No Dark Patterns** - Tidak ada false urgency atau misleading countdown
3. **Syariah Compliance** - Semua reinforcement harus halal dan tidak encourage gambling behavior
4. **User Control** - User bisa opt-out dari notifications dan behavioral features
5. **Respect Autonomy** - Gentle nudge, bukan aggressive push notifications

---

## 12. Neurodesign Philosophy

> **Pendekatan Akordium:** Neurodesign sebagai layer di atas UX tradisional

### UX Tradisional vs Neurodesign

| Dimensi | UX Tradisional | Neurodesign |
|---------|----------------|-------------|
| Pertanyaan | "Bisakah user melakukan X?" | "Apa yang otak rasakan saat X?" |
| Layer otak | System 2 (sadar, deliberate) | System 1 (otomatis, emosional) |
| Fokus | Task completion | Emotion & memory formation |

### Masalah "Say-Do Gap"

```
User berkata: "Saya suka desain minimal"
Otak melakukan: Klik tombol paling colorful & high-contrast
```

95% keputusan terjadi di subconscious — jauh sebelum user bisa mengartikulasikannya.

### Kapan Gunakan Yang Mana

| Fase | UX Tradisional | Neurodesign |
|------|----------------|-------------|
| Wireframing | Information architecture | Visual hierarchy |
| Prototype | Usability testing | 5-second test |
| Post-Launch | Analytics funnel | Heatmap analysis |

### Referensi Lengkap

Lihat: [neurodesign-vs-ux-traditional.md](../_templates/neurodesign-vs-ux-traditional.md)

---

## 13. fMRI Research Insights

> **Evidence-based design:** Temuan neuroscience untuk optimasi UI

### Brain Response to UI (200ms Rule)

Dalam 200ms pertama, OFC (Orbitofrontal Cortex) user sudah membuat penilaian tentang desain. First impression bukan pepatah — ini hardwired di otak.

### Key Research Findings

| Finding | Implication | Application |
|---------|-------------|-------------|
| OFC aktif untuk high-reward stimulus | Tampilkan value secara visual | Hero section harus convey value instantly |
| Color > No Color untuk engagement | Tambahkan aksen warna strategis | Bahkan developer tools perlu color accent |
| DMN activation = personal resonance | Konten harus berbicara tentang user | Gunakan "you" language, personal relevance |

### Research-Based Checklist

- [ ] Above-fold harmonis dalam 200ms?
- [ ] Visual consistency 100%?
- [ ] Color accent pada elemen kritis?
- [ ] Personal resonance di hero copy?

### Referensi Lengkap

Lihat: [neurodesign-fmri-case-studies.md](../_templates/neurodesign-fmri-case-studies.md)

---

*Based on: [neurodesign-uiux-guide.md](../_templates/neurodesign-uiux-guide.md)*

*Last Updated: 2026-03-03*
*Document Version: 1.1*

*Last Updated: 2026-03-03*
*Document Version: 1.1*
