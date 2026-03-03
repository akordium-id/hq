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

## 11. Behavioral Design Techniques

Ethical Design Note: Learning products should lean toward **Sticky** design karena goal adalah skill acquisition, bukan endless scrolling. Streaks work well untuk habit formation.

### 11.1 Anticipation Loop

**Neuroscience Principle:** Dopamine release during anticipation drives action.

| Use Case | Implementation |
|----------|----------------|
| **Course Progress Loading** | Animated progress bar saat module loading dengan "Almost there..." |
| **Certificate Generation** | "Generating your certificate..." animation dengan name dan completion date |
| **Quiz Result** | Loading spinner sebelum reveal score dengan "Calculating your mastery..." |

**Technical Implementation:**
```css
/* Anticipation Animation */
@keyframes pulse-glow {
  0%, 100% { opacity: 1; box-shadow: 0 0 20px rgba(37, 99, 235, 0.3); }
  50% { opacity: 0.8; box-shadow: 0 0 40px rgba(37, 99, 235, 0.6); }
}

.anticipation-state {
  animation: pulse-glow 1.5s ease-in-out infinite;
}
```

### 11.2 Invisible Personalization

**Neuroscience Principle:** Predictive preferences reduce cognitive load without explicit choice.

| Data Source | Personalization Output |
|-------------|------------------------|
| **Skill Assessment** | Course recommendations aligned dengan current level |
| **Learning Pace** | Module difficulty adjustment (adaptive learning) |
| **Time of Day** | Practice problems matching energy level (morning = complex formulas) |
| **Past Struggles** | Extra practice on weak areas (e.g., "Let's reinforce VLOOKUP") |

**Example Implementation:**
```typescript
// Invisible course recommendation
interface UserProfile {
  completedModules: string[];
  averageScore: number;
  timeSpentPerDay: number;
  struggleTopics: string[];
}

function getNextModule(user: UserProfile): Module {
  // Algorithm prioritizes:
  // 1. Prerequisite completion
  // 2. Optimal challenge level (70-80% success rate)
  // 3. Struggle topic reinforcement
  // 4. Learning pace alignment
}
```

### 11.3 Streak + Loss Aversion

**Neuroscience Principle:** Loss aversion (losing streak > gaining streak) creates habit loops.

| Streak Type | Implementation |
|-------------|----------------|
| **Daily Practice** | Fire icon 🔥 bertambah setiap hari practice, reset jika skip |
| **Weekly Goal** | Progress bar 5/7 days, visual warning jika hampir reset |
| **Module Streak** | Consecutive days completing modules dalam course sama |

**Visual Design:**
```
┌─────────────────────────────────────┐
│  🔥 12-Day Streak                   │
│  ════════════════════════════       │
│  [Mon] [Tue] [Wed] [Thu] [Fri]      │
│   ✓      ✓      ✓      ✓     ?      │
│                                     │
│  Don't lose your streak! Practice   │
│  today to keep it alive.            │
└─────────────────────────────────────┘
```

**Loss Aversion Messaging:**
- "You've practiced for 12 days straight. Don't break your streak now!"
- "One more day to reach your weekly goal. Keep it going!"
- "Your VLOOKUP streak will reset in 6 hours. Practice now?"

### 11.4 Emotional Character

**Neuroscience Principle:** Emotional connection enhances memory formation dan engagement.

| Character | Personality | Celebration Triggers |
|-----------|-------------|---------------------|
| **Excella** (Excel Owl) | Wise mentor, encouraging, formula enthusiast | Formula mastered, quiz passed, project completed |

**Character Personality:**
- **Name:** Excella the Excel Owl
- **Tagline:** "Together, we'll master Excel, one formula at a time."
- **Voice:** Warm, supportive, slightly nerdy about formulas
- **Celebration Style:** Confetti + motivational quote about growth mindset

**Celebration Animations:**
```
Trigger: User masters VLOOKUP formula

┌─────────────────────────────────────┐
│                                     │
│        🦉 Excella                   │
│   "HOO-HOO! VLOOKUP MASTER!"        │
│                                     │
│   ✨ ✨ ✨                          │
│   "You just unlocked a superpower!"  │
│   "2047 learners use VLOOKUP daily" │
│                                     │
│   [Continue Learning]  [Share]      │
└─────────────────────────────────────┘
```

**Micro-copy Examples:**
- When completing a hard formula: "That was tricky! You crushed it. 💪"
- When struggling: "It's okay to pause. Come back when you're ready. We'll be here."
- When breaking streak: "Life happens. Your streak reset, but your knowledge didn't. Pick up where you left off!"

### 11.5 Variable Reward Notification

