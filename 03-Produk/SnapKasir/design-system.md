# SnapKasir Design System

> Neurodesign-based visual hierarchy untuk Solusi Point of Sale Modern untuk UMKM Indonesia

**Category:** Commerce (Point of Sale)

**Related:** [neurodesign-uiux-guide.md](../_templates/neurodesign-uiux-guide.md)

---

## 1. Visual Identity

### Color Palette

| Role | Color | Hex | Neuroscience Rationale |
|------|-------|-----|------------------------|
| Primary | Orange | `#EA580C` | Warna oranye memicu energi, aksi, dan urgensi - sempurna untuk transaksi cepat. Dalam neuroscience, oranye meningkatkan aktivitas saraf dan merangsang keputusan cepat, ideal untuk POS yang butuh kecepatan. |
| Secondary | White | `#FFFFFF` | Memberikan kesan bersih dan cepat - penting untuk aplikasi kasir di mana kecepatan membaca visual adalah kunci. Kontras tinggi dengan oranye menciptakan fokus instan. |
| Accent | Dark Gray | `#1F2937` | Memberikan kedalaman untuk teks dan elemen penting tanpa mengganggu fokus utama. Dark gray lebih lembut dari pure black, mengurangi kelelahan mata pengguna. |
| Background | Light Gray | `#F9FAFB` | Base tone yang netral dan tidak mengganggu, memungkinkan konten utama (tombol aksi, total harga) menonjol dengan jelas. |
| Text Primary | Dark Gray | `#111827` | Kontras maksimal untuk keterbacaan data transaksi yang krusial - angka harga, nama produk, dan detail pembayaran. |
| Text Secondary | Medium Gray | `#6B7280` | Untuk informasi pendukung seperti timestamp, kategori produk, dan label sekunder. |

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
| Display/Hero | Plus Jakarta Sans | 48px | Bold (700) |
| H1 | Plus Jakarta Sans | 38px | Semibold (600) |
| H2 | Plus Jakarta Sans | 30px | Semibold (600) |
| H3 | Plus Jakarta Sans | 24px | Medium (500) |
| Body Large | Plus Jakarta Sans | 18px | Regular (400) |
| Body | Plus Jakarta Sans | 16px | Regular (400) |
| Caption/Meta | Plus Jakarta Sans | 12px | Regular (400) |

**Typography Rationale:** Plus Jakarta Sans (atau Geist sebagai alternatif) dipilih karena karakter geometris yang bersih dan modern. Geometric fonts terbukti lebih cepat diproses oleh otak (cognitive processing speed) - krusial untuk aplikasi POS di mana setiap milidetik berharga. Font ini memiliki legibility optimal pada berbagai ukuran, penting untuk tampilan angka harga dan nama produk di layar kasir.

---

## 2. Visual Hierarchy (5-Layer)

### Layer Definitions

| Layer | Use Case | Size | Weight | Contrast |
|-------|----------|------|--------|----------|
| **1. Focal Point** | Tombol "Catat Transaksi" | 48px | Bold | 7:1 (AAA) |
| **2. Primary** | Total omzet hari ini | 30px | Medium | 4.5:1 (AA) |
| **3. Secondary** | Daftar produk, harga item | 18px | Regular | 4.5:1 (AA) |
| **4. Supporting** | Timestamp, kategori, qty | 14px | Light | 3:1 |
| **5. UI Chrome** | Navigation, borders, icon labels | 12px | Regular | 3:1 |

### Focal Point Strategy

**Single Focal Element per Screen:** Tombol "Catat Transaksi" dengan kontras tertinggi di layar - elemen paling penting yang memicu konversi dan revenue.

```
Example:
┌─────────────────────────────────────┐
│  Total Hari Ini: Rp 2.5M            │  ← Layer 2: Secondary focal (metric)
│                                     │
│  ┌─────────────────────────────────┐│
│  │                                 ││
│  │     [CATAT TRANSAKSI]           ││  ← Layer 1: PRIMARY FOCAL POINT
│  │                                 ││  (Highest contrast, largest size)
│  └─────────────────────────────────┘│
│                                     │
│  Daftar Produk (recent):            │  ← Layer 3: Secondary info
│  • Nasi Goreng - Rp 15.000          │
│  • Es Teh Manis - Rp 5.000          │
│                                     │
│  Terakhir update: 10:30 WIB         │  ← Layer 4: Supporting info
└─────────────────────────────────────┘
```

