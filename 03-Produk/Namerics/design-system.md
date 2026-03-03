# Namerics Design System

> Neurodesign-based visual hierarchy untuk Brand Identity Naming Agency

**Category:** Creative

**Related:** [neurodesign-uiux-guide.md](../_templates/neurodesign-uiux-guide.md)

---

## 1. Visual Identity

### Color Palette

| Role | Color | Hex | Neuroscience Rationale |
|------|-------|-----|------------------------|
| Primary | Purple | `#7C3AED` | Ungu melambangkan kreativitas, imagination, dan artistic expression. Perfect untuk creative agency yang membranding businesses. |
| Secondary | Black | `#000000` | Memberikan kesan premium, professional, dan sophisticated. Menciptakan strong contrast yang memorable. |
| Accent | Electric Violet | `#8B5CF6` | Lighter purple untuk highlights dan subtle gradients - adds depth tanpa mengganggu hierarchy. |
| Background | White | `#FFFFFF` | Clean canvas yang lets the creative work shine. White space = clarity dan professionalism. |
| Text Primary | Black | `#000000` | Maximum readability dan strong visual impact. |
| Text Secondary | Dark Gray | `#374151` | Supporting text yang maintains readability tanpa competing dengan primary. |

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
| Display/Hero | Space Grotesk or Clash Display | 48px | Bold (700) |
| H1 | Space Grotesk or Clash Display | 38px | Semibold (600) |
| H2 | Inter | 30px | Semibold (600) |
| H3 | Inter | 24px | Medium (500) |
| Body Large | Inter | 18px | Regular (400) |
| Body | Inter | 16px | Regular (400) |
| Caption/Meta | Inter | 12px | Regular (400) |

**Typography Rationale:** Space Grotesk atau Clash Display untuk hero/headings memberikan expressive, contemporary feel yang mencerminkan creativity. Inter untuk body text memastikan readability optimal. Kombinasi ini balances artistic expression dengan professional clarity - perfect untuk creative agency.

---

## 2. Visual Hierarchy (5-Layer)

### Layer Definitions

| Layer | Use Case | Size | Weight | Contrast |
|-------|----------|------|--------|----------|
| **1. Focal Point** | Agency logo / brand name showcase | 48px | Bold | 7:1 (AAA) |
| **2. Primary** | Portfolio highlights, service CTAs | 30px | Medium | 4.5:1 (AA) |
| **3. Secondary** | Case study descriptions, testimonials | 18px | Regular | 4.5:1 (AA) |
| **4. Supporting** | Service tags, client logos | 14px | Light | 3:1 |
| **5. UI Chrome** | Navigation, borders | 12px | Regular | 3:1 |

### Focal Point Strategy

**Single Focal Element per Screen:** Namerics logo/brand name yang prominently displayed. Ini adalah core identity - creative agency harus brandable dan memorable.

```
Example:
┌─────────────────────────────────────┐
│                                     │
│      [NAMERICS LOGO]                │  ← Layer 1: Focal Point
│      Creative Naming Agency         │
│                                     │
│  ┌─────────┐  ┌─────────┐          │  ← Layer 2: Primary CTAs
│  │Portfolio│  │Services │          │
│  └─────────┘  └─────────┘          │
│                                     │
│  Crafting memorable brand names     │  ← Layer 3: Value proposition
│  for ambitious businesses           │
│                                     │
└─────────────────────────────────────┘
```

### Anti-Patterns to Avoid

- ❌ **Christmas Tree Effect:** Semua portfolio items highlighted = tidak ada standout work
- ❌ **Flat Hierarchy:** Semua elements sama size = visitor bingung apa yang ditawarkan
- ❌ **Hidden Contact:** CTA untuk consultation kecil dan sulit ditemukan = missed opportunities

---

## 3. Eye Tracking Pattern

### Primary Pattern: Z-Pattern

**Rationale:** Namerics sebagai agency landing page membutuhkan Z-Pattern untuk optimal conversion. Logo (top-left) → Hero value proposition (diagonal) → CTA (bottom-right). Pattern ini guides visitor dari awareness ke consideration ke action.

### Pattern Application

#### Z-Pattern - Landing Page

