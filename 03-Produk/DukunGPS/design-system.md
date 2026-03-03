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

## 11. Behavioral Design Techniques

> Ethical Design Note: Location/Utility products should lean toward **Sticky** design karena fokus pada safety dan convenience, bukan engagement for engagement's sake. The techniques below prioritize genuine utility over manufactured engagement.

### 11.1 Anticipation Loop

**Definition:** Building positive tension through expected, delayed rewards during loading/waiting states.

**DukunGPS Implementation:**

| Use Case | Technique | Example |
|----------|-----------|---------|
| Location update loading | Progress indicator with context | "Updating location... Finding best GPS signal" |
| Tracking activation | Step-by-step activation feedback | "Enabling GPS → Connecting satellite → Tracking active" |
| Route calculation | Progressive route drawing | Route appears segment-by-segment from start point |
| Geofence setup | Animated boundary creation | Geofence circle expands from center with pulse |

**Anti-Patterns:**
- ❌ Generic spinning loaders without context
- ❌ Unexplained delays during location updates
- ❌ Missing progress indication for long operations

**Key Principle:** Make waiting moments feel like preparation, not punishment.

---

### 11.2 Invisible Personalization

**Definition:** Predictive UX that adapts to user behavior without requiring explicit configuration.

**DukunGPS Implementation:**

| Feature | Personalization Logic | User Value |
|---------|----------------------|------------|
| Frequent location suggestions | Auto-suggest top 3 visited locations | Quick check-in without manual entry |
| Geofence recommendations | Suggest geofences for frequently visited places | Automatic safety zones setup |
| Map view zoom level | Remember preferred zoom per location type | Familiar map context on revisit |
| Tracking interval | Adjust based on battery + usage pattern | Balance accuracy vs battery life |
| Route preference | Learn fastest vs shortest preference | Personalized routing suggestions |

**Anti-Patterns:**
- ❌ Creepy personalization ("We noticed you're at...")
- ❌ Over-assumption (auto-tracking without permission)
- ❌ Irrelevant suggestions based on sparse data

**Key Principle:** Personalization should feel like "the app just gets me," not "the app is watching me."

---

### 11.3 Streak + Loss Aversion

**Status:** NOT APPLICABLE for DukunGPS

**Rationale:** DukunGPS is a utility/safety product, not a habit-formation or engagement-driven app. Introducing streaks would:
- Create artificial urgency for a safety tool
- Encourage unnecessary tracking "to maintain streak"
- Undermine trust in the product's safety purpose

**Alternative Approach:** Focus on reliability and peace of mind rather than gamification.

---

### 11.4 Emotional Character

**Status:** NOT APPLICABLE for DukunGPS

**Rationale:** GPS tracking requires precision, trust, and clarity. A playful emotional character would:
- Undermine the serious nature of safety/location tracking
- Distract from critical real-time information
- Reduce perceived professionalism and reliability

**Alternative Approach:** Use consistent, clear iconography and micro-copy that feels reliable and precise, not playful.

---

### 11.5 Variable Reward Notification

**Definition:** Unpredictable but valuable notifications that create positive anticipation without dependency.

**DukunGPS Implementation:**

| Notification Type | Trigger Pattern | Value Proposition |
|-------------------|-----------------|-------------------|
| Family member arrived | Geofence entry (time-variable) | Peace of mind, safety confirmation |
| Geofence alert | Boundary crossing | Safety awareness, anomaly detection |
| Battery low warning | Device battery threshold | Proactive device management |
| Signal recovered | Signal restoration notification | Relief, connectivity restored |
| Place reminder | "You usually visit here on [day]" | Contextual relevance |

**Anti-Patterns:**
- ❌ Notifications for notification's sake
- ❌ Alerts for trivial location changes
- ❌ Variable rewards that create FOMO (missing out)

**Key Principle:** Notifications should deliver genuine safety or convenience value, not dopamine hits.

---

### 11.6 Social Proof Counter

**Definition:** Showing aggregated user activity to validate trust and encourage adoption.

**DukunGPS Implementation:**

| Context | Display | Example Copy |
|---------|---------|--------------|
| Onboarding | Active families tracking | "12,458 families tracking safely" |
| Feature reveal | Safe arrivals today | "8,934 safe arrivals confirmed today" |
| Geofence setup | Active geofences | "234,567 geofences protecting loved ones" |
| Premium feature | Families on family plan | "5,678 families using Family Plan" |

