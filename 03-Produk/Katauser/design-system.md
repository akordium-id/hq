# Katauser Design System

> Neurodesign-based visual hierarchy untuk Platform Collection Feedback Product

**Category:** SaaS

**Related:** [neurodesign-uiux-guide.md](../_templates/neurodesign-uiux-guide.md)

---

## 1. Visual Identity

### Color Palette

| Role | Color | Hex | Neuroscience Rationale |
|------|-------|-----|------------------------|
| Primary | Royal Blue | `#2563EB` | Biru melambangkan trust dan communication - essensial untuk feedback collection yang transparent |
| Secondary | Navy Blue | `#1E3A5F` | Memberikan depth dan seriousness, conveying bahwa feedback penting dan di-value |
| Accent | Sky Blue | `#0EA5E9` | Highlight untuk pending feedback dan interactive elements |
| Background | White | `#FFFFFF` | Clean dan focused, memungkinkan feedback content menjadi spotlight |
| Surface | Light Gray | `#F9FAFB` | Subtle differentiation untuk feedback cards dan sections |
| Text Primary | Dark Navy | `#0F172A` | Maximum kontras untuk readability di white background |
| Text Secondary | Slate Gray | `#475569` | Mendukung tanpa mengganggu visual hierarchy |

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

**Typography Rationale:** Inter dipilih karena excellent readability dan versatility. Font ini modern, clean, dan highly legible untuk berbagai panjang teks - dari short feedback snippets sampai detailed customer testimonials. Inter memiliki neutral personality yang memungkinkan feedback content menjadi star, bukan typography-nya.

---

## 2. Visual Hierarchy (5-Layer)

### Layer Definitions

| Layer | Use Case | Size | Weight | Contrast |
|-------|----------|------|--------|----------|
| **1. Focal Point** | Pending feedback count (large number) | 48px | Bold | 7:1 (AAA) |
| **2. Primary** | Action buttons (Respond, Archive) | 30px | Medium | 4.5:1 (AA) |
| **3. Secondary** | Feedback content, customer names | 18px | Regular | 4.5:1 (AA) |
| **4. Supporting** | Timestamps, tags, source info | 14px | Light | 3:1 |
| **5. UI Chrome** | Navigation, filters, borders | 12px | Regular | 3:1 |

### Focal Point Strategy

**Single Focal Element per Screen:** Pending feedback count dengan visual prominence - ini creates urgency dan guides user ke immediate action yang perlu di-take.

```
Example:
┌─────────────────────────────────────┐
│                                     │
│      12 PENDING FEEDBACK            │  ← Layer 1: Single focal metric
│      Awaiting your response         │
│                                     │
│  ┌─────────┐  ┌─────────┐          │  ← Layer 2: Primary actions
│  │ Respond │  │ Archive │          │
│  └─────────┘  └─────────┘          │
│                                     │
│  Recent feedback from:              │  ← Layer 3: Feedback list
│  • Sarah from Product Hunt          │
│  • Mike from Twitter                │
└─────────────────────────────────────┘
```

### Anti-Patterns to Avoid

- ❌ **Christmas Tree Effect:** Semua feedback items di-highlight sama = tidak ada urgency
- ❌ **Flat Hierarchy:** Semua text sama size = user bingung feedback mana yang urgent
- ❌ **Hidden CTA:** Tombol "Respond" tersembunyi di antara elemen lain

---

## 3. Eye Tracking Pattern

### Primary Pattern: F-Pattern

**Rationale:** Dashboard feedback didominasi oleh list-based content (feedback items, customer messages) dan metrics yang perlu di-scan secara sistematis. F-Pattern optimal untuk interface di mana user perlu process multiple feedback items dan take action secara efficient.

### Pattern Application

#### F-Pattern - Feedback Dashboard

```
┌──────────────────────────────────────┐
│ ████████████████████████████████████ │  ← Horizontal scan 1 (Pending count)
│ ████████████████████████             │  ← Horizontal scan 2 (Quick filters)
│ █                                    │
│ █ Feedback 1: Feature request        │  ← Vertical scan left (Sender names)
│ █ Feedback 2: Bug report             │
│ █ Feedback 3: Testimonial            │
│ █ Feedback 4: Support question       │
└──────────────────────────────────────┘
```