### Anti-Patterns to Avoid

- ❌ **Christmas Tree Effect:** Semua tombol highlighted oranye = tidak ada focal point yang jelas
- ❌ **Flat Hierarchy:** Semua elemen sama besar = otak bingung harus mulai dari mana
- ❌ **Hidden CTA:** Tombol "Catat Transaksi" tertimbun di antara elemen lain
- ❌ **Slow Animations:** Transisi lambat mengganggu flow transaksi cepat

---

## 3. Eye Tracking Pattern

### Primary Pattern: Z-Pattern

**Rationale:** Z-Pattern ideal untuk antarmuka POS karena mengikuti alur natural mata saat memproses transaksi cepat: (1) scan total harga → (2) scan produk → (3) fokus ke tombol aksi. Pattern ini meminimalkan cognitive load dan memaksimalkan kecepatan transaksi - krusial untuk lingkungan kasir yang sibuk.

### Pattern Application

#### Z-Pattern - Untuk Layar Transaksi Utama

```
┌──────────────────────────────────────┐
│ Total: Rp 150.000    →→→   [BAYAR]   │  ← Zone 1: First impression (harga)
│                    ↘                 │
│         Nasi Goreng x2               │
│         Es Teh x3                    │  Zone 2: Item details
│                   ↙                  │
│ [CATAT]    →→→    [BATAL]           │  ← Zone 4: Action buttons
└──────────────────────────────────────┘
```

#### F-Pattern - Untuk Dashboard/Report

```
┌──────────────────────────────────────┐
│ ████████████████████████████████████ │  ← Horizontal scan 1 (total omzet)
│ ████████████████████                 │  ← Horizontal scan 2 (periode)
│ █                                    │
│ █                                    │  ← Vertical scan (daftar transaksi)
│ █                                    │
└──────────────────────────────────────┘
```

### Key Rules

- **Tombol "Catat Transaksi"** = Z-point akhir (conversion point)
- **Total harga** = Z-point awal (value anchor)
- **Daftar produk** = diagonal connection (quick scanning)
- **Jangan sembunyikan** tombol penting di bottom-right corner

---

## 4. Motion Guidelines

### When to Use Motion

| Use Case | Animation Type | Duration |
|----------|---------------|----------|
| Loading states | Skeleton shimmer | Continuous |
| Success feedback (transaksi berhasil) | Micro-confetti | 300ms max |
| Error indication (payment failed) | Shake/pulse | 200ms |
| Modal transitions | Fade/scale | 150ms |
| Button hover/tap | Scale/glow | 100ms |

### When NOT to Use Motion

- ❌ Background decorative animations (mengganggu fokus transaksi)
- ❌ Auto-playing carousels tanpa pause
- ❌ Continuous motion saat membaca daftar produk
- ❌ Animasi yang mengganggu tombol "Catat Transaksi"

### Easing Presets

```css
--ease-out: cubic-bezier(0, 0, 0.2, 1);     /* Elements appearing */
--ease-in: cubic-bezier(0.4, 0, 1, 1);      /* Elements disappearing */
--ease-in-out: cubic-bezier(0.4, 0, 0.2, 1); /* Moving elements */
```

**Speed Rationale:** POS environment membutuhkan kecepatan maksimal. 150ms untuk interactions adalah sweet spot - cukup cepat untuk tidak mengganggu flow, cukup lambat untuk memberikan feedback visual. Micro-confetti 300ms memberikan reward instan tanpa breaking flow.

---

## 5. Whitespace Strategy

### Density Level: Minimal

**Rationale:** Minimal whitespace menciptakan energi dan densitas - cocok untuk aplikasi POS di mana efisiensi adalah prioritas. Dalam lingkungan kasir yang sibuk, whitespace berlebih = scrolling lebih banyak = transaksi lebih lambat. Dense layout memungkinkan lebih banyak informasi terlihat dalam satu viewport.

