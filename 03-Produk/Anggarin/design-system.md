# Anggarin Design System

> Neurodesign-based visual hierarchy untuk Aplikasi Perencanaan Keuangan Pribadi

**Category:** Finance

**Related:** [neurodesign-uiux-guide.md](../_templates/neurodesign-uiux-guide.md)

---

## 1. Visual Identity

### Color Palette

| Role | Color | Hex | Neuroscience Rationale |
|------|-------|-----|------------------------|
| Primary | Growth Green | `#16A34A` | Memicu respons positif dan kepercayaan, diasosiasikan dengan pertumbuhan finansial dan keamanan |
| Secondary | Navy Trust | `#1E3A5F` | Warna biru tua meningkatkan rasa tenang dan stabilitas, cocok untuk manajemen keuangan |
| Accent | Amber Alert | `#D97706` | Untuk peringatan budget dan notifikasi penting tanpa terlalu agresif |
| Background | Pure White | `#FFFFFF` | Kanvas bersih untuk data keuangan yang kompleks |
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

**Typography Rationale:** Geist dan DM Sans adalah geometric sans-serif yang bersih dan modern, sangat cocok untuk aplikasi keuangan. Bentuk geometris yang konsisten memudahkan pembacaan angka dan data. Geist dirancang khusus untuk readability di UI digital, sedangkan DM Sans adalah alternatif open-source dengan karakteristik serupa.

---

## 2. Visual Hierarchy (5-Layer)

### Layer Definitions

| Layer | Use Case | Size | Weight | Contrast |
|-------|----------|------|--------|----------|
| **1. Focal Point** | "Total Saldo" atau "Sisa Anggaran" | 48px | Bold | 7:1 (AAA) |
| **2. Primary** | Metric utama (Pemasukan, Pengeluaran, Tabungan) | 30px | Medium | 4.5:1 (AA) |
| **3. Secondary** | Detail transaksi, kategori, tanggal | 18px | Regular | 4.5:1 (AA) |
| **4. Supporting** | Meta info (timestamp, catatan kecil) | 14px | Light | 3:1 |
| **5. UI Chrome** | Navigation, borders, label sekunder | 12px | Regular | 3:1 |

### Focal Point Strategy

**Single Focal Element per Screen:** Angka "Total Saldo" atau "Sisa Anggaran Bulan Ini" yang paling menonjol di dashboard.

```
Example:
┌─────────────────────────────────────┐
│                                     │
│     RP 15.750.000                   │  ← Layer 1: Focal Point
│     Sisa Anggaran Bulan Ini         │     (Total Saldo/Sisa Budget)
│                                     │
│  ┌─────────┐  ┌─────────┐          │  ← Layer 2: Primary Metrics
│  │ Rp 8Jt  │  │ Rp 5Jt  │          │     (Pemasukan, Pengeluaran)
│  │ Masuk   │  │ Keluar  │          │
│  └─────────┘  └─────────┘          │
│                                     │
│  Transaksi terakhir:                │  ← Layer 3: Secondary Info
│  • Transfer Bank BCA - Rp 500.000   │
│  • Belanja Online - Rp 250.000      │
│                                     │
└─────────────────────────────────────┘
```

### Anti-Patterns to Avoid

- ❌ **Christmas Tree Effect:** Semua angka bold dan berwarna = tidak ada fokus
- ❌ **Flat Hierarchy:** Semua elemen sama besar = user bingung mulai dari mana
- ❌ **Hidden CTA:** Tombol "Tambah Transaksi" tidak menonjol

---

## 3. Eye Tracking Pattern

### Primary Pattern: F-Pattern

**Rationale:** F-Pattern paling cocok untuk dashboard keuangan karena user scan data secara vertikal di sisi kiri untuk kategori, lalu membaca angka-angka penting secara horizontal di bagian atas.

### Pattern Application

#### F-Pattern - Dashboard Keuangan

