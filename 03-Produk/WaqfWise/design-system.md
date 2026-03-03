# WaqfWise Design System

> Neurodesign-based visual hierarchy untuk Sistem Manajemen Wakaf Terpercaya & Transparan

**Category:** Islamic

**Related:** [neurodesign-uiux-guide.md](../_templates/neurodesign-uiux-guide.md)

---

## 1. Visual Identity

### Color Palette

| Role | Color | Hex | Neuroscience Rationale |
|------|-------|-----|------------------------|
| Primary | Dark Teal (Islamic Heritage) | `#0D5C4D` | Warna hijau tua melambangkan kepercayaan, warisan Islam, dan stabilitas. Hijau adalah warna identik dengan dunia Islam, membangkitkan rasa aman dan spiritualitas. |
| Secondary | Gold (Nobility) | `#D4AF37` | Emas melambangkan kemuliaan, nilai, dan keberkahan. Memberikan kesan premium dan menghargai nilai wakaf yang tinggi. |
| Accent | Warm Gold | `#E8C547` | Aksen yang lebih terang untuk highlight dan elemen interaktif, mempertahankan nuansa kemuliaan namun lebih visible. |
| Background | Cream/Warm White | `#FAF8F5` | Latar belakang hangat yang memberikan kesan ramah dan membumi, mengurangi kekakuan visual. |
| Surface | Off-White | `#FFFFFF` | Surface untuk kartu dan panel konten, memberikan kontras yang cukup untuk keterbacaan. |
| Text Primary | Deep Charcoal | `#1A1A2E` | Teks utama dengan kontras tinggi untuk keterbacaan maksimal, namun tetap soft di mata. |
| Text Secondary | Slate Gray | `#6B7280` | Teks sekunder untuk informasi pendukung, memberikan hierarki visual yang jelas. |
| Text Muted | Light Gray | `#9CA3AF` | Teks muted untuk elemen non-kritis seperti placeholder dan label sekunder. |

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

**Typography Rationale:**
- **Lora untuk Headings:** Font serif yang elegan dengan nuansa heritage dan tradisi, cocok untuk produk Islamic yang menghargai warisan. Lora memberikan kesan premium dan terpercaya, sekaligus highly readable.
- **Inter untuk Body:** Sans-serif modern yang sangat readable, memberikan keseimbangan antara tradisi (Lora) dan modernitas (Inter). Inter memastikan kenyamanan membaca untuk konten panjang seperti laporan keuangan dan dokumen legal.

---

## 2. Visual Hierarchy (5-Layer)

### Layer Definitions

| Layer | Use Case | Size | Weight | Contrast |
|-------|----------|------|--------|----------|
| **1. Focal Point** | Total nilai aset wakaf / Jumlah penerima manfaat | 48px | Bold | 7:1 (AAA) |
| **2. Primary** | Key metrics (donasi bulan ini, aset terdaftar) | 30px | Medium | 4.5:1 (AA) |
| **3. Secondary** | Supporting data (tanggal, status, kategori) | 18px | Regular | 4.5:1 (AA) |
| **4. Supporting** | Meta info, timestamps, labels | 14px | Light | 3:1 |
| **5. UI Chrome** | Navigation, borders, divider lines | 12px | Regular | 3:1 |

### Focal Point Strategy

**Single Focal Element per Screen:** Total nilai aset wakaf yang dikelola atau jumlah penerima manfaat untuk dashboard, dan nominal donasi untuk halaman pembayaran.