| Whitespace Type | Value | Application |
|-----------------|-------|-------------|
| **Macro** (section gaps) | 32-48px | Antara major sections (header/content) |
| **Card padding** | 16px | Inside card components (product items) |
| **Form group gaps** | 12px | Antara form fields |
| **List item gaps** | 8px | Antara list items (transaksi history) |
| **Micro** (tight) | 4px | Related inline elements (harga + qty) |

### Density by Product Category

| Category | Density | Why |
|----------|---------|-----|
| Trust-based (Islamic, Finance) | Generous | Whitespace = trust & premium |
| **Commerce/Action (POS, Marketing)** | **Minimal** | **Density = energy & urgency** |
| Standard | Moderate | Balance of clarity & efficiency |

---

## 6. Design Tokens

```css
/* ===========================================
   SNAPKASIR DESIGN TOKENS
   Based on Akordium Neurodesign System
   =========================================== */

/* --- COLOR TOKENS --- */
--color-primary: #EA580C;
--color-primary-hover: #C2410C;
--color-primary-light: #FFEDD5;
--color-secondary: #FFFFFF;
--color-accent: #1F2937;

--color-background: #F9FAFB;
--color-surface: #FFFFFF;
--color-surface-elevated: #FFFFFF;

--color-text-primary: #111827;
--color-text-secondary: #6B7280;
--color-text-muted: #9CA3AF;

/* Semantic Colors (Consistent Across All Products) */
--color-success: #16A34A;
--color-warning: #D97706;
--color-error: #DC2626;
--color-info: #2563EB;

/* --- TYPOGRAPHY TOKENS --- */
--font-display: 'Plus Jakarta Sans', 'Geist', system-ui, sans-serif;
--font-body: 'Plus Jakarta Sans', 'Geist', system-ui, sans-serif;

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
--space-md: 12px;
--space-lg: 16px;
--space-xl: 24px;
--space-2xl: 32px;
--space-3xl: 48px;

/* Component Spacing (Minimal Density for POS) */
--card-padding: 16px;
--section-gap: 32px;
--form-group-gap: 12px;
--list-item-gap: 8px;

/* --- VISUAL WEIGHT (5-LAYER HIERARCHY) --- */
--focal-size: 48px;       /* Layer 1: "Catat Transaksi" button - ONE per screen */
--primary-size: 30px;     /* Layer 2: Total omzet hari ini - 2-3 elements */
--secondary-size: 18px;   /* Layer 3: Daftar produk, harga item - 4-6 elements */
--supporting-size: 14px;  /* Layer 4: Timestamp, kategori, qty */
--chrome-size: 12px;      /* Layer 5: UI Chrome */

/* --- CONTRAST RATIOS (WCAG) --- */
--contrast-focal: 7:1;      /* AAA - Focal points (Catat Transaksi button) */
--contrast-primary: 4.5:1;  /* AA - Body text (harga, nama produk) */
--contrast-secondary: 3:1;  /* Minimum - UI components */

/* --- MOTION TOKENS (Fast for POS) --- */
--duration-instant: 100ms;  /* Button hover/tap */
--duration-fast: 150ms;     /* Modal transitions */
--duration-normal: 300ms;   /* Success feedback (micro-confetti) */
--duration-slow: 350ms;     /* (Rarely used in POS) */

--ease-out: cubic-bezier(0, 0, 0.2, 1);
--ease-in: cubic-bezier(0.4, 0, 1, 1);
--ease-in-out: cubic-bezier(0.4, 0, 0.2, 1);

/* --- BORDER RADIUS --- */
--radius-sm: 4px;
--radius-md: 8px;
--radius-lg: 12px;
--radius-xl: 16px;
--radius-full: 9999px;

/* --- SHADOWS (Minimal for clean POS) --- */
--shadow-sm: 0 1px 2px rgba(0, 0, 0, 0.05);
--shadow-md: 0 4px 6px rgba(0, 0, 0, 0.07);
--shadow-lg: 0 10px 15px rgba(0, 0, 0, 0.08);
--shadow-xl: 0 20px 25px rgba(0, 0, 0, 0.1);

/* --- SPECIFIC SNAPKASIR TOKENS --- */
--button-catat-height: 56px;
--button-catat-font-size: 18px;
--total-price-display-size: 42px;
--product-card-height: 72px;
--currency-symbol: 'Rp ';
```

