# Klustera Design System

> Neurodesign-based visual hierarchy untuk Platform Manajemen Event & Komunitas

**Category:** B2B/Serious - Community Management

**Related:** [neurodesign-uiux-guide.md](../_templates/neurodesign-uiux-guide.md)

---

## 1. Visual Identity

### Color Palette

| Role | Color | Hex | Neuroscience Rationale |
|------|-------|-----|------------------------|
| Primary | Deep Blue (Trust & Connection) | `#0D5C4D` | Warna biru tua melambangkan kepercayaan dan stabilitas, cocok untuk platform komunitas profesional. Biru membantu menurunkan anxiety dan meningkatkan sense of belonging. |
| Secondary | Coral (Community Energy) | `#D4AF37` | Coral melambangkan energi komunitas dan kehangatan koneksi antar anggota. Memberikan kesan welcoming namun tetap profesional. |
| Accent | Warm Orange | `#E8C547` | Aksen yang lebih terang untuk highlight tombol aksi dan elemen interaktif, mempertahankan nuansa energy namun tetap visible. |
| Background | Light Gray/White | `#FAF8F5` | Latar belakang bersih yang memberikan kesan profesional dan modern, memudahkan keterbacaan konten event dan komunitas. |
| Surface | Off-White | `#FFFFFF` | Surface untuk kartu dan panel konten, memberikan kontras yang cukup untuk keterbacaan. |
| Text Primary | Deep Charcoal | `#1A1A2E` | Teks utama dengan kontras tinggi untuk keterbacaan maksimal, namun tetap soft di mata. |
| Text Secondary | Slate Gray | `#6B7280` | Teks sekunder untuk informasi pendukung, memberikan hierarki visual yang jelas. |
| Text Muted | Light Gray | `#9CA3AF` | Teks muted untuk elemen non-kritis seperti placeholder dan label sekunder. |

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
| Display/Hero | Lora | 48px | Bold (700) |
| H1 | Lora | 38px | Semibold (600) |
| H2 | Lora | 30px | Semibold (600) |
| H3 | Lora | 24px | Medium (500) |
| Body Large | Inter | 18px | Regular (400) |
| Body | Inter | 16px | Regular (400) |
| Caption/Meta | Inter | 12px | Regular (400) |

**Typography Rationale:**
- **Lora untuk Headings:** Font serif yang elegan dengan nuansa heritage dan tradisi, cocok untuk produk komunitas yang menghargai nilai bersama. Lora memberikan kesan premium dan terpercaya.
- **Inter untuk Body:** Sans-serif modern yang sangat readable, memberikan keseimbangan antara tradisi (Lora) dan modernitas (Inter). Inter memastikan kenyamanan membaca untuk informasi kompleks seperti tagihan dan laporan keuangan.

---

## 2. Visual Hierarchy (5-Layer)

### Layer Definitions

| Layer | Use Case | Size | Weight | Contrast |
|-------|----------|------|--------|----------|
| **1. Focal Point** | QR code untuk scan / Nominal tagihan | 48px | Bold | 7:1 (AAA) |
| **2. Primary** | Status pembayaran, jumlah yang harus dibayar | 30px | Medium | 4.5:1 (AA) |
| **3. Secondary** | Detail tagihan, tanggal jatuh tempo | 18px | Regular | 4.5:1 (AA) |
| **4. Supporting** | Meta info, timestamps, labels | 14px | Light | 3:1 |
| **5. UI Chrome** | Navigation, borders, divider lines | 12px | Regular | 3:1 |

### Focal Point Strategy

**Single Focal Element per Screen:** QR code untuk pembayaran di resident portal, atau total tagihan yang harus dibayar di dashboard warga.