```
┌──────────────────────────────────────┐
│ NAMERICS          →→→   GET STARTED  │  ← Zone 1: Logo + CTA
│                    ↘                 │
│         WE CRAFT MEMORABLE           │
│         BRAND NAMES THAT STICK       │
│                   ↙                  │
│ VIEW PORTFOLIO   →→→  BOOK CALL      │  ← Zone 4: Conversion
└──────────────────────────────────────┘
```

### Key Rules

- **Logo/Brand name** = top-left corner (prime real estate)
- **Value proposition headline** = center (diagonal intersection)
- **Primary CTA** = bottom-right (endpoint of Z)
- **Never hide** contact form atau booking button

---

## 4. Motion Guidelines

### When to Use Motion

| Use Case | Animation Type | Duration |
|----------|---------------|----------|
| Loading states | Simple spinner atau logo pulse | Continuous |
| Hover effects | Subtle scale atau color shift | 150ms |
| Portfolio reveal | Fade in dengan slight slide up | 400ms |
| CTA interaction | Subtle glow atau shadow expansion | 200ms |
| Page transitions | Smooth fade | 250ms |
| Form submission | Success checkmark animation | 300ms |

### When NOT to Use Motion

- ❌ Background decorative animations (distracting dari portfolio work)
- ❌ Auto-playing portfolio carousel tanpa pause
- ❌ Excessive motion pada hero section (cheapens premium feel)
- ❌ Anything yang mengganggu readability dari case studies

### Easing Presets

```css
--ease-out: cubic-bezier(0, 0, 0.2, 1);     /* Elements appearing */
--ease-in: cubic-bezier(0.4, 0, 1, 1);      /* Elements disappearing */
--ease-in-out: cubic-bezier(0.4, 0, 0.2, 1); /* Moving elements */
```

---

## 5. Whitespace Strategy

### Density Level: Moderate

**Rationale:** Moderate whitespace menciptakan balance antara clarity dan visual interest. Creative agency needs enough whitespace untuk let the work breathe, tapi juga needs density untuk show capability dan range. Premium feel comes from confident use of space.

| Whitespace Type | Value | Application |
|-----------------|-------|-------------|
| **Macro** (section gaps) | 64-96px | Between major page sections |
| **Card padding** | 24px | Inside portfolio/service cards |
| **Form group gaps** | 16px | Between form fields |
| **List item gaps** | 12px | Between service items |
| **Micro** (tight) | 4-8px | Related inline elements |

### Density by Product Category

| Category | Density | Why |
|----------|---------|-----|
| Trust-based (Islamic, Finance) | Generous | Whitespace = trust & premium |
| Commerce/Action (POS, Marketing) | Minimal | Density = energy & urgency |
| **Creative (Namerics)** | **Moderate** | **Balance of clarity & visual richness** |
| Standard | Moderate | Balance of clarity & efficiency |

---

## 6. Design Tokens

```css
/* ===========================================
   NAMERICS DESIGN TOKENS
   Based on Akordium Neurodesign System
   =========================================== */

/* --- COLOR TOKENS --- */
--color-primary: #7C3AED;
--color-primary-hover: #6D28D9;
--color-primary-light: #A78BFA;
--color-secondary: #000000;
--color-accent: #8B5CF6;

--color-background: #FFFFFF;
--color-surface: #F9FAFB;
--color-surface-elevated: #FFFFFF;

--color-text-primary: #000000;
--color-text-secondary: #374151;
--color-text-muted: #6B7280;

/* Semantic Colors (Consistent Across All Products) */
--color-success: ##16A34A;
--color-warning: #D97706;
--color-error: #DC2626;
--color-info: #2563EB;

/* --- TYPOGRAPHY TOKENS --- */
--font-display: 'Space Grotesk', 'Clash Display', system-ui, sans-serif;
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
--card-padding: 24px;
--section-gap: 64px;
--form-group-gap: 16px;
--list-item-gap: 12px;

/* --- VISUAL WEIGHT (5-LAYER HIERARCHY) --- */
--focal-size: 48px;       /* Layer 1: Logo/Brand name */
--primary-size: 30px;     /* Layer 2: Portfolio highlights */
--secondary-size: 18px;   /* Layer 3: Case studies, testimonials */
--supporting-size: 14px;  /* Layer 4: Service tags, client logos */
--chrome-size: 12px;      /* Layer 5: UI Chrome */

/* --- CONTRAST RATIOS (WCAG) --- */
--contrast-focal: 7:1;      /* AAA - Logo/Brand name */
--contrast-primary: 4.5:1;  /* AA - Portfolio, services */
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
--shadow-lg: 0 10px 15px rgba(124, 58, 237, 0.1);
--shadow-xl: 0 20px 25px rgba(124, 58, 237, 0.15);
```