**Neuroscience Principle:** Unpredictable rewards trigger dopamine, driving repeated behavior.

| Reward Type | Trigger | Visual Feedback |
|-------------|---------|-----------------|
| **Badge Unlocked** | Master formula, complete module | Badge animation + "New Achievement!" |
| **Course Completed** | Finish all modules | Certificate preview + confetti |
| **Quiz Passed** | Score > 80% | Score reveal + "Great job!" |
| **Perfect Score** | 100% pada quiz | Special badge + "Excel Master!" |
| **Speed Bonus** | Complete fast dengan accuracy | "Lightning Learner" badge |

**Reward Probability Table:**
| Achievement | Uncommon | Rare | Epic | Legendary |
|-------------|----------|------|------|-----------|
| Formula Mastered | 70% | 25% | 4% | 1% |
| Quiz Passed | 80% | 15% | 4% | 1% |
| Module Completed | 75% | 20% | 4% | 1% |

**Technical Implementation:**
```typescript
// Variable reward system
function getRewardTier(achievement: string): RewardTier {
  const rand = Math.random();

  if (rand < 0.70) return 'uncommon';
  if (rand < 0.95) return 'rare';
  if (rand < 0.99) return 'epic';
  return 'legendary';
}

// Legendary rewards include special animations
const legendaryRewards = {
  animation: 'full-screen celebration',
  shareable: true,
  badge: 'special edition',
  message: 'You are in the top 1% of Excel learners!'
};
```

### 11.6 Social Proof Counter

**Neuroscience Principle:** Social validation reduces uncertainty dan builds trust.

| Counter Type | Placement | Message Format |
|--------------|-----------|----------------|
| **Community Members** | Landing page hero | "2,847 learners mastering Excel" |
| **Formulas Mastered** | Course page | "VLOOKUP mastered by 1,234 people" |
| **Projects Completed** | Project section | "342 projects submitted this month" |
| **Active Now** | Course detail | "12 people learning this module now" |

**Visual Implementation:**
```
┌─────────────────────────────────────┐
│  INTERMEDIATE EXCEL COURSE          │
│  ═════════════════════════════════  │
│                                     │
│  👥 1,234 enrolled                  │
│  📊 892 completed                   │
│  ⏱️ 12 learning now                 │
│                                     │
│  "This course changed my career!"   │
│  — Sarah T., Data Analyst           │
└─────────────────────────────────────┘
```

**Dynamic Updates:**
```typescript
// Real-time counter updates
function updateSocialProof() {
  const activeLearners = getActiveLearnersCount();
  const element = document.getElementById('active-now');

  // Update every 30 seconds with randomization
  // (adds 10-20% fluctuation for perceived activity)
  setInterval(() => {
    const variance = Math.floor(activeLearners * 0.2);
    const displayCount = activeLearners + Math.floor(Math.random() * variance);
    element.textContent = `${displayCount} learning now`;
  }, 30000);
}
```

### 11.7 Annual Wrapped

**Neuroscience Principle:** Reflection reinforces identity dan achievement pride.

| Section | Data Displayed |
|---------|----------------|
| **Learning Streaks** | Longest streak, total days practiced |
| **Top Formulas** | Most-used formulas (VLOOKUP, INDEX-MATCH, Pivot Tables) |
| **Skills Acquired** | New skills learned dengan proficiency level |
| **Projects Completed** | Number of projects dengan difficulty breakdown |
| **Time Invested** | Total hours spent learning (growth-focused framing) |
| **Community Impact** | Help provided to other learners (forum posts, answers) |

**Visual Design:**
```
┌─────────────────────────────────────────────┐
│                                             │
│   YOUR 2025 EXCEL JOURNEY                   │
│   ═══════════════════════════               │
│                                             │
│   🔥 45-Day Longest Streak                  │
│   📚 23 Formulas Mastered                   │
│   ⏱️ 67 Hours of Learning                   │
│   🎯 12 Projects Completed                  │
│                                             │
│   Top Formulas:                             │
│   1. VLOOKUP (156 uses)                     │
│   2. INDEX-MATCH (89 uses)                  │
│   3. Pivot Tables (67 uses)                 │
│                                             │
│   "You're in the top 15% of learners!       │
│    Ready for 2026?"                         │
│                                             │
│   [Share]  [View Certificate]               │
└─────────────────────────────────────────────┘
```

**Technical Implementation:**
```typescript
// Generate annual wrapped data
interface AnnualWrapped {
  year: number;
  longestStreak: number;
  formulasMastered: FormulaStat[];
  totalHours: number;
  projectsCompleted: number;
  communityContributions: number;
  percentileRank: number;
}

function generateAnnualWrapped(userId: string): AnnualWrapped {
  // Aggregate all learning activity for the year
  // Calculate percentile rank against all users
  // Prepare shareable summary card
}
```