#### Z-Pattern - Landing Page

```
┌──────────────────────────────────────┐
│ KATAUSER         →→→    START FREE   │  ← Zone 1: Brand + CTA
│                    ↘                 │
│         COLLECT FEEDBACK             │
│         EVERYWHERE                   │
│                   ↙                  │
│ INTEGRATIONS    →→→    GET STARTED   │  ← Zone 4: Conversion
└──────────────────────────────────────┘
```

### Key Rules

- **Pending feedback count** = top horizontal scan (most critical metric)
- **Respond button** = left side of feedback item (primary action)
- **Timestamps** = right side (supporting info, not competing)
- **Never hide** unread indicators or urgent tags

---

## 4. Motion Guidelines

### When to Use Motion

| Use Case | Animation Type | Duration |
|----------|---------------|----------|
| New feedback arrives | Subtle slide-in from top | 300ms |
| Feedback sent success | Green checkmark + "Sent!" | 300ms |
| Empty feedback list | Placeholder illustration fade-in | 400ms |
| Button hover | Scale 1.02 + subtle glow | 150ms |
| Filter change | List reorder with stagger | 250ms per item |

### When NOT to Use Motion

- ❌ Background decorative animations
- ❌ Continuous motion during feedback review
- ❌ Auto-playing testimonials carousel
- ❌ Anything that obscures pending feedback visibility

### Easing Presets

```css
--ease-out: cubic-bezier(0, 0, 0.2, 1);     /* Elements appearing */
--ease-in: cubic-bezier(0.4, 0, 1, 1);      /* Elements disappearing */
--ease-in-out: cubic-bezier(0.4, 0, 0.2, 1); /* Moving elements */
```

---

## 5. Whitespace Strategy

### Density Level: Moderate

**Rationale:** Feedback dashboard perlu balance antara clarity (untuk memahami customer sentiments dengan proper) dan efficiency (banyak feedback yang perlu di-process). Moderate whitespace memungkinkan user scan feedback items dan identify patterns tanpa visual clutter.

| Whitespace Type | Value | Application |
|-----------------|-------|-------------|
| **Macro** (section gaps) | 48-64px | Between dashboard sections |
| **Card padding** | 20px | Inside feedback cards |
| **Form group gaps** | 16px | Between response composer fields |
| **List item gaps** | 12px | Between feedback items |
| **Micro** (tight) | 4-8px | Related inline elements (tag + count) |

### Density by Screen Type

| Screen Type | Density | Why |
|-------------|---------|-----|
| Dashboard overview | Moderate | Balance of metrics & feedback list |
| Feedback detail | Generous | Focus on single feedback content |
| Integration settings | Moderate | Clear options without wasted space |

---

## 6. Design Tokens

