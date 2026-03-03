# ExcelCircle Design System

> Neurodesign-based visual hierarchy untuk Excel Consulting Service

**Category:** Developer Tools

**Related:** [neurodesign-uiux-guide.md](../_templates/neurodesign-uiux-guide.md)

---

## 1. Visual Identity

### Color Palette

| Role | Color | Hex | Neuroscience Rationale |
|------|-------|-----|------------------------|
| Primary | Royal Blue | `#2563EB` | Biru teknis membangun kepercayaan dan kompetensi - essensial untuk consulting service |
| Secondary | Cool Gray | `#6B7280` | Netral dan professional, tidak mengalihkan perhatian dari expertise |
| Accent | Teal | `#14B8A6` | Highlight untuk elemen interaktif, memberikan kesan modern dan capability |
| Background | White | `#FFFFFF` | Clean dan focused, memungkinkan content (expert profiles) shine |
| Surface | Light Gray | `#F9FAFB` | Subtle differentiation untuk cards dan sections |
| Text Primary | Dark Slate | `#111827` | Maximum kontras untuk readability |
| Text Secondary | Medium Gray | `#4B5563` | Mendukung tanpa competing dengan primary content |

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

**Typography Rationale:** Inter dipilih karena versatility dan excellent readability di semua screen sizes. Font ini sudah standard di design tools (Figma, Adobe XD) dan memberikan kesan modern, professional yang tepat untuk consulting service. Inter memiliki出色的 legibility untuk long-form content seperti case studies dan expert profiles - critical untuk showcasing expertise.

---

## 2. Visual Hierarchy (5-Layer)

### Layer Definitions

| Layer | Use Case | Size | Weight | Contrast |
|-------|----------|------|--------|----------|
| **1. Focal Point** | Expert availability / CTA button | 48px | Bold | 7:1 (AAA) |
| **2. Primary** | Expert profiles / service names | 30px | Medium | 4.5:1 (AA) |
| **3. Secondary** | Skill tags, project descriptions | 18px | Regular | 4.5:1 (AA) |
| **4. Supporting** | Ratings, years of experience | 14px | Light | 3:1 |
| **5. UI Chrome** | Navigation, filters, borders | 12px | Regular | 3:1 |

### Focal Point Strategy

**Single Focal Element per Screen:** "Book Consultation" CTA dengan expert availability indicator - ini adalah conversion point utama dan harus paling menonjol.

```
Example:
┌─────────────────────────────────────┐
│                                     │
│    BOOK CONSULTATION                │  ← Layer 1: Single focal CTA
│    3 Experts Available              │
│                                     │
│  ┌─────────┐  ┌─────────┐          │  ← Layer 2: Expert cards
│  │ Expert  │  │ Expert  │          │
│  │ Profile │  │ Profile │          │
│  └─────────┘  └─────────┘          │
│                                     │
│  Skills: Excel, VBA, Power Query    │  ← Layer 3: Supporting info
└─────────────────────────────────────┘
```

### Anti-Patterns to Avoid

- ❌ **Christmas Tree Effect:** Semua expert cards di-highlight sama = user bingung memilih
- ❌ **Flat Hierarchy:** Semua text sama size = expertise tidak di-highlight dengan proper
- ❌ **Hidden CTA:** Tombol booking tersembunyi di bawah fold

---

## 3. Eye Tracking Pattern

### Primary Pattern: F-Pattern

**Rationale:** Landing page dan expert listing page didominasi oleh content yang perlu di-scan vertically (expert profiles, service offerings, case studies). F-Pattern optimal untuk memungkinkan user membandingkan multiple experts dan scan through service offerings secara efisien.

### Pattern Application

#### F-Pattern - Expert Listing Page

```
┌──────────────────────────────────────┐
│ ████████████████████████████████████ │  ← Horizontal scan 1 (Page title + filter)
│ ████████████████████████             │  ← Horizontal scan 2 (Featured expert)
│ █                                    │
│ █ Expert 1: Excel Specialist         │  ← Vertical scan left (Expert names)
│ █ Expert 2: VBA Developer            │
│ █ Expert 3: Data Analyst             │
│ █ Expert 4: Financial Modeler        │
└──────────────────────────────────────┘
```

