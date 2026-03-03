# [Product Name] Design System

> Neurodesign-based visual hierarchy untuk [Product Tagline]

**Category:** [Finance | Commerce | Islamic | Wedding | Creative/Gamification | Marketing | Developer Tools | Celebration | Heritage | Tech/Precision | EdTech | SaaS | Internal | E-commerce Legacy]

**Related:** [neurodesign-uiux-guide.md](../_templates/neurodesign-uiux-guide.md)

---

## 1. Visual Identity

### Color Palette

| Role | Color | Hex | Neuroscience Rationale |
|------|-------|-----|------------------------|
| Primary | [Color Name] | `#XXXXXX` | [Why this color works for this product category] |
| Secondary | [Color Name] | `#XXXXXX` | [Supporting role] |
| Accent | [Color Name] | `#XXXXXX` | [Highlight/emphasis] |
| Background | [Color Name] | `#XXXXXX` | [Base tone] |
| Text Primary | [Color Name] | `#XXXXXX` | [Readability] |
| Text Secondary | [Color Name] | `#XXXXXX` | [Supporting text] |

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
| Display/Hero | [Font Name] | 48px | Bold (700) |
| H1 | [Font Name] | 38px | Semibold (600) |
| H2 | [Font Name] | 30px | Semibold (600) |
| H3 | [Font Name] | 24px | Medium (500) |
| Body Large | [Font Name] | 18px | Regular (400) |
| Body | [Font Name] | 16px | Regular (400) |
| Caption/Meta | [Font Name] | 12px | Regular (400) |

**Typography Rationale:** [Why this font pairing suits the product]

---

## 2. Visual Hierarchy (5-Layer)

### Layer Definitions

| Layer | Use Case | Size | Weight | Contrast |
|-------|----------|------|--------|----------|
| **1. Focal Point** | [Product-specific focal element] | 48px | Bold | 7:1 (AAA) |
| **2. Primary** | [Key metrics/actions] | 30px | Medium | 4.5:1 (AA) |
| **3. Secondary** | [Supporting data] | 18px | Regular | 4.5:1 (AA) |
| **4. Supporting** | [Meta info, timestamps] | 14px | Light | 3:1 |
| **5. UI Chrome** | [Navigation, borders] | 12px | Regular | 3:1 |

### Focal Point Strategy

**Single Focal Element per Screen:** [Specific element that commands attention]

```
Example:
┌─────────────────────────────────────┐
│                                     │
│         [FOCAL POINT]               │  ← Layer 1: Single most important element
│         [Key Metric/Action]         │
│                                     │
│  ┌─────────┐  ┌─────────┐          │  ← Layer 2: Primary supporting info
│  │ Primary │  │ Primary │          │
│  └─────────┘  └─────────┘          │
│                                     │
│  Secondary info here                │  ← Layer 3: Secondary info
│                                     │
└─────────────────────────────────────┘
```

### Anti-Patterns to Avoid

- ❌ **Christmas Tree Effect:** All elements bold/highlighted = no focal point
- ❌ **Flat Hierarchy:** All elements same size = brain confused where to start
- ❌ **Hidden CTA:** Primary action visually buried among other elements

---

## 3. Eye Tracking Pattern

### Primary Pattern: [Z-Pattern | F-Pattern]