### 11.8 Personalization Surprise

**Neuroscience Principle:** Unexpected positive recognition creates emotional connection.

| Surprise Type | Trigger Data | Message Example |
|---------------|--------------|-----------------|
| **Skill Improvement** | Compare quiz scores over time | "Your VLOOKUP speed improved 40% this month!" |
| **Consistency Celebration** | 30-day practice milestone | "You've practiced every day for 30 days. Impressive dedication!" |
| **Breakthrough Moment** | Finally master difficult formula | "INDEX-MATCH clicked! You've mastered the hardest formula." |
| **Learning Spurt** | Unusual activity spike | "5 modules in 2 days? You're on fire!" |
| **Unique Pattern** | e.g., night owl learner | "You're a night learner! 80% of your practice happens after 10 PM." |

**Delivery Method:**
```typescript
// Surprise detection algorithm
function detectSurprise(user: User): Surprise | null {
  const insights = analyzeUserBehavior(user);

  // Skill improvement
  if (insights.quizScoreImprovement > 30) {
    return {
      type: 'improvement',
      message: `Your ${insights.improvedSkill} improved ${insights.percent}%!`,
      visual: 'growth-chart-animation'
    };
  }

  // Consistency milestone
  if (insights.currentStreak === 30) {
    return {
      type: 'milestone',
      message: '30 days of consistent practice. You\'re building a habit!',
      visual: 'fire-badge-animation'
    };
  }

  return null; // No surprise this time
}
```

### 11.9 Flash Sale Countdown

**Neuroscience Principle:** Scarcity + time urgency triggers immediate action.

| Sale Type | Duration | Discount | Target Audience |
|-----------|----------|----------|-----------------|
| **Launch Discount** | 48 hours | 40% off | New users, course launch |
| **Bundle Flash** | 24 hours | 50% off | Course bundles |
| **Streak Bonus** | 6 hours | 30% off | Active learners (5+ day streak) |
| **Referral Bonus** | 72 hours | 35% off | Referred users |

**Visual Design:**
```
┌─────────────────────────────────────────────┐
│   ⏰ FLASH SALE ENDS IN:                    │
│   ════════════════════════════════════════  │
│                                             │
│   [02:45:32]                                │
│                                             │
│   40% OFF ALL COURSES                        │
│                                             │ │
│   [Claim Discount Now]                      │
│                                             │
│   "Sale ends at midnight. Don't miss out!"   │
└─────────────────────────────────────────────┘
```

**Technical Implementation:**
```typescript
// Countdown timer with urgency messaging
function startCountdown(endTime: Date) {
  const timer = setInterval(() => {
    const now = new Date();
    const remaining = endTime.getTime() - now.getTime();

    if (remaining <= 0) {
      clearInterval(timer);
      showSaleEnded();
      return;
    }

    const hours = Math.floor(remaining / (1000 * 60 * 60));
    const minutes = Math.floor((remaining % (1000 * 60 * 60)) / (1000 * 60));
    const seconds = Math.floor((remaining % (1000 * 60)) / 1000);

    updateTimerDisplay(hours, minutes, seconds);

    // Urgency messaging
    if (hours < 1) {
      showUrgencyMessage('Less than 1 hour left!');
    } else if (hours < 6) {
      showUrgencyMessage('Sale ending soon!');
    }
  }, 1000);
}
```

### 11.10 Social Commerce

**Neuroscience Principle:** Social incentives amplify individual motivation.

| Social Feature | Incentive | Implementation |
|----------------|-----------|----------------|
| **Team Learning** | 20% group discount | 3+ users enroll together dalam course sama |
| **Referral Bonus** | IDR 50K credit per referral | Referred user makes purchase |
| **Study Group** | Unlock group projects | Form group dengan 2+ friends |
| **Leaderboard** | Badge + visibility | Top learners weekly/monthly |
| **Share Achievement** | 5% discount coupon | Share certificate ke social media |

**Team Learning Implementation:**
```
┌─────────────────────────────────────────────┐
│   👥 LEARN TOGETHER, SAVE TOGETHER          │
│   ════════════════════════════════════════  │
│                                             │
│   Form a team of 3+ and get 20% off!        │
│                                             │
│   Your Team:                                │
│   ┌─────────────────────────────────────┐   │
│   │ ✓ You (Team Captain)                 │   │
│   │ ✓ Sarah (sarah@email.com)            │   │
│   │ ⏳ Waiting for 1 more...              │   │
│   └─────────────────────────────────────┘   │
│                                             │
│   [Invite Team Member]  [Proceed to Pay]    │
└─────────────────────────────────────────────┘
```

