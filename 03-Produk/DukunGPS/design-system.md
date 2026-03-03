# DukunGPS Design System

> Neurodesign-based visual hierarchy untuk Real-time GPS Tracking Platform

**Category:** Tech/Precision

**Related:** [neurodesign-uiux-guide.md](../_templates/neurodesign-uiux-guide.md)

---

## 1. Visual Identity

### Color Palette

| Role | Color | Hex | Neuroscience Rationale |
|------|-------|-----|------------------------|
| Primary | Teal | `#14B8A6` | Teal melambangkan precision, technology, dan modernity - perfect untuk GPS/tracking yang membutuhkan trust dalam accuracy |
| Secondary | White | `#FFFFFF` | Clean dan minimal, memungkinkan map UI menjadi foreground |
| Accent | Bright Teal | `#2DD4BF` | Highlight untuk real-time elements (current location, active tracking) |
| Background | Dark Slate | `#0F172A` | Dark theme reduces eye strain saat monitoring dalam jangka waktu lama |
| Surface | Slate Gray | `#1E293B` | Subtle differentiation untuk panels dan overlays di atas map |
| Text Primary | Pure White | `#FFFFFF` | Maximum kontras untuk readability di dark background |
| Text Secondary | Light Gray | `#94A3B8` | Mendukung tanpa mengganggu visual hierarchy |

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

**Typography Rationale:** Geist dipilih karena technical precision dan excellent readability di dark backgrounds. Font ini memiliki compact proportions yang ideal untuk map-overlays dan space-constrained UI elements typical di GPS/tracking applications. Geist传达 modern, tech-forward aesthetic yang sesuai dengan precision-based product.

---

## 2. Visual Hierarchy (5-Layer)

### Layer Definitions

| Layer | Use Case | Size | Weight | Contrast |
|-------|----------|------|--------|----------|
| **1. Focal Point** | Real-time speed / location coordinates | 48px | Bold | 7:1 (AAA) |
| **2. Primary** | Map view, tracking indicators | 30px | Medium | 4.5:1 (AA) |
| **3. Secondary** | Device list, trip history | 18px | Regular | 4.5:1 (AA) |
| **4. Supporting** | Timestamps, battery status | 14px | Light | 3:1 |
| **5. UI Chrome** | Navigation, map controls | 12px | Regular | 3:1 |

### Focal Point Strategy

**Single Focal Element per Screen:** Real-time speed display atau current location coordinates - ini adalah critical information yang user monitor secara continuous.

```
Example:
┌─────────────────────────────────────┐
│                                     │
│    62 KM/H                          │  ← Layer 1: Single focal metric
│    -6.2088, 106.8456               │
│                                     │
│  ┌─────────┐  ┌─────────┐          │  ← Layer 2: Map controls
│  │ Zoom In │  │ Zoom Out│          │
│  └─────────┘  └─────────┘          │
│                                     │
│  Recent locations:                  │  ← Layer 3: Location history
│  • Home - 10 min ago                │
│  • Office - 1 hour ago              │
└─────────────────────────────────────┘
```

### Anti-Patterns to Avoid

- ❌ **Christmas Tree Effect:** Semua map markers di-highlight sama = tidak ada urgency
- ❌ **Flat Hierarchy:** Semua UI elements sama size = critical information lost in visual noise
- ❌ **Hidden Speed/Location:** Critical real-time data tersembunyi di dalam menu

---

## 3. Eye Tracking Pattern

### Primary Pattern: F-Pattern

**Rationale:** GPS tracking app didominasi oleh map-centric interface dengan overlay information yang perlu di-scan secara sistematis. F-Pattern optimal untuk map-based UI di mana user perlu monitor location data secara continuous sambil tetap aware dari surrounding controls.

### Pattern Application

#### F-Pattern - Map Tracking View

```
┌──────────────────────────────────────┐
│ ████████████████████████████████████ │  ← Horizontal scan 1 (Speed/Location)
│ ████████████████████                 │  ← Horizontal scan 2 (Quick stats)
│ █                                    │
│ █ [MAP AREA]                         │  ← Vertical scan left (Device/Location list)
│ █                                    │
│ █ [MAP CONTROLS]                     │
└──────────────────────────────────────┘
```

#### Z-Pattern - Landing Page

