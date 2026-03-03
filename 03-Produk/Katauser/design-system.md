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

## 11. Behavioral Design Techniques

**Ethical Design Note:** B2B feedback products should lean toward **Sticky** design karena membantu business understand customers better, bukan membuat mereka addicted to checking.

### Technique 1: Anticipation Loop

**Definition:** Building anticipation for upcoming value through loading states and progress indicators.

**Katauser Implementation:**

| Context | Implementation | Neuroscience Principle |
|---------|----------------|------------------------|
| **Survey results loading** | "Analyzing responses..." with animated progress bar | Dopamine anticipation system |
| **Response analytics** | "Discovering insights from 247 responses..." with staggered card reveal | Curiosity gap + peak anticipation |
| **Export generation** | "Preparing your feedback report..." with percentage counter | Goal gradient effect |

**Implementation Details:**
```css
/* Anticipation animation */
@keyframes shimmer {
  0% { background-position: -200% 0; }
  100% { background-position: 200% 0; }
}

.loading-skeleton {
  background: linear-gradient(90deg, #F9FAFB 25%, #E5E7EB 50%, #F9FAFB 75%);
  background-size: 200% 100%;
  animation: shimmer 1.5s infinite;
}
```

---

### Technique 2: Invisible Personalization

**Definition:** Seamless customization that feels like magic, not configuration.

**Katauser Implementation:**

| Feature | Personalization Signal | Adaptive Behavior |
|---------|----------------------|-------------------|
| **Survey type detection** | Past survey patterns | Auto-suggest NPS vs. CSAT vs. CES question templates |
| **Response routing** | Customer feedback content | Auto-tag + route to appropriate team member |
| **Dashboard layout** | Frequently accessed metrics | Prioritize relevant widgets automatically |
| **Question recommendations** | Industry + business size | Suggest best-practice questions for context |

**Ethical Boundary:** Always provide transparency - "Recommended based on your survey patterns" with opt-out option.

---

### Technique 3: Streak + Loss Aversion

**Definition:** Visualizing consistency to maintain engagement, while leveraging the pain of losing progress.

**Katauser Implementation:**

| Context | Implementation | Motivation Principle |
|---------|----------------|---------------------|
| **Weekly review streak** | "4 weeks straight! Keep the momentum" colored badge | Consistency priming |
| **Response rate goal** | Progress bar to 80% target, showing "only 12 more responses needed" | Goal gradient effect |
| **Unanswered feedback warning** | "3 responses await - respond within 24h to maintain your quick-reply reputation" | Loss aversion (reputation) |
| **Streak recovery** | "Don't lose your 8-week streak! Respond by 5pm today" | Loss aversion (progress) |

**Note:** Light implementation only - avoid gamification that trivializes customer feedback importance.

**Visual Example:**
```
┌──────────────────────────────────────┐
│  🔥 8-Week Review Streak             │
│  ━━━━━━━━━━━━━━━━━━━━ 100%          │
│                                      │
│  ⚠️ 3 responses need attention       │
│     today to maintain your streak    │
└──────────────────────────────────────┘
```

---

### Technique 4: Emotional Character

**Definition:** Creating brand personality through character-based interactions.

**Katauser Implementation:** ❌ **NOT APPLICABLE**

**Rationale:** Katauser is a professional B2B tool for serious feedback management. Emotional characters undermine the seriousness of customer voice and business decision-making.

**Alternative:** Use clean, professional UI with subtle warmth through microcopy tone (helpful, not cartoonish).

---

### Technique 5: Variable Reward Notification

**Definition:** Unpredictable reward delivery to maximize engagement through dopamine-driven anticipation.

**Katauser Implementation:**

