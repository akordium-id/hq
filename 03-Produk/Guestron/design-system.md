# Guestron Design System

> Neurodesign-based visual hierarchy untuk Manajemen Tamu Pernikahan

**Category:** Wedding

**Related:** [neurodesign-uiux-guide.md](../_templates/neurodesign-uiux-guide.md)

---

## 1. Visual Identity

### Color Palette

| Role | Color | Hex | Neuroscience Rationale |
|------|-------|-----|------------------------|
| Primary | Rose | `#E8B4B8` | Warna romantis dan hangat yang memicu emosi cinta, kelembutan, dan intim - sangat cocok untuk momen pernikahan yang penuh kasih sayang |
| Secondary | Cream | `#F5F5DC` | Memberikan kesan premium, elegan, dan tenang - menciptakan latar belakang yang bersih dan hangat tanpa mengganggu konten utama |
| Accent | Gold | `#D4AF37` | Menambahkan sentuhan mewah dan spesial untuk highlight penting seperti tombol aksi atau elemen dekoratif |
| Background | Cream Light | `#FAFAF0` | Nuansa hangat yang nyaman di mata untuk pengalaman membaca yang lama |
| Text Primary | Charcoal | `#2D3748` | Kontras tinggi untuk keterbacaan maksimal pada latar cream |
| Text Secondary | Warm Gray | `#718096` | Untuk teks pendukung dengan kontras yang cukup tapi tidak dominan |

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
| Display/Hero | Playfair Display | 48px | Bold (700) |
| H1 | Playfair Display | 38px | Semibold (600) |
| H2 | Playfair Display | 30px | Semibold (600) |
| H3 | Inter | 24px | Medium (500) |
| Body Large | Inter | 18px | Regular (400) |
| Body | Inter | 16px | Regular (400) |
| Caption/Meta | Inter | 12px | Regular (400) |

**Typography Rationale:** Playfair Display untuk heading memberikan kesan romantis, klasik, dan elegan yang sangat cocok untuk tema pernikahan. Sementara Inter untuk body text memastikan keterbacaan yang baik dengan tampilan modern yang clean. Kombinasi ini menciptakan harmoni antara keanggunan tradisional dan fungsionalitas modern.

---

## 2. Visual Hierarchy (5-Layer)

### Layer Definitions

| Layer | Use Case | Size | Weight | Contrast |
|-------|----------|------|--------|----------|
| **1. Focal Point** | Countdown pernikahan / Nama pasangan | 48px | Bold | 7:1 (AAA) |
| **2. Primary** | Jumlah tamu terkonfirmasi / Tombol kirim undangan | 30px | Medium | 4.5:1 (AA) |
| **3. Secondary** | Detail tamu (nama, kategori, status) | 18px | Regular | 4.5:1 (AA) |
| **4. Supporting** | Timestamp, catatan kecil | 14px | Light | 3:1 |
| **5. UI Chrome** | Navigation, borders, label input | 12px | Regular | 3:1 |

### Focal Point Strategy

**Single Focal Element per Screen:** Countdown pernikahan atau preview nama pasangan yang akan menikah

```
Example:
┌─────────────────────────────────────┐
│                                     │
│    ANDI & PUTRI                     │  ← Layer 1: Nama pasangan (Focal Point)
│    45 HARI LAGI                     │
│                                     │
│  ┌─────────┐  ┌─────────┐          │  ← Layer 2: Primary metrics
│  │ 120/200 │  │  KIRIM  │          │     (Tamu terkonfirmasi, CTA)
│  │ Hadir   │  │UNDANGAN │          │
│  └─────────┘  └─────────┘          │
│                                     │
│  Daftar tamu terkonfirmasi          │  ← Layer 3: Secondary info
│  • Budi Santono (2 orang)           │
│  • Citra Dewi (1 orang)             │
│                                     │
└─────────────────────────────────────┘
```

### Anti-Patterns to Avoid

- ❌ **Christmas Tree Effect:** Semua elemen bold/highlighted = tidak ada focal point
- ❌ **Flat Hierarchy:** Semua elemen ukuran sama = otak bingung mulai dari mana
- ❌ **Hidden CTA:** Tombol kirim undangan tersembunyi di antara elemen lain

---

## 3. Eye Tracking Pattern

