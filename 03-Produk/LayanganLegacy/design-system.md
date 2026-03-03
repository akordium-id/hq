# LayanganLegacy Design System

> Neurodesign-based visual hierarchy untuk Platform E-commerce Legacy

**Category:** E-commerce Legacy

**Related:** [neurodesign-uiux-guide.md](../_templates/neurodesign-uiux-guide.md)

---

## 1. Visual Identity

### Color Palette

| Role | Color | Hex | Neuroscience Rationale |
|------|-------|-----|------------------------|
| Primary | Terra Cotta | `#C67B5C` | Warna tanah merah bata yang hangat dan energik - memicu emosi kehangatan, keramahan, dan keakraban. Cocok untuk e-commerce lokal yang ingin terasa approachable dan authentic. |
| Secondary | Warm Sand | `#E8D5C4` | Memberikan kesan natural, organic, dan grounded - menciptakan latar belakang yang hangat tanpa mengganggu produk |
| Accent | Deep Teal | `#2D6A4F` | Menambahkan kontras dan kepercayaan untuk highlight penting seperti tombol beli, promo, atau status |
| Background | Off-White | `#FDFBF7` | Warm neutral yang nyaman di mata untuk browsing produk yang lama |
| Text Primary | Dark Brown | `#3E2723` | Kontras tinggi dengan nuansa earthy untuk keterbacaan maksimal |
| Text Secondary | Warm Gray | `#6B5B5B` | Untuk teks pendukung dengan kontras yang cukup |

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
| Display/Hero | Inter | 48px | Bold (700) |
| H1 | Inter | 38px | Semibold (600) |
| H2 | Inter | 30px | Semibold (600) |
| H3 | Inter | 24px | Medium (500) |
| Body Large | Inter | 18px | Regular (400) |
| Body | Inter | 16px | Regular (400) |
| Caption/Meta | Inter | 12px | Regular (400) |

**Typography Rationale:** Inter untuk seluruh typography memberikan kesan modern, clean, dan highly readable yang sangat penting untuk e-commerce. Font ini memiliki excellent legibility di berbagai ukuran dan terlihat professional tapi tetap approachable. Cocok untuk platform legacy yang ingin mudah digunakan oleh semua kalangan.

---

## 2. Visual Hierarchy (5-Layer)

### Layer Definitions

| Layer | Use Case | Size | Weight | Contrast |
|-------|----------|------|--------|----------|
| **1. Focal Point** | Produk unggulan / Promo banner | 48px | Bold | 7:1 (AAA) |
| **2. Primary** | Nama produk / Harga | 30px | Medium | 4.5:1 (AA) |
| **3. Secondary** | Deskripsi produk / Rating | 18px | Regular | 4.5:1 (AA) |
| **4. Supporting** | Stok, pengiriman, garansi | 14px | Light | 3:1 |
| **5. UI Chrome** | Filter kategori, pagination, badges | 12px | Regular | 3:1 |

### Focal Point Strategy

**Single Focal Element per Screen:** Produk yang sedang ditampilkan atau promo yang sedang berlangsung

```
Example:
┌─────────────────────────────────────┐
│                                     │
│    [PRODUK UNGGULAN]                │  ← Layer 1: Focal Point
│    [Gambar Produk Besar]            │
│                                     │
│  Jam Tangan Klasik                  │  ← Layer 2: Nama & Harga
│  Rp 450.000                         │
│                                     │
│  ⭐⭐⭐⭐⭐ (128 ulasan)              │  ← Layer 3: Rating & desc
│  Jam tangan dengan desain vintage   │
│                                     │
│  Stok: 50 | Pengiriman: Gratis      │  ← Layer 4: Supporting info
│                                     │
│  [BELI SEKARANG]                    │  ← CTA Utama
└─────────────────────────────────────┘
```

### Anti-Patterns to Avoid

- ❌ **Christmas Tree Effect:** Semua produk/promo highlighted = tidak ada focal point
- ❌ **Flat Hierarchy:** Semua elemen ukuran sama = sulit membedakan produk penting
- ❌ **Hidden CTA:** Tombol beli tersembunyi di antara elemen lain

---

## 3. Eye Tracking Pattern

### Primary Pattern: F-Pattern

