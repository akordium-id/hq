# Akordium Design System

> Neurodesign-based visual hierarchy untuk Website Perusahaan Akordium Lab

**Category:** Internal

**Related:** [neurodesign-uiux-guide.md](../_templates/neurodesign-uiux-guide.md)

---

## 1. Visual Identity

### Color Palette

| Role | Color | Hex | Neuroscience Rationale |
|------|-------|-----|------------------------|
| Primary | Gray | `#6B7280` | Warna abu-abu melambangkan profesionalisme, keseimbangan, dan kestabilan - sangat cocok untuk website perusahaan yang ingin terlihat modern, reliable, dan tidak terlalu agresif |
| Secondary | Navy | `#1E3A5F` | Memberikan kedalaman dan kepercayaan - warna navy klasik yang sering digunakan oleh perusahaan teknologi dan consulting untuk kesan expertise |
| Accent | Electric Blue | `#3B82F6` | Menambahkan sentuhan modern dan teknologi untuk highlight penting seperti CTA, links, atau elemen interaktif |
| Background | Off-White | `#F9FAFB` | Clean dan neutral untuk konten perusahaan yang padat (services, portfolio) |
| Text Primary | Dark Navy | `#0F172A` | Kontras maksimal untuk keterbacaan pada latar terang |
| Text Secondary | Cool Gray | `#475569` | Untuk teks pendukung dengan kontras yang cukup |

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

**Typography Rationale:** Geist adalah font modern, clean, dan highly readable yang sempurna untuk website perusahaan teknologi. Font ini memiliki karakter professional tapi tetap approachable, dengan excellent legibility di berbagai ukuran. Sangat cocok untuk brand yang ingin terlihat modern dan tech-savvy.

---

## 2. Visual Hierarchy (5-Layer)

### Layer Definitions

| Layer | Use Case | Size | Weight | Contrast |
|-------|----------|------|--------|----------|
| **1. Focal Point** | Hero message / Value proposition utama | 48px | Bold | 7:1 (AAA) |
| **2. Primary** | Nama service / CTA utama | 30px | Medium | 4.5:1 (AA) |
| **3. Secondary** | Deskripsi service / Detail portfolio | 18px | Regular | 4.5:1 (AA) |
| **4. Supporting** | Testimoni / Tech stack / Timeline | 14px | Light | 3:1 |
| **5. UI Chrome** | Navigation, footer, metadata | 12px | Regular | 3:1 |

### Focal Point Strategy

**Single Focal Element per Screen:** Hero statement atau value proposition utama perusahaan

```
Example:
┌─────────────────────────────────────┐
│                                     │
│  DEVELOPMENT SERVICES THAT MATTER    │  ← Layer 1: Hero (Focal Point)
│  Kami membangun solusi digital       │
│  untuk bisnis Indonesia             │
│                                     │
│  ┌─────────┐  ┌─────────┐          │  ← Layer 2: Primary CTAs
│  │LATEST   │  │CONTACT  │          │
│  │WORK     │  │US       │          │
│  └─────────┘  └─────────┘          │
│                                     │
│  Web Development • Mobile Apps      │  ← Layer 3: Services
│  Cloud Infrastructure • Consulting  │
│                                     │
└─────────────────────────────────────┘
```

### Anti-Patterns to Avoid

- ❌ **Christmas Tree Effect:** Semua service/CTA highlighted = tidak ada focal point
- ❌ **Flat Hierarchy:** Semua konten ukuran sama = pengunjung bingung apa yang ditawarkan
- ❌ **Hidden CTA:** Tombol contact tersembunyi di antara konten lain

---

## 3. Eye Tracking Pattern

### Primary Pattern: Z-Pattern

**Rationale:** Z-Pattern sangat cocok untuk landing page perusahaan karena pengunjung cenderung memindai dari kiri atas (logo/brand) ke kanan atas (navigation/CTA), lalu ke tengah (hero message/value proposition), dan akhirnya ke kanan bawah (tombol aksi utama). Pattern ini mengikuti alur baca alami dan memaksimalkan konversi.

### Pattern Application

#### Z-Pattern - Untuk Landing Page

```
┌──────────────────────────────────────┐
│ AKORDIUM LAB    →→→    CONTACT US    │  ← Zone 1: First impression + CTA
│                      ↘                │
│     DEVELOPMENT SERVICES THAT         │
│     MATTER FOR INDONESIAN BUSINESS    │
│                   ↙                   │
│ OUR SERVICES    →→→   VIEW PORTFOLIO  │  ← Zone 4: Conversion
└──────────────────────────────────────┘
```

