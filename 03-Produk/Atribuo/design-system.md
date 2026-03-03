# Atribuo Design System

> Neurodesign-based visual hierarchy untuk Visualisasi Skill RPG Kehidupan Nyata

**Category:** Creative/Gamification

**Related:** [neurodesign-uiux-guide.md](../_templates/neurodesign-uiux-guide.md)

---

## 1. Visual Identity

### Color Palette

| Role | Color | Hex | Neuroscience Rationale |
|------|-------|-----|------------------------|
| Primary | Purple | `#7C3AED` | Ungu melambangkan kreativitas, magic, dan gaming. Memicu asosiasi dengan fantasy RPG, membangkitkan rasa wonder dan imagination. |
| Secondary | Black | `#000000` | Memberikan kontras dramatis dan kesan premium. Menciptakan visual impact yang kuat seperti game dark mode. |
| Accent XP | Bright Cyan | `#00D4FF` | Cyan terang untuk XP dan progress - melambangkan energy, technology, dan achievement yang glowing. |
| Accent Gold | Gold | `#FFD700` | Emas untuk achievements dan milestones - memicu dopamin dan reward anticipation. |
| Background | Dark Purple | `#1E1B4B` | Base tone yang maintains immersion dalam game aesthetic tanpa terlalu gelap. |
| Text Primary | White | `#FFFFFF` | Maximum readability pada dark background, menciptakan contrast yang tinggi. |
| Text Secondary | Light Gray | `#9CA3AF` | Supporting text yang tidak mengganggu focal point. |

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
| Display/Hero | Orbitron or Exo 2 | 48px | Bold (700) |
| H1 | Orbitron or Exo 2 | 38px | Semibold (600) |
| H2 | Inter | 30px | Semibold (600) |
| H3 | Inter | 24px | Medium (500) |
| Body Large | Inter | 18px | Regular (400) |
| Body | Inter | 16px | Regular (400) |
| Caption/Meta | Inter | 12px | Regular (400) |

**Typography Rationale:** Orbitron atau Exo 2 untuk heading memberikan futuristic/gaming aesthetic yang bold dan distinctive. Inter untuk body text memastikan readability tetap optimal. Kombinasi ini menciptakan RPG character sheet feel tanpa mengorbankan legibility.

---

## 2. Visual Hierarchy (5-Layer)

### Layer Definitions

| Layer | Use Case | Size | Weight | Contrast |
|-------|----------|------|--------|----------|
| **1. Focal Point** | Character avatar + level badge | 48px | Bold | 7:1 (AAA) |
| **2. Primary** | Skill points, XP bar, stat blocks | 30px | Medium | 4.5:1 (AA) |
| **3. Secondary** | Skill descriptions, quest details | 18px | Regular | 4.5:1 (AA) |
| **4. Supporting** | Skill categories, timestamps | 14px | Light | 3:1 |
| **5. UI Chrome** | Navigation, borders, dividers | 12px | Regular | 3:1 |

### Focal Point Strategy

**Single Focal Element per Screen:** Character avatar dengan level badge yang prominently displayed. Ini adalah heart dari Atribuo - representasi visual dari user's journey dalam game kehidupan.

```
Example:
┌─────────────────────────────────────┐
│                                     │
│      [AVATAR + LEVEL BADGE]         │  ← Layer 1: Focal Point
│         Level 12 Warrior            │
│                                     │
│  ┌─────────┐  ┌─────────┐          │  ← Layer 2: Primary Stats
│  │  XP     │  │  Skill  │          │
│  │  2450   │  │  Points │          │
│  └─────────┘  └─────────┘          │
│                                     │
│  Active Skills: 5/10                │  ← Layer 3: Secondary info
│  Completed Quests: 23                │
│                                     │
└─────────────────────────────────────┘
```

### Anti-Patterns to Avoid

- ❌ **Christmas Tree Effect:** Semua skills glowing/highlighted = tidak ada progress indication yang jelas
- ❌ **Flat Hierarchy:** Semua elements sama size = user bingung mana yang perlu fokus
- ❌ **Hidden Achievement:** Level up notification kecil dan mudah terlewat = missing dopamine hit

---

## 3. Eye Tracking Pattern

### Primary Pattern: F-Pattern

**Rationale:** Atribuo's character sheet dan skill tree structure mengikuti natural reading pattern. User scans avatar dulu (top-left), lalu stats (horizontal atas), lalu skill list (vertical down). F-Pattern optimal untuk dense information display seperti RPG character sheet.

### Pattern Application

#### F-Pattern - Character Sheet / Skill Tree

