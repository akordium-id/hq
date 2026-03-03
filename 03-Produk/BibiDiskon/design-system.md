# BibiDiskon Design System

> Neurodesign-based visual hierarchy untuk Platform Diskon Ulang Tahun

**Category:** Celebration

**Related:** [neurodesign-uiux-guide.md](../_templates/neurodesign-uiux-guide.md)

---

## 1. Visual Identity

### Color Palette

| Role | Color | Hex | Neuroscience Rationale |
|------|-------|-----|------------------------|
| Primary | Pink | `#EC4899` | Pink melambangkan celebration, joy, dan friendliness. Memicu associations dengan birthday parties, gifts, dan happy moments. Color yang "festive" dan approachable. |
| Secondary | White | `#FFFFFF` | Clean canvas yang lets festive content shine. White = freshness dan modern celebration feel. |
| Accent Confetti | Multi-color | `#FF6B6B, #4ECDC4, #FFE66D, #95E1D3` | Confetti colors untuk celebration moments - memicu dopamine dan excitement. Variety = fun dan surprise. |
| Background | Light Pink | `#FDF2F8` | Subtle pink background yang maintains festive feel tanpa overwhelming |
| Text Primary | Dark Pink | `#831843` | High contrast text yang fits theme tanpa sacrificing readability |
| Text Secondary | Medium Pink-Gray | `#9F1239` | Supporting text yang maintains color harmony |

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
| Display/Hero | Fredoka One or Nunito | 48px | Bold (700) |
| H1 | Fredoka One or Nunito | 38px | Semibold (600) |
| H2 | Nunito | 30px | Semibold (600) |
| H3 | Nunito | 24px | Medium (500) |
| Body Large | Inter | 18px | Regular (400) |
| Body | Inter | 16px | Regular (400) |
| Caption/Meta | Inter | 12px | Regular (400) |

**Typography Rationale:** Fredoka One atau Nunito untuk hero/headings memberikan playful, rounded, friendly feel yang screams "celebration!" Perfect untuk birthday context. Inter untuk body text memastikan information tetap readable. Kombinasi ini balances fun dengan functionality.

---

## 2. Visual Hierarchy (5-Layer)

### Layer Definitions

| Layer | Use Case | Size | Weight | Contrast |
|-------|----------|------|--------|----------|
| **1. Focal Point** | Birthday countdown / discount reveal | 48px | Bold (700) | 7:1 (AAA) |
| **2. Primary** | "Claim Discount" CTA | 30px | Semibold (600) | 4.5:1 (AA) |
| **3. Secondary** | Offer details, expiry dates | 18px | Regular (400) | 4.5:1 (AA) |
| **4. Supporting** | Partner logos, terms | 14px | Regular (400) | 3:1 |
| **5. UI Chrome** | Navigation, borders | 12px | Regular (400) | 3:1 |

### Focal Point Strategy

**Single Focal Element per Screen:** Birthday countdown atau discount reveal yang prominently displayed. Ini adalah core value - user is here untuk birthday rewards, jadi the reward should be the star.

```
Example:
┌─────────────────────────────────────┐
│                                     │
│      🎉 YOUR BIRTHDAY REWARD 🎉     │  ← Layer 1: Focal Point
│         50% OFF EVERYTHING!         │
│                                     │
│  ┌─────────┐  ┌─────────┐          │  ← Layer 2: Primary Actions
│  │  Claim  │  │  Share  │          │
│  └─────────┘  └─────────┘          │
│                                     │
│  Valid until: [Date]                │  ← Layer 3: Offer details
│  Partner: [Store Name]              │
│                                     │
└─────────────────────────────────────┘
```

### Anti-Patterns to Avoid

- ❌ **Christmas Tree Effect:** Semua offers highlighted = tidak ada standout deal
- ❌ **Flat Hierarchy:** Birthday reward sama size dengan regular offers = user bingung mana yang spesial
- ❌ **Hidden Claim Button:** Claim button kecil atau sulit ditemukan = missed birthday joy

---

## 3. Eye Tracking Pattern

### Primary Pattern: Z-Pattern

**Rationale:** BibiDiskon sebagai celebration-focused platform membutuhkan Z-Pattern untuk optimal excitement flow. Logo/birthday greeting (top-left) → Reward reveal (center) → Claim CTA (bottom-right). Pattern ini guides user dari anticipation ke action.

### Pattern Application

#### Z-Pattern - Birthday Reward Page