### Key Rules

- **Most important message** (hero/value prop) = top horizontal scan (Zone 1-2)
- **Most important action** (contact/CTA) = top-right dan bottom-right (Zones 1 & 4)
- **Never hide critical info** di bottom-left corner (blind spot)

---

## 4. Motion Guidelines

### When to Use Motion

| Use Case | Animation Type | Duration |
|----------|---------------|----------|
| Loading states | Skeleton shimmer dengan efek gray-blue | Continuous |
| Success feedback | Subtle checkmark dengan glow | 300ms max |
| Error indication | Shake dengan pulse merah | 200ms |
| Page transitions | Fade/slide dengan subtle blue tint | 250ms |
| Button hover | Scale dengan subtle glow | 150ms |
| Scroll animations | Fade-in elements saat scroll | 400ms |

### When NOT to Use Motion

- ❌ Background decorative animations (mengganggu fokus pada konten)
- ❌ Auto-playing carousels tanpa pause
- ❌ Continuous motion saat membaca services/portfolio
- ❌ Apa pun yang mengalihkan perhatian dari value proposition

### Easing Presets

```css
--ease-out: cubic-bezier(0, 0, 0.2, 1);     /* Elements appearing */
--ease-in: cubic-bezier(0.4, 0, 1, 1);      /* Elements disappearing */
--ease-in-out: cubic-bezier(0.4, 0, 0.2, 1); /* Moving elements */
```

---

## 5. Whitespace Strategy

### Density Level: Moderate

**Rationale:** Whitespace moderate menciptakan balance antara professionalism dan efficiency - penting untuk website perusahaan yang harus terlihat established tapi juga informative dan action-oriented. Tidak terlalu longgar (seperti luxury brand) dan tidak terlalu padat (seperti dashboard), tapi tepat untuk corporate website.

| Whitespace Type | Value | Application |
|-----------------|-------|-------------|
| **Macro** (section gaps) | 64-80px | Antara section utama (hero, services, portfolio) |
| **Card padding** | 24px | Inside card components (service cards, portfolio) |
| **Form group gaps** | 16px | Antara form fields (contact form) |
| **List item gaps** | 12px | Antara list items (service features, tech stack) |
| **Micro** (tight) | 4-8px | Related inline elements (badges, tags) |

### Density by Product Category

| Category | Density | Why |
|----------|---------|-----|
| Internal (Akordium) | Moderate | Balance professionalism & efficiency |
| Wedding/Heritage | Generous | Whitespace = trust, premium, respect |
| Commerce/Action | Minimal | Density = energy & urgency |

---

## 6. Design Tokens

```css
/* ===========================================
   AKORDIUM DESIGN TOKENS
   Based on Akordium Neurodesign System
   =========================================== */

/* --- COLOR TOKENS --- */
--color-primary: #6B7280;
--color-primary-hover: #4B5563;
--color-primary-light: #9CA3AF;
--color-secondary: #1E3A5F;
--color-accent: #3B82F6;

--color-background: #F9FAFB;
--color-surface: #FFFFFF;
--color-surface-elevated: #F0F4F8;

--color-text-primary: #0F172A;
--color-text-secondary: #475569;
--color-text-muted: #94A3B8;

/* Semantic Colors (Consistent Across All Products) */
--color-success: #16A34A;
--color-warning: #D97706;
--color-error: #DC2626;
--color-info: #2563EB;

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
--card-padding: 24px;
--section-gap: 72px;
--form-group-gap: 16px;
--list-item-gap: 12px;

/* --- VISUAL WEIGHT (5-LAYER HIERARCHY) --- */
--focal-size: 48px;       /* Layer 1: ONE per screen */
--primary-size: 30px;     /* Layer 2: 2-3 elements */
--secondary-size: 18px;   /* Layer 3: 4-6 elements */
--supporting-size: 14px;  /* Layer 4: Supporting info */
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
--shadow-sm: 0 1px 2px rgba(107, 114, 128, 0.05);
--shadow-md: 0 4px 6px rgba(107, 114, 128, 0.1);
--shadow-lg: 0 10px 15px rgba(107, 114, 128, 0.15);
--shadow-xl: 0 20px 25px rgba(107, 114, 128, 0.2);
```

---

