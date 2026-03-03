# AkarKita Design System

> Neurodesign-based visual hierarchy untuk Silsilah Keluarga Digital

**Category:** Heritage

**Related:** [neurodesign-uiux-guide.md](../_templates/neurodesign-uiux-guide.md)

---

## 1. Visual Identity

### Color Palette

| Role | Color | Hex | Neuroscience Rationale |
|------|-------|-----|------------------------|
| Primary | Brown | `#8B4513` | Warna cokelat tanah melambangkan akar, grounding, dan warisan - memicu rasa kedalaman, kestabilan, dan koneksi dengan masa lalu. Sangat cocok untuk produk genealogi/family tree. |
| Secondary | Cream | `#F5F5DC` | Memberikan kesan klasik, hangat, dan nostalgis - menciptakan latar belakang yang nyaman seperti kertas tua tanpa mengganggu konten |
| Accent | Deep Green | `#2D5A27` | Melambangkan pertumbuhan, kelangsungan hidup, dan alam - cocok untuk metafora "pohon keluarga" yang terus tumbuh |
| Background | Warm Beige | `#FDF5E6` | Nuansa hangat yang menenangkan, seperti kanvas vintage untuk cerita keluarga |
| Text Primary | Dark Brown | `#3E2723` | Kontras tinggi dengan nuansa earthy untuk keterbacaan maksimal |
| Text Secondary | Warm Gray | `#6B5B5B` | Untuk teks pendukung dengan kontras yang cukup tapi tidak dominan |

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
| Display/Hero | Lora | 48px | Bold (700) |
| H1 | Lora | 38px | Semibold (600) |
| H2 | Lora | 30px | Semibold (600) |
| H3 | Lora | 24px | Medium (500) |
| Body Large | Inter | 18px | Regular (400) |
| Body | Inter | 16px | Regular (400) |
| Caption/Meta | Inter | 12px | Regular (400) |

**Typography Rationale:** Lora (serif) untuk semua heading memberikan kesan heritage, traditional, dan elegan yang sangat cocok untuk tema silsilah keluarga. Font ini memiliki karakter klasik seperti yang digunakan dalam dokumen sejarah. Sementara Inter untuk body text memastikan keterbacaan yang baik untuk informasi detail tentang anggota keluarga.

---

## 2. Visual Hierarchy (5-Layer)

### Layer Definitions

| Layer | Use Case | Size | Weight | Contrast |
|-------|----------|------|--------|----------|
| **1. Focal Point** | Anggota keluarga yang sedang dipilih | 48px | Bold | 7:1 (AAA) |
| **2. Primary** | Nama anggota keluarga utama / Tanggal lahir-wafat | 30px | Medium | 4.5:1 (AA) |
| **3. Secondary** | Detail hubungan keluarga / Foto kecil | 18px | Regular | 4.5:1 (AA) |
| **4. Supporting** | Caption, catatan sejarah | 14px | Light | 3:1 |
| **5. UI Chrome** | Navigation, buttons tree view | 12px | Regular | 3:1 |

### Focal Point Strategy

**Single Focal Element per Screen:** Anggota keluarga yang sedang dipilih/dilihat detailnya

```
Example:
┌─────────────────────────────────────┐
│                                     │
│       H. AHMAD NASUTION              │  ← Layer 1: Nama (Focal Point)
│       1920 - 1995                    │
│       [Foto Besar]                   │
│                                     │
│  Ayah dari:                          │  ← Layer 2: Primary info
│  • Budi Nasution (1950)              │
│  • Siti Nasution (1955)              │
│                                     │
│  Menikah dengan: Fatmawati (1922)    │  ← Layer 3: Secondary info
│  Catatan: Pendiri desa               │
│                                     │
└─────────────────────────────────────┘
```

### Anti-Patterns to Avoid

- ❌ **Christmas Tree Effect:** Semua nama bold/highlighted = tidak ada focal point
- ❌ **Flat Hierarchy:** Semua anggota keluarga ukuran sama = sulit mencari siapa yang sedang dipilih
- ❌ **Hidden Navigation:** Kontrol navigasi tree tersembunyi di antara elemen lain

---

## 3. Eye Tracking Pattern

