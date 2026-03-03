# KoalaMail Design System

> Neurodesign-based visual hierarchy untuk Transactional Email API Service

**Category:** Developer Tools

**Related:** [neurodesign-uiux-guide.md](../_templates/neurodesign-uiux-guide.md)

---

## 1. Visual Identity

### Color Palette

| Role | Color | Hex | Neuroscience Rationale |
|------|-------|-----|------------------------|
| Primary | Royal Blue | `#2563EB` | Biru teknis membangun kepercayaan dan reliabilitas - penting untuk infrastruktur email yang krusial |
| Secondary | Cool Gray | `#6B7280` | Netral dan profesional, memberikan kesan stabil dan mature |
| Accent | Sky Blue | `#0EA5E9` | Highlight untuk elemen interaktif, tetap dalam keluarga biru |
| Background | White | `#FFFFFF` | Bersih dan clinical, cocok untuk dashboard teknis |
| Surface | Light Gray | `#F9FAFB` | Subtle differentiation untuk card dan panel |
| Text Primary | Dark Slate | `#111827` | Maximum kontras untuk readability |
| Text Secondary | Medium Gray | `#4B5563` | Mendukung tanpa mengganggu visual hierarchy |

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

**Typography Rationale:** Geist dipilih karena karakternya yang teknis, clean, dan highly readable. Font ini sudah familiar di kalangan developer (digunakan di Vercel, Next.js), memberikan kesan "by developers, for developers". Geist memiliki excellent legibility pada code snippets dan technical metrics - critical untuk email service dashboard.

---

## 2. Visual Hierarchy (5-Layer)

### Layer Definitions

| Layer | Use Case | Size | Weight | Contrast |
|-------|----------|------|--------|----------|
| **1. Focal Point** | Delivery rate / Email sent count | 48px | Bold | 7:1 (AAA) |
| **2. Primary** | Key metrics (open rate, click rate) | 30px | Medium | 4.5:1 (AA) |
| **3. Secondary** | Email list, recipient info | 18px | Regular | 4.5:1 (AA) |
| **4. Supporting** | Timestamps, status labels | 14px | Light | 3:1 |
| **5. UI Chrome** | Navigation, borders, pagination | 12px | Regular | 3:1 |

### Focal Point Strategy

**Single Focal Element per Screen:** Delivery Rate percentage (97.2%) dengan visual prominence - ini adalah metric paling penting untuk email service, langsung menunjukkan reliability.

```
Example:
┌─────────────────────────────────────┐
│                                     │
│      97.2% DELIVERY RATE            │  ← Layer 1: Single most important metric
│      1,247 emails sent              │
│                                     │
│  ┌─────────┐  ┌─────────┐          │  ← Layer 2: Primary supporting metrics
│  │ 84.5%   │  │ 12.3%   │          │
│  │ Open    │  │ Click   │          │
│  └─────────┘  └─────────┘          │
│                                     │
│  Recent emails                      │  ← Layer 3: Email list
│  • user@example.com                 │
│  • client@company.com               │
└─────────────────────────────────────┘
```

### Anti-Patterns to Avoid

- ❌ **Christmas Tree Effect:** Semua metrics di-highlight sama = user bingung mana yang penting
- ❌ **Flat Hierarchy:** Semua text sama size = developer frustrasi mencari critical error
- ❌ **Hidden CTA:** Tombol "Send Test Email" tersembunyi di antara elemen lain

---

## 3. Eye Tracking Pattern

### Primary Pattern: F-Pattern

**Rationale:** Dashboard email service didominasi oleh list-based content (email logs, delivery status) dan metrics yang harus di-scan secara sistematis. F-Pattern optimal untuk data-dense interface di mana user perlu membandingkan multiple metrics dan scan through lists.

### Pattern Application

#### F-Pattern - Dashboard & Email Logs

