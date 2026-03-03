# CaptionMania Design System

> Neurodesign-based visual hierarchy untuk Generator Caption Media Sosial

**Category:** Marketing

**Related:** [neurodesign-uiux-guide.md](../_templates/neurodesign-uiux-guide.md)

---

## 1. Visual Identity

### Color Palette

| Role | Color | Hex | Neuroscience Rationale |
|------|-------|-----|------------------------|
| Primary | Red-Orange Gradient | `#FF4D4D → #FF8C00` | Gradient yang energetic dan urgent. Red-orange memicu excitement dan action - perfect untuk tool yang membantu user create content quickly. |
| Secondary | White | `#FFFFFF` | Clean canvas yang lets the generated caption menjadi focal point. White = clarity dan efficiency. |
| Accent | Bright Yellow | `#FFC107` | Yellow untuk highlights dan CTAs - memicu attention dan optimism. Color yang "clickable". |
| Background | Light Gray | `#F3F4F6` | Subtle background yang tidak competing dengan generated content |
| Text Primary | Dark Gray | `#1F2937` | High contrast text yang easy to read |
| Text Secondary | Medium Gray | `#6B7280` | Supporting text yang tidak mengganggu hierarchy |

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
| Display/Hero | Poppins or Plus Jakarta Sans | 48px | Bold (700) |
| H1 | Poppins or Plus Jakarta Sans | 38px | Semibold (600) |
| H2 | Inter | 30px | Semibold (600) |
| H3 | Inter | 24px | Medium (500) |
| Body Large | Inter | 18px | Regular (400) |
| Body | Inter | 16px | Regular (400) |
| Caption/Meta | Inter | 12px | Regular (400) |

**Typography Rationale:** Poppins atau Plus Jakarta Sans untuk hero/headings memberikan friendly, approachable feel yang encourages quick action. Inter untuk body text memastikan generated captions are easily readable. Kombinasi ini balances energy dengan clarity - perfect untuk marketing tool.

---

## 2. Visual Hierarchy (5-Layer)

### Layer Definitions

| Layer | Use Case | Size | Weight | Contrast |
|-------|----------|------|--------|----------|
| **1. Focal Point** | Generated caption output | 32px | Semibold (600) | 7:1 (AAA) |
| **2. Primary** | "Generate" CTA button | 24px | Semibold (600) | 4.5:1 (AA) |
| **3. Secondary** | Input fields, platform selector | 16px | Regular (400) | 4.5:1 (AA) |
| **4. Supporting** | Hashtag suggestions, tone options | 14px | Regular (400) | 3:1 |
| **5. UI Chrome** | Navigation, copy button icons | 12px | Regular (400) | 3:1 |

### Focal Point Strategy

**Single Focal Element per Screen:** Generated caption output yang prominently displayed. Ini adalah core value - user is here untuk get captions, jadi the result should be the star.

```
Example:
┌─────────────────────────────────────┐
│                                     │
│  [GENERATED CAPTION HERE]           │  ← Layer 1: Focal Point
│  (Large, readable, prominent)       │
│                                     │
│  ┌─────────┐  ┌─────────┐          │  ← Layer 2: Primary Actions
│  │  Copy   │  │ Regenerate│        │
│  └─────────┘  └─────────┘          │
│                                     │
│  Tone: Casual | Platform: Instagram │  ← Layer 3: Input controls
│                                     │
└─────────────────────────────────────┘
```

### Anti-Patterns to Avoid

- ❌ **Christmas Tree Effect:** Semua buttons highlighted = tidak ada clear CTA
- ❌ **Flat Hierarchy:** Generated caption sama size dengan placeholder text = user bingung mana hasil
- ❌ **Hidden Copy Button:** Copy button kecil atau sulit ditemukan = friction dalam workflow

---

## 3. Eye Tracking Pattern

### Primary Pattern: Z-Pattern

**Rationale:** CaptionMania sebagai action-oriented tool membutuhkan Z-Pattern untuk optimal flow. Input (top-left) → Generated output (center) → Action buttons (bottom-right). Pattern ini guides user dari task initiation ke completion.

### Pattern Application

#### Z-Pattern - Main Generator Interface