### Primary Pattern: F-Pattern

**Rationale:** F-Pattern sangat cocok untuk family tree karena pengguna cenderung memindai secara vertikal di sisi kiri (navigasi hirarki/hubungan) lalu membaca horizontal untuk detail setiap anggota keluarga. Pattern ini mengikuti struktur alami pohon keluarga: dari atas ke bawah (generasi) dan kiri ke kanan (sibling/spouse).

### Pattern Application

#### F-Pattern - Untuk Family Tree Navigation

```
┌──────────────────────────────────────┐
│ Kakek        Nenek     Paman  Bibi   │  ← Horizontal scan 1 (generasi 1)
│ Budi         Siti      Andi   Dewi   │  ← Horizontal scan 2 (generasi 2)
│ █                                    │  ← Vertical scan (navigasi tree)
│ █  [DETAIL KAKEK - FOCAL POINT]      │
│ █                                    │
└──────────────────────────────────────┘
```

### Key Rules

- **Most important person** (yang sedang dipilih) = left side vertical scan
- **Most important info** (nama, tanggal) = horizontal scan pertama
- **Never hide critical info** di bottom-right corner (blind spot)

---

## 4. Motion Guidelines

### When to Use Motion

| Use Case | Animation Type | Duration |
|----------|---------------|----------|
| Loading states | Skeleton shimmer dengan efek earth tone | Continuous |
| Success feedback | Subtle leaf fall animation (hijau) | 300ms max |
| Error indication | Shake dengan pulse merah | 200ms |
| Tree navigation | Smooth expand/collapse | 250ms |
| Member selection | Fade dengan subtle highlight | 150ms |
| Photo reveal | Scale dengan vintage fade | 200ms |

### When NOT to Use Motion

- ❌ Background decorative animations (mengganggu fokus pada tree)
- ❌ Auto-playing carousels tanpa pause
- ❌ Continuous motion saat menelusuri silsilah
- ❌ Apa pun yang mengalihkan perhatian dari anggota keluarga yang sedang dipilih

### Easing Presets

```css
--ease-out: cubic-bezier(0, 0, 0.2, 1);     /* Elements appearing */
--ease-in: cubic-bezier(0.4, 0, 1, 1);      /* Elements disappearing */
--ease-in-out: cubic-bezier(0.4, 0, 0.2, 1); /* Moving elements */
```

---

## 5. Whitespace Strategy

### Density Level: Generous

**Rationale:** Whitespace yang luas menciptakan kesan hormat, penting, dan bermakna - sangat penting untuk produk heritage tentang keluarga. Ruang kosong memberikan "ruang penghormatan" bagi setiap anggota keluarga dan membuat informasi mudah dicerna.

| Whitespace Type | Value | Application |
|-----------------|-------|-------------|
| **Macro** (section gaps) | 64-96px | Antara generasi/section utama |
| **Card padding** | 28px | Inside card components (profil anggota) |
| **Form group gaps** | 20px | Antara form fields (tambah anggota) |
| **List item gaps** | 16px | Antara list items (daftar anak/saudara) |
| **Micro** (tight) | 8-12px | Related inline elements (badge, hubungan) |

### Density by Product Category

| Category | Density | Why |
|----------|---------|-----|
| Heritage (AkarKita) | Generous | Whitespace = respect, importance, dan clarity |
| Commerce/Action | Minimal | Density = energy & urgency |
| Standard | Moderate | Balance of clarity & efficiency |

---

## 6. Design Tokens

```css
/* ===========================================
   AKARKITA DESIGN TOKENS
   Based on Akordium Neurodesign System
   =========================================== */

/* --- COLOR TOKENS --- */
--color-primary: #8B4513;
--color-primary-hover: #6B3410;
--color-primary-light: #A0522D;
--color-secondary: #F5F5DC;
--color-accent: #2D5A27;

--color-background: #FDF5E6;
--color-surface: #FFFFFF;
--color-surface-elevated: #FFFAF0;

--color-text-primary: #3E2723;
--color-text-secondary: #6B5B5B;
--color-text-muted: #8B7355;

/* Semantic Colors (Consistent Across All Products) */
--color-success: #16A34A;
--color-warning: #D97706;
--color-error: #DC2626;
--color-info: #2563EB;

/* --- TYPOGRAPHY TOKENS --- */
--font-display: 'Lora', Georgia, serif;
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
--card-padding: 28px;
--section-gap: 80px;
--form-group-gap: 20px;
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
--shadow-sm: 0 1px 2px rgba(139, 69, 19, 0.1);
--shadow-md: 0 4px 6px rgba(139, 69, 19, 0.15);
--shadow-lg: 0 10px 15px rgba(139, 69, 19, 0.2);
--shadow-xl: 0 20px 25px rgba(139, 69, 19, 0.25);
```