```
┌──────────────────────────────────────┐
│ DUKUNGPS         →→→    START TRACKING│  ← Zone 1: Brand + CTA
│                    ↘                 │
│         REAL-TIME GPS                │
│         PRECISION TRACKING           │
│                   ↙                  │
│ FEATURE LIST     →→→    GET STARTED  │  ← Zone 4: Conversion
└──────────────────────────────────────┘
```

### Key Rules

- **Real-time speed/location** = top horizontal scan (never hide)
- **Map controls** = left or right edge (not center, interferes with map)
- **Active device indicator** = always visible (not hidden in menus)
- **Battery/signal status** = supporting layer, not competing with map view

---

## 4. Motion Guidelines

### When to Use Motion

| Use Case | Animation Type | Duration |
|----------|---------------|----------|
| Location marker update | Smooth position transition | 1000ms |
| Speed change | Number counter animation | 300ms |
| Tracking start | Pulse animation on marker | 500ms then continuous slow pulse |
| Route calculation | Progress bar + route draw | 400ms |
| Button hover | Scale 1.05 + glow | 150ms |

### When NOT to Use Motion

- ❌ Background decorative animations on map
- ❌ Excessive marker animations (distracts from location accuracy)
- ❌ Continuous motion during route planning
- ❌ Anything that obscures map visibility

### Easing Presets

```css
--ease-out: cubic-bezier(0, 0, 0.2, 1);     /* Elements appearing */
--ease-in: cubic-bezier(0.4, 0, 1, 1);      /* Elements disappearing */
--ease-in-out: cubic-bezier(0.4, 0, 0.2, 1); /* Moving elements */
```

---

## 5. Whitespace Strategy

### Density Level: Moderate

**Rationale:** GPS tracking app perlu balance antara clarity (untuk real-time location data) dan map coverage (maximize map area). Moderate whitespace memungkinkan critical information visible tanpa mengorbankan map real estate.

| Whitespace Type | Value | Application |
|-----------------|-------|-------------|
| **Macro** (section gaps) | 24-32px | Between map and UI panels |
| **Card padding** | 16px | Inside location/device cards |
| **Form group gaps** | 12px | Between geofence settings fields |
| **List item gaps** | 8px | Between location history items |
| **Micro** (tight) | 4px | Related inline elements (speed + unit) |

### Density by Screen Type

| Screen Type | Density | Why |
|-------------|---------|-----|
| Map tracking view | Minimal | Maximize map coverage |
| Device list | Moderate | Clear device identification |
| Settings | Moderate | Options without clutter |

---

## 6. Design Tokens

```css
/* ===========================================
   DUKUNGPS DESIGN TOKENS
   Based on Akordium Neurodesign System
   =========================================== */

/* --- COLOR TOKENS --- */
--color-primary: #14B8A6;
--color-primary-hover: #0D9488;
--color-primary-light: #2DD4BF;
--color-secondary: #FFFFFF;
--color-accent: #2DD4BF;

--color-background: #0F172A;
--color-surface: #1E293B;
--color-surface-elevated: #334155;

--color-text-primary: #FFFFFF;
--color-text-secondary: #94A3B8;
--color-text-muted: #64748B;

/* Semantic Colors (Consistent Across All Products) */
--color-success: #16A34A;
--color-warning: #D97706;
--color-error: #DC2626;
--color-info: #2563EB;

/* GPS Status Specific */
--gps-status-tracking: #16A34A;
--gps-status-paused: #F59E0B;
--gps-status-offline: #64748B;
--gps-status-signal-strong: #16A34A;
--gps-status-signal-weak: #F59E0B;
--gps-status-signal-lost: #DC2626;

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
--card-padding: 16px;
--section-gap: 24px;
--form-group-gap: 12px;
--list-item-gap: 8px;

/* --- VISUAL WEIGHT (5-LAYER HIERARCHY) --- */
--focal-size: 48px;       /* Layer 1: Speed/location - ONE per screen */
--primary-size: 30px;     /* Layer 2: Map labels (2-3 elements) */
--secondary-size: 18px;   /* Layer 3: Device names (4-6 elements) */
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
--shadow-sm: 0 1px 2px rgba(0, 0, 0, 0.3);
--shadow-md: 0 4px 6px rgba(0, 0, 0, 0.4);
--shadow-lg: 0 10px 15px rgba(0, 0, 0, 0.5);
--shadow-xl: 0 20px 25px rgba(0, 0, 0, 0.6);

/* Dark theme shadows (lighter for visibility) */
--shadow-glow-sm: 0 0 8px rgba(20, 184, 166, 0.3);
--shadow-glow-md: 0 0 16px rgba(20, 184, 166, 0.4);
```