```
Example: Dashboard Nazhir
┌─────────────────────────────────────────────┐
│                                             │
│    Rp 2.5 Miliar                            │  ← Layer 1: Total Aset Wakaf (Focal Point)
│    Total Nilai Aset Wakaf                   │
│                                             │
│  ┌──────────┐  ┌──────────┐  ┌──────────┐  │  ← Layer 2: Primary Metrics
│  │ 152      │  │ 45       │  │ Rp 150Jt │  │
│  │ Aset     │  │ Program  │  │ Donasi   │  │
│  └──────────┘  └──────────┘  └──────────┘  │
│                                             │
│  Daftar aset wakaf terbaru                  │  ← Layer 3: Secondary Content
│  1. Tanah wakaf Al-Ikhlas                 │
│  2. Masjid Jami' Al-Huda                  │
│                                             │
└─────────────────────────────────────────────┘
```

### Anti-Patterns to Avoid

- ❌ **Christmas Tree Effect:** Semua elemen bold/highlighted = tidak ada focal point yang jelas
- ❌ **Flat Hierarchy:** Semua elemen sama besar = otak bingung harus mulai dari mana
- ❌ **Hidden CTA:** Tombol donasi atau aksi utama tertimbun di antara elemen lain

---

## 3. Eye Tracking Pattern

### Primary Pattern: F-Pattern

**Rationale:** Dashboard WaqfWise berisi banyak data dan metrik yang perlu dipindai secara sistematis. F-Pattern memungkinkan nazhir melihat metrik terpenting di bagian atas, lalu memindai ke bawah untuk detail tambahan.

### Pattern Application

#### F-Pattern - Untuk Dashboard & Halaman Data

```
┌──────────────────────────────────────┐
│ ████████████████████████████████████ │  ← Horizontal scan 1 (Focal Point)
│ Total Aset Wakaf: Rp 2.5 Miliar      │
│                                       │
│ ██████████████████████                │  ← Horizontal scan 2 (Primary Metrics)
│ Aset: 152  |  Program: 45  |  ...   │
│ █                                    │
│ █  Daftar Aset Wakaf                  │  ← Vertical scan (Daftar konten)
│ █  1. Tanah wakaf Al-Ikhlas          │
│ █  2. Masjid Jami' Al-Huda           │
│ █  3. Gedung Pesantren Daarul...     │
└──────────────────────────────────────┘
```

#### Z-Pattern - Untuk Landing Page & Halaman Marketing

```
┌──────────────────────────────────────┐
│ WaqfWise         →→→     Daftar/Login │  ← Zone 1: First impression
│                    ↘                  │
│      Kelola Wakaf dengan Transparansi │
│                   ↙                   │
│  Manajemen Wakaf →→→  Mulai Gratis   │  ← Zone 4: Conversion
└──────────────────────────────────────┘
```

### Key Rules

- **Metrik terpenting** = horizontal scan pertama (total aset wakaf)
- **Tombol aksi utama** = sisi kiri atau bagian atas (bukan bottom-right)
- **Jangan sembunyikan info kritis** di pojok kanan bawah

---

## 4. Motion Guidelines

### When to Use Motion

| Use Case | Animation Type | Duration |
|----------|---------------|----------|
| Loading states | Skeleton shimmer dengan warna teal | Continuous |
| Success feedback (donasi berhasil) | Micro-confetti dengan warna gold | 300ms max |
| Error indication | Shake/pulse dengan warna merah lembut | 200ms |
| Page transitions | Fade/slide smooth | 250ms |
| Button hover | Scale/glow dengan efek gold | 150ms |
| Chart/data visualization | Progressive reveal (bars grow from 0) | 400ms |

### When NOT to Use Motion

- ❌ Background decorative animations (distracting dari konten)
- ❌ Auto-playing carousels tanpa pause (kontrol user hilang)
- ❌ Continuous motion saat membaca laporan (mengganggu fokus)
- ❌ Apapun yang mengalihkan perhatian dari focal point

### Easing Presets

```css
--ease-out: cubic-bezier(0, 0, 0.2, 1);     /* Elements appearing */
--ease-in: cubic-bezier(0.4, 0, 1, 1);      /* Elements disappearing */
--ease-in-out: cubic-bezier(0.4, 0, 0.2, 1); /* Moving elements */
```

---