#### Z-Pattern - Landing Page

```
┌──────────────────────────────────────┐
│ EXCEL CIRCLE    →→→    GET STARTED   │  ← Zone 1: Brand + CTA
│                    ↘                 │
│         EXCEL EXPERTS                │
│         ON DEMAND                    │
│                   ↙                  │
│ OUR SERVICES    →→→    BOOK NOW      │  ← Zone 4: Conversion
└──────────────────────────────────────┘
```

### Key Rules

- **"Book Consultation" CTA** = top horizontal scan (never hide below fold)
- **Expert photos** = left side (face recognition helps decision-making)
- **Availability indicators** = near expert name (not hidden in card)
- **Ratings/reviews** = supporting layer, not competing with CTA

---

## 4. Motion Guidelines

### When to Use Motion

| Use Case | Animation Type | Duration |
|----------|---------------|----------|
| CTA button hover | Scale 1.05 + shadow increase | 150ms |
| Expert card hover | Subtle lift (Y: -4px) | 200ms |
| Success booking | Green checkmark fade-in | 300ms |
| Form validation | Shake + color transition | 200ms |
| Page transitions | Fade + slide | 250ms |

### When NOT to Use Motion

- ❌ Background decorative animations
- ❌ Auto-playing testimonials carousel
- ❌ Continuous motion during expert profile reading
- ❌ Anything that distracts from "Book Consultation" CTA

### Easing Presets

```css
--ease-out: cubic-bezier(0, 0, 0.2, 1);     /* Elements appearing */
--ease-in: cubic-bezier(0.4, 0, 1, 1);      /* Elements disappearing */
--ease-in-out: cubic-bezier(0.4, 0, 0.2, 1); /* Moving elements */
```

---

## 5. Whitespace Strategy

### Density Level: Moderate

**Rationale:** Consulting service website perlu balance antara clarity (untuk showcasing expertise dengan proper) dan efficiency (banyak content: profiles, services, case studies). Moderate whitespace memungkinkan visitor scan expert profiles dan evaluate capability dengan comfortable.

| Whitespace Type | Value | Application |
|-----------------|-------|-------------|
| **Macro** (section gaps) | 64-80px | Between major sections (hero → experts → services) |
| **Card padding** | 24px | Inside expert profile cards |
| **Form group gaps** | 16px | Between consultation booking fields |
| **List item gaps** | 12px | Between skill tags |
| **Micro** (tight) | 4-8px | Related inline elements (rating + count) |

### Density by Screen Type

| Screen Type | Density | Why |
|-------------|---------|-----|
| Landing page | Moderate | Balance of persuasion & information |
| Expert listing | Moderate | Allow comparison without clutter |
| Case studies | Generous | Long-form readability |

---

## 6. Design Tokens

```css
/* ===========================================
   EXCELCIRCLE DESIGN TOKENS
   Based on Akordium Neurodesign System
   =========================================== */

/* --- COLOR TOKENS --- */
--color-primary: #2563EB;
--color-primary-hover: #1D4ED8;
--color-primary-light: #3B82F6;
--color-secondary: #6B7280;
--color-accent: #14B8A6;

--color-background: #FFFFFF;
--color-surface: #F9FAFB;
--color-surface-elevated: #FFFFFF;

--color-text-primary: #111827;
--color-text-secondary: #4B5563;
--color-text-muted: #9CA3AF;

/* Semantic Colors (Consistent Across All Products) */
--color-success: #16A34A;
--color-warning: #D97706;
--color-error: #DC2626;
--color-info: #2563EB;

/* Availability Status */
--status-available: #16A34A;
--status-busy: #F59E0B;
--status-offline: #6B7280;

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
--card-padding: 24px;
--section-gap: 64px;
--form-group-gap: 16px;
--list-item-gap: 12px;

/* --- VISUAL WEIGHT (5-LAYER HIERARCHY) --- */
--focal-size: 48px;       /* Layer 1: CTA - ONE per screen */
--primary-size: 30px;     /* Layer 2: Expert names (2-3 elements) */
--secondary-size: 18px;   /* Layer 3: Skills, descriptions (4-6 elements) */
--supporting-size: 14px;  /* Layer 4: Ratings, experience */
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
```