```
┌──────────────────────────────────────┐
│ ████████████████████████████████████ │  ← Horizontal scan 1 (Delivery rate)
│ ████████████████████████             │  ← Horizontal scan 2 (Key metrics)
│ █                                    │
│ █ Email 1: Delivered                 │  ← Vertical scan left (Status column)
│ █ Email 2: Bounced                   │
│ █ Email 3: Delivered                 │
│ █ Email 4: Pending                   │
└──────────────────────────────────────┘
```

#### Z-Pattern - Landing Page

```
┌──────────────────────────────────────┐
│ KOALA            →→→     GET API KEY │  ← Zone 1: Brand + CTA
│                    ↘                 │
│         RELIABLE EMAIL API           │
│                   ↙                  │
│ FOR DEVELOPERS  →→→    START FREE    │  ← Zone 4: Conversion
└──────────────────────────────────────┘
```

### Key Rules

- **Delivery rate** = top horizontal scan (most critical metric)
- **Send email button** = left side, not right (primary action)
- **Error notifications** = near top-left, never bottom-right
- **Status indicators** = leftmost column in email lists

---

## 4. Motion Guidelines

### When to Use Motion

| Use Case | Animation Type | Duration |
|----------|---------------|----------|
| Email sending progress | Progress bar + status update | 500-1000ms |
| Success (email sent) | Green checkmark fade-in | 300ms |
| Error (bounce) | Shake + red pulse | 200ms |
| Real-time stats update | Number counter animation | 400ms |
| Button hover | Scale 1.02 + subtle glow | 150ms |

### When NOT to Use Motion

- ❌ Background decorative animations (distracts from metrics)
- ❌ Auto-playing carousels in dashboard
- ❌ Continuous motion during email log review
- ❌ Anything that obscures delivery rate visibility

### Easing Presets

```css
--ease-out: cubic-bezier(0, 0, 0.2, 1);     /* Elements appearing */
--ease-in: cubic-bezier(0.4, 0, 1, 1);      /* Elements disappearing */
--ease-in-out: cubic-bezier(0.4, 0, 0.2, 1); /* Moving elements */
```

---

## 5. Whitespace Strategy

### Density Level: Moderate

**Rationale:** Email service dashboard perlu balance antara clarity (untuk quick error detection) dan efficiency (banyak data yang ditampilkan: metrics, logs, status). Moderate whitespace memungkinkan developer scan cepat tanpa visual clutter.

| Whitespace Type | Value | Application |
|-----------------|-------|-------------|
| **Macro** (section gaps) | 48-64px | Between dashboard sections |
| **Card padding** | 20px | Inside metric cards |
| **Form group gaps** | 16px | Between email composer fields |
| **List item gaps** | 8px | Between email log entries |
| **Micro** (tight) | 4px | Related inline elements (status + timestamp) |

### Density by Screen Type

| Screen Type | Density | Why |
|-------------|---------|-----|
| Dashboard overview | Moderate | Balance of metrics & visual clarity |
| Email logs | Minimal | Density = more visible entries per screen |
| API docs | Generous | Code readability & focus |

---

## 6. Design Tokens

