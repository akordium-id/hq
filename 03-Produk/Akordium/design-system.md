# Akordium Design System

> Neurodesign-based visual hierarchy untuk Website Perusahaan Akordium Lab

**Category:** Internal

**Related:** [neurodesign-uiux-guide.md](../_templates/neurodesign-uiux-guide.md)

---

## 1. Visual Identity

### Color Palette

| Role | Color | Hex | Neuroscience Rationale |
|------|-------|-----|------------------------|
| Primary | Gray | `#6B7280` | Warna abu-abu melambangkan profesionalisme, keseimbangan, dan kestabilan - sangat cocok untuk website perusahaan yang ingin terlihat modern, reliable, dan tidak terlalu agresif |
| Secondary | Navy | `#1E3A5F` | Memberikan kedalaman dan kepercayaan - warna navy klasik yang sering digunakan oleh perusahaan teknologi dan consulting untuk kesan expertise |
| Accent | Electric Blue | `#3B82F6` | Menambahkan sentuhan modern dan teknologi untuk highlight penting seperti CTA, links, atau elemen interaktif |
| Background | Off-White | `#F9FAFB` | Clean dan neutral untuk konten perusahaan yang padat (services, portfolio) |
| Text Primary | Dark Navy | `#0F172A` | Kontras maksimal untuk keterbacaan pada latar terang |
| Text Secondary | Cool Gray | `#475569` | Untuk teks pendukung dengan kontras yang cukup |

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
| Display/Hero | Geist | 48px | Bold (700) |
| H1 | Geist | 38px | Semibold (600) |
| H2 | Geist | 30px | Semibold (600) |
| H3 | Geist | 24px | Medium (500) |
| Body Large | Geist | 18px | Regular (400) |
| Body | Geist | 16px | Regular (400) |
| Caption/Meta | Geist | 12px | Regular (400) |

**Typography Rationale:** Geist adalah font modern, clean, dan highly readable yang sempurna untuk website perusahaan teknologi. Font ini memiliki karakter professional tapi tetap approachable, dengan excellent legibility di berbagai ukuran. Sangat cocok untuk brand yang ingin terlihat modern dan tech-savvy.

---

## 2. Visual Hierarchy (5-Layer)

### Layer Definitions

| Layer | Use Case | Size | Weight | Contrast |
|-------|----------|------|--------|----------|
| **1. Focal Point** | Hero message / Value proposition utama | 48px | Bold | 7:1 (AAA) |
| **2. Primary** | Nama service / CTA utama | 30px | Medium | 4.5:1 (AA) |
| **3. Secondary** | Deskripsi service / Detail portfolio | 18px | Regular | 4.5:1 (AA) |
| **4. Supporting** | Testimoni / Tech stack / Timeline | 14px | Light | 3:1 |
| **5. UI Chrome** | Navigation, footer, metadata | 12px | Regular | 3:1 |

### Focal Point Strategy

**Single Focal Element per Screen:** Hero statement atau value proposition utama perusahaan

```
Example:
┌─────────────────────────────────────┐
│                                     │
│  DEVELOPMENT SERVICES THAT MATTER    │  ← Layer 1: Hero (Focal Point)
│  Kami membangun solusi digital       │
│  untuk bisnis Indonesia             │
│                                     │
│  ┌─────────┐  ┌─────────┐          │  ← Layer 2: Primary CTAs
│  │LATEST   │  │CONTACT  │          │
│  │WORK     │  │US       │          │
│  └─────────┘  └─────────┘          │
│                                     │
│  Web Development • Mobile Apps      │  ← Layer 3: Services
│  Cloud Infrastructure • Consulting  │
│                                     │
└─────────────────────────────────────┘
```

### Anti-Patterns to Avoid

- ❌ **Christmas Tree Effect:** Semua service/CTA highlighted = tidak ada focal point
- ❌ **Flat Hierarchy:** Semua konten ukuran sama = pengunjung bingung apa yang ditawarkan
- ❌ **Hidden CTA:** Tombol contact tersembunyi di antara konten lain

---

## 3. Eye Tracking Pattern

### Primary Pattern: Z-Pattern

