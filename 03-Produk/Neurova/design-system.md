# Neurova.id Design System

> Neurodesign-based visual hierarchy untuk platform optimasi performa kognitif berbasis neurosains

**Category:** Tech/Precision

**Related:** [neurodesign-uiux-guide.md](../_templates/neurodesign-uiux-guide.md) | [neuroscience-design-guide.md](../_templates/neuroscience-design-guide.md)

---

## 1. Visual Identity

### Color Palette

| Role | Color | Hex | Neuroscience Rationale |
|------|-------|-----|------------------------|
| Primary | Teal | `#14B8A6` | Merepresentasikan presisi, teknologi modern, dan kesehatan otak. Warna teal menyeimbangkan ketenangan (biru) dengan pertumbuhan (hijau), menciptakan perasaan kontrol dan optimasi yang sempurna untuk platform cognitive performance |
| Secondary | White | `#FFFFFF` | Memberikan kesan bersih, klinis, dan ilmiah. Whitespace yang melimpah menciptakan fokus dan kesan premium — sesuai untuk produk optimasi otak |
| Accent | Deep Blue | `#0C4A6E` | Digunakan untuk metrik kognitif penting. Biru gelap meningkatkan fokus dan konsentrasi, serta diasosiasikan dengan kecerdasan dan analisis yang mendalam |
| Background | Off-White | `#FAFAF9` | Base tone yang lembut untuk mengurangi eye strain selama sesi training kognitif yang panjang |
| Text Primary | Slate Dark | `#1E293B` | Kontras tinggi untuk keterbacaan maksimal saat membaca metrik performa |
| Text Secondary | Slate Gray | `#64748B` | Untuk informasi pendukung yang tidak boleh mengganggu focal point |

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
| H3 | Inter | 24px | Medium (500) |
| Body Large | Inter | 18px | Regular (400) |
| Body | Inter | 16px | Regular (400) |
| Caption/Meta | Inter | 12px | Regular (400) |

**Typography Rationale:** Geist dan Inter dipilih karena karakternya yang teknis namun tetap modern dan clean. Geist untuk heading memberikan kesan presisi dan data-driven, sementara Inter untuk body text memastikan keterbacaan optimal selama sesi training kognitif yang panjang. Keduanya adalah sans-serif geometric yang mencerminkan nature produk ini: performance tool berbasis science.

---

## 2. Visual Hierarchy (5-Layer)

### Layer Definitions

| Layer | Use Case | Size | Weight | Contrast |
|-------|----------|------|--------|----------|
| **1. Focal Point** | Cognitive Score / Focus Time hari ini | 48px | Bold | 7:1 (AAA) |
| **2. Primary** | Metric kunci lainnya (streak, level, milestone) | 30px | Medium | 4.5:1 (AA) |
| **3. Secondary** | Data pendukung (history, charts, comparisons) | 18px | Regular | 4.5:1 (AA) |
| **4. Supporting** | Meta info, timestamps, labels | 14px | Light | 3:1 |
| **5. UI Chrome** | Navigation, borders, divider | 12px | Regular | 3:1 |

### Focal Point Strategy

**Single Focal Element per Screen:** Cognitive Score atau Focus Time hari ini — satu angka paling penting yang mewakili "otak kamu hari ini"

```
Example:
┌─────────────────────────────────────┐
│                                     │
│         COGNITIVE SCORE             │  ← Layer 1: Single most important element
│            847                      │
│       (+23 dari minggu lalu)        │
│                                     │
│  ┌─────────┐  ┌─────────┐          │  ← Layer 2: Primary supporting info
│  │ Streak  │  │ Level   │          │
│  │   7    │  │   12    │          │
│  └─────────┘  └─────────┘          │
│                                     │
│  History & trends this week         │  ← Layer 3: Secondary info
│  [Chart visualization]              │
│                                     │
└─────────────────────────────────────┘
```

### Anti-Patterns to Avoid

- ❌ **Christmas Tree Effect:** Semua metric di-highlight = tidak ada yang jadi fokus
- ❌ **Flat Hierarchy:** Semua angka ukuran sama = otak bingung mana yang penting
- ❌ **Hidden Progress:** Milestone achievement tidak menonjol = kehilangan momen celebratory

---

## 3. Eye Tracking Pattern

### Primary Pattern: F-Pattern