```css
/* ===========================================
   KOALAMAIL DESIGN TOKENS
   Based on Akordium Neurodesign System
   =========================================== */

/* --- COLOR TOKENS --- */
--color-primary: #2563EB;
--color-primary-hover: #1D4ED8;
--color-primary-light: #3B82F6;
--color-secondary: #6B7280;
--color-accent: #0EA5E9;

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

/* Email Status Specific */
--email-status-delivered: #16A34A;
--email-status-bounced: #DC2626;
--email-status-pending: #F59E0B;
--email-status-opened: #3B82F6;

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
--card-padding: 20px;
--section-gap: 48px;
--form-group-gap: 16px;
--list-item-gap: 8px;

/* --- VISUAL WEIGHT (5-LAYER HIERARCHY) --- */
--focal-size: 48px;       /* Layer 1: Delivery rate - ONE per screen */
--primary-size: 30px;     /* Layer 2: Key metrics (2-3 elements) */
--secondary-size: 18px;   /* Layer 3: Email list (4-6 elements) */
--supporting-size: 14px;  /* Layer 4: Timestamps, status */
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
| **Focal Point** | Delivery Rate percentage (large, top-center) |
| **Eye Pattern** | F-Pattern (metrics → email list) |
| **Primary Actions** | "Send Email" button (top-left), "View Logs" (secondary) |
| **Key Metrics** | Open rate, Click rate, Bounce rate (Layer 2 cards) |

### Email Logs

| Element | Specification |
|---------|---------------|
| **Focal Point** | Status filter badges (All/Delivered/Bounced) |
| **Pattern** | F-Pattern (scan status column vertically) |
| **CTAs** | "Resend" (left), "View Details" (row action) |

### API Documentation

| Element | Specification |
|---------|---------------|
| **Focal Point** | Code snippet example (pre-formatted, highlighted) |
| **Pattern** | F-Pattern (scan endpoints vertically) |
| **CTAs** | "Get API Key" (prominent), "Copy Code" (inline) |

### Email Composer

| Element | Specification |
|---------|---------------|
| **Focal Point** | "To" field (primary recipient) |
| **Pattern** | F-Pattern (top to bottom form flow) |
| **CTAs** | "Send" (bottom-right, primary), "Preview" (secondary) |

---

## 8. Peak Moment Design

Based on Peak-End Rule: Users remember the **peak moment** and the **ending**, not the average.

### Peak Moment: Email Successfully Sent

| Moment | Implementation |
|--------|----------------|
| **Trigger** | Send API call returns 200 OK |
| **Visual** | Green checkmark scales up from center + "Email sent!" text |
| **Duration** | 400ms animation, then subtle badge remains |
| **Micro-copy** | "Email sent successfully! Open rate: --%" |

### Peak Moment: 100% Delivery Rate Milestone

| Moment | Implementation |
|--------|----------------|
| **Trigger** | Delivery rate reaches exactly 100% (rare!) |
| **Visual** | Full-screen confetti + "Perfect Delivery!" badge |
| **Duration** | 600ms celebration |
| **Micro-copy** | "100% delivery rate! You're crushing it. 🎯" |

### Ending Design

| Moment | Implementation |
|--------|----------------|
| **Trigger** | Logout / session end |
| **Message** | "Goodbye! Your emails are still being delivered." |
| **Tone** | Reassuring - reminds of reliability even when away |

---

## 9. Accessibility Requirements

| Requirement | Standard |
|-------------|----------|
| Contrast Ratio | WCAG AA minimum (4.5:1 for text) |
| Focal Points | AAA contrast (7:1) - critical for metrics |
| Interactive Elements | Minimum 44px touch target |
| Focus States | Visible 2px blue focus ring (#2563EB) |
| Motion | Respect `prefers-reduced-motion` |
| Color Independence | Email status not indicated by color alone (use icons + text) |

---

## 10. Implementation Checklist

- [ ] Blue-gray color palette applied
- [ ] Geist font family loaded and used
- [ ] Single focal point per screen (delivery rate or equivalent)
- [ ] F-Pattern applied to dashboard and email logs
- [ ] Moderate whitespace density maintained
- [ ] Motion used sparingly (only for success/error feedback)
- [ ] Peak moment designed for email sent
- [ ] Design tokens implemented in CSS
- [ ] AAA contrast for focal metrics
- [ ] Accessible status indicators (not color-only)

---

## 11. Behavioral Design Techniques

### Ethical Design Note

Email marketing products should lean toward **Sticky** design because the goal is effective communication, not keeping users constantly in the app. Focus on value creation rather than engagement farming.

### Technique Matrix

| # | Technique | Applied | Implementation |
|---|-----------|---------|----------------|
| 1 | Anticipation Loop | ✅ | Campaign sending progress, analytics loading |
| 2 | Invisible Personalization | ✅ | Send time optimization, subject line suggestions |
| 3 | Streak + Loss Aversion | ✅ | Weekly campaign streak (keep your subscribers engaged) |
| 4 | Emotional Character | ✅ | Koala mascot for celebration moments (light usage) |
| 5 | Variable Reward Notification | ✅ | Campaign milestone, high open rate achieved |
| 6 | Social Proof Counter | ✅ | Emails sent, open rates, subscribers managed |
| 7 | Annual Wrapped | ✅ | Yearly campaign performance summary |
| 8 | Personalization Surprise | ✅ | "Your best performing subject line was..." |
| 9 | Flash Sale Countdown | ❌ | NOT applicable |
| 10 | Social Commerce | ✅ | Agency plan referral |
| 11 | Gentle Nudge | ✅ | Campaign schedule reminder, list cleanup suggestion |

### 1. Anticipation Loop

**Use Cases:**
- Campaign sending progress (0% → 100% to 10,000 subscribers)
- Analytics loading when opening performance dashboard
- Email list import progress

**Implementation:**
```
Sending campaign...
███░░░░░░░░░ 30% (3,000 / 10,000 emails sent)