```
Example: Portal Pembayaran Warga
┌─────────────────────────────────────────────┐
│                                             │
│         ┌─────────────┐                    │  ← Layer 1: QR Code (Focal Point)
│         │  [QR CODE]  │                    │
│         │   Scan to   │                    │
│         │    Pay      │                    │
│         └─────────────┘                    │
│                                             │
│     Rp 1.250.000                           │  ← Layer 2: Jumlah Tagihan (Primary)
│     Tagihan Bulan Ini                       │
│                                             │
│  IPL: Rp 500K | Kebersihan: Rp 250K ...    │  ← Layer 3: Detail Tagihan
│                                             │
│  Jatuh tempo: 5 Maret 2026                 │  ← Layer 4: Supporting Info
│                                             │
└─────────────────────────────────────────────┘
```

### Anti-Patterns to Avoid

- ❌ **Christmas Tree Effect:** Semua elemen bold/highlighted = tidak ada focal point yang jelas
- ❌ **Flat Hierarchy:** Semua elemen sama besar = otak bingung harus mulai dari mana
- ❌ **Hidden CTA:** Tombol bayar atau QR code tertimbun di antara elemen lain

---

## 3. Eye Tracking Pattern

### Primary Pattern: F-Pattern

**Rationale:** Dashboard Klustera berisi banyak informasi keuangan dan status yang perlu dipindai secara sistematis. F-Pattern memungkinkan warga melihat QR code dan nominal tagihan di bagian atas, lalu memindai ke bawah untuk detail tambahan.

### Pattern Application

#### F-Pattern - Untuk Dashboard Warga & Portal Pembayaran

```
┌──────────────────────────────────────┐
│ ████████████████████████████████████ │  ← Horizontal scan 1 (QR Code & Tagihan)
│ [QR]      Rp 1.250.000              │
│                                       │
│ ██████████████████████                │  ← Horizontal scan 2 (Status & Detail)
│ Lunas: 5/10  |  Jatuh tempo: ...     │
│ █                                    │
│ █  Riwayat Pembayaran                 │  ← Vertical scan (Daftar konten)
│ █  - Feb 2026: Rp 1.250.000 (Lunas)  │
│ █  - Jan 2026: Rp 1.250.000 (Lunas)  │
│ █  - Des 2025: Rp 1.200.000 (Lunas)  │
└──────────────────────────────────────┘
```

#### Z-Pattern - Untuk Landing Page & Halaman Marketing

```
┌──────────────────────────────────────┐
│ Klustera          →→→    Daftar Kompleks │  ← Zone 1: First impression
│                    ↘                    │
│  Manajemen Kompleks Tanpa Ribet       │
│                   ↙                    │
│  Mulai Gratis    →→→   Demo Produk     │  ← Zone 4: Conversion
└──────────────────────────────────────┘
```

### Key Rules

- **QR Code & Nominal Tagihan** = horizontal scan pertama (focal point)
- **Tombol aksi utama** = sisi kiri atau dekat QR code (bukan bottom-right)
- **Jangan sembunyikan info kritis** seperti jatuh tempo di pojok kanan bawah

---

## 4. Motion Guidelines

### When to Use Motion

| Use Case | Animation Type | Duration |
|----------|---------------|----------|
| Loading states | Skeleton shimmer dengan warna teal | Continuous |
| Success feedback (pembayaran berhasil) | Micro-confetti dengan warna gold | 300ms max |
| Error indication | Shake/pulse dengan warna merah lembut | 200ms |
| Page transitions | Fade/slide smooth | 250ms |
| Button hover | Scale/glow dengan efek gold | 150ms |
| QR code refresh | Smooth fade transition | 400ms |

### When NOT to Use Motion

- ❌ Background decorative animations (distracting dari konten)
- ❌ Auto-playing carousels tanpa pause (kontrol user hilang)
- ❌ Continuous motion saat membaca laporan (mengganggu fokus)
- ❌ Apapun yang mengalihkan perhatian dari focal point (QR code)

### Easing Presets

```css
--ease-out: cubic-bezier(0, 0, 0.2, 1);     /* Elements appearing */
--ease-in: cubic-bezier(0.4, 0, 1, 1);      /* Elements disappearing */
--ease-in-out: cubic-bezier(0.4, 0, 0.2, 1); /* Moving elements */
```