```
┌──────────────────────────────────────┐
│ ████████████████████████████████████ │  ← Horizontal scan 1: Total Saldo (most important)
│ ████████████████████                 │  ← Horizontal scan 2: Metric sekunder
│ █                                    │
│ █  Kategori      │   Jumlah          │  ← Vertical scan: List transaksi
│ █  Makanan       │   Rp 500.000      │
│ █  Transport     │   Rp 250.000      │
│ █  Hiburan       │   Rp 150.000      │
└──────────────────────────────────────┘
```

### Key Rules

- **Most important metric** (Total Saldo/Sisa Anggaran) = top horizontal scan penuh
- **Most important action** (Tambah Transaksi) = left side atau floating button
- **Never hide critical info** di bottom-right corner (blind spot area)

---

## 4. Motion Guidelines

### When to Use Motion

| Use Case | Animation Type | Duration |
|----------|---------------|----------|
| Loading states | Skeleton shimmer (green tint) | Continuous |
| Success feedback (transaksi berhasil) | Micro-confetti + checkmark | 300ms max |
| Budget terlampaui (warning) | Shake/pulse + amber glow | 200ms |
| Page transitions | Fade/slide | 250ms |
| Button hover | Scale/glow (green) | 150ms |
| Chart animations | Progressive fill | 400ms |

### When NOT to Use Motion

- ❌ Background decorative animations
- ❌ Auto-playing carousels tanpa pause
- ❌ Continuous motion saat membaca angka
- ❌ Animasi yang mengganggu focal point (Total Saldo)

### Easing Presets

```css
--ease-out: cubic-bezier(0, 0, 0.2, 1);     /* Elements appearing */
--ease-in: cubic-bezier(0.4, 0, 1, 1);      /* Elements disappearing */
--ease-in-out: cubic-bezier(0.4, 0, 0.2, 1); /* Moving elements */
```

---

## 5. Whitespace Strategy

### Density Level: Moderate

**Rationale:** Density moderate untuk aplikasi keuangan karena:
1. Cukup whitespace untuk readability data yang kompleks
2. Tidak terlalu sparse agar user bisa melihat banyak informasi sekaligus
3. Balance antara clarity (trust) dan efficiency (productivity)

| Whitespace Type | Value | Application |
|-----------------|-------|-------------|
| **Macro** (section gaps) | 64-96px | Antara section major (Dashboard, Transaksi, Budget) |
| **Card padding** | 24px | Inside card metric |
| **Form group gaps** | 16px | Antara field form tambah transaksi |
| **List item gaps** | 12px | Antara item transaksi |
| **Micro** (tight) | 4-8px | Related inline elements (icon + text) |

### Density by Product Category

| Category | Density | Why |
|----------|---------|-----|
| Trust-based (Finance) | Moderate | Whitespace cukup untuk trust, tapi tidak terlalu generous seperti Islamic apps |
| Commerce/Action | Minimal | Density = energy & urgency |
| Standard | Moderate | Balance clarity & efficiency |

---

## 6. Design Tokens

```css
/* ===========================================
   ANGGARIN DESIGN TOKENS
   Based on Akordium Neurodesign System
   =========================================== */

/* --- COLOR TOKENS --- */
--color-primary: #16A34A;
--color-primary-hover: #15803D;
--color-primary-light: #22C55E;
--color-secondary: #1E3A5F;
--color-accent: #D97706;

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
--focal-size: 48px;       /* Layer 1: ONE per screen - "Total Saldo" */
--primary-size: 30px;     /* Layer 2: 2-3 elements - Metrics utama */
--secondary-size: 18px;   /* Layer 3: 4-6 elements - Detail transaksi */
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

/* --- FINANCE SPECIFIC TOKENS --- */
--chart-line-width: 3px;
--chart-grid-color: #E2E8F0;
--positive-trend: #16A34A;
--negative-trend: #DC2626;
--neutral-trend: #64748B;
```

---

## 7. Per-Screen Specifications

### Dashboard/Home

