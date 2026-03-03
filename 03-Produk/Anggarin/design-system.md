# Anggarin Design System

> Neurodesign-based visual hierarchy untuk Aplikasi Perencanaan Keuangan Pribadi

**Category:** Finance

**Related:** [neurodesign-uiux-guide.md](../_templates/neurodesign-uiux-guide.md)

---

## 1. Visual Identity

### Color Palette

| Role | Color | Hex | Neuroscience Rationale |
|------|-------|-----|------------------------|
| Primary | Growth Green | `#16A34A` | Memicu respons positif dan kepercayaan, diasosiasikan dengan pertumbuhan finansial dan keamanan |
| Secondary | Navy Trust | `#1E3A5F` | Warna biru tua meningkatkan rasa tenang dan stabilitas, cocok untuk manajemen keuangan |
| Accent | Amber Alert | `#D97706` | Untuk peringatan budget dan notifikasi penting tanpa terlalu agresif |
| Background | Pure White | `#FFFFFF` | Kanvas bersih untuk data keuangan yang kompleks |
| Surface | Light Gray | `#F9FAFB` | Memisahkan section tanpa kontras yang keras |
| Text Primary | Dark Navy | `#0F172A` | Kontras tinggi untuk keterbacaan data angka |
| Text Secondary | Slate Gray | `#64748B` | Informasi pendukung dengan kontras sedang |

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
| Display/Hero | Geist / DM Sans | 48px | Bold (700) |
| H1 | Geist / DM Sans | 38px | Semibold (600) |
| H2 | Geist / DM Sans | 30px | Semibold (600) |
| H3 | Geist / DM Sans | 24px | Medium (500) |
| Body Large | Geist / DM Sans | 18px | Regular (400) |
| Body | Geist / DM Sans | 16px | Regular (400) |
| Caption/Meta | Geist / DM Sans | 12px | Regular (400) |

**Typography Rationale:** Geist dan DM Sans adalah geometric sans-serif yang bersih dan modern, sangat cocok untuk aplikasi keuangan. Bentuk geometris yang konsisten memudahkan pembacaan angka dan data. Geist dirancang khusus untuk readability di UI digital, sedangkan DM Sans adalah alternatif open-source dengan karakteristik serupa.

---

## 2. Visual Hierarchy (5-Layer)

### Layer Definitions

| Layer | Use Case | Size | Weight | Contrast |
|-------|----------|------|--------|----------|
| **1. Focal Point** | "Total Saldo" atau "Sisa Anggaran" | 48px | Bold | 7:1 (AAA) |
| **2. Primary** | Metric utama (Pemasukan, Pengeluaran, Tabungan) | 30px | Medium | 4.5:1 (AA) |
| **3. Secondary** | Detail transaksi, kategori, tanggal | 18px | Regular | 4.5:1 (AA) |
| **4. Supporting** | Meta info (timestamp, catatan kecil) | 14px | Light | 3:1 |
| **5. UI Chrome** | Navigation, borders, label sekunder | 12px | Regular | 3:1 |

### Focal Point Strategy

**Single Focal Element per Screen:** Angka "Total Saldo" atau "Sisa Anggaran Bulan Ini" yang paling menonjol di dashboard.

```
Example:
┌─────────────────────────────────────┐
│                                     │
│     RP 15.750.000                   │  ← Layer 1: Focal Point
│     Sisa Anggaran Bulan Ini         │     (Total Saldo/Sisa Budget)
│                                     │
│  ┌─────────┐  ┌─────────┐          │  ← Layer 2: Primary Metrics
│  │ Rp 8Jt  │  │ Rp 5Jt  │          │     (Pemasukan, Pengeluaran)
│  │ Masuk   │  │ Keluar  │          │
│  └─────────┘  └─────────┘          │
│                                     │
│  Transaksi terakhir:                │  ← Layer 3: Secondary Info
│  • Transfer Bank BCA - Rp 500.000   │
│  • Belanja Online - Rp 250.000      │
│                                     │
└─────────────────────────────────────┘
```

### Anti-Patterns to Avoid

- ❌ **Christmas Tree Effect:** Semua angka bold dan berwarna = tidak ada fokus
- ❌ **Flat Hierarchy:** Semua elemen sama besar = user bingung mulai dari mana
- ❌ **Hidden CTA:** Tombol "Tambah Transaksi" tidak menonjol

---

## 3. Eye Tracking Pattern

### Primary Pattern: F-Pattern