```
┌──────────────────────────────────────┐
│ ████████████████████████████████████ │  ← Horizontal scan 1 (Avatar + Level)
│ ████████████████                     │  ← Horizontal scan 2 (XP + Skill Points)
│ █                                    │
│ █ Skill 1                            │  ← Vertical scan left (Skill list)
│ █ Skill 2                            │
│ █ Skill 3                            │
└──────────────────────────────────────┘
```

### Key Rules

- **Character avatar** = top-left corner (prime real estate)
- **Current level + next level requirements** = first horizontal scan
- **Most important skill/quest** = left side, not right
- **Never hide** level-up button atau skill unlock di bottom-right corner

---

## 4. Motion Guidelines

### When to Use Motion

| Use Case | Animation Type | Duration |
|----------|---------------|----------|
| Loading states | Progress bar dengan skill icon | Continuous |
| XP gain | Number counting up + glow effect | 500ms |
| Skill unlock | Card flip atau reveal animation | 400ms |
| Level up | Full-screen celebration dengan particles | 800ms |
| Achievement unlock | Badge shine + confetti burst | 600ms |
| Quest completion | Checkmark animation + progress update | 300ms |

### When NOT to Use Motion

- ❌ Background decorative particles (distracting dari character sheet)
- ❌ Auto-playing skill showcases tanpa pause
- ❌ Continuous motion saat user viewing skill tree
- ❌ Anything yang mengganggu focal point (avatar + level)

### Easing Presets

```css
--ease-out: cubic-bezier(0, 0, 0.2, 1);     /* Elements appearing */
--ease-in: cubic-bezier(0.4, 0, 1, 1);      /* Elements disappearing */
--ease-in-out: cubic-bezier(0.4, 0, 0.2, 1); /* Moving elements */
--ease-bounce: cubic-bezier(0.68, -0.55, 0.265, 1.55); /* Level up bounce */
```

---

## 5. Whitespace Strategy

### Density Level: Minimal

**Rationale:** Minimal whitespace menciptakan energetic, game-like density yang cocok untuk RPG experience. Dense layout feels lebih "feature-rich" seperti game interface. Tapi tetap maintain readability melalui strong visual hierarchy.

| Whitespace Type | Value | Application |
|-----------------|-------|-------------|
| **Macro** (section gaps) | 32-48px | Between major page sections (smaller untuk game density) |
| **Card padding** | 16px | Inside skill/quest card components |
| **Form group gaps** | 12px | Between form fields |
| **List item gaps** | 8px | Between skill list items |
| **Micro** (tight) | 4px | Related inline elements (XP numbers, tags) |

### Density by Product Category

| Category | Density | Why |
|----------|---------|-----|
| Trust-based (Islamic, Finance) | Generous | Whitespace = trust & premium |
| Commerce/Action (POS, Marketing) | Minimal | Density = energy & urgency |
| **Gamification (Atribuo)** | **Minimal** | **Density = feature-rich game UI** |
| Standard | Moderate | Balance of clarity & efficiency |

---

## 6. Design Tokens

```css
/* ===========================================
   ATRIBUO DESIGN TOKENS
   Based on Akordium Neurodesign System
   =========================================== */

/* --- COLOR TOKENS --- */
--color-primary: #7C3AED;
--color-primary-hover: #6D28D9;
--color-primary-light: #A78BFA;
--color-secondary: #000000;
--color-accent-xp: #00D4FF;
--color-accent-gold: #FFD700;

--color-background: #1E1B4B;
--color-surface: #312E81;
--color-surface-elevated: #4C1D95;

--color-text-primary: #FFFFFF;
--color-text-secondary: #9CA3AF;
--color-text-muted: #6B7280;

/* Semantic Colors (Consistent Across All Products) */
--color-success: #16A34A;
--color-warning: #D97706;
--color-error: #DC2626;
--color-info: #2563EB;

/* --- TYPOGRAPHY TOKENS --- */
--font-display: 'Orbitron', 'Exo 2', system-ui, sans-serif;
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
--focal-size: 48px;       /* Layer 1: Character Avatar + Level */
--primary-size: 30px;     /* Layer 2: XP, Skill Points */
--secondary-size: 18px;   /* Layer 3: Skill Names, Quests */
--supporting-size: 14px;  /* Layer 4: Skill Categories */
--chrome-size: 12px;      /* Layer 5: UI Chrome */

/* --- CONTRAST RATIOS (WCAG) --- */
--contrast-focal: 7:1;      /* AAA - Avatar + Level badge */
--contrast-primary: 4.5:1;  /* AA - Stats and skills */
--contrast-secondary: 3:1;  /* Minimum - UI components */

/* --- MOTION TOKENS --- */
--duration-fast: 150ms;
--duration-normal: 250ms;
--duration-slow: 350ms;
--duration-levelup: 800ms;  /* Special: Level up animation */

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
--shadow-sm: 0 1px 2px rgba(0, 0, 0, 0.3);
--shadow-md: 0 4px 6px rgba(0, 0, 0, 0.4);
--shadow-lg: 0 10px 15px rgba(124, 58, 237, 0.3);
--shadow-xl: 0 20px 25px rgba(0, 212, 255, 0.2);
--shadow-glow: 0 0 20px rgba(0, 212, 255, 0.5); /* XP glow effect */
```