**Rationale:** Z-Pattern sangat cocok untuk landing page perusahaan karena pengunjung cenderung memindai dari kiri atas (logo/brand) ke kanan atas (navigation/CTA), lalu ke tengah (hero message/value proposition), dan akhirnya ke kanan bawah (tombol aksi utama). Pattern ini mengikuti alur baca alami dan memaksimalkan konversi.

### Pattern Application

#### Z-Pattern - Untuk Landing Page

```
┌──────────────────────────────────────┐
│ AKORDIUM LAB    →→→    CONTACT US    │  ← Zone 1: First impression + CTA
│                      ↘                │
│     DEVELOPMENT SERVICES THAT         │
│     MATTER FOR INDONESIAN BUSINESS    │
│                   ↙                   │
│ OUR SERVICES    →→→   VIEW PORTFOLIO  │  ← Zone 4: Conversion
└──────────────────────────────────────┘
```

### Key Rules

- **Most important message** (hero/value prop) = top horizontal scan (Zone 1-2)
- **Most important action** (contact/CTA) = top-right dan bottom-right (Zones 1 & 4)
- **Never hide critical info** di bottom-left corner (blind spot)

---

## 4. Motion Guidelines

### When to Use Motion

| Use Case | Animation Type | Duration |
|----------|---------------|----------|
| Loading states | Skeleton shimmer dengan efek gray-blue | Continuous |
| Success feedback | Subtle checkmark dengan glow | 300ms max |
| Error indication | Shake dengan pulse merah | 200ms |
| Page transitions | Fade/slide dengan subtle blue tint | 250ms |
| Button hover | Scale dengan subtle glow | 150ms |
| Scroll animations | Fade-in elements saat scroll | 400ms |

### When NOT to Use Motion

- ❌ Background decorative animations (mengganggu fokus pada konten)
- ❌ Auto-playing carousels tanpa pause
- ❌ Continuous motion saat membaca services/portfolio
- ❌ Apa pun yang mengalihkan perhatian dari value proposition

### Easing Presets

```css
--ease-out: cubic-bezier(0, 0, 0.2, 1);     /* Elements appearing */
--ease-in: cubic-bezier(0.4, 0, 1, 1);      /* Elements disappearing */
--ease-in-out: cubic-bezier(0.4, 0, 0.2, 1); /* Moving elements */
```

---

## 5. Whitespace Strategy

### Density Level: Moderate

**Rationale:** Whitespace moderate menciptakan balance antara professionalism dan efficiency - penting untuk website perusahaan yang harus terlihat established tapi juga informative dan action-oriented. Tidak terlalu longgar (seperti luxury brand) dan tidak terlalu padat (seperti dashboard), tapi tepat untuk corporate website.

| Whitespace Type | Value | Application |
|-----------------|-------|-------------|
| **Macro** (section gaps) | 64-80px | Antara section utama (hero, services, portfolio) |
| **Card padding** | 24px | Inside card components (service cards, portfolio) |
| **Form group gaps** | 16px | Antara form fields (contact form) |
| **List item gaps** | 12px | Antara list items (service features, tech stack) |
| **Micro** (tight) | 4-8px | Related inline elements (badges, tags) |

### Density by Product Category

| Category | Density | Why |
|----------|---------|-----|
| Internal (Akordium) | Moderate | Balance professionalism & efficiency |
| Wedding/Heritage | Generous | Whitespace = trust, premium, respect |
| Commerce/Action | Minimal | Density = energy & urgency |

---

## 6. Design Tokens