### Primary Pattern: Z-Pattern

**Rationale:** Z-Pattern sangat cocok untuk landing page pernikahan karena pengguna cenderung memindai dari kiri atas (logo/nama pasangan) ke kanan atas (navigasi/CTA), lalu ke tengah (hero message/countdown), dan akhirnya ke kanan bawah (tombol aksi utama). Pattern ini mengikuti alur baca alami dan memaksimalkan konversi.

### Pattern Application

#### Z-Pattern - Untuk Landing Page Preview Wedding

```
┌──────────────────────────────────────┐
│ ANDI & PUTRI     →→→    RSVP/LOGIN   │  ← Zone 1: First impression
│                      ↘                │
│       PREVIEW WEDDING PAGE            │
│          45 HARI LAGI                │
│                   ↙                   │
│ LIHAT DAFTAR   →→→   BUAT UNDANGAN   │  ← Zone 4: Conversion
└──────────────────────────────────────┘
```

### Key Rules

- **Most important element** (nama pasangan/countdown) = top horizontal scan (Zone 1-2)
- **Most important action** (tombol buat undangan) = bottom-right corner (Zone 4)
- **Never hide critical info** di bottom-left corner (blind spot)

---

## 4. Motion Guidelines

### When to Use Motion

| Use Case | Animation Type | Duration |
|----------|---------------|----------|
| Loading states | Skeleton shimmer dengan efek rose | Continuous |
| Success feedback | Confetti dengan warna rose-gold | 300ms max |
| Error indication | Shake lembut dengan pulse merah | 200ms |
| Page transitions | Fade/slide dengan rose tint | 250ms |
| Button hover | Scale dengan glow rose | 150ms |

### When NOT to Use Motion

- ❌ Background decorative animations (mengganggu fokus pada konten pernikahan)
- ❌ Auto-playing carousels tanpa pause
- ❌ Continuous motion saat membaca daftar tamu
- ❌ Apa pun yang mengalihkan perhatian dari focal point

### Easing Presets

```css
--ease-out: cubic-bezier(0, 0, 0.2, 1);     /* Elements appearing */
--ease-in: cubic-bezier(0.4, 0, 1, 1);      /* Elements disappearing */
--ease-in-out: cubic-bezier(0.4, 0, 0.2, 1); /* Moving elements */
```

---

## 5. Whitespace Strategy

### Density Level: Generous

**Rationale:** Whitespace yang luas menciptakan kesan premium, eksklusif, dan romantis - sangat penting untuk produk pernikahan yang bersifat emosional dan sekali seumur hidup. Ruang kosong juga memberikan "ruang bernafas" bagi informasi penting tentang momen spesial.

| Whitespace Type | Value | Application |
|-----------------|-------|-------------|
| **Macro** (section gaps) | 80-120px | Antara section utama (hero, daftar tamu, preview) |
| **Card padding** | 32px | Inside card components (undangan, detail tamu) |
| **Form group gaps** | 24px | Antara form fields (input tamu baru) |
| **List item gaps** | 16px | Antara list items (daftar tamu) |
| **Micro** (tight) | 8-12px | Related inline elements (badge, status) |

### Density by Product Category

| Category | Density | Why |
|----------|---------|-----|
| Wedding (Guestron) | Generous | Whitespace = premium, emosional, dan romantis |
| Commerce/Action | Minimal | Density = energy & urgency |
| Standard | Moderate | Balance of clarity & efficiency |

---

## 6. Design Tokens

```css
/* ===========================================
   GUESTRON DESIGN TOKENS
   Based on Akordium Neurodesign System
   =========================================== */

/* --- COLOR TOKENS --- */
--color-primary: #E8B4B8;
--color-primary-hover: #D4A0A4;
--color-primary-light: #F5D5D8;
--color-secondary: #F5F5DC;
--color-accent: #D4AF37;

--color-background: #FAFAF0;
--color-surface: #FFFFFF;
--color-surface-elevated: #FFFEF8;

--color-text-primary: #2D3748;
--color-text-secondary: #718096;
--color-text-muted: #A0AEC0;

/* Semantic Colors (Consistent Across All Products) */
--color-success: #16A34A;
--color-warning: #D97706;
--color-error: #DC2626;
--color-info: #2563EB;

/* --- TYPOGRAPHY TOKENS --- */
--font-display: 'Playfair Display', Georgia, serif;
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
--space-md: 16px;
--space-lg: 24px;
--space-xl: 48px;
--space-2xl: 64px;
--space-3xl: 96px;

/* Component Spacing */
--card-padding: 32px;
--section-gap: 96px;
--form-group-gap: 24px;
--list-item-gap: 16px;

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
--shadow-sm: 0 1px 2px rgba(232, 180, 184, 0.1);
--shadow-md: 0 4px 6px rgba(232, 180, 184, 0.15);
--shadow-lg: 0 10px 15px rgba(232, 180, 184, 0.2);
--shadow-xl: 0 20px 25px rgba(232, 180, 184, 0.25);
```

