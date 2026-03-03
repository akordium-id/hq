# Sesarra Design System

> Neurodesign-based visual hierarchy untuk Wedding Website Builder

**Category:** Wedding

**Related:** [neurodesign-uiux-guide.md](../_templates/neurodesign-uiux-guide.md)

---

## 1. Visual Identity

### Color Palette

| Role | Color | Hex | Neuroscience Rationale |
|------|-------|-----|------------------------|
| Primary | Rose | `#E8B4B8` | Warna romantis dan hangat yang memicu emosi cinta, kelembutan, dan intim - sangat cocok untuk momen pernikahan yang penuh kasih sayang |
| Secondary | Cream | `#F5F5DC` | Memberikan kesan premium, elegan, dan tenang - menciptakan latar belakang yang bersih dan hangat tanpa mengganggu konten utama |
| Accent | Gold | `#D4AF37` | Menambahkan sentuhan mewah dan spesial untuk highlight penting seperti tombol publish atau elemen dekoratif website |
| Background | Cream Light | `#FAFAF0` | Nuansa hangat yang nyaman di mata untuk pengalaman editing yang lama |
| Text Primary | Charcoal | `#2D3748` | Kontras tinggi untuk keterbacaan maksimal pada latar cream |
| Text Secondary | Warm Gray | `#718096` | Untuk teks pendukung dengan kontras yang cukup tapi tidak dominan |

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
| Display/Hero | Playfair Display | 48px | Bold (700) |
| H1 | Playfair Display | 38px | Semibold (600) |
| H2 | Playfair Display | 30px | Semibold (600) |
| H3 | Inter | 24px | Medium (500) |
| Body Large | Inter | 18px | Regular (400) |
| Body | Inter | 16px | Regular (400) |
| Caption/Meta | Inter | 12px | Regular (400) |

**Typography Rationale:** Playfair Display untuk heading memberikan kesan romantis, klasik, dan elegan yang sangat cocok untuk tema pernikahan. Sementara Inter untuk body text memastikan keterbacaan yang baik dengan tampilan modern yang clean. Kombinasi ini menciptakan harmoni antara keanggunan tradisional dan fungsionalitas modern untuk website builder.

---

## 2. Visual Hierarchy (5-Layer)

### Layer Definitions

| Layer | Use Case | Size | Weight | Contrast |
|-------|----------|------|--------|----------|
| **1. Focal Point** | Preview website pernikahan | 48px | Bold | 7:1 (AAA) |
| **2. Primary** | Tombol Publish / Status website | 30px | Medium | 4.5:1 (AA) |
| **3. Secondary** | Opsi template / Nama domain | 18px | Regular | 4.5:1 (AA) |
| **4. Supporting** | Label setting, help text | 14px | Light | 3:1 |
| **5. UI Chrome** | Navigation editor, toolbar | 12px | Regular | 3:1 |

### Focal Point Strategy

**Single Focal Element per Screen:** Live preview website pernikahan yang sedang dibuat

```
Example:
┌─────────────────────────────────────┐
│                                     │
│    [PREVIEW WEBSITE]                │  ← Layer 1: Live preview (Focal Point)
│    ANDI & PUTRI                     │
│    25 DESEMBER 2025                 │
│                                     │
│  ┌─────────┐  ┌─────────┐          │  ← Layer 2: Primary actions
│  │  SAVE   │  │ PUBLISH │          │
│  └─────────┘  └─────────┘          │
│                                     │
│  Template: Romantic Garden          │  ← Layer 3: Settings
│  Domain: andi-putri.sesarra.id      │
│                                     │
└─────────────────────────────────────┘
```

### Anti-Patterns to Avoid

- ❌ **Christmas Tree Effect:** Semua elemen bold/highlighted = tidak ada focal point
- ❌ **Flat Hierarchy:** Semua elemen ukuran sama = otak bingung mulai dari mana
- ❌ **Hidden CTA:** Tombol Publish tersembunyi di antara opsi lain

---

## 3. Eye Tracking Pattern

### Primary Pattern: Z-Pattern