```
┌──────────────────────────────────────┐
│ 🎂 BibiDiskon     →→→   My Rewards  │  ← Zone 1: Logo + Nav
│                    ↘                 │
│         YOUR BIRTHDAY GIFT           │
│         [50% OFF] REVEAL!            │
│                   ↙                  │
│ SHARE DEAL       →→→   CLAIM NOW     │  ← Zone 4: Conversion
└──────────────────────────────────────┘
```

### Key Rules

- **Birthday reward/discount** = center stage (diagonal intersection)
- **Primary CTA** (Claim) = bottom-right
- **Birthday countdown** = top atau center (builds anticipation)
- **Never hide** birthday reward di bawah fold

---

## 4. Motion Guidelines

### When to Use Motion

| Use Case | Animation Type | Duration |
|----------|---------------|----------|
| Loading states | Confetti spinner atau cake candle flicker | Continuous |
| Birthday reward reveal | Curtain open atau gift box open animation | 600ms |
| Confetti celebration | Confetti burst dari semua sides | 800ms |
| Button hover | Bounce effect atau subtle scale | 150ms |
| Countdown tick | Subtle pulse pada changing number | 200ms |
| Claim confirmation | Full-screen celebration dengan balloons | 1000ms |

### When NOT to Use Motion

- ❌ Background continuous confetti (distracting dari offers)
- ❌ Auto-playing showcase tanpa pause
- ❌ Excessive motion pada offer browsing (feels chaotic)
- ❌ Anything yang delays user dari claiming birthday reward

### Easing Presets

```css
--ease-out: cubic-bezier(0, 0, 0.2, 1);     /* Elements appearing */
--ease-in: cubic-bezier(0.4, 0, 1, 1);      /* Elements disappearing */
--ease-in-out: cubic-bezier(0.4, 0, 0.2, 1); /* Moving elements */
--ease-bounce: cubic-bezier(0.68, -0.55, 0.265, 1.55); /* Celebration bounce */
```

---

## 5. Whitespace Strategy

### Density Level: Minimal

**Rationale:** Minimal whitespace menciptakan festive, energetic density yang cocok untuk celebration platform. Dense layout feels lebih "alive" dan "exciting" seperti party atmosphere. Tapi tetap maintain readability melalui strong visual hierarchy dan color.

| Whitespace Type | Value | Application |
|-----------------|-------|-------------|
| **Macro** (section gaps) | 32-48px | Between major page sections (smaller untuk party feel) |
| **Card padding** | 16px | Inside offer cards |
| **Form group gaps** | 12px | Between form fields |
| **List item gaps** | 8px | Between offer items |
| **Micro** (tight) | 4px | Related inline elements |

### Density by Product Category

| Category | Density | Why |
|----------|---------|-----|
| Trust-based (Islamic, Finance) | Generous | Whitespace = trust & premium |
| **Celebration (BibiDiskon)** | **Minimal** | **Density = festive energy, party atmosphere** |
| Standard | Moderate | Balance of clarity & efficiency |

---

## 6. Design Tokens

```css
/* ===========================================
   BIBIDISKON DESIGN TOKENS
   Based on Akordium Neurodesign System
   =========================================== */

/* --- COLOR TOKENS --- */
--color-primary: #EC4899;
--color-primary-hover: #DB2777;
--color-primary-light: #F472B6;
--color-secondary: #FFFFFF;
--color-accent-confetti-1: #FF6B6B; /* Red */
--color-accent-confetti-2: #4ECDC4; /* Teal */
--color-accent-confetti-3: #FFE66D; /* Yellow */
--color-accent-confetti-4: #95E1D3; /* Mint */

--color-background: #FDF2F8;
--color-surface: #FFFFFF;
--color-surface-elevated: #FFFFFF;

--color-text-primary: #831843;
--color-text-secondary: #9F1239;
--color-text-muted: #FBCFE8;

/* Semantic Colors (Consistent Across All Products) */
--color-success: #16A34A;
--color-warning: #D97706;
--color-error: #DC2626;
--color-info: #2563EB;

/* --- TYPOGRAPHY TOKENS --- */
--font-display: 'Fredoka One', 'Nunito', system-ui, sans-serif;
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
--focal-size: 48px;       /* Layer 1: Birthday reward */
--primary-size: 30px;     /* Layer 2: Claim CTA */
--secondary-size: 18px;   /* Layer 3: Offer details */
--supporting-size: 14px;  /* Layer 4: Partner logos */
--chrome-size: 12px;      /* Layer 5: UI Chrome */

/* --- CONTRAST RATIOS (WCAG) --- */
--contrast-focal: 7:1;      /* AAA - Birthday reward */
--contrast-primary: 4.5:1;  /* AA - CTAs, offers */
--contrast-secondary: 3:1;  /* Minimum - UI components */

/* --- MOTION TOKENS --- */
--duration-fast: 150ms;
--duration-normal: 250ms;
--duration-slow: 350ms;
--duration-celebration: 1000ms; /* Special: Birthday celebration */

--ease-out: cubic-bezier(0, 0, 0.2, 1);
--ease-in: cubic-bezier(0.4, 0, 1, 1);
--ease-in-out: cubic-bezier(0.4, 0, 0.2, 1);
--ease-bounce: cubic-bezier(0.68, -0.55, 0.265, 1.55);

/* --- BORDER RADIUS --- */
--radius-sm: 4px;
--radius-md: 8px;
--radius-lg: 12px;
--radius-xl: 16px;
--radius-full: 9999px;

/* --- SHADOWS --- */
--shadow-sm: 0 1px 2px rgba(0, 0, 0, 0.05);
--shadow-md: 0 4px 6px rgba(0, 0, 0, 0.1);
--shadow-lg: 0 10px 15px rgba(236, 72, 153, 0.15);
--shadow-xl: 0 20px 25px rgba(236, 72, 153, 0.2);
--shadow-confetti: 0 4px 12px rgba(255, 107, 107, 0.3); /* Festive shadow */
```