---

## 7. Per-Screen Specifications

### Dashboard/Home

| Element | Specification |
|---------|---------------|
| **Focal Point** | Countdown pernikahan dengan nama pasangan di tengah atas |
| **Eye Pattern** | Z-Pattern (diagonal dari nama pasangan ke tombol buat undangan) |
| **Primary Actions** | Tombol "Buat Undangan" dan "Lihat Preview" dengan accent gold |
| **Key Metrics** | Total tamu diundang, tamu terkonfirmasi, RSVP pending (Layer 2) |

### Daftar Tamu

| Element | Specification |
|---------|---------------|
| **Focal Point** | Statistik ringkas (120/200 hadir) |
| **Pattern** | F-Pattern (untuk scanning daftar panjang) |
| **CTAs** | Tombol "Tambah Tamu" di kiri atas (bukan kanan) |

### Preview Wedding Page

| Element | Specification |
|---------|---------------|
| **Focal Point** | Preview hero section dengan nama pasangan besar |
| **Pattern** | Z-Pattern (dari preview ke tombol edit/share) |
| **CTAs** | Tombol "Edit" dan "Share" di kanan bawah |

---

## 8. Peak Moment Design

Based on Peak-End Rule: Users remember the **peak moment** and the **ending**, not the average.

### Peak Moment: First Preview Wedding Page

| Moment | Implementation |
|--------|----------------|
| **Trigger** | User pertama kali melihat preview wedding page setelah mengisi data pasangan |
| **Visual** | Full-screen reveal dengan animasi fade-in dari bawah ke atas, confetti rose-gold |
| **Duration** | 500ms animation |
| **Micro-copy** | "Wedding page kamu cantik sekali! 🌹" |

### Peak Moment: Undangan Terkirim

| Moment | Implementation |
|--------|----------------|
| **Trigger** | User berhasil mengirim undangan ke semua tamu |
| **Visual** | Modal celebration dengan icon amplop terbuka dan animasi partikel |
| **Duration** | 400ms animation |
| **Micro-copy** | "Undangan berhasil dikirim ke 200 tamu! Semoga menjadi momen bahagia 💒" |

### Ending Design

| Moment | Implementation |
|--------|----------------|
| **Trigger** | User logout atau menutup aplikasi |
| **Message** | "Sampai jumpa di persiapan bahagia berikutnya! 👰🤵" |
| **Tone** | Warm, encouraging, romantic |

---

## 9. Accessibility Requirements

| Requirement | Standard |
|-------------|----------|
| Contrast Ratio | WCAG AA minimum (4.5:1 for text) |
| Focal Points | AAA contrast (7:1) |
| Interactive Elements | Minimum 44px touch target |
| Focus States | Visible focus ring dengan warna primary rose |
| Motion | Respect `prefers-reduced-motion` |

---

## 10. Implementation Checklist

- [ ] Colors match category palette (Rose, Cream, Gold)
- [ ] Single focal point per screen (Countdown/Nama Pasangan)
- [ ] Eye tracking pattern applied (Z-Pattern untuk landing, F-Pattern untuk list)
- [ ] Whitespace density appropriate (Generous)
- [ ] Motion used sparingly (romantic, tidak berlebihan)
- [ ] Peak moment designed (First preview, undangan terkirim)
- [ ] Design tokens implemented in CSS
- [ ] Accessibility requirements met

---

## 11. Behavioral Design Techniques

### 11.1 Applicable Techniques for Guestron