**Rationale:** Z-Pattern sangat cocok untuk website builder karena pengguna cenderung memindai dari kiri atas (preview/nama website) ke kanan atas (tombol publish/CTA), lalu ke tengah (area editing), dan akhirnya ke kanan bawah (tombol aksi sekunder). Pattern ini mengikuti alur kerja natural: preview -> edit -> publish.

### Pattern Application

#### Z-Pattern - Untuk Editor Screen

```
┌──────────────────────────────────────┐
│ ANDI & PUTRI     →→→    PUBLISH ▲    │  ← Zone 1: First impression + CTA
│                      ↘                │
│       [LIVE PREVIEW AREA]            │
│       Website Builder                │
│                   ↙                   │
│ TEMPLATES      →→→   CUSTOM DOMAIN   │  ← Zone 4: Secondary actions
└──────────────────────────────────────┘
```

### Key Rules

- **Most important element** (preview website) = top horizontal scan (Zone 1-2)
- **Most important action** (tombol publish) = top-right corner (Zone 1)
- **Never hide critical info** di bottom-left corner (blind spot)

---

## 4. Motion Guidelines

### When to Use Motion

| Use Case | Animation Type | Duration |
|----------|---------------|----------|
| Loading states | Skeleton shimmer dengan efek rose | Continuous |
| Success feedback | Confetti dengan warna rose-gold saat publish | 300ms max |
| Error indication | Shake lembut dengan pulse merah | 200ms |
| Page transitions | Fade/slide dengan rose tint | 250ms |
| Button hover | Scale dengan glow rose | 150ms |
| Preview updates | Smooth transition (bukan instant swap) | 300ms |

### When NOT to Use Motion

- ❌ Background decorative animations (mengganggu fokus pada editing)
- ❌ Auto-playing carousels tanpa pause
- ❌ Continuous motion saat mengedit konten
- ❌ Apa pun yang mengalihkan perhatian dari preview website

### Easing Presets

```css
--ease-out: cubic-bezier(0, 0, 0.2, 1);     /* Elements appearing */
--ease-in: cubic-bezier(0.4, 0, 1, 1);      /* Elements disappearing */
--ease-in-out: cubic-bezier(0.4, 0, 0.2, 1); /* Moving elements */
```

---

## 5. Whitespace Strategy

### Density Level: Generous

**Rationale:** Whitespace yang luas menciptakan kesan premium, eksklusif, dan romantis - sangat penting untuk produk pernikahan. Ruang kosong juga memberikan "ruang bernafas" bagi pengguna saat berkreasi membuat website pernikahan impian mereka.

| Whitespace Type | Value | Application |
|-----------------|-------|-------------|
| **Macro** (section gaps) | 80-120px | Antara section utama (preview, editor, settings) |
| **Card padding** | 32px | Inside card components (template cards, settings) |
| **Form group gaps** | 24px | Antara form fields (input data pernikahan) |
| **List item gaps** | 16px | Antara list items (daftar template) |
| **Micro** (tight) | 8-12px | Related inline elements (badge, status) |

### Density by Product Category

| Category | Density | Why |
|----------|---------|-----|
| Wedding (Sesarra) | Generous | Whitespace = premium, emosional, dan romantis |
| Commerce/Action | Minimal | Density = energy & urgency |
| Standard | Moderate | Balance of clarity & efficiency |

---

## 6. Design Tokens