**Rationale:** F-Pattern paling cocok untuk dashboard keuangan karena user scan data secara vertikal di sisi kiri untuk kategori, lalu membaca angka-angka penting secara horizontal di bagian atas.

### Pattern Application

#### F-Pattern - Dashboard Keuangan

```
┌──────────────────────────────────────┐
│ ████████████████████████████████████ │  ← Horizontal scan 1: Total Saldo (most important)
│ ████████████████████                 │  ← Horizontal scan 2: Metric sekunder
│ █                                    │
│ █  Kategori      │   Jumlah          │  ← Vertical scan: List transaksi
│ █  Makanan       │   Rp 500.000      │
│ █  Transport     │   Rp 250.000      │
│ █  Hiburan       │   Rp 150.000      │
└──────────────────────────────────────┘
```

### Key Rules

- **Most important metric** (Total Saldo/Sisa Anggaran) = top horizontal scan penuh
- **Most important action** (Tambah Transaksi) = left side atau floating button
- **Never hide critical info** di bottom-right corner (blind spot area)

---

## 4. Motion Guidelines

### When to Use Motion

| Use Case | Animation Type | Duration |
|----------|---------------|----------|
| Loading states | Skeleton shimmer (green tint) | Continuous |
| Success feedback (transaksi berhasil) | Micro-confetti + checkmark | 300ms max |
| Budget terlampaui (warning) | Shake/pulse + amber glow | 200ms |
| Page transitions | Fade/slide | 250ms |
| Button hover | Scale/glow (green) | 150ms |
| Chart animations | Progressive fill | 400ms |

### When NOT to Use Motion

- ❌ Background decorative animations
- ❌ Auto-playing carousels tanpa pause
- ❌ Continuous motion saat membaca angka
- ❌ Animasi yang mengganggu focal point (Total Saldo)

### Easing Presets

```css
--ease-out: cubic-bezier(0, 0, 0.2, 1);     /* Elements appearing */
--ease-in: cubic-bezier(0.4, 0, 1, 1);      /* Elements disappearing */
--ease-in-out: cubic-bezier(0.4, 0, 0.2, 1); /* Moving elements */
```

---

## 5. Whitespace Strategy

### Density Level: Moderate

**Rationale:** Density moderate untuk aplikasi keuangan karena:
1. Cukup whitespace untuk readability data yang kompleks
2. Tidak terlalu sparse agar user bisa melihat banyak informasi sekaligus
3. Balance antara clarity (trust) dan efficiency (productivity)

| Whitespace Type | Value | Application |
|-----------------|-------|-------------|
| **Macro** (section gaps) | 64-96px | Antara section major (Dashboard, Transaksi, Budget) |
| **Card padding** | 24px | Inside card metric |
| **Form group gaps** | 16px | Antara field form tambah transaksi |
| **List item gaps** | 12px | Antara item transaksi |
| **Micro** (tight) | 4-8px | Related inline elements (icon + text) |

### Density by Product Category

| Category | Density | Why |
|----------|---------|-----|
| Trust-based (Finance) | Moderate | Whitespace cukup untuk trust, tapi tidak terlalu generous seperti Islamic apps |
| Commerce/Action | Minimal | Density = energy & urgency |
| Standard | Moderate | Balance clarity & efficiency |

---

## 6. Design Tokens

```css
/* ===========================================
   ANGGARIN DESIGN TOKENS
   Based on Akordium Neurodesign System
   =========================================== */

/* --- COLOR TOKENS --- */
--color-primary: #16A34A;
--color-primary-hover: #15803D;
--color-primary-light: #22C55E;
--color-secondary: #1E3A5F;
--color-accent: #D97706;

--color-background: #FFFFFF;
--color-surface: #F9FAFB;
--color-surface-elevated: #F0FDF4;

--color-text-primary: #0F172A;
--color-text-secondary: #64748B;
--color-text-muted: #94A3B8;

/* Semantic Colors (Consistent Across All Products) */
--color-success: #16A34A;
--color-warning: #D97706;
--color-error: #DC2626;
--color-info: #2563EB;

/* --- TYPOGRAPHY TOKENS --- */
--font-display: 'Geist', 'DM Sans', system-ui, sans-serif;
--font-body: 'Geist', 'DM Sans', system-ui, sans-serif;

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
--focal-size: 48px;       /* Layer 1: ONE per screen - "Total Saldo" */
--primary-size: 30px;     /* Layer 2: 2-3 elements - Metrics utama */
--secondary-size: 18px;   /* Layer 3: 4-6 elements - Detail transaksi */
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
--shadow-sm: 0 1px 2px rgba(0, 0, 0, 0.05);
--shadow-md: 0 4px 6px rgba(0, 0, 0, 0.1);
--shadow-lg: 0 10px 15px rgba(0, 0, 0, 0.1);
--shadow-xl: 0 20px 25px rgba(0, 0, 0, 0.15);

/* --- FINANCE SPECIFIC TOKENS --- */
--chart-line-width: 3px;
--chart-grid-color: #E2E8F0;
--positive-trend: #16A34A;
--negative-trend: #DC2626;
--neutral-trend: #64748B;
```