---

## 5. Whitespace Strategy

### Density Level: Generous

**Rationale:** Sebagai produk trust-based (community management), whitespace yang luas melambangkan transparansi, kejelasan, dan professional feel. Whitespace memudahkan anggota komunitas memproses informasi event dan koneksi yang penting.

| Whitespace Type | Value | Application |
|-----------------|-------|-------------|
| **Macro** (section gaps) | 64-96px | Antara section utama dashboard |
| **Card padding** | 24px | Inside kartu event dan community info |
| **Form group gaps** | 16px | Antara field di form event creation |
| **List item gaps** | 12px | Antara item di daftar event/member |
| **Micro** (tight) | 4-8px | Elemen inline yang terkait erat |

### Density by Product Category

| Category | Density | Why |
|----------|---------|-----|
| Trust-based (Islamic, Finance) | Generous | Whitespace = trust & premium |
| Commerce/Action (POS, Marketing) | Minimal | Density = energy & urgency |
| Standard | Moderate | Balance of clarity & efficiency |

---

## 6. Design Tokens

```css
/* ===========================================
   KLASTERA DESIGN TOKENS
   Based on Akordium Neurodesign System
   =========================================== */

/* --- COLOR TOKENS --- */
/* Primary - Islamic Heritage Teal */
--color-primary: #0D5C4D;
--color-primary-hover: #0A4A3D;
--color-primary-light: #1A7A65;
--color-primary-lighter: #E8F5F1;

/* Secondary - Noble Gold */
--color-secondary: #D4AF37;
--color-secondary-hover: #B8952F;
--color-secondary-light: #E8C547;

/* Accent - Warm Gold */
--color-accent: #E8C547;
--color-accent-hover: #D4AF37;

/* Backgrounds */
--color-background: #FAF8F5;      /* Cream/warm white */
--color-surface: #FFFFFF;         /* Pure white for cards */
--color-surface-elevated: #FFFFFF;

/* Text */
--color-text-primary: #1A1A2E;    /* Deep charcoal */
--color-text-secondary: #6B7280;  /* Slate gray */
--color-text-muted: #9CA3AF;      /* Light gray */

/* Semantic Colors (Consistent Across All Products) */
--color-success: #16A34A;
--color-warning: #D97706;
--color-error: #DC2626;
--color-info: #2563EB;

/* --- TYPOGRAPHY TOKENS --- */
--font-display: 'Lora', 'Times New Roman', serif;
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
--focal-size: 48px;       /* Layer 1: ONE per screen - QR Code / Tagihan */
--primary-size: 30px;     /* Layer 2: 2-3 elements - Status, nominal */
--secondary-size: 18px;   /* Layer 3: 4-6 elements - Detail tagihan */
--supporting-size: 14px;  /* Layer 4: Supporting info - Meta, timestamps */
--chrome-size: 12px;      /* Layer 5: UI Chrome - Nav, borders */

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
--shadow-sm: 0 1px 2px rgba(13, 92, 77, 0.05);
--shadow-md: 0 4px 6px rgba(13, 92, 77, 0.1);
--shadow-lg: 0 10px 15px rgba(13, 92, 77, 0.1);
--shadow-xl: 0 20px 25px rgba(13, 92, 77, 0.15);
```

---

## 7. Per-Screen Specifications

### Dashboard Warga (Resident Portal)

| Element | Specification |
|---------|---------------|
| **Focal Point** | QR code untuk scan pembayaran (large, center, prominent) |
| **Eye Pattern** | F-Pattern - QR di atas, riwayat pembayaran di bawah |
| **Primary Actions** | "Bayar Sekarang" / "Lihat Detail" (tombol primary gold) |
| **Key Metrics** | Tagihan bulan ini, Status pembayaran, Jatuh tempo (Layer 2) |

### Dashboard Pengurus (Property Manager)