**Rationale:** Neurova adalah performance dashboard dengan banyak data dan metrik. F-Pattern adalah pola natural untuk scanning dashboard — user membaca horizontal atas (metric terpenting), lalu scan ke bawah di sisi kiri (navigasi dan label).

### Pattern Application

#### F-Pattern - Dashboard & Performance Pages

```
┌──────────────────────────────────────┐
│ ████████████████████████████████████ │  ← Horizontal scan 1 (full) - Cognitive Score
│ ████████████████████                 │  ← Horizontal scan 2 (shorter) - Streak & Level
│ █                                    │
│ █                                    │  ← Vertical scan left - Navigation & Labels
│ █                                    │
└──────────────────────────────────────┘
```

### Key Rules

- **Cognitive Score** = top horizontal scan (focal point)
- **Primary actions** (Start Training, Focus Timer) = left side
- **Tidak pernah menyembunyikan** critical metrics di bottom-right corner

---

## 4. Motion Guidelines

### When to Use Motion

| Use Case | Animation Type | Duration |
|----------|---------------|----------|
| Loading states | Skeleton shimmer | Continuous |
| Success feedback | Micro-confetti + pulse | 300ms max |
| Cognitive milestone achieved | Dramatic reveal + particles | 500ms |
| Score update | Count-up animation | 600ms |
| Progress completion | Ring fill + glow | 400ms |
| Button hover | Scale + subtle glow | 150ms |

### When NOT to Use Motion

- ❌ Background decorative animations (distracting dari focus)
- ❌ Auto-playing carousels tanpa pause
- ❌ Continuous motion saat cognitive training session
- ❌ Anything yang mengganggu flow state

### Easing Presets

```css
--ease-out: cubic-bezier(0, 0, 0.2, 1);     /* Elements appearing */
--ease-in: cubic-bezier(0.4, 0, 1, 1);      /* Elements disappearing */
--ease-in-out: cubic-bezier(0.4, 0, 0.2, 1); /* Moving elements */
--ease-spring: cubic-bezier(0.34, 1.56, 0.64, 1); /* Playful/rewarding */
```

### Special: Peak Moment Animations

Untuk milestone cognitive achievement (personal best, level up), gunakan animation yang lebih dramatis:

```typescript
// Peak celebration for cognitive milestones
confetti({
  particleCount: 150,
  spread: 100,
  origin: { y: 0.6 },
  colors: ['#14B8A6', '#0C4A6E', '#FFFFFF'],
  duration: 500
});
```

---

## 5. Whitespace Strategy

### Density Level: Generous

**Rationale:** Neurova adalah tentang brain optimization dan focus. Whitespace yang melimpah = premium feel, reduced cognitive load, dan enhanced concentration. User akan menghabiskan waktu lama di platform ini — jangan overload visual mereka.

| Whitespace Type | Value | Application |
|-----------------|-------|-------------|
| **Macro** (section gaps) | 64-96px | Antara major page sections (dashboard, training, journal) |
| **Card padding** | 32px | Inside card components (lebih besar dari standar) |
| **Form group gaps** | 20px | Antara form fields |
| **List item gaps** | 16px | Antara list items |
| **Micro** (tight) | 4-8px | Related inline elements |

### Special Considerations

- **Training Mode:** Saat cognitive training aktif, whitespace harus LEBIH besar lagi untuk minimize distractions
- **Focus Timer UI:** Gunakan whitespace maksimal — hanya timer dan control yang penting
- **Dashboard Performance:** Maintain generous spacing meskipun banyak data — prioritize clarity over density

---

## 6. Design Tokens