| # | Technique | Implementation | Impact |
|---|-----------|----------------|--------|
| **1** | **Anticipation Loop** | RSVP loading dengan animated progress bar; Countdown reveal yang bertambah setiap hari; Loading states menampilkan fakta pernikahan menarik saat menunggu | Builds excitement toward wedding day; Makes waiting time feel shorter |
| **2** | **Invisible Personalization** | Guest seating suggestions berdasarkan hubungan (keluarga dekat di meja 1-5, teman kantor di meja 10-15); Auto-grouping berdasarkan kode pos; Smart suggestions untuk +1 berdasarkan data RSVP | Reduces cognitive load; Makes complex seating decisions feel effortless |
| **3** | **Streak + Loss Aversion** | **NOT APPLICABLE** - Wedding adalah one-time event, bukan habit-forming product | N/A |
| **4** | **Emotional Character** | Wedding theme mascot (dove/ring/love bird) yang muncul saat celebration moments (RSVP confirmed, undangan terkirim, milestone tercapai); Character dengan animasi subtle untuk human touch | Creates emotional connection; Makes stressful moments feel lighter |
| **5** | **Variable Reward Notification** | "New RSVP from Budi Santono!"; "Citra confirmed dengan 2 tamu"; Notification dengan varied copy dan timing untuk setiap RSVP baru | Creates dopamine hits from guest confirmations; Encourages checking dashboard |
| **6** | **Social Proof Counter** | "45 dari 120 tamu sudah konfirmasi"; "78 undangan sudah terkirim"; "Budi, Citra, dan 3 lainnya RSVP hari ini"; Countdown dengan social context "45 hari lagi, 45 tamu sudah pasti hadir!" | Leverages FOMO and social validation; Motivates completion |
| **7** | **Annual Wrapped** | Post-wedding recap: "Total tamu: 180; RSVP rate: 85%; Most enthusiastic guest: Budi (RSVP 3 bulan early); Favorite menu: Ayam Bakar (65%)"; Shareable summary card untuk kenangan | Creates closure and beautiful memory; Shareable marketing moment |
| **8** | **Personalization Surprise** | "70% tamu pilih vegetarian menu"; "Kebanyakan tamu dari Jakarta Timur"; Smart insight yang muncul setelah collecting data selama 24-48 jam | Delights users with unexpected insights; Helps decision-making |
| **9** | **Flash Sale Countdown** | **NOT APPLICABLE** - Tidak ada urgency pricing di wedding products | N/A |
| **10** | **Social Commerce** | **NOT APPLICABLE** - Guestron tidak memiliki commerce/affiliate features | N/A |
| **11** | **Gentle Nudge** | "3 tamu belum RSVP, deadline 2 hari lagi"; "Selesaikan seating chart, 80% tamu sudah konfirmasi"; Friendly reminder dengan tone membantu, bukan mengancam | Reduces abandonment; Feels like supportive assistant |

### 11.2 Technique-Specific Examples

#### Example 1: Anticipation Loop - Countdown Reveal

```text
Initial state (30 days before):
┌─────────────────────────────────┐
│   ANDI & PUTRI                  │
│   ♡ 30 HARI LAGI ♡              │
│   [ 29  28  27 ... ]            │
│                                 │
│   Loading wedding facts...      │
│   "Tahukah kamu? Rata-rata      │
│    persiapan pernikahan         │
│    memakan waktu 6-12 bulan"    │
└─────────────────────────────────┘

Daily update (next day):
┌─────────────────────────────────┐
│   ANDI & PUTRI                  │
│   ♡ 29 HARI LAGI ♡              │
│   ✨ HARI INI: 2 RSVP BARU ✨    │
│                                 │
│   Progress: 45/120 confirmed    │
│   [████░░░░░░░░░░░░] 37.5%      │
└─────────────────────────────────┘
```

#### Example 2: Variable Reward Notification

```text
Notification types (varied copy + timing):

🎉 "Budi Santono baru saja RSVP!
   Dia akan hadir berdua dengan istrinya."

💌 "Surprise! Citra dari team marketing
   konfirmasi kehadiran + 3 orang teman."

✨ "RSVP milestone tercapai!
   50 tamu sudah pasti hadir,
   tinggal 70 lagi menuju target."

💝 "Sari dari masa kecil kamu
   baru RSVP dan tulis pesan:
   'Akhirnya Andi nikah! Senang sekali!'"
```