Progress bar + ETA + real-time counter
```

**Do's:**
- Show actual progress with percentage and absolute numbers
- Provide realistic ETA based on current velocity
- Allow cancellation without data loss

**Don'ts:**
- Fake progress that jumps artificially
- Hide progress behind spinners without context
- Block user from navigating away during send

---

### 2. Invisible Personalization

**Use Cases:**
- Send time optimization based on subscriber engagement patterns
- Subject line suggestions using historical performance data
- Smart segmentation based on user behavior

**Implementation:**
```
"Best time to send: Tuesday 10:00 AM (based on your subscribers' engagement)"

"Subject line suggestion: 'Your weekly summary' (historically 23% higher open rate)"
```

**Do's:**
- Make suggestions feel helpful, not intrusive
- Provide clear rationale for recommendations
- Allow easy override with one click

**Don'ts:**
- Make changes without user awareness
- Hide what data is used for personalization
- Remove user agency in final decisions

---

### 3. Streak + Loss Aversion

**Use Cases:**
- Weekly campaign streak (keep your subscribers engaged)
- Consecutive weeks with campaigns sent
- Monthly newsletter consistency tracker

**Implementation:**
```
🔥 8-week streak! Keep your subscribers engaged.

Send this week's campaign to maintain your streak.
```

**Do's:**
- Frame streak around value to subscribers (not app usage)
- Show streak impact on engagement metrics
- Make streak recovery clear after break

**Don'ts:**
- Use guilt or FOMO to drive sends
- Hide streak reset conditions
- Prioritize streak over send quality

---

### 4. Emotional Character

**Use Cases:**
- Koala mascot for celebration moments (light usage)
- Success/celebration screens for campaign milestones
- Error states with helpful, friendly guidance

**Implementation:**
```
Campaign milestone reached! 🐨

You've sent 100,000 emails through KoalaMail.
Your subscribers love hearing from you.
```

**Do's:**
- Use character sparingly for peak moments only
- Maintain professional tone for B2B context
- Ensure character adds value, not decoration

**Don'ts:**
- Overuse mascot in critical workflows
- Let character distract from metrics/tasks
- Use character for serious error messages

---

### 5. Variable Reward Notification

**Use Cases:**
- Campaign milestone achievements
- High open rate notifications
- Unusual engagement patterns detected

**Implementation:**
```
🎉 New record!