```css
/* ===========================================
   AKORDIUM DESIGN TOKENS
   Based on Akordium Neurodesign System
   =========================================== */

/* --- COLOR TOKENS --- */
--color-primary: #6B7280;
--color-primary-hover: #4B5563;
--color-primary-light: #9CA3AF;
--color-secondary: #1E3A5F;
--color-accent: #3B82F6;

--color-background: #F9FAFB;
--color-surface: #FFFFFF;
--color-surface-elevated: #F0F4F8;

--color-text-primary: #0F172A;
--color-text-secondary: #475569;
--color-text-muted: #94A3B8;

/* Semantic Colors (Consistent Across All Products) */
--color-success: #16A34A;
--color-warning: #D97706;
--color-error: #DC2626;
--color-info: #2563EB;

/* --- TYPOGRAPHY TOKENS --- */
--font-display: 'Geist', system-ui, -apple-system, sans-serif;
--font-body: 'Geist', system-ui, -apple-system, sans-serif;

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
--section-gap: 72px;
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
--shadow-sm: 0 1px 2px rgba(107, 114, 128, 0.05);
--shadow-md: 0 4px 6px rgba(107, 114, 128, 0.1);
--shadow-lg: 0 10px 15px rgba(107, 114, 128, 0.15);
--shadow-xl: 0 20px 25px rgba(107, 114, 128, 0.2);
```

---

## 7. Per-Screen Specifications

### Homepage/Landing

| Element | Specification |
|---------|---------------|
| **Focal Point** | Hero message "Development Services That Matter" di tengah atas |
| **Eye Pattern** | Z-Pattern (dari hero ke CTA) |
| **Primary Actions** | Tombol "Contact Us" dan "View Portfolio" dengan accent blue |
| **Key Metrics** | Years experience, projects completed (Layer 2) |

### Services Page

| Element | Specification |
|---------|---------------|
| **Focal Point** | Service yang sedang di-hover/select |
| **Pattern** | F-Pattern (untuk scanning daftar services) |
| **CTAs** | Tombol "Discuss Project" di kiri atas (bukan kanan) |

### Portfolio Page

| Element | Specification |
|---------|---------------|
| **Focal Point** | Featured project di tengah atas |
| **Pattern** | Z-Pattern (dari featured ke list projects) |
| **CTAs** | Tombol "View Case Study" pada setiap project card |

### Contact Page

| Element | Specification |
|---------|---------------|
| **Focal Point** | Contact form atau contact info utama |
| **Pattern** | Z-Pattern (dari form ke CTA submit) |
| **CTAs** | Tombol "Send Message" di kanan bawah form |

---

## 8. Peak Moment Design

Based on Peak-End Rule: Users remember the **peak moment** and the **ending**, not the average.

### Peak Moment: Contact Form Submitted

| Moment | Implementation |
|--------|----------------|
| **Trigger** | User berhasil mengirim contact form |
| **Visual** | Full-screen success message dengan subtle checkmark animation |
| **Duration** | 400ms animation |
| **Micro-copy** | "Pesan terkirim! Tim kami akan menghubungi Anda dalam 1x24 jam." |

### Peak Moment: Portfolio Case Study Viewed

| Moment | Implementation |
|--------|----------------|
| **Trigger** | User membuka detail case study portfolio |
| **Visual** | Smooth transition dengan hero image reveal |
| **Duration** | 300ms animation |
| **Micro-copy** | (Tidak perlu, fokus pada konten case study) |

### Ending Design

| Moment | Implementation |
|--------|----------------|
| **Trigger** | User meninggalkan website (exit intent atau page close) |
| **Message** | (Tidak perlu untuk corporate website) |
| **Tone** | Professional, straightforward |

---

## 9. Accessibility Requirements

| Requirement | Standard |
|-------------|----------|
| Contrast Ratio | WCAG AA minimum (4.5:1 for text) |
| Focal Points | AAA contrast (7:1) |
| Interactive Elements | Minimum 44px touch target |
| Focus States | Visible focus ring dengan warna accent blue |
| Motion | Respect `prefers-reduced-motion` |

---

## 10. Implementation Checklist

- [ ] Colors match category palette (Gray, Navy, Blue)
- [ ] Single focal point per screen (Hero message/Service)
- [ ] Eye tracking pattern applied (Z-Pattern untuk landing, F-Pattern untuk services)
- [ ] Whitespace density appropriate (Moderate)
- [ ] Motion used sparingly (professional, tidak berlebihan)
- [ ] Peak moment designed (Contact form submitted)
- [ ] Design tokens implemented in CSS
- [ ] Accessibility requirements met

---

*Based on: [neurodesign-uiux-guide.md](../_templates/neurodesign-uiux-guide.md)*

*Last Updated: 2026-03-03*
*Document Version: 1.0*