## 7. Per-Screen Specifications

### Homepage/Landing

| Element | Specification |
|---------|---------------|
| **Focal Point** | Hero message "Development Services That Matter" di tengah atas |
| **Eye Pattern** | Z-Pattern (dari hero ke CTA) |
| **Primary Actions** | Tombol "Contact Us" dan "View Portfolio" dengan accent blue |
| **Key Metrics** | Years experience, projects completed (Layer 2) |

### Services Page

| Element | Specification |
|---------|---------------|
| **Focal Point** | Service yang sedang di-hover/select |
| **Pattern** | F-Pattern (untuk scanning daftar services) |
| **CTAs** | Tombol "Discuss Project" di kiri atas (bukan kanan) |

### Portfolio Page

| Element | Specification |
|---------|---------------|
| **Focal Point** | Featured project di tengah atas |
| **Pattern** | Z-Pattern (dari featured ke list projects) |
| **CTAs** | Tombol "View Case Study" pada setiap project card |

### Contact Page

| Element | Specification |
|---------|---------------|
| **Focal Point** | Contact form atau contact info utama |
| **Pattern** | Z-Pattern (dari form ke CTA submit) |
| **CTAs** | Tombol "Send Message" di kanan bawah form |

---

## 8. Peak Moment Design

Based on Peak-End Rule: Users remember the **peak moment** and the **ending**, not the average.

### Peak Moment: Contact Form Submitted

| Moment | Implementation |
|--------|----------------|
| **Trigger** | User berhasil mengirim contact form |
| **Visual** | Full-screen success message dengan subtle checkmark animation |
| **Duration** | 400ms animation |
| **Micro-copy** | "Pesan terkirim! Tim kami akan menghubungi Anda dalam 1x24 jam." |

### Peak Moment: Portfolio Case Study Viewed

| Moment | Implementation |
|--------|----------------|
| **Trigger** | User membuka detail case study portfolio |
| **Visual** | Smooth transition dengan hero image reveal |
| **Duration** | 300ms animation |
| **Micro-copy** | (Tidak perlu, fokus pada konten case study) |

### Ending Design

| Moment | Implementation |
|--------|----------------|
| **Trigger** | User meninggalkan website (exit intent atau page close) |
| **Message** | (Tidak perlu untuk corporate website) |
| **Tone** | Professional, straightforward |

---

## 9. Accessibility Requirements

| Requirement | Standard |
|-------------|----------|
| Contrast Ratio | WCAG AA minimum (4.5:1 for text) |
| Focal Points | AAA contrast (7:1) |
| Interactive Elements | Minimum 44px touch target |
| Focus States | Visible focus ring dengan warna accent blue |
| Motion | Respect `prefers-reduced-motion` |

---

## 10. Implementation Checklist

- [ ] Colors match category palette (Gray, Navy, Blue)
- [ ] Single focal point per screen (Hero message/Service)
- [ ] Eye tracking pattern applied (Z-Pattern untuk landing, F-Pattern untuk services)
- [ ] Whitespace density appropriate (Moderate)
- [ ] Motion used sparingly (professional, tidak berlebihan)
- [ ] Peak moment designed (Contact form submitted)
- [ ] Design tokens implemented in CSS
- [ ] Accessibility requirements met

---

## 11. Behavioral Design Techniques

> **Category:** B2B/Serious - Value-creating design
>
> **Ethical Design Note:** B2B products should lean toward **Sticky** design karena fokus pada value creation dan trust building, bukan engagement manipulation.

### Technique Applicability Matrix

| # | Technique | Applicable | Implementation | Priority |
|---|-----------|------------|----------------|----------|
| 1 | Anticipation Loop | ✅ Yes | Loading portfolio/projects reveal | Medium |
| 2 | Invisible Personalization | ✅ Yes | Project recommendations for returning visitors | Low |
| 3 | Streak + Loss Aversion | ❌ No | Not applicable for corporate website | N/A |
| 4 | Emotional Character | ❌ No | Not applicable for corporate website | N/A |
| 5 | Variable Reward Notification | ❌ No | No notification system | N/A |
| 6 | Social Proof Counter | ✅ Yes | Client logos, project count, years experience | High |
| 7 | Annual Wrapped | ✅ Yes | Client success stories yearly summary | Medium |
| 8 | Personalization Surprise | ✅ Yes | Relevant case studies based on browsing | Low |
| 9 | Flash Sale Countdown | ❌ No | No sales mechanism | N/A |
| 10 | Social Commerce | ❌ No | Not applicable for B2B services | N/A |
| 11 | Gentle Nudge | ✅ Yes | Newsletter subscription reminders | Low |