---

## 7. Per-Screen Specifications

### Home / Dashboard

| Element | Specification |
|---------|---------------|
| **Focal Point** | Birthday countdown banner (prominent, top of page) atau "Claim Your Birthday Reward" card |
| **Eye Pattern** | Z-Pattern (Countdown → Offers → Claim CTA) |
| **Primary Actions** | "Claim Birthday Reward" (prominent, gradient background), "Browse Offers" (secondary) |
| **Key Metrics** | Days until birthday, available offers count, claimed rewards count |

### Birthday Reward Page

| Element | Specification |
|---------|---------------|
| **Focal Point** | Birthday discount reveal (large percentage, prominent display) |
| **Pattern** | Z-Pattern (Greeting → Discount reveal → Claim CTA) |
| **CTAs** | "Claim Now" (prominent, bottom), "Share with Friends" (secondary) |

### All Offers Page

| Element | Specification |
|---------|---------------|
| **Focal Point** | Featured/spotlight offer dengan largest card |
| **Pattern** | F-Pattern (Filter di left, offer grid di right) |
| **CTAs** | "Get Offer" (on each card), "Filter by Category" (top) |

---

## 8. Peak Moment Design

Based on Peak-End Rule: Users remember the **peak moment** and the **ending**, not the average.

### Peak Moment: Birthday Reward Reveal

| Moment | Implementation |
|--------|----------------|
| **Trigger** | User clicks "Claim Birthday Reward" atau lands on birthday page |
| **Visual** | Full-screen overlay dengan celebration animation. Gift box opens, discount percentage bursts out, confetti explodes dari semua directions. "Happy Birthday!" text bounces in. |
| **Duration** | 1000ms total (400ms build-up, 400ms celebration, 200ms fade) |
| **Micro-copy** | "Happy Birthday! 🎉 Here's your special gift: [X]% OFF. Valid for [Y] days. Enjoy your special day!" |

### Secondary Peak: Offer Claimed Successfully

| Moment | Implementation |
|--------|----------------|
| **Trigger** | User successfully claims an offer |
| **Visual** | Confetti burst (mini version). Checkmark animation draws in. "Offer Claimed!" badge slides in dari top. |
| **Duration** | 600ms |
| **Micro-copy** | "Offer claimed! Check your email for the voucher code. Show this at [Store Name] to redeem." |

### Ending Design

| Moment | Implementation |
|--------|----------------|
| **Trigger** | User leaves site setelah claiming birthday reward |
| **Message** | "Thanks for celebrating with BibiDiskon! See you next year! 🎂" |
| **Tone** | Warm, celebratory, personal. Acknowledges the special occasion. |

---

## 9. Accessibility Requirements

| Requirement | Standard |
|-------------|----------|
| Contrast Ratio | WCAG AA minimum (4.5:1 for text) |
| Focal Points | AAA contrast (7:1) untuk birthday reward/discount |
| Interactive Elements | Minimum 44px touch target |
| Focus States | Visible pink focus ring (2px) |
| Motion | Respect `prefers-reduced-motion` untuk celebration animations |
| Color Independence | Offer categories tidak hanya ditandai dengan warna, tapi juga icon/label |
| Confetti | Option untuk disable confetti animations in settings |

---

## 10. Implementation Checklist