---

## 7. Per-Screen Specifications

### Dashboard/Home

| Element | Specification |
|---------|---------------|
| **Focal Point** | Family tree overview dengan generasi teratas di tengah |
| **Eye Pattern** | F-Pattern (dari atas ke bawah, kiri ke kanan) |
| **Primary Actions** | Tombol "Tambah Anggota" dengan accent green |
| **Key Metrics** | Total anggota keluarga, generasi terdalam (Layer 2) |

### Detail Anggota Keluarga

| Element | Specification |
|---------|---------------|
| **Focal Point** | Nama dan foto anggota keluarga yang dipilih |
| **Pattern** | F-Pattern (dari nama ke detail hubungan) |
| **CTAs** | Tombol "Edit" dan "Tambah Anak/Pasangan" di kiri atas |

### Tree View

| Element | Specification |
|---------|---------------|
| **Focal Point** | Anggota keluarga yang sedang aktif/highlighted |
| **Pattern** | F-Pattern (vertical scan di kiri, horizontal untuk detail) |
| **CTAs** | Tombol expand/collapse di sisi kiri setiap nama |

---

## 8. Peak Moment Design

Based on Peak-End Rule: Users remember the **peak moment** and the **ending**, not the average.

### Peak Moment: Menemukan Hubungan Keluarga

| Moment | Implementation |
|--------|----------------|
| **Trigger** | User berhasil menemukan koneksi keluarga yang dicari |
| **Visual** | Path highlight dengan animasi garis connecting antar anggota |
| **Duration** | 500ms animation |
| **Micro-copy** | "Koneksi ditemukan! Beliau adalah kakek buyut dari pihak ayah 🌳" |

### Peak Moment: Tree Lengkap Terbentuk

| Moment | Implementation |
|--------|----------------|
| **Trigger** | User berhasil melengkapi silsilah sampai generasi tertentu |
| **Visual** | Celebration dengan animasi tree "tumbuh" dari akar ke pucuk |
| **Duration** | 600ms animation |
| **Micro-copy** | "Silsilah lengkap! 5 generasi telah terdata. Warisan hidup terus 🌱" |

### Ending Design

| Moment | Implementation |
|--------|----------------|
| **Trigger** | User logout atau menutup aplikasi |
| **Message** | "Silsilah tersimpan. Sampai jumpa di penjelajahan sejarah berikutnya 📜" |
| **Tone** | Warm, respectful, historical |

---

## 9. Accessibility Requirements

| Requirement | Standard |
|-------------|----------|
| Contrast Ratio | WCAG AA minimum (4.5:1 for text) |
| Focal Points | AAA contrast (7:1) |
| Interactive Elements | Minimum 44px touch target |
| Focus States | Visible focus ring dengan warna primary brown |
| Motion | Respect `prefers-reduced-motion` |

---

## 10. Implementation Checklist

- [ ] Colors match category palette (Brown, Cream, Green)
- [ ] Single focal point per screen (Anggota keluarga yang dipilih)
- [ ] Eye tracking pattern applied (F-Pattern untuk tree navigation)
- [ ] Whitespace density appropriate (Generous)
- [ ] Motion used sparingly (subtle, respectful)
- [ ] Peak moment designed (Menemukan koneksi, tree lengkap)
- [ ] Design tokens implemented in CSS
- [ ] Accessibility requirements met

---

*Based on: [neurodesign-uiux-guide.md](../_templates/neurodesign-uiux-guide.md)*

*Last Updated: 2026-03-03*
*Document Version: 1.0*