#### Example 3: Social Proof Counter

```text
Dashboard social proof:

┌─────────────────────────────────────┐
│  ANDI & PUTRI                       │
│  45 HARI LAGI                       │
│                                     │
│  ┌─────────────────────────────┐   │
│  │ 45 dari 120 tamu confirmed   │   │
│  │ [████░░░░░░░░░░░░] 37.5%     │   │
│  └─────────────────────────────┘   │
│                                     │
│  Kebanyakan tamu (60%) dari        │
│  Jakarta Timur & Selatan            │
│                                     │
│  Recent RSVPs:                      │
│  • Budi Santono - 2 orang          │
│  • Citra Dewi - 1 orang            │
│  • Ahmad Rizky - 4 orang           │
└─────────────────────────────────────┘
```

#### Example 4: Annual Wrapped (Post-Wedding)

```text
Wedding Day Recap:

┌─────────────────────────────────────┐
│     💒 WEDDING WRAPPED 💒           │
│     Andi & Putri - 15 Maret 2026   │
│                                     │
│  📊 STATISTIK PERNIKAHANMU         │
│  • Total tamu diundang: 200        │
│  • Tamu hadir: 180 (90%)           │
│  • RSVP rate: 85%                  │
│  • Waktu persiapan: 6 bulan        │
│                                     │
│  🏆 PRESTASI UNIK                  │
│  • RSVP tercepat: Budi (3 bulan)   │
│  • Tamu terjauh: Sari (Surabaya)   │
│  • Plus-one terbanyak: Rizky (5)   │
│                                     │
│  🍽️ FAVORIT TAMU                   │
│  • Menu favorit: Ayam Bakar (65%)  │
│  • Spot foto favorit: Garden area  │
│  • Waktu favorit: Sesi malam       │
│                                     │
│  [📤 Share Kenangan Ini]           │
└─────────────────────────────────────┘
```

#### Example 5: Gentle Nudge

```text
Nudge styles (supportive, not threatening):

┌─────────────────────────────────────┐
│  💡 Friendly Reminder              │
│                                     │
│  3 tamu belum RSVP,                 │
│  deadline tinggal 2 hari lagi       │
│                                     │
│  [Kirim Reminder] [Lihat Detail]    │
└─────────────────────────────────────┘

┌─────────────────────────────────────┐
│  ✨ Almost There!                   │
│                                     │
│  80% tamu sudah konfirmasi,         │
│  waktunya buat seating chart        │
│                                     │
│  [Buat Seating] [Lihat Progress]    │
└─────────────────────────────────────┘
```

### 11.3 Ethical Design Note

**Design Philosophy for Guestron:**

> **Sticky > Addictive**

Wedding products harus fokus pada **Sticky design** (engaging selama needed season) bukan **Addictive design** (creating long-term addiction).

**Key Principles:**
- Wedding adalah momen sekali seumur hidup - jangan create FOMO yang berlebihan
- Focus pada **reducing stress**, bukan creating addiction
- Help users move forward ke下一阶段 (married life), bukan trap them in wedding prep
- Peak moments saat celebration (RSVP milestone, undangan terkirim), bukan daily engagement
- Healthy disengagement setelah wedding day - graceful closure dengan "Wedding Wrapped"

**Anti-Patterns to Avoid:**
- ❌ Dark patterns yang membuat user cemas kehilangan momen
- ❌ Fake urgency ("RSVP sekarang atau kehilangan kursi!")
- ❌ Infinite scroll di daftar tamu (create obsession, bukan clarity)
- ❌ Push notifications excessive di tengah malam
- ❌ Gamification yang membuat wedding prep terasa seperti kerjaan

**Healthy Patterns to Embrace:**
- ✅ Gentle nudges yang feel like helpful assistant
- ✅ Celebration moments yang create joy, bukan anxiety
- ✅ Social proof yang motivate, bukan pressure
- ✅ Beautiful closure (wedding wrapped) untuk graceful exit

---

*Based on: [neurodesign-uiux-guide.md](../_templates/neurodesign-uiux-guide.md)*

*Last Updated: 2026-03-03*
*Document Version: 1.0*