| Element | Specification |
|---------|---------------|
| **Focal Point** | Total iuran terkumpul bulan ini / Collection rate % |
| **Pattern** | F-Pattern - Summary keuangan di atas, detail di bawah |
| **Primary Actions** | "Buat Invoice Baru" / "Lihat Laporan" (tombol primary teal) |
| **Key Metrics** | Total billed, Total collected, Outstanding AR, Collection rate |

### Halaman Pembayaran (Payment Page)

| Element | Specification |
|---------|---------------|
| **Focal Point** | QR code besar untuk scan (center, dengan instruction) |
| **Pattern** | Z-Pattern - QR di atas, detail di tengah, tombol cancel di bawah |
| **CTAs** | "Close" / "Batalkan" (tombol secondary) |

### Halaman Akses Kontrol (Security Post Mode)

| Element | Specification |
|---------|---------------|
| **Focal Point** | Scanner QR code / Input confirmation code (large input) |
| **Pattern** | F-Pattern - Scanner di atas, log akses di bawah |
| **CTAs** | "Verify" / "Allow Entry" (tombol primary teal) |

---

## 8. Peak Moment Design

Based on Peak-End Rule: Users remember the **peak moment** and the **ending**, not the average.

### Peak Moment: Event Registration Berhasil

| Moment | Implementation |
|--------|----------------|
| **Trigger** | User berhasil registrasi ke event |
| **Visual** | Full-screen celebration dengan micro-confetti, ikon checkmark |
| **Duration** | 400ms animation |
| **Micro-copy** | "Kamu terdaftar! Sampai jumpa di event." |
| **Secondary Message** | "3 orang lain dari komunitasmu juga akan hadir." (social proof) |

### Secondary Peak Moment: New Member Joined

| Moment | Implementation |
|--------|----------------|
| **Trigger** | Anggota baru bergabung ke komunitas |
| **Visual** | Card slide-in dengan avatar dan welcome message |
| **Duration** | 300ms animation |
| **Micro-copy** | "Selamat datang, [Nama]!" |
| **Secondary Message** | "Komunitasmu sekarang memiliki 152 anggota." |

### Ending Design

| Moment | Implementation |
|--------|----------------|
| **Trigger** | Logout atau menutup aplikasi |
| **Message** | "Sampai jumpa! Semoga komunitasmu terus bertumbuh." |
| **Tone** | Warm, encouraging, community-focused |

---

## 9. Accessibility Requirements

| Requirement | Standard |
|-------------|----------|
| Contrast Ratio | WCAG AA minimum (4.5:1 for text) |
| Focal Points | AAA contrast (7:1) |
| Interactive Elements | Minimum 44px touch target |
| Focus States | Visible focus ring dengan warna teal |
| Motion | Respect `prefers-reduced-motion` |
| Color Blindness | Tidak hanya mengandalkan warna untuk info penting |
| QR Code | Minimum 200x200px untuk scannability |

---

## 10. Implementation Checklist