---

## 7. Per-Screen Specifications

### Dashboard / Character Sheet

| Element | Specification |
|---------|---------------|
| **Focal Point** | Character avatar (circular, 80px) + Level badge (prominent, 48px) di top-left |
| **Eye Pattern** | F-Pattern (Avatar → Stats → Skill List) |
| **Primary Actions** | "Add Skill Point" button (right side, below stats) |
| **Key Metrics** | Current XP, XP to next level, Available skill points (Layer 2) |

### Skill Tree

| Element | Specification |
|---------|---------------|
| **Focal Point** | Currently selected skill card dengan highlighted border |
| **Pattern** | F-Pattern (Skill categories di left, skill details di right) |
| **CTAs** | "Unlock Skill" (prominent, bottom-right), "Skill Requirements" (subtle, above button) |

### Quest List

| Element | Specification |
|---------|---------------|
| **Focal Point** | Active quest dengan progress bar yang paling dekat completion |
| **Pattern** | F-Pattern (Quest list di left, quest details di right) |
| **CTAs** | "Complete Quest" (enabled when 100%), "Abandon Quest" (subtle, secondary) |

---

## 8. Peak Moment Design

Based on Peak-End Rule: Users remember the **peak moment** and the **ending**, not the average.

### Peak Moment: Level Up

| Moment | Implementation |
|--------|----------------|
| **Trigger** | XP bar reaches 100% |
| **Visual** | Full-screen overlay dengan character evolution animation. Avatar glows cyan/gold, particles explode outward, "LEVEL UP" text pulses dengan shake effect. New level badge animates in dengan bounce. |
| **Duration** | 800ms total (400ms build-up, 200ms celebration, 200ms fade) |
| **Micro-copy** | "Level [X] Unlocked! +[Y] Skill Points earned. Keep grinding!" |

### Secondary Peak: Skill/Quest Completion

| Moment | Implementation |
|--------|----------------|
| **Trigger** | Skill unlocked atau quest completed |
| **Visual** | Card flip animation revealing skill/quest art. Confetti burst (cyan + gold particles). Badge shine effect dari kiri ke kanan. |
| **Duration** | 600ms |
| **Micro-copy** | "[Skill Name] Mastered!" atau "Quest Complete! +[Reward]" |

### Ending Design

| Moment | Implementation |
|--------|----------------|
| **Trigger** | Session end / logout |
| **Message** | "Great progress today, [Name]! See you tomorrow for more adventures." |
| **Tone** | Encouraging, gamified, personal. Reminds user of progress made. |

---

## 9. Accessibility Requirements

| Requirement | Standard |
|-------------|----------|
| Contrast Ratio | WCAG AA minimum (4.5:1 for text) |
| Focal Points | AAA contrast (7:1) untuk avatar + level badge |
| Interactive Elements | Minimum 44px touch target (buttons, skill cards) |
| Focus States | Visible cyan glow ring (2px) pada focused elements |
| Motion | Respect `prefers-reduced-motion` untuk level up animations |
| Color Independence | Skill rarity tidak hanya ditandai dengan warna, tapi juga icon/shape |

---

## 10. Implementation Checklist

- [ ] Purple primary + black secondary untuk dark game aesthetic
- [ ] Cyan XP glow effects untuk progress indication
- [ ] Gold accent untuk achievements dan milestones
- [ ] Single focal point (avatar + level) per screen
- [ ] F-Pattern untuk character sheet dan skill tree
- [ ] Minimal whitespace untuk game-like density
- [ ] Level up full-screen animation dengan particles
- [ ] Skill unlock card flip animation
- [ ] Orbitron/Exo 2 font untuk headings (gaming feel)
- [ ] Inter font untuk body text (readability)
- [ ] Design tokens implemented in CSS
- [ ] Accessibility requirements met (contrast, touch targets, reduced motion)

---

*Based on: [neurodesign-uiux-guide.md](../_templates/neurodesign-uiux-guide.md)*

*Last Updated: 2026-03-03*
*Document Version: 1.0*