---

## 7. Per-Screen Specifications

### Landing Page (Home)

| Element | Specification |
|---------|---------------|
| **Focal Point** | Namerics logo + tagline (center, hero section) |
| **Eye Pattern** | Z-Pattern (Logo → Value Prop → CTA) |
| **Primary Actions** | "Book a Call" (prominent, bottom-right), "View Portfolio" (secondary) |
| **Key Metrics** | Featured client logos, number of brands named |

### Portfolio Page

| Element | Specification |
|---------|---------------|
| **Focal Point** | Featured/highlighted project dengan largest card |
| **Pattern** | F-Pattern (Project grid dengan featured di top-left) |
| **CTAs** | "View Case Study" (pada setiap project card), "Filter by Industry" (top) |

### Services Page

| Element | Specification |
|---------|---------------|
| **Focal Point** | Most popular service package dengan highlighted border |
| **Pattern** | Z-Pattern (Service intro → Packages → Contact CTA) |
| **CTAs** | "Get Started" (prominent pada setiap package), "Learn More" (subtle) |

### Contact/Booking Page

| Element | Specification |
|---------|---------------|
| **Focal Point** | "Book Your Free Consultation" headline |
| **Pattern** | F-Pattern (Form fields di left, contact info di right) |
| **CTAs** | "Submit Booking Request" (prominent, bottom), "Contact Directly" (secondary) |

---

## 8. Peak Moment Design

Based on Peak-End Rule: Users remember the **peak moment** and the **ending**, not the average.

### Peak Moment: Booking Confirmation

| Moment | Implementation |
|--------|----------------|
| **Trigger** | Contact/booking form submitted successfully |
| **Visual** | Full-screen success message dengan subtle purple gradient background. Checkmark animation (draw in effect). "We'll be in touch within 24 hours" message. |
| **Duration** | 400ms (fade in) |
| **Micro-copy** | "Thanks for reaching out! We're excited to help craft your brand's perfect name. Expect a call from our team soon." |

### Secondary Peak: Portfolio Case Study View

| Moment | Implementation |
|--------|----------------|
| **Trigger** | User clicks "View Case Study" |
| **Visual** | Smooth modal/page transition. Project hero image fades in dengan subtle scale. Before/After naming comparison reveals dengan slide animation. |
| **Duration** | 300ms |
| **Micro-copy** | "How we named [Company Name] - from concept to memorable brand" |

### Ending Design

| Moment | Implementation |
|--------|----------------|
| **Trigger** | User leaves site atau closes modal |
| **Message** | (No explicit message needed - let the work speak for itself) |
| **Tone** | Confident, professional. The portfolio IS the ending. |

---

## 9. Accessibility Requirements

| Requirement | Standard |
|-------------|----------|
| Contrast Ratio | WCAG AA minimum (4.5:1 for text) |
| Focal Points | AAA contrast (7:1) untuk logo/brand name |
| Interactive Elements | Minimum 44px touch target |
| Focus States | Visible purple focus ring (2px) |
| Motion | Respect `prefers-reduced-motion` |
| Color Independence | Portfolio categories tidak hanya ditandai dengan warna, tapi juga icon/label |

---

## 10. Implementation Checklist

- [ ] Purple primary + black secondary untuk premium creative feel
- [ ] Space Grotesk/Clash Display font untuk expressive headings
- [ ] Inter font untuk optimal body readability
- [ ] Single focal point (logo/brand name) per screen
- [ ] Z-Pattern untuk landing page conversion flow
- [ ] Moderate whitespace untuk balance of clarity dan richness
- [ ] Portfolio cards dengan clear hierarchy (featured > standard)
- [ ] Subtle, professional animations (nothing cheesy)
- [ ] Strong CTA hierarchy (Book Call > View Portfolio)
- [ ] Design tokens implemented in CSS
- [ ] Accessibility requirements met

---

*Based on: [neurodesign-uiux-guide.md](../_templates/neurodesign-uiux-guide.md)*

*Last Updated: 2026-03-03*
*Document Version: 1.0*