```
┌──────────────────────────────────────┐
│ CaptionMania     →→→   History       │  ← Zone 1: Logo + History
│                    ↘                 │
│         [GENERATED CAPTION]          │
│         Your perfect caption here     │
│                   ↙                  │
│ COPY          →→→    REGENERATE      │  ← Zone 4: Action
└──────────────────────────────────────┘
```

### Key Rules

- **Generated caption** = center stage (diagonal intersection)
- **Primary CTAs** (Copy, Regenerate) = bottom-right
- **Input controls** = top atau left side (entry point)
- **Never hide** hasil generated di bawah fold

---

## 4. Motion Guidelines

### When to Use Motion

| Use Case | Animation Type | Duration |
|----------|---------------|----------|
| Loading states | Progress bar atau spinner | Continuous |
| Caption generation | Text typing effect atau fade in | 400ms |
| Copy confirmation | Checkmark flash pada copy button | 200ms |
| Button hover | Subtle scale atau brightness increase | 150ms |
| Platform switch | Smooth slide transition | 250ms |
| Tone selection | Active state indicator slide | 200ms |

### When NOT to Use Motion

- ❌ Background decorative animations (distracting dari generated content)
- ❌ Auto-playing caption carousel tanpa pause
- ❌ Excessive motion pada generation process (feels slow)
- ❌ Anything yang delays user dari getting their caption

### Easing Presets

```css
--ease-out: cubic-bezier(0, 0, 0.2, 1);     /* Elements appearing */
--ease-in: cubic-bezier(0.4, 0, 1, 1);      /* Elements disappearing */
--ease-in-out: cubic-bezier(0.4, 0, 0.2, 1); /* Moving elements */
```

---

## 5. Whitespace Strategy

### Density Level: Minimal

**Rationale:** Minimal whitespace menciptakan sense of urgency dan efficiency. User wants captions quickly - tight spacing communicates "this tool is fast and action-oriented." Density = energy dan momentum.

| Whitespace Type | Value | Application |
|-----------------|-------|-------------|
| **Macro** (section gaps) | 32-48px | Between major page sections (smaller untuk action feel) |
| **Card padding** | 16px | Inside generated caption card |
| **Form group gaps** | 12px | Between input fields |
| **List item gaps** | 8px | Between tone/style options |
| **Micro** (tight) | 4px | Related inline elements |

### Density by Product Category

| Category | Density | Why |
|----------|---------|-----|
| Trust-based (Islamic, Finance) | Generous | Whitespace = trust & premium |
| **Marketing (CaptionMania)** | **Minimal** | **Density = energy, urgency, efficiency** |
| Standard | Moderate | Balance of clarity & efficiency |

---

## 6. Design Tokens

```css
/* ===========================================
   CAPTIONMANIA DESIGN TOKENS
   Based on Akordium Neurodesign System
   =========================================== */

/* --- COLOR TOKENS --- */
--color-primary: #FF4D4D;
--color-primary-hover: #FF8C00;
--color-primary-gradient-start: #FF4D4D;
--color-primary-gradient-end: #FF8C00;
--color-secondary: #FFFFFF;
--color-accent: #FFC107;

--color-background: #F3F4F6;
--color-surface: #FFFFFF;
--color-surface-elevated: #FFFFFF;

--color-text-primary: #1F2937;
--color-text-secondary: #6B7280;
--color-text-muted: #9CA3AF;

/* Semantic Colors (Consistent Across All Products) */
--color-success: #16A34A;
--color-warning: #D97706;
--color-error: #DC2626;
--color-info: #2563EB;

/* --- TYPOGRAPHY TOKENS --- */
--font-display: 'Poppins', 'Plus Jakarta Sans', system-ui, sans-serif;
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
--space-md: 12px;
--space-lg: 16px;
--space-xl: 24px;
--space-2xl: 32px;
--space-3xl: 48px;

/* Component Spacing */
--card-padding: 16px;
--section-gap: 48px;
--form-group-gap: 12px;
--list-item-gap: 8px;

/* --- VISUAL WEIGHT (5-LAYER HIERARCHY) --- */
--focal-size: 32px;       /* Layer 1: Generated caption */
--primary-size: 24px;     /* Layer 2: CTA buttons */
--secondary-size: 16px;   /* Layer 3: Input fields */
--supporting-size: 14px;  /* Layer 4: Hashtags, options */
--chrome-size: 12px;      /* Layer 5: UI Chrome */

/* --- CONTRAST RATIOS (WCAG) --- */
--contrast-focal: 7:1;      /* AAA - Generated caption */
--contrast-primary: 4.5:1;  /* AA - Buttons, inputs */
--contrast-secondary: 3:1;  /* Minimum - UI components */

/* --- MOTION TOKENS --- */
--duration-fast: 150ms;
--duration-normal: 250ms;
--duration-slow: 350ms;
--duration-generation: 400ms; /* Special: Caption generation */

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
--shadow-lg: 0 10px 15px rgba(255, 77, 77, 0.15);
--shadow-xl: 0 20px 25px rgba(255, 77, 77, 0.2);
```