| Trigger | Variable Reward | Surprise Element |
|---------|-----------------|------------------|
| **New response received** | Sometimes: Just "1 new response"<br>Sometimes: "Viral feedback detected!"<br>Rarely: "Celebrity customer just responded!" | Uncertainty creates notification-checking habit |
| **Analytics generated** | Sometimes: Standard insights<br>Sometimes: "Unexpected pattern discovered!"<br>Rarely: "Your NPS increased 15% - here's why" | Variable insight value |
| **Milestone reached** | Sometimes: Basic milestone badge<br>Sometimes: Animated celebration + shareable stats<br>Rarely: "Top 5% of feedback collectors this month!" | Social proof variability |

**Ethical Implementation:**
- Never fabricate data for surprise effect
- Clearly distinguish between routine and exceptional events
- Allow notification preferences to reduce dopamine-driven checking

---

### Technique 6: Social Proof Counter

**Definition:** Quantifying collective action to validate individual participation.

**Katauser Implementation:**

| Counter Type | Display Format | Placement | Psychological Effect |
|--------------|----------------|-----------|---------------------|
| **Total responses collected** | "2,847 pieces of feedback collected" | Dashboard header | Validation of tool value |
| **Active surveys** | "156 businesses collecting feedback right now" | Landing page | Bandwagon effect |
| **Insights generated** | "893 customer insights discovered this week" | Analytics summary | Collective progress |
| **Response rate achieved** | "Average 42% response rate across all Katauser surveys" | Benchmark panel | Performance normalization |

**Visual Example:**
```
┌──────────────────────────────────────┐
│  📊 KATAUSER COMMUNITY               │
│                                      │
│  2,847  Feedback collected today     │
│  156    Active surveys               │
│  893    Insights generated           │
│                                      │
│  Your response rate: 38%             │
│  Industry benchmark: 42%             │
└──────────────────────────────────────┘
```

---

### Technique 7: Annual Wrapped

**Definition:** Year-end retrospective that transforms usage data into memorable achievement narrative.

**Katauser Implementation:**

| Section | Content Example | Emotional Goal |
|---------|----------------|----------------|
| **Year overview** | "In 2025, you collected 3,892 pieces of feedback" | Pride in accomplishment |
| **Customer voice impact** | "1,247 customers felt heard - 87% said their feedback was valued" | Purpose affirmation |
| **Sentiment journey** | Line graph showing NPS improvement from +32 to +48 | Progress visualization |
| **Top insights** | "Your #1 discovery: 'Mobile app users 3x more satisfied'" | Memory reinforcement |
| **Team acknowledgment** | "You responded 89% of feedback within 24h - top 10% fastest" | Competitive validation |
| **Prediction** | "Based on trends, 2026 could break 5,000 responses" | Anticipation building |

**Delivery:**
- Email on December 31st or first business day
- Shareable card format for LinkedIn/Twitter
- Print-ready PDF option for annual reports

**Micro-copy Example:**
```
Your 2025 Feedback Journey

You didn't just collect feedback — you built a customer-obsessed culture.

📊 3,892 pieces of feedback
📈 NPS: +32 → +48 (+50% improvement!)
⚡ 89% response rate (top 10% fastest)
🎯 12 product features prioritized from feedback

Here's to another year of listening deeply.
```

---

### Technique 8: Personalization Surprise

**Definition:** Unexpected adaptive behavior that demonstrates deep understanding of user needs.

**Katauser Implementation:**

| Surprise Moment | Trigger | Delight Factor |
|-----------------|---------|----------------|
| **NPS milestone alert** | "Your NPS increased 15% this quarter! Here are the 3 drivers..." | Unexpected positive news |
| **Hidden insight discovery** | "We noticed customers from [Industry] love [Feature] - want a breakdown?" | Proactive value discovery |
| **Anniversary recognition** | "1 year ago today, you received your first Katauser feedback!" | Nostalgia + progress |
| **Smart suggestion** | "Based on your dip in response rate, try sending surveys on Tuesdays (your best day)" | Helpful optimization |
| **Competitive insight** | "Your 42% response rate beats 78% of similar [Industry] businesses" | Contextual pride |