**Anti-Patterns:**
- ❌ Fake or inflated numbers
- ❌ Social proof that creates pressure ("Your neighbors are tracking more")
- ❌ Comparison metrics (e.g., "You're in the bottom 10% of trackers")

**Key Principle:** Social proof should convey "this works and is trusted," not "you're missing out."

---

### 11.7 Annual Wrapped

**Definition:** Yearly summary that transforms usage data into meaningful, shareable insights.

**DukunGPS Implementation:**

| Section | Content | Visual |
|---------|---------|--------|
| Overview | Total distance tracked, total time | Animated map showing all routes |
| Top Places | Most visited locations | Photo cards with visit count |
| Safety Summary | Geofence alerts responded, safe arrivals | Calendar heatmap of activity |
| Family Highlights | Shared tracking moments (with consent) | Collage of memorable locations |
| Personal Records | Farthest distance, longest trip | Achievement badges |
| Prediction | "Based on 2026, you'll visit [X] in 2027" | Playful forecast card |

**Shareability:** Optimized for Instagram Stories format (1080x1920)

**Privacy Note:** All shared data opt-in, family members' data blurred unless explicit permission.

---

### 11.8 Personalization Surprise

**Definition:** Delightful moments where the app reveals learned preferences back to the user.

**DukunGPS Implementation:**

| Surprise | Trigger Condition | Example |
|----------|-------------------|---------|
| Pattern recognition | 3+ visits to same place, same time | "You usually visit Gym on Fridays. Want to set a reminder?" |
| Route shortcut | App finds faster route than usual | "Found a shortcut! Save 5 minutes on your commute." |
| Seasonal insight | Year-over-year comparison | "You're visiting Grandma 20% more this year. ❤️" |
| Battery optimization | Battery lasts longer than expected | "Great news! Your battery lasted 2h longer today." |
| Recovery celebration | Signal recovered after lost period | "You're back online! 3 locations updated." |

**Anti-Patterns:**
- ❌ Surprises that feel intrusive ("We know where you sleep")
- ❌ Over-familiarity from sparse data
- ❌ Surprises that interrupt critical tasks (active tracking)

**Key Principle:** Surprises should feel like a thoughtful assistant, not an overfamiliar friend.

---

### 11.9 Flash Sale Countdown

**Definition:** Limited-time offer urgency leverages loss aversion for conversion.

**DukunGPS Implementation:**

| Context | Offer | Countdown | Ethical Consideration |
|---------|-------|-----------|----------------------|
| Premium trial | "7-day free trial of Family Plan" | Real-time countdown to trial end | Genuine value, not artificial scarcity |
| Feature unlock | "Try Advanced Geofencing for 3 days" | Hour-by-hour countdown | Feature sampling, not pressure |
| Annual discount | "20% off annual plan - ends tonight" | Midnight deadline | Real deadline, not recurring "last chance" |

**Anti-Patterns:**
- ❌ Fake urgency ("Only 2 spots left!")
- ❌ Ever-recurring "last chance" offers
- ❌ Countdown that interrupts safety features (e.g., blocking tracking during countdown)

**Key Principle:** Urgency should offer genuine value, not manipulate anxiety.

---

### 11.10 Social Commerce

**Definition:** Leveraging social networks for growth through shared value.

**DukunGPS Implementation:**

| Feature | Mechanism | Incentive |
|---------|-----------|-----------|
| Family Plan referral | Invite family members to join | Shared discount, easier setup |
| Safety network | Trusted contacts can check your location | Peace of mind, emergency access |
| Location sharing | Share live location via link | Temporary sharing for meetups |
| Community safety | Anonymous aggregate data (e.g., road safety) | Public good, privacy-respecting |

**Privacy Safeguards:**
- All social sharing requires explicit, revocable consent
- Family members can opt out anytime
- Shared links expire automatically (default 1 hour)
- No public location sharing by default

**Anti-Patterns:**
- ❌ Auto-sharing to social media
- ❌ Pressure to invite for full functionality
- ❌ Public leaderboards or comparison features

---

### 11.11 Gentle Nudge

**Definition:** Timely, non-intrusive prompts that improve safety or convenience.

**DukunGPS Implementation:**

| Nudge Type | Trigger | Message | Action |
|------------|---------|---------|--------|
| Safety check-in | No movement for 2h during active trip | "Still safe? Tap to confirm." | Single-tap confirmation |
| Battery low | Device battery < 20% during tracking | "Battery low. Save session?" | Save/Continue choice |
| Signal weak | GPS signal degradation | "GPS signal weak. Moving to open area helps." | Dismissible tip |
| Geofence setup | Frequent location visited 3x+ | "Set up a geofence for [Place]?" | Quick setup flow |
| Tracking reminder | Tracking not started at usual commute time | "Start tracking your trip?" | Start/Dismiss |