---

## 7. Per-Screen Specifications

### Map Tracking View

| Element | Specification |
|---------|---------------|
| **Focal Point** | Real-time speed display (top-center overlay) |
| **Eye Pattern** | F-Pattern (speed → map → device list) |
| **Primary Actions** | Zoom controls (right edge), Menu (left) |
| **Key Metrics** | Current location, accuracy, signal strength |

### Device List

| Element | Specification |
|---------|---------------|
| **Focal Point** | Active device (with "Tracking" indicator) |
| **Pattern** | F-Pattern (scan device names vertically) |
| **CTAs** | "Track" (left-side), "Settings" (row action) |

### Location History

| Element | Specification |
|---------|---------------|
| **Focal Point** | Date range selector (top) |
| **Pattern** | F-Pattern (timeline list vertically) |
| **CTAs** | "Export" (top-right), "View on Map" (row action) |

### Geofence Settings

| Element | Specification |
|---------|---------------|
| **Focal Point** | Map with geofence area (editable) |
| **Pattern** | F-Pattern (map → settings fields) |
| **CTAs** | "Save Geofence" (bottom-right, primary) |

---

## 8. Peak Moment Design

Based on Peak-End Rule: Users remember the **peak moment** and the **ending**, not the average.

### Peak Moment: Destination Reached

| Moment | Implementation |
|--------|----------------|
| **Trigger** | Device enters geofenced destination area |
| **Visual** | Green ring expands from marker + "Arrived!" message |
| **Duration** | 600ms animation, then subtle "arrived" badge |
| **Micro-copy** | "You've arrived at [Destination Name]! 📍" |

### Peak Moment: Tracking Started

| Moment | Implementation |
|--------|----------------|
| **Trigger** | User initiates tracking session |
| **Visual** | Pulse animation starts on device marker + "Tracking Active" |
| **Duration** | 500ms initial, then continuous slow pulse (3s cycle) |
| **Micro-copy** | "Tracking started. Your location is being monitored." |

### Peak Moment: Speed Milestone

| Moment | Implementation |
|--------|----------------|
| **Trigger** | Speed reaches personal record or threshold |
| **Visual** | Speed display briefly scales up + color flash (teal) |
| **Duration** | 400ms celebration |
| **Micro-copy** | "New record: [Speed]! 🏆" |

### Ending Design

| Moment | Implementation |
|--------|----------------|
| **Trigger** | Tracking session ended / logout |
| **Message** | "Tracking saved. Total distance: [X] km. Time: [Y] min." |
| **Tone** | Accomplishment-focused - summarize the session value |

---

## 9. Accessibility Requirements

| Requirement | Standard |
|-------------|----------|
| Contrast Ratio | WCAG AA minimum (4.5:1 for text on dark) |
| Focal Points | AAA contrast (7:1) - critical for real-time data |
| Interactive Elements | Minimum 44px touch target |
| Focus States | Visible 2px teal focus ring (#14B8A6) |
| Motion | Respect `prefers-reduced-motion` |
| Color Independence | GPS status not indicated by color alone (use icons + text) |
| Map Alternatives | Text-based location list for screen readers |

---

## 10. Implementation Checklist

- [ ] Teal-white-dark color palette applied
- [ ] Geist font family loaded and used
- [ ] Dark theme implemented for reduced eye strain
- [ ] Single focal point per screen (speed or location)
- [ ] F-Pattern applied to map-based views
- [ ] Z-Pattern applied to landing page
- [ ] Moderate whitespace density maintained
- [ ] Motion used sparingly (only for real-time updates)
- [ ] Peak moment designed for destination arrival
- [ ] Design tokens implemented in CSS
- [ ] AAA contrast for focal real-time data
- [ ] Accessible status indicators (not color-only)
- [ ] Text alternatives for map-based information

---

*Based on: [neurodesign-uiux-guide.md](../_templates/neurodesign-uiux-guide.md)*

*Last Updated: 2026-03-03*
*Document Version: 1.0*