## 5. Whitespace Strategy

### Density Level: Generous

**Rationale:** Sebagai produk trust-based (Islamic, financial), whitespace yang luas melambangkan transparansi, kejelasan, dan premium feel. Whitespace juga memudahkan nazhir memproses informasi keuangan yang kompleks.

| Whitespace Type | Value | Application |
|-----------------|-------|-------------|
| **Macro** (section gaps) | 64-96px | Antara section utama dashboard |
| **Card padding** | 24px | Inside kartu aset dan laporan |
| **Form group gaps** | 16px | Antara field di form registrasi aset |
| **List item gaps** | 12px | Antara item di daftar aset/wakif |
| **Micro** (tight) | 4-8px | Elemen inline yang terkait erat |

### Density by Product Category

| Category | Density | Why |
|----------|---------|-----|
| Trust-based (Islamic, Finance) | Generous | Whitespace = trust & premium |
| Commerce/Action (POS, Marketing) | Minimal | Density = energy & urgency |
| Standard | Moderate | Balance of clarity & efficiency |

---

## 6. Design Tokens

```css
/* ===========================================
   WAQFWISE DESIGN TOKENS
   Based on Akordium Neurodesign System
   =========================================== */

/* --- COLOR TOKENS --- */
/* Primary - Islamic Heritage Teal */
--color-primary: #0D5C4D;
--color-primary-hover: #0A4A3D;
--color-primary-light: #1A7A65;
--color-primary-lighter: #E8F5F1;

/* Secondary - Noble Gold */
--color-secondary: #D4AF37;
--color-secondary-hover: #B8952F;
--color-secondary-light: #E8C547;

/* Accent - Warm Gold */
--color-accent: #E8C547;
--color-accent-hover: #D4AF37;

/* Backgrounds */
--color-background: #FAF8F5;      /* Cream/warm white */
--color-surface: #FFFFFF;         /* Pure white for cards */
--color-surface-elevated: #FFFFFF;

/* Text */
--color-text-primary: #1A1A2E;    /* Deep charcoal */
--color-text-secondary: #6B7280;  /* Slate gray */
--color-text-muted: #9CA3AF;      /* Light gray */

/* Semantic Colors (Consistent Across All Products) */
--color-success: #16A34A;
--color-warning: ##D97706;
--color-error: #DC2626;
--color-info: #2563EB;

/* --- TYPOGRAPHY TOKENS --- */
--font-display: 'Lora', 'Times New Roman', serif;
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
--card-padding: 24px;
--section-gap: 64px;
--form-group-gap: 16px;
--list-item-gap: 12px;

/* --- VISUAL WEIGHT (5-LAYER HIERARCHY) --- */
--focal-size: 48px;       /* Layer 1: ONE per screen - Total Aset Wakaf */
--primary-size: 30px;     /* Layer 2: 2-3 elements - Key metrics */
--secondary-size: 18px;   /* Layer 3: 4-6 elements - Supporting data */
--supporting-size: 14px;  /* Layer 4: Supporting info - Meta, timestamps */
--chrome-size: 12px;      /* Layer 5: UI Chrome - Nav, borders */

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
--shadow-sm: 0 1px 2px rgba(13, 92, 77, 0.05);
--shadow-md: 0 4px 6px rgba(13, 92, 77, 0.1);
--shadow-lg: 0 10px 15px rgba(13, 92, 77, 0.1);
--shadow-xl: 0 20px 25px rgba(13, 92, 77, 0.15);
```

---

## 7. Per-Screen Specifications

### Dashboard Nazhir

| Element | Specification |
|---------|---------------|
| **Focal Point** | Total nilai aset wakaf (dalam Rupiah) - Large, bold, di bagian atas |
| **Eye Pattern** | F-Pattern - Metrik di atas, daftar aset di bawah |
| **Primary Actions** | "Tambah Aset Baru" (tombol primary di sebelah kiri atas) |
| **Key Metrics** | Jumlah aset, Program aktif, Total donasi bulan ini (Layer 2) |