### Applicable Techniques

#### 1. Anticipation Loop ⚡

**Concept:** Build anticipation during loading states to increase perceived value and reduce abandonment.

**Implementation for Akordium:**

```css
/* Portfolio loading animation with progressive reveal */
.portfolio-skeleton {
  animation: shimmer 1.5s ease-in-out infinite;
  background: linear-gradient(90deg, #F0F4F8 25%, #E2E8F0 50%, #F0F4F8 75%);
}

@keyframes shimmer {
  0% { background-position: -200% 0; }
  100% { background-position: 200% 0; }
}

.portfolio-item {
  opacity: 0;
  transform: translateY(20px);
  animation: revealUp 0.4s ease-out forwards;
}

@keyframes revealUp {
  to {
    opacity: 1;
    transform: translateY(0);
  }
}
```

**When to Use:**
- Loading portfolio grid on homepage
- Filtering projects by category/tech stack
- Loading case study details

**Neuroscience Rationale:** Anticipation triggers dopamine release, making the final reveal more rewarding and memorable.

---

#### 2. Invisible Personalization 🔍

**Concept:** Personalize experience without asking for explicit preferences, using behavioral data.

**Implementation for Akordium:**

```javascript
// Track visited projects to recommend similar work
const trackProjectView = (projectId, category, techStack) => {
  const viewed = JSON.parse(localStorage.getItem('viewedProjects') || '[]');
  viewed.push({ projectId, category, techStack, timestamp: Date.now() });
  localStorage.setItem('viewedProjects', JSON.stringify(viewed));
};

// Recommend similar projects based on browsing history
const recommendProjects = () => {
  const viewed = JSON.parse(localStorage.getItem('viewedProjects') || '[]');
  const preferences = analyzePreferences(viewed);

  return projects.filter(p =>
    p.category === preferences.topCategory ||
    p.techStack.some(t => preferences.topTechStack.includes(t))
  ).slice(0, 3);
};
```

**When to Use:**
- Show "Recommended for You" section on portfolio page
- Highlight relevant case studies based on previously viewed projects

**Neuroscience Rationale:** Implicit personalization reduces cognitive load while increasing relevance perception.

---

#### 6. Social Proof Counter 📊

**Concept:** Display social proof metrics to build trust and credibility.

**Implementation for Akordium:**

```html
<!-- Hero section with social proof -->
<div class="social-proof-bar">
  <div class="metric">
    <span class="value">5+</span>
    <span class="label">Years Experience</span>
  </div>
  <div class="metric">
    <span class="value">50+</span>
    <span class="label">Projects Delivered</span>
  </div>
  <div class="metric">
    <span class="value">20+</span>
    <span class="label">Happy Clients</span>
  </div>
</div>

<!-- Client logos section -->
<div class="client-logos">
  <img src="/clients/logo1.svg" alt="Client 1" loading="lazy">
  <img src="/clients/logo2.svg" alt="Client 2" loading="lazy">
  <!-- More client logos -->
</div>
```

**When to Use:**
- Hero section (below value proposition)
- Before contact form
- Footer of every page

**Neuroscience Rationale:** Social proof activates herd mentality and reduces decision-making anxiety in B2B contexts.

---

#### 7. Annual Wrapped 🎁

**Concept:** Yearly summary that creates emotional connection and re-engagement.

**Implementation for Akordium:**

```html
<!-- Year in Review section (shown in January/February) -->
<section class="annual-wrapped">
  <h2>2025: Year in Review</h2>
  <div class="wrapped-stats">
    <div class="stat-card">
      <span class="stat">15</span>
      <span class="label">Projects Launched</span>
    </div>
    <div class="stat-card">
      <span class="stat">3</span>
      <span class="label">New Technologies Mastered</span>
    </div>
    <div class="stat-card">
      <span class="stat">98%</span>
      <span class="label">Client Satisfaction</span>
    </div>
  </div>
  <div class="success-stories">
    <h3>Featured Success Stories</h3>
    <!-- Top 3 client success stories from the year -->
  </div>
</section>
```

**When to Use:**
- January/February (beginning of year)
- Company anniversary
- Before major business quarters