**Rationale:** F-Pattern sangat cocok untuk e-commerce karena pengguna cenderung memindai horizontal di atas (banner/promo), lalu vertical di kiri (kategori/navigasi), dan membaca horizontal untuk detail setiap produk. Pattern ini efisien untuk browsing produk dan scanning informasi penting seperti harga dan rating.

### Pattern Application

#### F-Pattern - Untuk Product Listing

```
┌──────────────────────────────────────┐
│ PROMO SPESIAL    GRATIS ONGKIR       │  ← Horizontal scan 1 (banner)
│ █                                    │
│ █  [KATEGORI PRODUK]                 │  ← Vertical scan (navigasi)
│ █  Elektronik       [Product Card]   │  ← Horizontal scan 2
│ █  Fashion          [Product Card]   │
│ █  Home & Living    [Product Card]   │
└──────────────────────────────────────┘
```

### Key Rules

- **Most important product/promo** = top horizontal scan
- **Most important action** (tombol beli) = left side of product card (bukan right)
- **Never hide critical info** (harga, stok) di bottom-right corner (blind spot)

---

## 4. Motion Guidelines

### When to Use Motion

| Use Case | Animation Type | Duration |
|----------|---------------|----------|
| Loading states | Skeleton shimmer dengan efek earth tone | Continuous |
| Success feedback | Subtle checkmark dengan glow | 300ms max |
| Error indication | Shake dengan pulse merah | 200ms |
| Product image hover | Scale/zoom dengan smooth transition | 250ms |
| Add to cart | Cart icon bounce animation | 200ms |
| Promo reveal | Fade dengan subtle glow | 350ms |

### When NOT to Use Motion

- ❌ Background decorative animations (mengganggu fokus pada produk)
- ❌ Auto-playing carousels tanpa pause (sangat mengganggu untuk e-commerce)
- ❌ Continuous motion saat browsing produk
- ❌ Apa pun yang mengalihkan perhatian dari produk/CTA beli

### Easing Presets

```css
--ease-out: cubic-bezier(0, 0, 0.2, 1);     /* Elements appearing */
--ease-in: cubic-bezier(0.4, 0, 1, 1);      /* Elements disappearing */
--ease-in-out: cubic-bezier(0.4, 0, 0.2, 1); /* Moving elements */
```

---

## 5. Whitespace Strategy

### Density Level: Moderate

**Rationale:** Whitespace moderate menciptakan balance antara clarity dan efficiency - penting untuk e-commerce yang harus menampilkan banyak produk tapi tetap mudah dibaca. Tidak terlalu longgar (membuang screen real estate) dan tidak terlalu padat (sulit dibaca), tapi tepat untuk shopping experience.

| Whitespace Type | Value | Application |
|-----------------|-------|-------------|
| **Macro** (section gaps) | 48-64px | Antara section utama (promo, categories, products) |
| **Card padding** | 16px | Inside product cards |
| **Form group gaps** | 16px | Antara form fields (checkout, search) |
| **List item gaps** | 12px | Antara product items |
| **Micro** (tight) | 4-8px | Related inline elements (badges, tags) |

### Density by Product Category

| Category | Density | Why |
|----------|---------|-----|
| E-commerce Legacy (LayanganLegacy) | Moderate | Balance clarity & efficiency untuk produk banyak |
| Wedding/Heritage | Generous | Whitespace = trust, premium, respect |
| POS/Marketing | Minimal | Density = energy & urgency |

---

## 6. Design Tokens

```css
/* ===========================================
   LAYANGANLEGACY DESIGN TOKENS
   Based on Akordium Neurodesign System
   =========================================== */

/* --- COLOR TOKENS --- */
--color-primary: #C67B5C;
--color-primary-hover: #A65D3D;
--color-primary-light: #D9997A;
--color-secondary: #E8D5C4;
--color-accent: #2D6A4F;

--color-background: #FDFBF7;
--color-surface: #FFFFFF;
--color-surface-elevated: #F5F1EB;

--color-text-primary: #3E2723;
--color-text-secondary: #6B5B5B;
--color-text-muted: #8B7355;

/* Semantic Colors (Consistent Across All Products) */
--color-success: #16A34A;
--color-warning: #D97706;
--color-error: #DC2626;
--color-info: #2563EB;

/* --- TYPOGRAPHY TOKENS --- */
--font-display: 'Inter', system-ui, -apple-system, sans-serif;
--font-body: 'Inter', system-ui, -apple-system, sans-serif;

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
--card-padding: 16px;
--section-gap: 56px;
--form-group-gap: 16px;
--list-item-gap: 12px;

/* --- VISUAL WEIGHT (5-LAYER HIERARCHY) --- */
--focal-size: 48px;       /* Layer 1: ONE per screen */
--primary-size: 30px;     /* Layer 2: 2-3 elements */
--secondary-size: 18px;   /* Layer 3: 4-6 elements */
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
--shadow-sm: 0 1px 2px rgba(198, 123, 92, 0.1);
--shadow-md: 0 4px 6px rgba(198, 123, 92, 0.15);
--shadow-lg: 0 10px 15px rgba(198, 123, 92, 0.2);
--shadow-xl: 0 20px 25px rgba(198, 123, 92, 0.25);
```