```css
/* ===========================================
   NEUROVA.ID DESIGN TOKENS
   Based on Akordium Neurodesign System
   =========================================== */

/* --- COLOR TOKENS --- */
--color-primary: #14B8A6;
--color-primary-hover: #0D9488;
--color-primary-light: #CCFBF1;
--color-secondary: #FFFFFF;
--color-accent: #0C4A6E;

--color-background: #FAFAF9;
--color-surface: #FFFFFF;
--color-surface-elevated: #F8FAFC;

--color-text-primary: #1E293B;
--color-text-secondary: #64748B;
--color-text-muted: #94A3B8;

/* Semantic Colors (Consistent Across All Products) */
--color-success: #16A34A;
--color-warning: #D97706;
--color-error: #DC2626;
--color-info: #2563EB;

/* Cognitive Performance Gradients */
--gradient-performance: linear-gradient(135deg, #14B8A6 0%, #0D9488 100%);
--gradient-focus: linear-gradient(135deg, #0C4A6E 0%, #075985 100%);
--gradient-achievement: linear-gradient(135deg, #14B8A6 0%, #0C4A6E 100%);

/* --- TYPOGRAPHY TOKENS --- */
--font-display: 'Geist', system-ui, -apple-system, sans-serif;
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
--card-padding: 32px;
--section-gap: 72px;
--form-group-gap: 20px;
--list-item-gap: 16px;

/* Training Mode Spacing (Expanded) */
--training-card-padding: 40px;
--training-section-gap: 96px;

/* --- VISUAL WEIGHT (5-LAYER HIERARCHY) --- */
--focal-size: 48px;       /* Layer 1: Cognitive Score/Focus Time */
--primary-size: 30px;     /* Layer 2: Streak, Level, Milestone */
--secondary-size: 18px;   /* Layer 3: Charts, History, Comparisons */
--supporting-size: 14px;  /* Layer 4: Timestamps, Labels */
--chrome-size: 12px;      /* Layer 5: Navigation, Borders */

/* --- CONTRAST RATIOS (WCAG) --- */
--contrast-focal: 7:1;      /* AAA - Cognitive scores */
--contrast-primary: 4.5:1;  /* AA - Body text */
--contrast-secondary: 3:1;  /* Minimum - UI components */

/* --- MOTION TOKENS --- */
--duration-instant: 100ms;
--duration-fast: 150ms;
--duration-normal: 250ms;
--duration-slow: 350ms;
--duration-celebration: 500ms;

--ease-out: cubic-bezier(0, 0, 0.2, 1);
--ease-in: cubic-bezier(0.4, 0, 1, 1);
--ease-in-out: cubic-bezier(0.4, 0, 0.2, 1);
--ease-spring: cubic-bezier(0.34, 1.56, 0.64, 1);

/* --- BORDER RADIUS --- */
--radius-sm: 6px;
--radius-md: 8px;
--radius-lg: 12px;
--radius-xl: 16px;
--radius-2xl: 24px;
--radius-full: 9999px;

/* --- SHADOWS --- */
--shadow-sm: 0 1px 2px rgba(0, 0, 0, 0.05);
--shadow-md: 0 4px 6px rgba(12, 74, 110, 0.1);
--shadow-lg: 0 10px 15px rgba(12, 74, 110, 0.1);
--shadow-xl: 0 20px 25px rgba(12, 74, 110, 0.15);
--shadow-glow: 0 0 20px rgba(20, 184, 166, 0.3);

/* --- SPECIAL: COGNITIVE SCORE DISPLAY --- */
--score-glow: 0 0 40px rgba(20, 184, 166, 0.4);
--score-ring-width: 8px;
--score-size: 200px;

/* --- SPECIAL: FOCUS TIMER --- */
--timer-display-size: 80px;
--timer-progress-width: 12px;
--timer-accent-color: #14B8A6;
```

---

## 7. Per-Screen Specifications

### Dashboard/Home (Cognitive Performance Hub)

| Element | Specification |
|---------|---------------|
| **Focal Point** | Cognitive Score hari ini (besar, centered, dengan glow effect) |
| **Eye Pattern** | F-Pattern (score di top, metrics pendukung di bawah) |
| **Primary Actions** | "Mulai Training" button (left side, teal gradient) |
| **Key Metrics** | Streak hari ini, Level saat ini, Focus time hari ini (Layer 2) |

### Focus Timer (Ultradian Rhythm Timer)

| Element | Specification |
|---------|---------------|
| **Focal Point** | Timer countdown (80px, centered, minimal UI) |
| **Pattern** | Center-focused (single purpose screen) |
| **CTAs** | Pause/Resume (bottom center), End Session (secondary) |
| **Special** | Whitespace maksimal, hanya timer dan progress ring yang visible |

### Cognitive Training (Exercise Session)

| Element | Specification |
|---------|---------------|
| **Focal Point** | Exercise task/stimulus (center screen) |
| **Pattern** | Center-focused dengan minimal peripheral distractions |
| **CTAs** | Response buttons (bottom, large touch targets) |
| **Special** | Background sangat clean, timer kecil di top-right |

### Brain Profiling (Assessment Results)