- [ ] Colors match B2B/Serious category palette (Blue + Coral)
- [ ] Single focal point per screen (Event CTA / Community Stats)
- [ ] Eye tracking pattern applied (F-Pattern for dashboard)
- [ ] Whitespace density appropriate (Generous untuk trust)
- [ ] Motion used sparingly (300ms max untuk micro-animations)
- [ ] Peak moment designed (Event registration celebration)
- [ ] Design tokens implemented in CSS
- [ ] Accessibility requirements met (WCAG AA)
- [ ] Typography pairing correct (Lora + Inter)
- [ ] Background light tone applied (#FAF8F5)
- [ ] Behavioral design techniques implemented appropriately

---

## 11. Behavioral Design Techniques

Klustera menggunakan behavioral design techniques untuk meningkatkan engagement komunitas tanpa manipulasi. Sebagai produk B2B/Serious untuk community management, fokusnya adalah membantu membangun koneksi komunitas yang genuine, bukan artificial engagement.

### 11.1 Applied Techniques

| # | Technique | Klustera Implementation | Ethical Note |
|---|-----------|------------------------|--------------|
| 1 | **Anticipation Loop** | Event countdown timer di halaman event, loading state dengan progress indicator saat registrasi event | Creates excitement without false urgency |
| 2 | **Invisible Personalization** | Event recommendations berdasarkan jenis event yang dihadiri sebelumnya, komunitas yang relevan dengan lokasi/user interest | Helpful without being creepy |
| 3 | **Streak + Loss Aversion** | Light version: "3 event berturut-turut" badge untuk anggota aktif, tanpa penalty untuk inactivity | Encourages consistency, not addiction |
| 4 | **Emotional Character** | **NOT APPLICABLE** - Professional B2B tool should maintain neutral, trustworthy persona | N/A |
| 5 | **Variable Reward Notification** | "New member joined", "Someone registered for your event", "Event reminder 1 hour before" | Genuine value, not gambling mechanics |
| 6 | **Social Proof Counter** | "152 members in this community", "47 events hosted", "23 active this week" | Transparency builds trust |
| 7 | **Annual Wrapped** | Yearly summary: "Your community grew 47% this year", "You hosted 12 events", "Top 5 most engaged members" | Celebrates genuine growth |
| 8 | **Personalization Surprise** | "Your community grew 25% this month! 🎉", "You've attended 5 tech events this quarter" | Delight through unexpected insight |
| 9 | **Flash Sale Countdown** | Early bird registration countdown: "3 days left for early bird price", "5 spots remaining" | Genuine scarcity, not artificial |
| 10 | **Social Commerce** | Group membership discount: "Get 20% off when 5 members from your community register together" | Encourages community growth |
| 11 | **Gentle Nudge** | "Event starts in 1 hour", "You haven't joined any event this month, here are recommendations", "Member [Name] hasn't been active in 2 weeks" | Helpful, not harassing |

### 11.2 Implementation Guidelines

#### Anticipation Loop - Event Countdown

```
┌───────────────────────────────────────────┐
│  Tech Meetup: Building Scalable Systems   │
│                                           │
│  ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━  │
│  02:14:33 remaining until registration    │
│                                           │
│  [Register Now - Early Bird Rp 150K]     │
└───────────────────────────────────────────┘
```

**Use cases:**
- Event registration page
- Early bird countdown
- Loading state saat memproses registrasi

#### Invisible Personalization - Event Recommendations

```
┌───────────────────────────────────────────┐
│  Recommended for You                      │
│                                           │
│  Based on events you've attended:         │
│  • Tech Meetups (80%)                     │
│  • Design Workshops (60%)                 │
│                                           │
│  [Design Systems Workshop] [Register]    │
│  [Go Best Practices] [Register]          │
└───────────────────────────────────────────┘
```

**Use cases:**
- Dashboard personal recommendations
- Community discovery
- Event feed filtering

#### Streak + Loss Aversion (Light Version)

```
┌───────────────────────────────────────────┐
│  Your Engagement Streak                   │
│                                           │
│  🔥 3 events in a row                    │
│  Attend 1 more this month to keep streak  │
│                                           │
│  Badge: Community Active Member          │
└───────────────────────────────────────────┘
```

**Ethical boundaries:**
- No penalty for losing streak
- No shame messaging
- Focus on celebration, not fear

#### Variable Reward Notification

```
┌───────────────────────────────────────────┐
│  🔔 Notifications                         │
│                                           │
│  • New member: Sarah joined your community│
│  • Event reminder: AI Workshop in 1 hour  │
│  • Achievement: You've hosted 10 events!  │
└───────────────────────────────────────────┘
```

**Notification types:**
- Social: New member, member milestone
- Functional: Event reminder, registration confirmation
- Delightful: Unexpected achievement, community growth

#### Social Proof Counter

```
┌───────────────────────────────────────────┐
│  Jakarta Tech Community                   │
│                                           │
│  👥 152 members                           │
│  📅 47 events hosted                      │
│  ⚡ 23 active this week                   │
│                                           │
│  Recent members:                          │
│  [Avatar] [Avatar] [Avatar] [Avatar]     │
└───────────────────────────────────────────┘
```

**Metrics to display:**
- Total members
- Events hosted
- Active members (this week/month)
- Upcoming events count

#### Annual Wrapped

```
┌───────────────────────────────────────────┐
│  Your 2026 Community Year in Review       │
│                                           │
│  📈 Community grew 47%                    │
│  🎉 You hosted 12 events                  │
│  👥 89 new members joined                 │
│                                           │
│  Top 5 Most Engaged Members:              │
│  1. Sarah (attended 11 events)            │
│  2. Budi (attended 9 events)              │
│  3. Dian (attended 8 events)              │
│  ...                                      │
│                                           │
│  [Share Your Story]                       │
└───────────────────────────────────────────┘
```

**Timing:**
- Send on last week of December
- Include shareable visuals
- Focus on growth and connection

#### Personalization Surprise

```
┌───────────────────────────────────────────┐
│  💡 Community Insight                     │
│                                           │
│  Your community grew 25% this month! 🎉   │
│                                           │
│  That's 12% faster than average growth.   │
│  Keep up the great community building!    │
└───────────────────────────────────────────┘
```

**Trigger conditions:**
- Unexpected growth milestone
- Above-average engagement
- Unique achievement

#### Flash Sale Countdown - Early Bird

```
┌───────────────────────────────────────────┐
│  🎟️ Early Bird Registration               │
│                                           │
│  Design Systems Workshop                  │
│  Regular: Rp 250K                         │
│  Early Bird: Rp 150K (save 40%)          │
│                                           │
│  ⏰ 2 days 14 hours remaining             │
│  🎫 5 spots remaining at this price       │
│                                           │
│  [Register Now - Save Rp 100K]           │
└───────────────────────────────────────────┘
```

**Ethical boundaries:**
- Genuine scarcity (real spot limits)
- Genuine time limit (early bird deadline)
- Clear regular price shown

#### Social Commerce - Group Discount

```
┌───────────────────────────────────────────┐
│  👥 Group Registration Discount           │
│                                           │
│  Get 20% off when 5+ members from         │
│  your community register together         │
│                                           │
│  Progress: 3/5 members registered         │
│  [━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━]      │
│                                           │
│  Share this event:                        │
│  [WhatsApp] [Twitter] [LinkedIn]         │
└───────────────────────────────────────────┘
```

**Benefits:**
- Encourages community growth
- Viral word-of-mouth
- Genuine group discount

#### Gentle Nudge

```
┌───────────────────────────────────────────┐
│  👋 Gentle Reminder                       │
│                                           │
│  You haven't joined any events this       │
│  month. Here are some recommendations:    │
│                                           │
│  • Tech Meetup (Tomorrow)                 │
│  • Design Workshop (Next week)            │
│                                           │
│  [Browse All Events]                      │
└───────────────────────────────────────────┘
```

**Nudge types:**
- Re-engagement: Inactive member reminder
- Event reminder: 1 hour before event
- Community care: Member inactivity alert to admin

### 11.3 Ethical Design Principles

**Klustera follows these ethical boundaries:**

1. **Transparency**: All mechanics are visible and understandable
2. **Genuine Value**: Every technique provides real user value
3. **No Addiction**: No dark patterns or FOMO-based manipulation
4. **User Control**: Users can opt-out of any behavioral feature
5. **Sticky > Addictive**: Focus on genuine community connection, not artificial engagement

**Why Sticky Design for Community Products?**

Community B2B products should lean toward **Sticky** design because:
- Helps build genuine community connections
- Increases user retention through value, not addiction
- Creates sustainable engagement without burnout
- Aligns with professional B2B use cases

---

*Based on: [neurodesign-uiux-guide.md](../_templates/neurodesign-uiux-guide.md)*

*Last Updated: 2026-03-03*
*Document Version: 1.0*