### Portal Donatur (Wakif)

| Element | Specification |
|---------|---------------|
| **Focal Point** | Total donasi yang sudah diberikan atau QR code untuk scan donasi |
| **Pattern** | Z-Pattern untuk landing, F-Pattern untuk dashboard |
| **CTAs** | "Donasi Sekarang" (tombol gold prominent) |

### Halaman Registrasi Aset

| Element | Specification |
|---------|---------------|
| **Focal Point** | Form input utama (jenis wakaf, nilai aset) |
| **Pattern** | F-Pattern - Form flow dari atas ke bawah |
| **CTAs** | "Simpan Aset" (tombol primary teal) |

### Halaman Laporan Keuangan

| Element | Specification |
|---------|---------------|
| **Focal Point** | Total hasil wakaf yang terkumpul periode ini |
| **Pattern** | F-Pattern - Summary di atas, detail breakdown di bawah |
| **CTAs** | "Download PDF" / "Export Excel" (tombol secondary) |

---

## 8. Peak Moment Design

Based on Peak-End Rule: Users remember the **peak moment** and the **ending**, not the average.

### Peak Moment: Donasi Berhasil

| Moment | Implementation |
|--------|----------------|
| **Trigger** | Pembayaran donasi selesai diverifikasi |
| **Visual** | Full-screen celebration dengan micro-confetti gold + teal, ikon tangan berdoa atau masjid |
| **Duration** | 400ms animation |
| **Micro-copy** | "Alhamdulillah! Wakaf Anda telah diterima. Terima kasih atas keberkahan yang Anda berikan." |
| **Secondary Message** | "Wakaf Anda sudah dirasakan oleh 245 penerima manfaat" (impact personalization) |

### Secondary Peak Moment: Aset Baru Terdaftar

| Moment | Implementation |
|--------|----------------|
| **Trigger** | Nazhir berhasil registrasi aset wakaf baru |
| **Visual** | Card slide-in dengan ikon aset (tanah/bangunan/uang) |
| **Duration** | 300ms animation |
| **Micro-copy** | "Masya Allah! Aset wakaf baru berhasil didaftarkan." |
| **Secondary Message** | "Sertifikat digital akan dikirim ke email Anda." |

### Ending Design

| Moment | Implementation |
|--------|----------------|
| **Trigger** | Logout atau menutup aplikasi |
| **Message** | "Semoga amal sholeh Anda diterima. Sampai jumpa lagi!" |
| **Tone** | Warm, spiritual, respectful |

---

## 9. Accessibility Requirements

| Requirement | Standard |
|-------------|----------|
| Contrast Ratio | WCAG AA minimum (4.5:1 for text) |
| Focal Points | AAA contrast (7:1) |
| Interactive Elements | Minimum 44px touch target |
| Focus States | Visible focus ring dengan warna teal |
| Motion | Respect `prefers-reduced-motion` |
| Color Blindness | Tidak hanya mengandalkan warna untuk info penting |

---

## 10. Implementation Checklist

- [ ] Colors match Islamic category palette (Teal + Gold)
- [ ] Single focal point per screen (Total aset / Donasi)
- [ ] Eye tracking pattern applied (F-Pattern for dashboard)
- [ ] Whitespace density appropriate (Generous untuk trust)
- [ ] Motion used sparingly (300ms max untuk micro-animations)
- [ ] Peak moment designed (Donasi berhasil celebration)
- [ ] Design tokens implemented in CSS
- [ ] Accessibility requirements met (WCAG AA)
- [ ] Typography pairing correct (Lora + Inter)
- [ ] Background cream tone applied (#FAF8F5)

---

*Based on: [neurodesign-uiux-guide.md](../_templates/neurodesign-uiux-guide.md)*

*Last Updated: 2026-03-03*
*Document Version: 1.0*