| Element | Specification |
|---------|---------------|
| **Focal Point** | Overall Brain Score (dengan comparison chart) |
| **Pattern** | F-Pattern untuk scanning multi-dimensional results |
| **CTAs** | "Share Result" (viral mechanic), "View Details" |
| **Key Metrics** | 4 dimensi: Working Memory, Focus Span, Processing Speed, Cognitive Flexibility |

### Neuro-Journal (Daily Check-in)

| Element | Specification |
|---------|---------------|
| **Focal Point** | Today's mood/energy input (emoji slider) |
| **Pattern** | Single-column flow (step-by-step input) |
| **CTAs** | "Save Entry" (bottom, sticky) |
| **Key Metrics** | Weekly trend chart di atas journal entries |

---

## 8. Peak Moment Design

Based on Peak-End Rule: Users remember the **peak moment** and the **ending**, not the average.

### Peak Moment: Cognitive Milestone Achieved

| Moment | Implementation |
|--------|----------------|
| **Trigger** | Personal best dalam cognitive training, level up, atau streak achievement |
| **Visual** | Full-screen celebration dengan confetti (teal + deep blue colors), dramatic score reveal |
| **Duration** | 500ms animation + 3s display sebelum auto-dismiss |
| **Micro-copy** | *"New Personal Best! Working Memory kamu meningkat 12% dari minggu lalu 🧠"* |
| **Audio** | Subtle success chime (optional, dapat di-disable) |
| **Shareability** | "Share to Instagram" button dengan pre-generated beautiful card |

### Secondary Peak Moments

| Moment | Trigger | Implementation |
|--------|---------|----------------|
| **Focus Session Complete** | Menyelesaikan 90-menit deep work session | Ring animation + summary stats |
| **7-Day Streak** | 7 hari berturut-turut training | Badge unlock + confetti |
| **Level Up** | Mencapai XP threshold untuk level baru | Character evolution animation |

### Ending Design

| Moment | Implementation |
|--------|----------------|
| **Trigger** | Menyelesaikan daily training quota |
| **Message** | *"Great work today! Otak kamu sekarang 23% lebih tajam. Kembali besok untuk maintain streak."* |
| **Tone** | Encouraging, science-backed, personalized |
| **Visual** | Gentle fade-out dengan tomorrow's preview |

---

## 9. Accessibility Requirements

| Requirement | Standard |
|-------------|----------|
| Contrast Ratio | WCAG AA minimum (4.5:1 for text) |
| Focal Points | AAA contrast (7:1) untuk Cognitive Score |
| Interactive Elements | Minimum 44px touch target (mobile) |
| Focus States | Visible focus ring (teal color) |
| Motion | Respect `prefers-reduced-motion` untuk semua animations |
| Color Blindness | Tidak relying solely pada color untuk mengkomunikasikan status |

### Special: Cognitive Accessibility

| Consideration | Implementation |
|---------------|----------------|
| Decision Fatigue | Minimal choices saat low cognitive state (tengah malam, post-training) |
| Load Time | Fast loading untuk maintain focus state |
| Notifications | Respect "Do Not Disturb" dan Focus Mode |

---

## 10. Component Specifications

### Cognitive Score Card

```typescript
interface CognitiveScoreCard {
  score: number;           // 0-1000
  change: number;          // +/- dari baseline
  label: string;          // "Cognitive Score"
  trend: 'up' | 'down' | 'stable';
  size: 'large' | 'medium' | 'small';
  showGlow?: boolean;     // Default true untuk large
}
```

**Visual Implementation:**
- Large: 200px circle dengan glow effect, score di center
- Medium: 120px circle, no glow
- Small: 64px circle, minimal

### Focus Timer Ring

```typescript
interface FocusTimerRing {
  duration: number;       // Total duration (minutes)
  elapsed: number;        // Elapsed time (seconds)
  phase: 'focus' | 'recovery';
  showLabel?: boolean;    // Default true
}
```

**Visual Implementation:**
- Teal untuk focus phase (90 menit)
- Deep blue untuk recovery phase (20 menit)
- Smooth animation transition antar phases

### Training Progress Bar

```typescript
interface TrainingProgressBar {
  current: number;
  total: number;
  exerciseType: string;
  showPercentage: boolean;
  animateOnUpdate: boolean;
}
```

**Visual Implementation:**
- Horizontal bar dengan teal gradient
- Percentage label di right end
- Subtle glow saat complete

### Streak Display

```typescript
interface StreakDisplay {
  days: number;
  bestStreak?: number;
  showFlame?: boolean;    // Default true
}
```