---

## 7. Per-Screen Specifications

### Landing Page

| Element | Specification |
|---------|---------------|
| **Focal Point** | "Book Consultation" CTA (top-right, prominent) |
| **Eye Pattern** | Z-Pattern (brand → value proposition → CTA) |
| **Primary Actions** | "Get Started" (hero), "View Experts" (secondary) |
| **Key Content** | Expert availability count, service offerings |

### Expert Listing

| Element | Specification |
|---------|---------------|
| **Focal Point** | Filter bar ( availability, skills ) |
| **Pattern** | F-Pattern (scan expert names vertically) |
| **CTAs** | "Book Now" (card-level), "View Profile" (secondary) |

### Expert Profile

| Element | Specification |
|---------|---------------|
| **Focal Point** | Expert photo + name + rating |
| **Pattern** | F-Pattern (photo → skills → case studies) |
| **CTAs** | "Book Consultation" (sticky, bottom on mobile) |

### Booking Form

| Element | Specification |
|---------|---------------|
| **Focal Point** | Expert summary (already selected) |
| **Pattern** | F-Pattern (top to bottom form flow) |
| **CTAs** | "Confirm Booking" (bottom-right, primary) |

---

## 8. Peak Moment Design

Based on Peak-End Rule: Users remember the **peak moment** and the **ending**, not the average.

### Peak Moment: Booking Confirmed

| Moment | Implementation |
|--------|----------------|
| **Trigger** | Booking form submitted successfully |
| **Visual** | Full-screen success modal with expert photo + "Booking Confirmed!" |
| **Duration** | 500ms animation, modal stays until dismissed |
| **Micro-copy** | "Your consultation with [Expert Name] is confirmed. Calendar invite sent!" |

### Peak Moment: Expert Joins Platform

| Moment | Implementation |
|--------|----------------|
| **Trigger** | New expert profile goes live |
| **Visual** | "New Expert Available" badge with subtle pulse animation |
| **Duration** | 400ms initial, then subtle pulse (2s cycle) |
| **Micro-copy** | "[Name] just joined! Special launch rate for first 5 clients." |

### Ending Design

| Moment | Implementation |
|--------|----------------|
| **Trigger** | Post-booking thank you page |
| **Message** | "You're all set! We'll send you a reminder 1 hour before your consultation." |
| **Tone** | Reassuring and professional |

---

## 9. Accessibility Requirements

| Requirement | Standard |
|-------------|----------|
| Contrast Ratio | WCAG AA minimum (4.5:1 for text) |
| Focal Points | AAA contrast (7:1) - critical for CTAs |
| Interactive Elements | Minimum 44px touch target |
| Focus States | Visible 2px blue focus ring (#2563EB) |
| Motion | Respect `prefers-reduced-motion` |
| Color Independence | Availability not indicated by color alone (use status text) |

---

## 10. Implementation Checklist

- [ ] Blue-gray color palette applied
- [ ] Inter font family loaded and used
- [ ] Single focal point per screen (CTA or key expert)
- [ ] F-Pattern applied to expert listings and content pages
- [ ] Z-Pattern applied to landing page
- [ ] Moderate whitespace density maintained
- [ ] Motion used sparingly (only for interactions)
- [ ] Peak moment designed for booking confirmation
- [ ] Design tokens implemented in CSS
- [ ] AAA contrast for focal CTAs
- [ ] Accessible status indicators (not color-only)

---

*Based on: [neurodesign-uiux-guide.md](../_templates/neurodesign-uiux-guide.md)*

*Last Updated: 2026-03-03*
*Document Version: 1.0*