**Principles:**
- Nudges are dismissible, not blocking
- Nudges are relevant to current context
- Nudges offer clear action or dismissal
- No nagging (max 1 nudge per context per session)

**Anti-Patterns:**
- ❌ Repeated notifications for the same context
- ❌ Nudges that can't be dismissed
- ❌ Fear-based messaging ("Your family is worried!")

---

### Behavioral Design Summary

| Technique | Applicability | Priority | Notes |
|-----------|---------------|----------|-------|
| Anticipation Loop | High | High | Use for all loading states |
| Invisible Personalization | High | High | Core to convenience value |
| Streak + Loss Aversion | Low | N/A | Not suitable for utility product |
| Emotional Character | Low | N/A | Not suitable for precision product |
| Variable Reward Notification | Medium | Medium | Focus on safety value, not dopamine |
| Social Proof Counter | Medium | Low | Onboarding only, avoid pressure |
| Annual Wrapped | Medium | Medium | Yearly engagement driver |
| Personalization Surprise | High | Medium | Delight moments, prioritize relevance |
| Flash Sale Countdown | Low | Low | Genuine offers only, respect utility |
| Social Commerce | Medium | Medium | Family features, privacy-first |
| Gentle Nudge | High | High | Safety-focused, non-intrusive |

**Core Ethical Principles:**

1. **Safety First:** Behavioral techniques never compromise safety features
2. **No Dark Patterns:** Avoid manufactured anxiety or false urgency
3. **Privacy Respecting:** Social features require explicit consent
4. **Utility Over Engagement:** Design for retention through value, not addiction
5. **Transparent Communication:** Clear about what the app does and why

---

## 12. Neurodesign Philosophy

> **Pendekatan Akordium:** Neurodesign sebagai layer di atas UX tradisional

### UX Tradisional vs Neurodesign

| Dimensi | UX Tradisional | Neurodesign |
|---------|----------------|-------------|
| Pertanyaan | "Bisakah user melakukan X?" | "Apa yang otak rasakan saat X?" |
| Layer otak | System 2 (sadar, deliberate) | System 1 (otomatis, emosional) |
| Fokus | Task completion | Emotion & memory formation |

### Masalah "Say-Do Gap"

```
User berkata: "Saya suka desain minimal"
Otak melakukan: Klik tombol paling colorful & high-contrast
```

95% keputusan terjadi di subconscious — jauh sebelum user bisa mengartikulasikannya.

### Kapan Gunakan Yang Mana

| Fase | UX Tradisional | Neurodesign |
|------|----------------|-------------|
| Wireframing | Information architecture | Visual hierarchy |
| Prototype | Usability testing | 5-second test |
| Post-Launch | Analytics funnel | Heatmap analysis |

### Referensi Lengkap

Lihat: [neurodesign-vs-ux-traditional.md](../_templates/neurodesign-vs-ux-traditional.md)

---

## 13. fMRI Research Insights

> **Evidence-based design:** Temuan neuroscience untuk optimasi UI

### Brain Response to UI (200ms Rule)

Dalam 200ms pertama, OFC (Orbitofrontal Cortex) user sudah membuat penilaian tentang desain. First impression bukan pepatah — ini hardwired di otak.

### Key Research Findings

| Finding | Implication | Application |
|---------|-------------|-------------|
| OFC aktif untuk high-reward stimulus | Tampilkan value secara visual | Hero section harus convey value instantly |
| Color > No Color untuk engagement | Tambahkan aksen warna strategis | Bahkan developer tools perlu color accent |
| DMN activation = personal resonance | Konten harus berbicara tentang user | Gunakan "you" language, personal relevance |

### Research-Based Checklist

- [ ] Above-fold harmonis dalam 200ms?
- [ ] Visual consistency 100%?
- [ ] Color accent pada elemen kritis?
- [ ] Personal resonance di hero copy?

### Referensi Lengkap

Lihat: [neurodesign-fmri-case-studies.md](../_templates/neurodesign-fmri-case-studies.md)

---

*Based on: [neurodesign-uiux-guide.md](../_templates/neurodesign-uiux-guide.md)*

*Last Updated: 2026-03-03*
*Document Version: 1.1*

*Last Updated: 2026-03-03*
*Document Version: 1.0*