**Rationale:** [Why this pattern suits this product's use case]

### Pattern Application

#### [Z-Pattern] - For Landing/Marketing Pages

```
┌──────────────────────────────────────┐
│ LOGO          →→→     NAV/CTA        │  ← Zone 1: First impression
│                    ↘                 │
│         HEADLINE/HERO VALUE          │
│                   ↙                  │
│ VALUE PROP    →→→    CTA BUTTON      │  ← Zone 4: Conversion
└──────────────────────────────────────┘
```

#### [F-Pattern] - For Dashboard/Content Pages

```
┌──────────────────────────────────────┐
│ ████████████████████████████████████ │  ← Horizontal scan 1 (full)
│ ████████████████████                 │  ← Horizontal scan 2 (shorter)
│ █                                    │
│ █                                    │  ← Vertical scan left
│ █                                    │
└──────────────────────────────────────┘
```

### Key Rules

- **Most important metric** = top horizontal scan
- **Most important action** = left side (not right)
- **Never hide critical info** in bottom-right corner

---

## 4. Motion Guidelines

### When to Use Motion

| Use Case | Animation Type | Duration |
|----------|---------------|----------|
| Loading states | Skeleton shimmer | Continuous |
| Success feedback | Micro-confetti | 300ms max |
| Error indication | Shake/pulse | 200ms |
| Page transitions | Fade/slide | 250ms |
| Button hover | Scale/glow | 150ms |

### When NOT to Use Motion

- ❌ Background decorative animations
- ❌ Auto-playing carousels without pause
- ❌ Continuous motion during reading
- ❌ Anything that distracts from the focal point

### Easing Presets

```css
--ease-out: cubic-bezier(0, 0, 0.2, 1);     /* Elements appearing */
--ease-in: cubic-bezier(0.4, 0, 1, 1);      /* Elements disappearing */
--ease-in-out: cubic-bezier(0.4, 0, 0.2, 1); /* Moving elements */
```

---

## 5. Whitespace Strategy

### Density Level: [Generous | Moderate | Minimal]

**Rationale:** [Why this density suits the product]

| Whitespace Type | Value | Application |
|-----------------|-------|-------------|
| **Macro** (section gaps) | [64-96px] | Between major page sections |
| **Card padding** | [24px] | Inside card components |
| **Form group gaps** | [16px] | Between form fields |
| **List item gaps** | [12px] | Between list items |
| **Micro** (tight) | [4-8px] | Related inline elements |

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
   [PRODUCT NAME] DESIGN TOKENS
   Based on Akordium Neurodesign System
   =========================================== */

/* --- COLOR TOKENS --- */
--color-primary: #XXXXXX;
--color-primary-hover: #XXXXXX;
--color-primary-light: #XXXXXX;
--color-secondary: #XXXXXX;
--color-accent: #XXXXXX;

--color-background: #XXXXXX;
--color-surface: #XXXXXX;
--color-surface-elevated: #XXXXXX;

--color-text-primary: #XXXXXX;
--color-text-secondary: #XXXXXX;
--color-text-muted: #XXXXXX;

/* Semantic Colors (Consistent Across All Products) */
--color-success: #16A34A;
--color-warning: #D97706;
--color-error: #DC2626;
--color-info: #2563EB;

/* --- TYPOGRAPHY TOKENS --- */
--font-display: '[Font Name]', system-ui, sans-serif;
--font-body: '[Font Name]', system-ui, sans-serif;

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
--shadow-sm: 0 1px 2px rgba(0, 0, 0, 0.05);
--shadow-md: 0 4px 6px rgba(0, 0, 0, 0.1);
--shadow-lg: 0 10px 15px rgba(0, 0, 0, 0.1);
--shadow-xl: 0 20px 25px rgba(0, 0, 0, 0.15);
```

---

## 7. Per-Screen Specifications

### Dashboard/Home

| Element | Specification |
|---------|---------------|
| **Focal Point** | [Specific element, e.g., "Total Saldo" for finance] |
| **Eye Pattern** | [F-Pattern / Z-Pattern] |
| **Primary Actions** | [Location and style of main CTAs] |
| **Key Metrics** | [What data appears in Layer 2] |

### [Key Screen 2 - Product Specific]

| Element | Specification |
|---------|---------------|
| **Focal Point** | [Element] |
| **Pattern** | [Pattern] |
| **CTAs** | [Placement] |

### [Key Screen 3 - Product Specific]

| Element | Specification |
|---------|---------------|
| **Focal Point** | [Element] |
| **Pattern** | [Pattern] |
| **CTAs** | [Placement] |

---

## 8. Peak Moment Design

Based on Peak-End Rule: Users remember the **peak moment** and the **ending**, not the average.

### Peak Moment: [Product-Specific Peak]

| Moment | Implementation |
|--------|----------------|
| **Trigger** | [What action leads to peak] |
| **Visual** | [Full-screen celebration / dramatic reveal] |
| **Duration** | [300-500ms animation] |
| **Micro-copy** | [Celebratory message] |

### Ending Design

| Moment | Implementation |
|--------|----------------|
| **Trigger** | [Task completion / logout] |
| **Message** | [Personalized "thank you" / "see you"] |
| **Tone** | [Warm / professional / playful] |

---

## 9. Accessibility Requirements

| Requirement | Standard |
|-------------|----------|
| Contrast Ratio | WCAG AA minimum (4.5:1 for text) |
| Focal Points | AAA contrast (7:1) |
| Interactive Elements | Minimum 44px touch target |
| Focus States | Visible focus ring |
| Motion | Respect `prefers-reduced-motion` |

---

## 10. Implementation Checklist

- [ ] Colors match category palette
- [ ] Single focal point per screen
- [ ] Eye tracking pattern applied
- [ ] Whitespace density appropriate
- [ ] Motion used sparingly
- [ ] Peak moment designed
- [ ] Design tokens implemented in CSS
- [ ] Accessibility requirements met

---

*Based on: [neurodesign-uiux-guide.md](../_templates/neurodesign-uiux-guide.md)*

*Last Updated: 2026-03-03*
*Document Version: 1.0*