---

## 7. Per-Screen Specifications

### Main Generator Interface

| Element | Specification |
|---------|---------------|
| **Focal Point** | Generated caption output (large text area, center stage) |
| **Eye Pattern** | Z-Pattern (Input → Output → Action) |
| **Primary Actions** | "Copy Caption" (prominent, gradient background), "Regenerate" (secondary) |
| **Key Metrics** | Character count, hashtag count, platform compatibility indicator |

### History/Saved Captions

| Element | Specification |
|---------|---------------|
| **Focal Point** | Most recent saved caption atau selected caption |
| **Pattern** | F-Pattern (List di left, preview di right) |
| **CTAs** | "Copy" (on each card), "Delete" (icon only, subtle) |

### Settings/Preferences

| Element | Specification |
|---------|---------------|
| **Focal Point** | Default tone/platform selection |
| **Pattern** | F-Pattern (Settings categories di left, controls di right) |
| **CTAs** | "Save Settings" (prominent, bottom), "Reset to Default" (subtle) |

---

## 8. Peak Moment Design

Based on Peak-End Rule: Users remember the **peak moment** and the **ending**, not the average.

### Peak Moment: Caption Generated Successfully

| Moment | Implementation |
|--------|----------------|
| **Trigger** | Caption generation completes |
| **Visual** | Generated caption fades in dengan subtle scale up (1.0 → 1.02). "Copy" button pulses briefly. Success icon (checkmark) flashes pada corner. |
| **Duration** | 400ms total (300ms fade in, 100ms button pulse) |
| **Micro-copy** | "Perfect! Caption ready to copy. Character count: [X]/[limit]" |

### Secondary Peak: Caption Copied

| Moment | Implementation |
|--------|----------------|
| **Trigger** | User clicks "Copy" button |
| **Visual** | Button text changes to "Copied!" dengan checkmark icon. Button background turns green briefly (200ms), then returns to normal. |
| **Duration** | 200ms button animation, 1s text change |
| **Micro-copy** | "Copied to clipboard!" (brief toast notification) |

### Ending Design

| Moment | Implementation |
|--------|----------------|
| **Trigger** | User closes tab atau leaves site |
| **Message** | (No explicit message - tool is quick and stateless) |
| **Tone** | Efficient. User got what they needed, quickly. |

---

## 9. Accessibility Requirements

| Requirement | Standard |
|-------------|----------|
| Contrast Ratio | WCAG AA minimum (4.5:1 for text) |
| Focal Points | AAA contrast (7:1) untuk generated caption |
| Interactive Elements | Minimum 44px touch target |
| Focus States | Visible red-orange focus ring (2px) |
| Motion | Respect `prefers-reduced-motion` |
| Color Independence | Platform icons tidak hanya warna, tapi juga label/shape |

---

## 10. Implementation Checklist

- [ ] Red-orange gradient untuk energetic feel
- [ ] Poppins/Plus Jakarta Sans font untuk friendly headings
- [ ] Inter font untuk optimal caption readability
- [ ] Single focal point (generated caption) per screen
- [ ] Z-Pattern untuk generation flow
- [ ] Minimal whitespace untuk action-oriented density
- [ ] "Copy" button sebagai primary CTA (always prominent)
- [ ] Subtle success feedback (not distracting)
- [ ] Character count indicator (visible but not prominent)
- [ ] Design tokens implemented in CSS
- [ ] Accessibility requirements met

---

*Based on: [neurodesign-uiux-guide.md](../_templates/neurodesign-uiux-guide.md)*

*Last Updated: 2026-03-03*
*Document Version: 1.0*