---

## 7. Per-Screen Specifications

### Dashboard/Home

| Element | Specification |
|---------|---------------|
| **Focal Point** | "Total Saldo" atau "Sisa Anggaran Bulan Ini" - 48px bold, green (#16A34A) |
| **Eye Pattern** | F-Pattern - Total saldo di top horizontal, kategori di vertical left |
| **Primary Actions** | Floating Action Button (FAB) kanan bawah "Tambah Transaksi" dengan icon plus |
| **Key Metrics** | Pemasukan Bulan Ini, Pengeluaran Bulan Ini, Tabungan (30px medium) |

### Transaksi Detail

| Element | Specification |
|---------|---------------|
| **Focal Point** | Nominal transaksi (Rp 500.000) - 48px bold |
| **Pattern** | F-Pattern - Nominal di top, detail transaksi di bawah |
| **CTAs** | "Edit" dan "Hapus" di bottom sheet atau modal |

### Budget Planning

| Element | Specification |
|---------|---------------|
| **Focal Point** | Total budget allocated vs spent (bar chart besar) |
| **Pattern** | F-Pattern - Chart di top, list kategori di bawah |
| **CTAs** | "Atur Budget" per kategori dengan toggle/tappable rows |

### Tambah Transaksi (Form)

| Element | Specification |
|---------|---------------|
| **Focal Point** | Input nominal (paling menonjol, large text) |
| **Pattern** | Z-Pattern - Nominal → Kategori → Deskripsi → Simpan |
| **CTAs** | Primary button "Simpan" di bottom, full width |

---

## 8. Peak Moment Design

Based on Peak-End Rule: Users remember the **peak moment** and the **ending**, not the average.

### Peak Moment: Mencapai Target Tabungan

| Moment | Implementation |
|--------|----------------|
| **Trigger** | User berhasil mencapai target tabungan yang telah ditetapkan |
| **Visual** | Full-screen celebration dengan confetti, progress bar hijau penuh, angka target tercapai berkedip |
| **Duration** | 400ms animation |
| **Micro-copy** | "Selamat! 🎯 Target tabungan kamu tercapai. Konsisten ya!" |

### Peak Moment: Tambah Transaksi Berhasil

| Moment | Implementation |
|--------|----------------|
| **Trigger** | Transaksi berhasil disimpan |
| **Visual** | Checkmark animation dengan green glow, brief toast notification |
| **Duration** | 300ms animation |
| **Micro-copy** | "Transaksi berhasil dicatat" |

### Ending Design

| Moment | Implementation |
|--------|----------------|
| **Trigger** | User logout atau menutup aplikasi |
| **Message** | "Sampai jumpa lagi! Semoga keuangan kamu sehat terus 💚" |
| **Tone** | Warm, encouraging, friendly |

---

## 9. Accessibility Requirements

| Requirement | Standard |
|-------------|----------|
| Contrast Ratio | WCAG AA minimum (4.5:1 for text) |
| Focal Points | AAA contrast (7:1) untuk Total Saldo dan metric penting |
| Interactive Elements | Minimum 44px touch target (mobile-friendly) |
| Focus States | Visible focus ring (green outline) |
| Motion | Respect `prefers-reduced-motion` for animations |
| Color Blindness | Gunakan icon/shape selain color untuk status (trend up/down) |

---

## 10. Implementation Checklist

- [ ] Colors match Finance palette (Green primary, Navy secondary)
- [ ] Single focal point per screen (Total Saldo/Sisa Anggaran)
- [ ] F-Pattern applied for dashboard
- [ ] Moderate whitespace density
- [ ] Motion used sparingly dan purposeful
- [ ] Peak moment designed (target tabungan tercapai)
- [ ] Design tokens implemented in CSS/Tailwind
- [ ] Accessibility requirements met (contrast 7:1 untuk focal)

---

## 11. Behavioral Design Techniques

Based on behavioral science and neuromarketing principles, these techniques increase engagement and retention. For finance products like Anggarin, we lean toward **Sticky** design (helping users achieve financial goals) rather than addictive patterns.

### Technique Applicability for Anggarin

| Technique | Applied | Priority | Notes |
|-----------|---------|----------|-------|
| 1. Anticipation Loop | ✅ Yes | High | Budget calculation loading, savings goal progress |
| 2. Invisible Personalization | ✅ Yes | High | Budget category suggestions based on spending |
| 3. Streak + Loss Aversion | ✅ Yes | Medium | Daily expense logging streak |
| 4. Emotional Character | ✅ Yes | Low | Savings mascot that celebrates milestones |
| 5. Variable Reward Notification | ✅ Yes | Medium | Budget milestone achieved, savings tip |
| 6. Social Proof Counter | ✅ Yes | Low | Users who achieved savings goals |
| 7. Annual Wrapped | ✅ Yes | High | Yearly financial summary (very powerful for finance apps) |
| 8. Personalization Surprise | ✅ Yes | Medium | Weekly Insight: "You spent less on X this week" |
| 9. Flash Sale Countdown | ❌ No | N/A | Not applicable - finance product |
| 10. Social Commerce | ❌ No | N/A | Not applicable - finance product |
| 11. Gentle Nudge | ✅ Yes | High | Daily expense logging reminder, savings motivation |

---

### 1. Anticipation Loop

**Principle:** Dopamine release happens during anticipation, not just reward. Build anticipation to make the reward moment more powerful.

**Anggarin Implementation:**

| Use Case | Trigger | Anticipation Mechanism | Reward |
|----------|---------|------------------------|--------|
| **Budget Calculation** | User navigates to dashboard | Skeleton loading with "Menghitung anggaran bulan ini..." | Animated reveal of total saldo with green glow |
| **Savings Goal Progress** | User adds money to savings goal | Progress bar fills gradually (not instantly) | Celebration animation when 100% reached |
| **Monthly Report Generation** | User clicks "Lihat Laporan Bulanan" | "Menganalisis 47 transaksi..." counter incrementing | Beautiful charts with insights |

**Implementation Notes:**
- Loading duration: 400-800ms (long enough to build anticipation, short enough to not annoy)
- Use skeleton screens with green tint for brand consistency
- Add micro-copy during loading: "Menghitung...", "Menganalisis..."

---

### 2. Invisible Personalization

**Principle:** Personalization that happens without explicit input creates "This app knows me" feeling - powerful for retention.

**Anggarin Implementation:**

| Feature | Data Used | Personalization Output |
|---------|-----------|------------------------|
| **Smart Category Suggestions** | Historical spending patterns | Suggest "Makan Siang" when user logs expense at 12pm weekday |
| **Budget Recommendations** | Income + spending history | Suggest budget allocations based on actual behavior |
| **Insight Highlights** | Transaction patterns | "Kamu biasanya spend lebih di weekend" |
| **Recurring Transaction Detection** | Transaction frequency | Auto-tag "Gaji", "Bayar Kos", "Langganan" |

**Implementation Notes:**
- No explicit setup required - works from first transaction
- Always allow user override (never force suggestions)
- Show "Suggestion" label to be transparent

---

### 3. Streak + Loss Aversion

**Principle:** People are more motivated by NOT losing something than gaining something. Streaks create loss aversion.

**Anggarin Implementation:**

| Feature | Streak Type | Loss Aversion Mechanic |
|---------|-------------|------------------------|
| **Daily Expense Logging** | Consecutive days logging expenses | "🔥 7 hari streak! Jangan sampe putus" |
| **Budget Under Limit** | Weeks staying within budget | "4 minggu berturut-tetap di bawah budget!" |
| **Savings Consistency** | Months adding to savings | "6 bulan nabung rutin - jangan break!" |

**Visual Indicators:**
- Fire icon for streak (7+ days)
- Shield icon for budget consistency
- Calendar view with filled circles for streak days
- Warning notification: "Streak kamu mau putus besok!"

**Implementation Notes:**
- Forgiveness mechanic: Allow 1 skip day without breaking streak (use bonus streak token)
- Start celebrating from day 3 (early wins)
- Show streak prominently on dashboard

---

### 4. Emotional Character

**Principle:** Characters create emotional connection. When they celebrate, users feel celebrated.

**Anggarin Implementation:**

**Character: "Tabu" - Smart Savings Owl**

| Moment | Tabu Behavior |
|--------|---------------|
| **App Onboarding** | Tabu waves: "Hai! Aku Tabu, bantu atur keuanganmu ya" |
| **First Transaction** | Tabu cheers: "Nice! Catat pertama kamu ✨" |
| **Savings Goal Reached** | Tabu does celebration dance: "WOHOOO! Target tercapai! 🎉" |
| **Budget Over** | Tabu looks concerned: "Oops, budget warning nih ⚠️" |
| **Weekly Summary** | Tabu with magnifying glass: "Minggu ini hemat banget!" |
| **Streak Milestone** | Tabu wears party hat: "30 hari STREAK! Juara banget!" |

**Character Guidelines:**
- Always friendly, never judgmental
- Celebrate wins enthusiastically
- Gently encourage without guilt
- Appear in key moments only (don't overuse)

**Implementation Notes:**
- Optional toggle: Users can disable character if preferred
- Character style: Minimalist owl in brand colors (green + navy)

---

### 5. Variable Reward Notification

**Principle:** Unpredictable rewards trigger more dopamine than predictable ones (Skinner box effect).

**Anggarin Implementation:**

| Reward Type | Trigger | Content | Frequency |
|-------------|---------|---------|-----------|
| **Budget Milestone** | Reach 50%, 75%, 100% of category budget | Confetti + "Hebat! Budget Makanan aman ✅" | Monthly (per category) |
| **Savings Tip** | Random time after app opens | "Tips: Pake envelope method untuk kontrol" | Weekly |
| **Insight Surprise** | Random day | "Fakta unik: Kamu hemat 30% dari bulan lalu!" | Weekly |
| **Milestone Badge** | Achieve certain number of transactions | "50 transaksi tercatat! 🏅" | One-time per badge |
| **Streak Celebration** | Every 7 days streak | "7 hari straight! Konsisten banget!" | Weekly (if active streak) |

**Implementation Notes:**
- Randomize delivery time (not same day/time)
- Variety in reward types (not just one pattern)
- Keep rewards valuable (not fluff)
- Allow user to control notification frequency

---

### 6. Social Proof Counter

**Principle:** "Others are doing it" creates FOMO and validates behavior.

**Anggarin Implementation:**

| Placement | Social Proof Copy | Purpose |
|-----------|-------------------|---------|
| **Onboarding** | "Bergabung dengan 2.547 orang yang atur keuangan" | Validation |
| **Savings Goal** | "1.234 orang telah capai target tabungan bulan ini" | Motivation |
| **Budget Feature** | "892 user aktif pakai budget mingguan ini" | Feature adoption |
| **Achievement** | "Kamu salah satu dari 156 user dengan 30-day streak!" | Exclusivity |

**Implementation Notes:**
- Use real numbers (never fake)
- Update numbers daily or weekly
- Position near relevant actions
- For smaller user base, use percentage instead: "80% user aktif capai target bulan ini"

---

### 7. Annual Wrapped

**Principle:** Yearly summaries create powerful emotional connection and viral sharing. Extremely effective for finance apps.

**Anggarin Implementation:**

**"Anggarin Wrapped" - Yearly Financial Summary**

| Section | Content | Visual |
|---------|---------|--------|
| **Hero** | "2025: Tahun Keuanganmu" with total money managed | Large animated number, confetti |
| **Top Category** | "Pengeluaran terbesar: Makanan (Rp 12.5jt)" | Bar chart, emoji icon |
| **Best Month** | "Bulan paling hemat: Agustus" | Calendar highlight |
| **Savings Win** | "Total tabungan tahun ini: Rp 25jt" | Growth chart, celebration |
| **Streak Record** | "Streak terpanjang: 47 hari" | Trophy icon |
| **Unique Insight** | "Kamu 35% lebih hemat dari user lain" | Comparison badge |
| **Prediction** | "2026 prediction: If trend continues..." | Forward-looking chart |
| **Shareable Card** | Instagram Stories format | Branded template |

**Delivery Timing:**
- Release on December 31 or January 1
- Push notification: "Anggarin Wrapped 2025 ready! 🎉"
- In-app splash screen for first open of new year

**Shareability:**
- Beautiful, Instagram-ready design
- Include user handle/name
- Branded Anggarin footer
- Share button with "Share to IG Story" CTA

**Implementation Notes:**
- Data accuracy is critical (double-check all calculations)
- Make it feel like a gift, not a report
- Include both achievements and gentle improvement areas
- Generate unique URL for each user

---

### 8. Personalization Surprise

**Principle:** "The app noticed something about me" creates connection. Different from regular personalization because it's unexpected.

**Anggarin Implementation:**

| Surprise | Trigger | Example Copy |
|----------|---------|--------------|
| **Weekly Insight** | Open app after week of spending | "Fakta: Kamu spend 40% less di Makanan minggu ini 💪" |
| **Pattern Detection** | After 3 similar transactions | "Kamu selalu beli kopi Senin pagi. Mau auto-catat?" |
| **Progress Comparison** | Month over month | "Lebih hemat 15% dari bulan lalu. Nice work!" |
| **Habit Recognition** | Consistent behavior | "3 bulan nabung rutin - ini jadi kebiasaan bagus!" |
| **Anomaly Detection** | Unusual spending | "Pengeluaran weekend ini 2x biasanya. All good?" |

**Implementation Notes:**
- Timing: Show when user opens app, not push notification
- Make insights actually useful (not fluff)
- Always actionable (include "Lihat detail" or "Atur budget")
- Keep variety high (rotate through different insight types)
- Store shown insights to avoid repetition

---

### 9. Flash Sale Countdown

**Status:** ❌ **NOT APPLICABLE** for Anggarin

**Reason:** Finance products should not use urgency tactics like flash sales. Financial decisions require calm, rational thinking - not pressure.

---

### 10. Social Commerce

**Status:** ❌ **NOT APPLICABLE** for Anggarin

**Reason:** Not a commerce product. Social features should focus on community support and accountability, not selling.

**Alternative:** Consider optional "Savings Buddy" feature where users can optionally share progress with a friend for accountability (with clear privacy controls).

---

### 11. Gentle Nudge

**Principle:** Timely, helpful reminders that feel like assistance, not harassment.

**Anggarin Implementation:**

| Nudge Type | Timing | Copy | Frequency Cap |
|------------|--------|------|---------------|
| **Daily Logging** | Evening (7-9pm) if no expenses logged | "Catat pengeluaran hari ini yuk! 2 menit aja 💚" | Once per day |
| **Savings Motivation** | Weekly, if savings progress stalled | "Target liburan kemana? Nabung dikit aja tiap minggu" | Once per week |
| **Budget Warning** | When 80% of category budget used | "Budget Makanan tinggal 20%. Masih 10 hari lagi" | Once per category per month |
| **Monthly Review** | Start of month | "Cek anggaran bulan ini yuk. Atur budget sekarang" | Once per month |
| **Streak Warning** | Before streak breaks | "Catat sekarang biar streak 7 hari kamu aman! 🔥" | Once per day max |
| **Bill Reminder** | 2 days before recurring bill | "Bayar Netflix 2 hari lagi. Siapkan Rp 180k" | Per bill |

**Channel Strategy:**

| Channel | Use For | Preference Level |
|---------|---------|------------------|
| **Push Notification** | Daily logging, streak warnings, bill reminders | Allow user control frequency |
| **In-App Banner** | Budget warnings, monthly review | Non-intrusive, dismissible |
| **Email** | Weekly/monthly summary, annual wrapped | Low frequency, high value only |
| **SMS** | Only if user explicitly opts in | Critical alerts only |

**Implementation Notes:**
- Always include "Manage Notifications" deep link
- Respect user's quiet hours (no late night/early morning)
- Learn from user behavior: if they always dismiss, stop sending
- Use AI timing: Send when user typically opens app
- Allow full "mute all" option for privacy-focused users

---

### Ethical Design Note: Sticky vs. Addictive

**For Finance Products, aim for STICKY design:**

| Sticky (Good) | Addictive (Avoid) |
|---------------|-------------------|
| Helps user achieve financial goals | Makes user compulsively check app |
- User returns because it's useful | - User returns out of anxiety |
- Reinforces healthy financial habits | - Creates FOMO if not checking |
- Saves user time | - Wastes user time |
- User feels in control | - User feels controlled |

**Anggarin Design Philosophy:**
- Build for **long-term financial health**, not short-term engagement metrics
- Celebrate real wins (savings goals reached), not fake wins (opened app 5 times today)
- Notifications should be **helpful**, not attention-seeking
- User should feel **empowered**, not addicted

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
*Document Version: 1.2*