| Element | Specification |
|---------|---------------|
| **Focal Point** | "Total Saldo" atau "Sisa Anggaran Bulan Ini" - 48px bold, green (#16A34A) |
| **Eye Pattern** | F-Pattern - Total saldo di top horizontal, kategori di vertical left |
| **Primary Actions** | Floating Action Button (FAB) kanan bawah "Tambah Transaksi" dengan icon plus |
| **Key Metrics** | Pemasukan Bulan Ini, Pengeluaran Bulan Ini, Tabungan (30px medium) |

### Transaksi Detail

| Element | Specification |
|---------|---------------|
| **Focal Point** | Nominal transaksi (Rp 500.000) - 48px bold |
| **Pattern** | F-Pattern - Nominal di top, detail transaksi di bawah |
| **CTAs** | "Edit" dan "Hapus" di bottom sheet atau modal |

### Budget Planning

| Element | Specification |
|---------|---------------|
| **Focal Point** | Total budget allocated vs spent (bar chart besar) |
| **Pattern** | F-Pattern - Chart di top, list kategori di bawah |
| **CTAs** | "Atur Budget" per kategori dengan toggle/tappable rows |

### Tambah Transaksi (Form)

| Element | Specification |
|---------|---------------|
| **Focal Point** | Input nominal (paling menonjol, large text) |
| **Pattern** | Z-Pattern - Nominal → Kategori → Deskripsi → Simpan |
| **CTAs** | Primary button "Simpan" di bottom, full width |

---

## 8. Peak Moment Design

Based on Peak-End Rule: Users remember the **peak moment** and the **ending**, not the average.

### Peak Moment: Mencapai Target Tabungan

| Moment | Implementation |
|--------|----------------|
| **Trigger** | User berhasil mencapai target tabungan yang telah ditetapkan |
| **Visual** | Full-screen celebration dengan confetti, progress bar hijau penuh, angka target tercapai berkedip |
| **Duration** | 400ms animation |
| **Micro-copy** | "Selamat! 🎯 Target tabungan kamu tercapai. Konsisten ya!" |

### Peak Moment: Tambah Transaksi Berhasil

| Moment | Implementation |
|--------|----------------|
| **Trigger** | Transaksi berhasil disimpan |
| **Visual** | Checkmark animation dengan green glow, brief toast notification |
| **Duration** | 300ms animation |
| **Micro-copy** | "Transaksi berhasil dicatat" |

### Ending Design

| Moment | Implementation |
|--------|----------------|
| **Trigger** | User logout atau menutup aplikasi |
| **Message** | "Sampai jumpa lagi! Semoga keuangan kamu sehat terus 💚" |
| **Tone** | Warm, encouraging, friendly |

---

## 9. Accessibility Requirements

| Requirement | Standard |
|-------------|----------|
| Contrast Ratio | WCAG AA minimum (4.5:1 for text) |
| Focal Points | AAA contrast (7:1) untuk Total Saldo dan metric penting |
| Interactive Elements | Minimum 44px touch target (mobile-friendly) |
| Focus States | Visible focus ring (green outline) |
| Motion | Respect `prefers-reduced-motion` for animations |
| Color Blindness | Gunakan icon/shape selain color untuk status (trend up/down) |

---

## 10. Implementation Checklist

- [ ] Colors match Finance palette (Green primary, Navy secondary)
- [ ] Single focal point per screen (Total Saldo/Sisa Anggaran)
- [ ] F-Pattern applied for dashboard
- [ ] Moderate whitespace density
- [ ] Motion used sparingly dan purposeful
- [ ] Peak moment designed (target tabungan tercapai)
- [ ] Design tokens implemented in CSS/Tailwind
- [ ] Accessibility requirements met (contrast 7:1 untuk focal)

---

*Based on: [neurodesign-uiux-guide.md](../_templates/neurodesign-uiux-guide.md)*

*Last Updated: 2026-03-03*
*Document Version: 1.0*