**Neuroscience Rationale:** Recapitulation creates narrative coherence and positive retrospective evaluation.

---

#### 8. Personalization Surprise 🎯

**Concept:** Delight users with unexpected, relevant content based on implicit signals.

**Implementation for Akordium:**

```javascript
// Show relevant case study based on referrer or time
const showPersonalizedCaseStudy = () => {
  const referrer = document.referrer;
  const hour = new Date().getHours();

  // If coming from LinkedIn (business context)
  if (referrer.includes('linkedin')) {
    return {
      title: 'Enterprise ERP Implementation',
      category: 'Business Solutions',
      relevance: 'Based on your professional network'
    };
  }

  // If visiting during business hours
  if (hour >= 9 && hour <= 17) {
    return {
      title: 'Real-time Analytics Dashboard',
      category: 'Business Intelligence',
      relevance: 'Popular during business hours'
    };
  }

  // Default: most viewed case study
  return getMostViewedCaseStudy();
};
```

**When to Use:**
- Homepage "Featured Case Study" section
- Portfolio page header
- After viewing 3+ projects

**Neuroscience Rationale:** Surprise relevance triggers dopamine and increases perceived intelligence of the system.

---

#### 11. Gentle Nudge 💡

**Concept:** Subtle, non-intrusive prompts for desirable actions.

**Implementation for Akordium:**

```html
<!-- Exit intent newsletter signup -->
<div class="newsletter-nudge" id="newsletterNudge">
  <div class="nudge-content">
    <h3>Stay Updated</h3>
    <p>Get latest insights on web development and technology trends.</p>
    <form id="newsletterForm">
      <input type="email" placeholder="Your email address" required>
      <button type="submit">Subscribe</button>
    </form>
    <button class="dismiss" aria-label="Close">✕</button>
  </div>
</div>

<script>
// Show nudge on exit intent (desktop) or after 30 seconds (mobile)
let hasShownNudge = false;

document.addEventListener('mouseout', (e) => {
  if (e.clientY < 10 && !hasShownNudge) {
    showNudge();
  }
});

setTimeout(() => {
  if (!hasShownNudge && isMobile()) {
    showNudge();
  }
}, 30000);
</script>
```

**When to Use:**
- Exit intent on homepage
- After reading a case study
- 30-45 seconds into session (mobile only)

**Neuroscience Rationale:** Gentle prompts leverage reciprocity bias without triggering reactance.

---

### Non-Applicable Techniques

#### 3. Streak + Loss Aversion ❌

**Not Applicable:** Corporate websites don't have daily engagement patterns. Streak mechanics would feel forced and inappropriate for B2B context.

**Alternative:** Focus on **Social Proof Counter** and **Annual Wrapped** to build long-term trust instead of daily engagement.

---

#### 4. Emotional Character ❌

**Not Applicable:** Corporate website maintains professional tone. Character-based interactions would undermine credibility.

**Alternative:** Use **consistent visual identity** and **professional micro-copy** to build brand personality without personification.

---

#### 5. Variable Reward Notification ❌

**Not Applicable:** No notification system exists for corporate website. Push notifications would be intrusive for B2B visitors.

**Alternative:** **Personalization Surprise** and **Invisible Personalization** provide relevance without notification dependency.

---

#### 9. Flash Sale Countdown ❌

**Not Applicable:** B2B services don't use sales mechanics. Urgency tactics reduce trust in professional services context.

**Alternative:** **Gentle Nudge** for contact form or newsletter subscription is more appropriate for B2B.

---

#### 10. Social Commerce ❌

**Not Applicable:** Akordium provides services, not e-commerce products. Social buying mechanics don't translate to service-based B2B.

**Alternative:** **Social Proof Counter** (client logos, testimonials, metrics) builds trust appropriate for service sales.

---

### Implementation Priority

**High Priority (Must Have):**
1. **Social Proof Counter** - Critical for B2B trust building
2. **Anticipation Loop** - Improves perceived quality of portfolio

**Medium Priority (Should Have):**
3. **Annual Wrapped** - Strengthens client relationships
4. **Personalization Surprise** - Differentiates from competitors

**Low Priority (Nice to Have):**
5. **Gentle Nudge** - Secondary conversion optimization
6. **Invisible Personalization** - Enhanced user experience

---

*Based on: [neurodesign-uiux-guide.md](../_templates/neurodesign-uiux-guide.md)*

*Last Updated: 2026-03-03*
*Document Version: 1.0*