---

## 7. Per-Screen Specifications

### Homepage

| Element | Specification |
|---------|---------------|
| **Focal Point** | Banner promo atau produk unggulan di tengah atas |
| **Eye Pattern** | F-Pattern (dari banner ke kategori) |
| **Primary Actions** | Tombol "Belanja Sekarang" dengan accent teal |
| **Key Metrics** | Promo terbaru, produk trending (Layer 2) |

### Product Listing

| Element | Specification |
|---------|---------------|
| **Focal Point** | Produk yang sedang di-hover/filter |
| **Pattern** | F-Pattern (dari filter kategori ke produk) |
| **CTAs** | Tombol "Tambah ke Keranjang" di kiri setiap card (bukan kanan) |

### Product Detail

| Element | Specification |
|---------|---------------|
| **Focal Point** | Gambar produk dan nama produk |
| **Pattern** | F-Pattern (dari gambar ke detail ke CTA) |
| **CTAs** | Tombol "Beli Sekarang" dan "Tambah ke Keranjang" |

### Checkout

| Element | Specification |
|---------|---------------|
| **Focal Point** | Ringkasan order dan total harga |
| **Pattern** | Z-Pattern (dari ringkasan ke form pembayaran) |
| **CTAs** | Tombol "Bayar Sekarang" di kanan bawah |

---

## 8. Peak Moment Design

Based on Peak-End Rule: Users remember the **peak moment** and the **ending**, not the average.

### Peak Moment: Produk Ditambahkan ke Keranjang

| Moment | Implementation |
|--------|----------------|
| **Trigger** | User berhasil menambahkan produk ke keranjang |
| **Visual** | Cart icon bounce dengan badge count update animation |
| **Duration** | 300ms animation |
| **Micro-copy** | "Produk ditambahkan! Keranjang: 3 item" |

### Peak Moment: Order Berhasil

| Moment | Implementation |
|--------|----------------|
| **Trigger** | User berhasil menyelesaikan pembayaran |
| **Visual** | Full-screen success dengan confetti subtle dan order summary |
| **Duration** | 500ms animation |
| **Micro-copy** | "Order berhasil! Pesanan #ORD12345 sedang diproses. Terima kasih!" |

### Ending Design

| Moment | Implementation |
|--------|----------------|
| **Trigger** | User meninggalkan website (exit intent) |
| **Message** | (Optional) Promo reminder di modal exit |
| **Tone** | Friendly, encouraging, transactional |

---

## 9. Accessibility Requirements

| Requirement | Standard |
|-------------|----------|
| Contrast Ratio | WCAG AA minimum (4.5:1 for text) |
| Focal Points | AAA contrast (7:1) |
| Interactive Elements | Minimum 44px touch target |
| Focus States | Visible focus ring dengan warna primary terra cotta |
| Motion | Respect `prefers-reduced-motion` |

---

## 10. Implementation Checklist

- [ ] Colors match category palette (Terra Cotta, Warm Sand, Teal)
- [ ] Single focal point per screen (Produk unggulan/Promo)
- [ ] Eye tracking pattern applied (F-Pattern untuk product listing)
- [ ] Whitespace density appropriate (Moderate)
- [ ] Motion used sparingly (functional, tidak berlebihan)
- [ ] Peak moment designed (Add to cart, order berhasil)
- [ ] Design tokens implemented in CSS
- [ ] Accessibility requirements met

---

*Based on: [neurodesign-uiux-guide.md](../_templates/neurodesign-uiux-guide.md)*

*Last Updated: 2026-03-03*
*Document Version: 1.0*