```css
/* ===========================================
   KATAUSER DESIGN TOKENS
   Based on Akordium Neurodesign System
   =========================================== */

/* --- COLOR TOKENS --- */
--color-primary: #2563EB;
--color-primary-hover: #1D4ED8;
--color-primary-light: #3B82F6;
--color-secondary: #1E3A5F;
--color-accent: #0EA5E9;

--color-background: #FFFFFF;
--color-surface: #F9FAFB;
--color-surface-elevated: #FFFFFF;

--color-text-primary: #0F172A;
--color-text-secondary: #475569;
--color-text-muted: #94A3B8;

/* Semantic Colors (Consistent Across All Products) */
--color-success: #16A34A;
--color-warning: #D97706;
--color-error: #DC2626;
--color-info: #2563EB;

/* Feedback Status Specific */
--feedback-status-pending: #F59E0B;
--feedback-status-responded: #16A34A;
--feedback-status-archived: #6B7280;
--feedback-status-urgent: #DC2626;

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
--card-padding: 20px;
--section-gap: 48px;
--form-group-gap: 16px;
--list-item-gap: 12px;

/* --- VISUAL WEIGHT (5-LAYER HIERARCHY) --- */
--focal-size: 48px;       /* Layer 1: Pending count - ONE per screen */
--primary-size: 30px;     /* Layer 2: Action buttons (2-3 elements) */
--secondary-size: 18px;   /* Layer 3: Feedback content (4-6 elements) */
--supporting-size: 14px;  /* Layer 4: Metadata, timestamps */
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
| **Focal Point** | Pending feedback count (large, top-center) |
| **Eye Pattern** | F-Pattern (metrics → feedback list) |
| **Primary Actions** | "Respond Now" (inline with item), "Mark All Read" (bulk) |
| **Key Metrics** | Total collected, response rate, sentiment score |

### Feedback Inbox

| Element | Specification |
|---------|---------------|
| **Focal Point** | Filter bar (All/Unanswered/Starred) |
| **Pattern** | F-Pattern (scan sender names vertically) |
| **CTAs** | "Respond" (left-side), "Archive" (row action) |

### Feedback Detail

| Element | Specification |
|---------|---------------|
| **Focal Point** | Feedback message (quoted, prominent) |
| **Pattern** | F-Pattern (feedback → context → response) |
| **CTAs** | "Send Response" (bottom-right, primary), "Close" (secondary) |

### Integration Settings

| Element | Specification |
|---------|---------------|
| **Focal Point** | Connected integrations (with status indicators) |
| **Pattern** | F-Pattern (integration list vertically) |
| **CTAs** | "Add Integration" (top-right), "Configure" (card-level) |

---

## 8. Peak Moment Design

Based on Peak-End Rule: Users remember the **peak moment** and the **ending**, not the average.

### Peak Moment: Feedback Milestone Reached

| Moment | Implementation |
|--------|----------------|
| **Trigger** | Feedback count reaches milestone (100, 500, 1000) |
| **Visual** | Full-screen celebration with animated counter + "Milestone Reached!" |
| **Duration** | 600ms animation, dismissible |
| **Micro-copy** | "You've collected 1,000 feedback! Your customers love being heard. 🎉" |

### Peak Moment: Response Sent Successfully

| Moment | Implementation |
|--------|----------------|
| **Trigger** | Response form submitted successfully |
| **Visual** | Green checkmark scales up from center + "Response Sent!" |
| **Duration** | 400ms animation, then subtle success badge |
| **Micro-copy** | "Response sent! [Customer Name] will be notified via email." |

### Peak Moment: First Integration Connected

| Moment | Implementation |
|--------|----------------|
| **Trigger** | First integration successfully connected |
| **Visual** | Integration logo animates in + "Connected!" with confetti |
| **Duration** | 500ms celebration |
| **Micro-copy** | "[Integration Name] connected! Feedback will start flowing in now." |

### Ending Design

| Moment | Implementation |
|--------|----------------|
| **Trigger** | Logout / session end |
| **Message** | "Goodbye! Your feedback inbox is waiting when you return." |
| **Tone** | Reassuring - reminder of ongoing value |

---

## 9. Accessibility Requirements

| Requirement | Standard |
|-------------|----------|
| Contrast Ratio | WCAG AA minimum (4.5:1 for text) |
| Focal Points | AAA contrast (7:1) - critical for pending count |
| Interactive Elements | Minimum 44px touch target |
| Focus States | Visible 2px blue focus ring (#2563EB) |
| Motion | Respect `prefers-reduced-motion` |
| Color Independence | Feedback status not indicated by color alone (use icons + text) |

---

## 10. Implementation Checklist

- [ ] Blue-navy color palette applied
- [ ] Inter font family loaded and used
- [ ] Single focal point per screen (pending count or key action)
- [ ] F-Pattern applied to dashboard and feedback lists
- [ ] Z-Pattern applied to landing page
- [ ] Moderate whitespace density maintained
- [ ] Motion used sparingly (only for interactions)
- [ ] Peak moment designed for feedback milestone
- [ ] Design tokens implemented in CSS
- [ ] AAA contrast for focal metrics
- [ ] Accessible status indicators (not color-only)

---

*Based on: [neurodesign-uiux-guide.md](../_templates/neurodesign-uiux-guide.md)*

*Last Updated: 2026-03-03*
*Document Version: 1.0*