```css
/* ===========================================
   SESARRA DESIGN TOKENS
   Based on Akordium Neurodesign System
   =========================================== */

/* --- COLOR TOKENS --- */
--color-primary: #E8B4B8;
--color-primary-hover: #D4A0A4;
--color-primary-light: #F5D5D8;
--color-secondary: #F5F5DC;
--color-accent: #D4AF37;

--color-background: #FAFAF0;
--color-surface: #FFFFFF;
--color-surface-elevated: #FFFEF8;

--color-text-primary: #2D3748;
--color-text-secondary: #718096;
--color-text-muted: #A0AEC0;

/* Semantic Colors (Consistent Across All Products) */
--color-success: #16A34A;
--color-warning: #D97706;
--color-error: #DC2626;
--color-info: #2563EB;

/* --- TYPOGRAPHY TOKENS --- */
--font-display: 'Playfair Display', Georgia, serif;
--font-body: 'Inter', system-ui, sans-serif;

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
--card-padding: 32px;
--section-gap: 96px;
--form-group-gap: 24px;
--list-item-gap: 16px;

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
--shadow-sm: 0 1px 2px rgba(232, 180, 184, 0.1);
--shadow-md: 0 4px 6px rgba(232, 180, 184, 0.15);
--shadow-lg: 0 10px 15px rgba(232, 180, 184, 0.2);
--shadow-xl: 0 20px 25px rgba(232, 180, 184, 0.25);
```

---

## 7. Per-Screen Specifications

### Dashboard/Home

| Element | Specification |
|---------|---------------|
| **Focal Point** | Live preview website pernikahan di tengah atas |
| **Eye Pattern** | Z-Pattern (dari preview ke tombol publish) |
| **Primary Actions** | Tombol "Publish" dengan accent gold di kanan atas |
| **Key Metrics** | Status website, jumlah pengunjung (Layer 2) |

### Template Selection

| Element | Specification |
|---------|---------------|
| **Focal Point** | Template yang sedang dipilih/di-highlight |
| **Pattern** | F-Pattern (untuk scanning daftar template) |
| **CTAs** | Tombol "Pilih Template" di kiri atas (bukan kanan) |

### Editor Screen

| Element | Specification |
|---------|---------------|
| **Focal Point** | Live preview website yang sedang diedit |
| **Pattern** | Z-Pattern (dari preview ke panel editor) |
| **CTAs** | Tombol "Save" dan "Publish" di kanan atas |

---

## 8. Peak Moment Design

Based on Peak-End Rule: Users remember the **peak moment** and the **ending**, not the average.

### Peak Moment: Website Published

| Moment | Implementation |
|--------|----------------|
| **Trigger** | User pertama kali publish website pernikahan |
| **Visual** | Full-screen celebration dengan animasi website "mengudara", confetti rose-gold |
| **Duration** | 500ms animation |
| **Micro-copy** | "Wedding website kamu sudah online! 🎉 Bagikan ke keluarga dan teman ya!" |

### Peak Moment: First Preview Selected

| Moment | Implementation |
|--------|----------------|
| **Trigger** | User memilih template dan melihat preview pertama |
| **Visual** | Smooth reveal dengan fade-in dari tengah |
| **Duration** | 400ms animation |
| **Micro-copy** | "Template cantik! Lanjutkan dengan edit konten 💒" |

### Ending Design

| Moment | Implementation |
|--------|----------------|
| **Trigger** | User logout atau menutup editor |
| **Message** | "Proyek kamu tersimpan. Sampai jumpa di kreasi indah berikutnya! ✨" |
| **Tone** | Warm, encouraging, creative |

---

## 9. Accessibility Requirements

| Requirement | Standard |
|-------------|----------|
| Contrast Ratio | WCAG AA minimum (4.5:1 for text) |
| Focal Points | AAA contrast (7:1) |
| Interactive Elements | Minimum 44px touch target |
| Focus States | Visible focus ring dengan warna primary rose |
| Motion | Respect `prefers-reduced-motion` |

---

## 10. Implementation Checklist

- [ ] Colors match category palette (Rose, Cream, Gold)
- [ ] Single focal point per screen (Live Preview Website)
- [ ] Eye tracking pattern applied (Z-Pattern untuk editor, F-Pattern untuk template)
- [ ] Whitespace density appropriate (Generous)
- [ ] Motion used sparingly (romantic, tidak berlebihan)
- [ ] Peak moment designed (Website published, preview pertama)
- [ ] Design tokens implemented in CSS
- [ ] Accessibility requirements met

---

*Based on: [neurodesign-uiux-guide.md](../_templates/neurodesign-uiux-guide.md)*

*Last Updated: 2026-03-03*
*Document Version: 1.0*