**Visual Implementation:**
- Angka streak dengan flame icon animasi
- Subtle pulse animation untuk streak > 7
- Warning color (amber) jika streak akan putus

---

## 11. Behavioral Design Techniques

Neurova applies 11 behavioral design techniques to drive engagement and habit formation for cognitive training. Each technique is tailored to support genuine cognitive improvement rather than addiction.

### 1. Anticipation Loop

**Implementation:**
- Assessment result loading dengan suspenseful animation (counting up dari 0 ke final score)
- Performance score reveal setelah training completion dengan dramatic pause
- "Analyzing your brain performance..." message sebelum menampilkan hasil

**Product Context:**
- Creates excitement untuk assessment results dan daily scores
- Builds anticipation yang meningkatkan dopamine release saat result revealed
- Supports user motivation untuk melihat progress

### 2. Invisible Personalization

**Implementation:**
- Training recommendations otomatis berdasarkan cognitive profile (tanpa explicit settings)
- Difficulty adjustment yang terjadi gradually tanpa user awareness
- Exercise selection yang adaptif based on performance patterns

**Product Context:**
- Reduces decision fatigue - user tidak perlu memilih exercise manual
- Creates feeling bahwa app "mengerti" cognitive strengths dan weaknesses
- Personalization feels magical, bukan overwhelming

### 3. Streak + Loss Aversion

**Implementation:**
- Daily training streak dengan prominent display (fire icon dengan animasi)
- "Don't lose your 7-day streak!" notification ketika approaching deadline
- Rest day feature yang dapat di-enable tanpa breaking streak
- Streak freeze power-up untuk emergency skip days

**Product Context:**
- VERY applicable untuk habit formation - cognitive training requires consistency
- Loss aversion: user lebih motivated untuk maintain streak daripada memulai baru
- **Ethical balance**: Rest day options prevent unhealthy obsession

### 4. Emotional Character

**Implementation:**
- Brain mascot ("Neuro") yang celebrates cognitive milestones
- Character expression yang berubah based on performance (excited untuk PR, concerned untuk missed day)
- Unlockable character evolution sebagai progress indicator

**Product Context:**
- Creates emotional connection dengan platform
- Makes abstract cognitive progress menjadi tangible dan relatable
- Character serves sebagai positive reinforcement source

### 5. Variable Reward Notification

**Implementation:**
- "New high score!" notification dengan random reward tier (bronze, silver, gold)
- "Cognitive improvement detected!" dengan unexpected insight reveal
- Randomized bonus XP atau unlockable content setelah training completion

**Product Context:**
- Leverages dopamine system untuk reinforce training behavior
- Variable rewards lebih effective daripada fixed rewards
- Creates element of surprise dan delight

### 6. Social Proof Counter

**Implementation:**
- "12,457 training minutes completed today" counter
- "2,341 users improving their focus right now" live activity
- "Average users gain 23% working memory in 30 days" statistics

**Product Context:**
- Validates bahwa cognitive training works untuk others
- Creates FOMO (Fear Of Missing Out) untuk join active community
- Social proof increases trust dan motivation

### 7. Annual Wrapped

**Implementation:**
- Yearly cognitive journey summary dengan animated timeline
- Top achievements: "Most improved area: Processing Speed (+45%)"
- Total training hours, best streak, favorite exercises
- Shareable summary card dengan beautiful visualization

**Product Context:**
- Creates annual moment of reflection dan celebration
- Highly shareable content untuk social media (viral mechanic)
- Reinforces long-term value proposition

### 8. Personalization Surprise

**Implementation:**
- "Your memory improved 25% this month!" notification dengan unexpected insight
- "You're in the top 10% for focus duration this week" surprise recognition
- Personalized cognitive health tips berdasarkan unique performance patterns

**Product Context:**
- Delight factor dari discovering unexpected progress
- Makes personalization tangible dan visible
- Reinforces bahwa training mempengaruhi real cognitive abilities

### 9. Flash Sale Countdown

**Implementation:**
- Premium program trial countdown dengan limited-time offer
- "48 hours left untuk unlock Advanced Memory Training at 50% off"
- Countdown timer pada upgrade screen dengan urgency messaging

**Product Context:**
- Creates urgency untuk conversion ke premium
- Limited-time offer leverages scarcity principle
- Countdown visual increases perceived value

### 10. Social Commerce