**Implementation Principles:**
- Must be genuinely useful, not just cute
- Based on real data patterns
- Clearly explained so user learns system capabilities
- Never creepy - transparent about data usage

---

### Technique 9: Flash Sale Countdown

**Definition:** Urgency-inducing timer for limited-time opportunities.

**Katauser Implementation:** ❌ **NOT APPLICABLE**

**Rationale:** Katauser is a relationship-building tool, not transactional. Fake urgency undermines trust in customer feedback sincerity.

**Alternative:** Use gentle reminders for time-sensitive feedback windows (e.g., "Survey closes in 3 days" - real deadline, not manufactured urgency).

---

### Technique 10: Social Commerce

**Definition:** Leveraging social networks for conversion through social proof and referral mechanics.

**Katauser Implementation:** ❌ **NOT APPLICABLE**

**Rationale:** B2B feedback tool; viral mechanics inappropriate for serious customer voice management. Customer feedback data is private and confidential.

**Alternative:** Case study testimonials (with explicit permission) showing ROI from improved feedback practices - authentic social proof, not referral gimmicks.

---

### Technique 11: Gentle Nudge

**Definition:** Timely, context-aware reminders that feel helpful, not harassing.

**Katauser Implementation:**

| Nudge Context | Timing | Copy Example | Psychological Principle |
|---------------|--------|--------------|------------------------|
| **Unanswered feedback** | 2h after receipt | "3 customers await your response" | Reciprocity obligation |
| **Survey deadline** | 24h before close | "Your survey closes tomorrow - 89% complete" | Zeigarnik effect (incomplete tasks) |
| **Response rate dip** | After 3 days low activity | "Your response rate dropped 12% this week - try these 3 tips" | Loss aversion |
| **Weekly review** | Monday 9am | "5 feedback items from weekend need attention" | Habit formation |
| **Integration inactive** | 14 days no data | "Your [Integration] hasn't sent feedback in 2 weeks - connection issue?" | Maintenance reminder |

**Nudge Principles:**
- **Frequency:** Maximum 1 nudge per day per type
- **Dismissibility:** Always include "Snooze" or "Turn off" option
- **Value-first:** Nudge must include helpful info, not just guilt
- **Context-aware:** Respect timezone, working hours, user preferences

**Visual Example:**
```
┌──────────────────────────────────────┐
│  💬 3 responses need attention        │
│                                      │
│  Your quick response (avg. 2h)       │
│  keeps customers 3x more satisfied.   │
│                                      │
│  [Respond Now]  [Snooze until later] │
└──────────────────────────────────────┘
```

**Ethical Implementation:**
- Never create artificial urgency
- Respect user's chosen notification boundaries
- Allow easy opt-out from nudges
- Provide clear value in each nudge (why this matters now)

---

### Behavioral Design Summary for Katauser

| Technique | Applied? | Intensity | Rationale |
|-----------|----------|-----------|-----------|
| Anticipation Loop | ✅ Yes | Medium | Enhances perceived value of analytics |
| Invisible Personalization | ✅ Yes | Light | Reduces setup friction |
| Streak + Loss Aversion | ✅ Yes | Light | Encourages consistent feedback review |
| Emotional Character | ❌ No | - | Professional tool, not playful |
| Variable Reward Notification | ✅ Yes | Light | Maintains engagement without addiction |
| Social Proof Counter | ✅ Yes | Medium | Validates tool adoption |
| Annual Wrapped | ✅ Yes | High | Creates emotional attachment annually |
| Personalization Surprise | ✅ Yes | Light | Delight through genuine helpfulness |
| Flash Sale Countdown | ❌ No | - | Contradicts authentic feedback philosophy |
| Social Commerce | ❌ No | - | Privacy-inappropriate for customer data |
| Gentle Nudge | ✅ Yes | Light | Supports consistent feedback habits |

**Overall Design Philosophy:** Sticky over Addictive. Katauser should become the go-to tool for customer feedback because it provides genuine value, not because it hijacks attention.

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