- [ ] Pink primary untuk festive, celebration feel
- [ ] Confetti multi-color accents untuk birthday moments
- [ ] Fredoka One/Nunito font untuk playful, friendly headings
- [ ] Inter font untuk optimal body readability
- [ ] Single focal point (birthday reward/discount) per screen
- [ ] Z-Pattern untuk reward reveal flow
- [ ] Minimal whitespace untuk party-like density
- [ ] Full-screen celebration animation untuk birthday reveal
- [ ] Confetti burst effects (respecting reduced motion)
- [ ] "Claim" button sebagai primary CTA (always prominent)
- [ ] Design tokens implemented in CSS
- [ ] Accessibility requirements met (including confetti toggle)

---

## 11. Behavioral Design Techniques

### Ethical Design Note
**Engaging Design Mode:** Celebration products can use **Engaging** design patterns karena moment bersifat sesekali (once a year) dan fokus pada joy, bukan daily addiction. Birthday context inherently limits frequency concerns.

### Product-Specific Implementation

| # | Technique | BibiDiskon Implementation | Applicability |
|---|-----------|--------------------------|---------------|
| 1 | **Anticipation Loop** | Birthday countdown timer on dashboard (showing days/hours/minutes). Discount reveal animation with gift box opening effect. Build excitement BEFORE the birthday arrives. | ✅ Highly Applicable |
| 2 | **Invisible Personalization** | Partner recommendations based on past claims. "Based on your favorite stores..." secara halus tanpa explicit "we personalized this for you" messaging. | ✅ Highly Applicable |
| 3 | **Streak + Loss Aversion** | ❌ **NOT APPLICABLE** - Birthday is once a year, tidak ada streak concept. Avoid artificial streak mechanics. | ❌ Not Applicable |
| 4 | **Emotional Character** | "Bibi" mascot - friendly character yang celebrates with user. Appears in birthday greetings, celebration moments, dan notification emails. Character yang "grew up" with user. | ✅ Highly Applicable |
| 5 | **Variable Reward Notification** | Surprise bonus discount ("You also got a free gift! 🎁"). Flash partner offer yang muncul tiba-tiba dengan limited quantity. | ✅ Applicable |
| 6 | **Social Proof Counter** | "X people claimed this offer today" pada partner offers. "Join 1,234 birthday celebrators this month!" Social validation bahwa banyak orang juga celebrating. | ✅ Applicable |
| 7 | **Annual Wrapped** | Birthday celebration summary - "Your Year in Birthday Savings!". Total savings, top claimed offers, favorite partner categories. Shareable summary card. | ✅ Highly Applicable |
| 8 | **Personalization Surprise** | "Your favorite store [Name] has a special birthday offer just for you!". Unexpected delight dari partner yang user sering claim. Feels magical dan personal. | ✅ Highly Applicable |
| 9 | **Flash Sale Countdown** | ⭐ **VERY APPLICABLE** ⭐ - Birthday offer validity countdown (e.g., "Valid for 7 days! Only 5 days left!"). Creates urgency tanpa feeling manipulative karena birthday offers memang time-limited. | ⭐ Critical |
| 10 | **Social Commerce** | "Celebrate together! Group birthday deal - invite 3 friends, everyone gets extra 10% off!". Shared birthday experience dengan friends. | ✅ Applicable |
| 11 | **Gentle Nudge** | Pre-birthday reminder (1 week before): "Your birthday is coming! Get ready to celebrate. Check out these early-bird offers!". Helpful, bukan pushy. | ✅ Highly Applicable |

### Priority Techniques for BibiDiskon

**Must-Have (Critical):**
1. Flash Sale Countdown (9) - Core mechanic untuk time-limited birthday offers
2. Anticipation Loop (1) - Birthday countdown builds excitement
3. Emotional Character (4) - "Bibi" mascot creates brand connection

**Should-Have (High Impact):**
4. Personalization Surprise (8) - Delight factor untuk user engagement
5. Annual Wrapped (7) - Retention dan shareable moment
6. Invisible Personalization (2) - Better user experience secara subtle

**Nice-to-Have (Enhancement):**
7. Variable Reward Notification (5) - Extra delight moments
8. Social Proof Counter (6) - Social validation
9. Gentle Nudge (11) - Pre-birthday preparation
10. Social Commerce (10) - Group celebration feature

**Avoid:**
- Streak + Loss Aversion (3) - Does not fit birthday-once-a-year model

---

*Based on: [neurodesign-uiux-guide.md](../_templates/neurodesign-uiux-guide.md)*

*Last Updated: 2026-03-03*
*Document Version: 1.0*
*Document Version: 1.0*