**Implementation:**
- "7-Day Brain Training Challenge" dengan friend invitation system
- Leaderboard untuk group challenges (team-based cognitive competitions)
- "Train with a friend" feature dengan shared progress tracking

**Product Context:**
- Social accountability increases adherence
- Friendly competition drives engagement
- Viral mechanic melalui friend invitations

### 11. Gentle Nudge

**Implementation:**
- Daily training reminder pada optimal time (dipersonalisasi berdasarkan user pattern)
- "Your brain is primed for training - morning session available" nudge
- Rest day reminder: "You've trained 5 days straight - consider a rest day for optimal recovery"
- Balanced messaging that encourages BOTH consistency AND rest

**Product Context:**
- Supports habit formation melalui timely reminders
- **Critical balance**: Encourages training tanpa creating unhealthy obsession
- Science-backed approach: Rest days are essential untuk cognitive recovery
- Prevents burnout dan promotes sustainable training habits

### Ethical Design Note

Cognitive health products should lean toward **Sticky** design (engagement through genuine value) rather than **Addictive** design (engagement through psychological exploitation).

**Key Principles:**
- Goal adalah genuine cognitive improvement, bukan time-on-app metrics
- Streaks should have rest day options untuk prevent unhealthy obsession
- Notifications should be helpful, bukan manipulative
- User control over notification frequency dan timing
- Transparent tentang how behavioral techniques are used

**Red Flags to Avoid:**
- Infinite scroll atau auto-play yang tanpa explicit stop mechanism
- Dark patterns yang make difficult to skip training days
- Exaggerated notifications yang create anxiety
- Predatory scheduling (optimal notification times untuk maximize addiction)

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

## 13. Implementation Checklist

- [ ] Colors match Teal/White/Deep Blue palette
- [ ] Single focal point per screen (Cognitive Score atau Focus Time)
- [ ] F-Pattern applied untuk dashboard dan performance screens
- [ ] Generous whitespace maintained (64-96px section gaps)
- [ ] Motion used sparingly, only untuk feedback dan peak moments
- [ ] Peak moment designed (milestone achievement dengan celebration)
- [ ] Design tokens implemented di CSS/Tailwind config
- [ ] Accessibility requirements met (WCAG AA, focus states, reduced motion)
- [ ] Special cognitive considerations addressed (decision fatigue prevention)
- [ ] Shareability mechanics implemented (viral loop untuk brain scores)
- [ ] Behavioral design techniques applied ethically (Sticky bukan Addictive)

---

## 14. Integration dengan Ekosistem Akordium

### Cross-Product Identity Badge

Neurova users bisa unlock badge **"Brain Athlete"** yang terhubung dengan:

- **Atribuo**: Stat Intelligence & Focus di-character sheet RPG
- **Anggarin**: Alert *"Cognitive performance rendah - hindari keputusan finansial besar hari ini"*
- **Classnetic**: Modul "Student Cognitive Performance" untuk guru

### Design Consistency

Neurova menggunakan:
- Same semantic colors (success, warning, error) dengan semua produk Akordium
- Same typography scale (Geist + Inter)
- Same visual weight hierarchy (5-layer system)
- Same motion easing curves
- **BUT** dengan color palette unik (Teal/White/Deep Blue) yang mencerminkan positioning sebagai cognitive performance platform

---

## 15. Design Asset Specifications

### Iconography

- **Style**: Outline icons, 2px stroke
- **Library**: Heroicons atau Lucide Icons
- **Color**: Slate gray untuk secondary, teal untuk primary actions
- **Size**: 24px default, 32px untuk focal icons

### Illustrations

- **Style**: Clean, geometric, minimal
- **Color Palette**: Monochrome teal dengan accent deep blue
- **Usage**: Brain profiling, cognitive training explanation, onboarding
- **Tone**: Scientific, modern, approachable

### Data Visualization

- **Chart Type**: Line charts untuk trends, bar charts untuk comparisons, donut charts untuk composition
- **Colors**: Teal gradient untuk primary data, slate untuk secondary
- **Grid**: Minimal, hanya horizontal lines
- **Tooltips**: Clean, dengan contextual info

---

## 16. fMRI Research Insights

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

*Based on: [neurodesign-uiux-guide.md](../_templates/neurodesign-uiux-guide.md) | [neuroscience-design-guide.md](../_templates/neuroscience-design-guide.md)*

*Last Updated: 2026-03-03*
*Document Version: 1.1*