Your campaign just hit a 45% open rate.
That's 12% higher than your average.
```

**Do's:**
- Celebrate meaningful milestones, not arbitrary ones
- Contextualize achievement against user's baseline
- Link celebration to action (e.g., "Analyze what worked")

**Don'ts:**
- Celebrate trivial metrics (e.g., "You opened the app today!")
- Use celebrations for dark pattern re-engagement
- Hide reward conditions from users

---

### 6. Social Proof Counter

**Use Cases:**
- Total emails sent counter
- Open rate benchmarks against similar senders
- Subscriber growth metrics

**Implementation:**
```
Your account stats:
• 1,247,832 emails sent
• 34.2% avg. open rate (top 20% of senders)
• 12,456 active subscribers
```

**Do's:**
- Show proof that builds trust in platform reliability
- Use real data from user's account only
- Contextualize metrics (percentages, not just raw numbers)

**Don'ts:**
- Fabricate or exaggerate social proof
- Use other users' data without consent
- Show competitive rankings that create anxiety

---

### 7. Annual Wrapped

**Use Cases:**
- Yearly campaign performance summary
- Subscriber growth over 12 months
- Top performing content/themes

**Implementation:**
```
Your 2025 in KoalaMail

You sent 156 campaigns to 24,000 subscribers
Your best subject line: "Your weekly summary" (52% open rate)
Your most engaged month: December (holiday campaigns)

[View full report]
```

**Do's:**
- Deliver wrapped in January, not random times
- Focus on insights, not vanity metrics
- Make it shareable for business reporting

**Don'ts:**
- Gate insights behind premium features
- Use wrapped for upselling without clear value
- Include irrelevant or confusing metrics

---

### 8. Personalization Surprise

**Use Cases:**
- "Your best performing subject line was..."
- Audience insight discoveries
- Unexpected optimization opportunities

**Implementation:**
```
We noticed something interesting:

Your emails sent on Tuesdays at 10 AM
perform 23% better than your average.

Try scheduling your next campaign for this time.
```

**Do's:**
- Surprise with genuinely useful insights
- Base surprises on actual user data
- Make action clear and easy to take

**Don'ts:**
- Fabricate insights for engagement
- Use surprise for feature promotion
- Deliver insights when user can't act on them

---

### 9. Flash Sale Countdown

**Status:** ❌ NOT APPLICABLE

Email marketing platforms should not use urgency tactics for plan upgrades. This contradicts the goal of effective, thoughtful communication.

---

### 10. Social Commerce

**Use Cases:**
- Agency plan referral program
- Team collaboration invitations
- Client onboarding through referrals

**Implementation:**
```
Invite your team:

KoalaMail Agency Plan lets you manage
multiple client accounts in one place.

[Copy invite link]
```

**Do's:**
- Frame referrals around team collaboration benefits
- Provide clear value for both parties
- Make referral process frictionless

**Don'ts:**
- Use aggressive referral prompts
- Hide referral rewards conditions
- Push referrals at inappropriate moments (e.g., during campaign send)

---

### 11. Gentle Nudge

**Use Cases:**
- Campaign schedule reminder
- List cleanup suggestion (inactive subscribers)
- Unfinished campaign draft reminder

**Implementation:**
```
Draft reminder:

You started "March Newsletter" 3 days ago.
Your subscribers are waiting for your updates.

[Continue drafting]  [Snooze]
```

**Do's:**
- Provide clear opt-out (snooze/dismiss)
- Time nudges based on user's actual patterns
- Link directly to relevant action

**Don'ts:**
- Use guilt or urgency language
- Send nudges at inappropriate times
- Make dismissal difficult or hidden

---

### Implementation Priority

| Priority | Techniques | Timeline |
|----------|------------|----------|
| P0 (Core) | 1, 5, 6, 11 | Launch - essential for user trust |
| P1 (Enhancement) | 2, 3, 7, 8 | Post-launch - drives engagement |
| P2 (Nice-to-have) | 4, 10 | When core features stable |

---

*Based on: [neurodesign-uiux-guide.md](../_templates/neurodesign-uiux-guide.md)*

*Last Updated: 2026-03-03*
*Document Version: 1.0*