**Referral System:**
```typescript
// Referral tracking and reward
interface ReferralProgram {
  referrerId: string;
  referredUserId: string;
  rewardAmount: number; // in IDR or percentage
  status: 'pending' | 'completed' | 'rewarded';
}

function processReferral(referral: ReferralProgram) {
  if (referral.status === 'completed') {
    // Credit referrer account
    creditUser(referral.referrerId, referral.rewardAmount);

    // Notify referrer
    sendNotification({
      userId: referral.referrerId,
      message: `You earned IDR ${referral.rewardAmount} from a referral!`,
      action: 'View Credits'
    });

    referral.status = 'rewarded';
  }
}
```

### 11.11 Gentle Nudge

**Neuroscience Principle:** Well-timed reminders capitalize on motivation spikes.

| Nudge Type | Trigger | Message Tone |
|------------|---------|--------------|
| **Daily Practice** | 24 hours since last practice | Encouraging, low pressure |
| **Course Restart** | 3+ days since last activity | "Pick up where you left off" |
| **New Course Available** | Relevant to completed courses | "Since you liked X, try Y" |
| **Streak Warning** | 6 hours before streak reset | "Don't break your streak!" |
| **Weekly Goal** | End of week, 1-2 days short | "Almost there! One more day" |

**Nudge Timing Strategy:**
```typescript
// Intelligent nudge scheduling
function scheduleNudges(user: User) {
  const nudges = [];

  // Daily practice: User's most active time
  const peakActivityHour = getUserPeakHour(user);
  nudges.push({
    type: 'daily_practice',
    time: `${peakActivityHour}:00`,
    condition: () => getHoursSinceLastPractice(user) >= 24,
    message: 'Ready for today\'s Excel practice?'
  });

  // Streak warning: 6 hours before reset
  nudges.push({
    type: 'streak_warning',
    time: '18:00', // Assuming day resets at midnight
    condition: () => user.streak > 0 && getHoursUntilReset() <= 6,
    message: 'Practice today to keep your streak alive!'
  });

  // Weekly goal: Sunday evening
  nudges.push({
    type: 'weekly_goal',
    time: '20:00',
    day: 'Sunday',
    condition: () => getWeeklyPracticeDays(user) >= 5 && getWeeklyPracticeDays(user) < 7,
    message: 'One more day to complete your weekly goal!'
  });

  return nudges;
}
```

**Nudge Message Templates:**
| Scenario | Message |
|----------|---------|
| Daily practice (morning) | "Good morning! Ready to master Excel today?" |
| Daily practice (evening) | "End your day with a quick Excel win. 5 minutes is all you need." |
| Streak at risk | "You've practiced for 7 days straight. Don't break your streak now!" |
| Course restart | "You were making great progress on Pivot Tables. Continue where you left off?" |
| New relevant course | "Since you mastered VLOOKUP, try INDEX-MATCH next!" |

### Ethical Design Implementation

**Sticky vs. Addictive Design:**

For learning products like ExcelCircle, the goal is **skill acquisition**, not endless scrolling. Here's how to maintain ethical boundaries:

| Ethical Principle | Implementation |
|-------------------|----------------|
| **Transparent Streaks** | Show streak reset time, no hidden timers |
| **Practice Limit Suggestions** | "You've practiced for 2 hours. Take a break?" |
| **No Dark Patterns** | Never hide cancellation, clear unsubscribe |
| **Progress Over Perfection** | Celebrate effort, not just perfect scores |
| **Reality-Based Goals** | Recommend 15-30 min daily, not hours |
| **Healthy Reminders** | Easy to snooze/disable, respect user preferences |

**Example - Healthy Streak Design:**
```typescript
// Ethical streak implementation
interface EthicalStreak {
  currentStreak: number;
  lastPracticeDate: Date;
  nextResetTime: Date;
  userPreference: {
    practiceReminderEnabled: boolean;
    preferredTime: string;
    dailyGoalMinutes: number;
  };
}

function shouldSendStreakWarning(streak: EthicalStreak): boolean {
  // Only warn if user has reminders enabled
  if (!streak.userPreference.practiceReminderEnabled) {
    return false;
  }

  // Only warn if approaching reset time
  const hoursUntilReset = getHoursUntil(streak.nextResetTime);
  if (hoursUntilReset > 6) {
    return false; // Too early, don't create anxiety
  }

  return true;
}
```

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

*Based on: [neurodesign-uiux-guide.md](../_templates/neurodesign-uiux-guide.md)*

*Last Updated: 2026-03-03*
*Document Version: 1.0*