---

## 7. Per-Screen Specifications

### Dashboard/Kasir Home

| Element | Specification |
|---------|---------------|
| **Focal Point** | Tombol "Catat Transaksi" - oranye solid, 56px height, full width pada mobile |
| **Eye Pattern** | Z-Pattern (Total → Produk → Tombol Aksi) |
| **Primary Actions** | "Catat Transaksi" (bottom center, highest contrast), "Lihat Riwayat" (secondary) |
| **Key Metrics** | Total omzet hari ini (Layer 2: 30px, bold), Jumlah transaksi (Layer 3: 18px) |

### Layar Transaksi Baru

| Element | Specification |
|---------|---------------|
| **Focal Point** | Total harga yang dinamis (auto-update setiap item ditambah) |
| **Pattern** | Z-Pattern modified (Total ↑ → Items ↓ → Catat ↘) |
| **CTAs** | "Catat Transaksi" (primary, bottom), "Batal" (secondary, top-left) |
| **Behavior** | Total harga highlight/flash saat berubah (150ms animation) |

### Layar Pembayaran/Sukses

| Element | Specification |
|---------|---------------|
| **Focal Point** | "Transaksi Berhasil!" message dengan micro-confetti (300ms) |
| **Pattern** | Center-focused (single focal element) |
| **CTAs** | "Catat Transaksi Baru" (primary, auto-focus), "Cetak Struk" (secondary) |
| **Peak Moment** | Full-screen celebration dengan confetti, checkmark animation |

---

## 8. Peak Moment Design

Based on Peak-End Rule: Users remember the **peak moment** and the **ending**, not the average.

### Peak Moment: Transaksi Berhasil

| Moment | Implementation |
|--------|----------------|
| **Trigger** | Tombol "Catat Transaksi" ditekan dan payment berhasil diproses |
| **Visual** | Micro-confetti (300ms) + checkmark animated circle + success message |
| **Duration** | 300ms animation (fast tapi memberikan reward instan) |
| **Micro-copy** | "Transaksi berhasil! +Rp 150.000" (positif reinforcement) |
| **Audio** | Satisfying "cha-ching" sound (optional, can be muted) |

### Ending Design

| Moment | Implementation |
|--------|----------------|
| **Trigger** | User logout atau tutup shift |
| **Message** | "Shift selesai! Total: Rp 2.5M. Sampai jumpa besok!" |
| **Tone** | Professional + warm (acknowledge hard work) |

---

## 9. Accessibility Requirements

| Requirement | Standard |
|-------------|----------|
| Contrast Ratio | WCAG AA minimum (4.5:1 for text) |
| Focal Points | AAA contrast (7:1) untuk tombol "Catat Transaksi" |
| Interactive Elements | Minimum 44px touch target (important untuk tablet/kiosk) |
| Focus States | Visible focus ring (important untuk keyboard navigation) |
| Motion | Respect `prefers-reduced-motion` untuk user dengan sensitivitas |
| Color Blindness | Gunakan shape + color untuk semantic states (bukan color saja) |

---

## 10. Implementation Checklist

- [ ] Colors match category palette (Orange primary, White secondary, Dark gray accent)
- [ ] Single focal point per screen (Tombol "Catat Transaksi" atau Total harga)
- [ ] Z-Pattern eye tracking applied untuk layar transaksi
- [ ] Minimal whitespace density (POS efficiency)
- [ ] Fast motion (150ms interactions, 300ms peak moment)
- [ ] Peak moment designed (Micro-confetti untuk transaksi berhasil)
- [ ] Design tokens implemented in CSS
- [ ] Accessibility requirements met (WCAG AA minimum, AAA untuk focal points)

---

*Based on: [neurodesign-uiux-guide.md](../_templates/neurodesign-uiux-guide.md)*

*Last Updated: 2026-03-03*
*Document Version: 1.0*
