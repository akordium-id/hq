# WaqfWise Design System

> Neurodesign-based visual hierarchy untuk Sistem Manajemen Wakaf Terpercaya & Transparan

**Category:** Islamic

**Related:** [neurodesign-uiux-guide.md](../_templates/neurodesign-uiux-guide.md)

---

## 1. Visual Identity

### Color Palette

| Role | Color | Hex | Neuroscience Rationale |
|------|-------|-----|------------------------|
| Primary | Dark Teal (Islamic Heritage) | `#0D5C4D` | Warna hijau tua melambangkan kepercayaan, warisan Islam, dan stabilitas. Hijau adalah warna identik dengan dunia Islam, membangkitkan rasa aman dan spiritualitas. |
| Secondary | Gold (Nobility) | `#D4AF37` | Emas melambangkan kemuliaan, nilai, dan keberkahan. Memberikan kesan premium dan menghargai nilai wakaf yang tinggi. |
| Accent | Warm Gold | `#E8C547` | Aksen yang lebih terang untuk highlight dan elemen interaktif, mempertahankan nuansa kemuliaan namun lebih visible. |
| Background | Cream/Warm White | `#FAF8F5` | Latar belakang hangat yang memberikan kesan ramah dan membumi, mengurangi kekakuan visual. |
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
- **Lora untuk Headings:** Font serif yang elegan dengan nuansa heritage dan tradisi, cocok untuk produk Islamic yang menghargai warisan. Lora memberikan kesan premium dan terpercaya, sekaligus highly readable.
- **Inter untuk Body:** Sans-serif modern yang sangat readable, memberikan keseimbangan antara tradisi (Lora) dan modernitas (Inter). Inter memastikan kenyamanan membaca untuk konten panjang seperti laporan keuangan dan dokumen legal.

---

## 2. Visual Hierarchy (5-Layer)

### Layer Definitions

| Layer | Use Case | Size | Weight | Contrast |
|-------|----------|------|--------|----------|
| **1. Focal Point** | Total nilai aset wakaf / Jumlah penerima manfaat | 48px | Bold | 7:1 (AAA) |
| **2. Primary** | Key metrics (donasi bulan ini, aset terdaftar) | 30px | Medium | 4.5:1 (AA) |
| **3. Secondary** | Supporting data (tanggal, status, kategori) | 18px | Regular | 4.5:1 (AA) |
| **4. Supporting** | Meta info, timestamps, labels | 14px | Light | 3:1 |
| **5. UI Chrome** | Navigation, borders, divider lines | 12px | Regular | 3:1 |

### Focal Point Strategy

**Single Focal Element per Screen:** Total nilai aset wakaf yang dikelola atau jumlah penerima manfaat untuk dashboard, dan nominal donasi untuk halaman pembayaran.

```
Example: Dashboard Nazhir
┌─────────────────────────────────────────────┐
│                                             │
│    Rp 2.5 Miliar                            │  ← Layer 1: Total Aset Wakaf (Focal Point)
│    Total Nilai Aset Wakaf                   │
│                                             │
│  ┌──────────┐  ┌──────────┐  ┌──────────┐  │  ← Layer 2: Primary Metrics
│  │ 152      │  │ 45       │  │ Rp 150Jt │  │
│  │ Aset     │  │ Program  │  │ Donasi   │  │
│  └──────────┘  └──────────┘  └──────────┘  │
│                                             │
│  Daftar aset wakaf terbaru                  │  ← Layer 3: Secondary Content
│  1. Tanah wakaf Al-Ikhlas                 │
│  2. Masjid Jami' Al-Huda                  │
│                                             │
└─────────────────────────────────────────────┘
```

### Anti-Patterns to Avoid

- ❌ **Christmas Tree Effect:** Semua elemen bold/highlighted = tidak ada focal point yang jelas
- ❌ **Flat Hierarchy:** Semua elemen sama besar = otak bingung harus mulai dari mana
- ❌ **Hidden CTA:** Tombol donasi atau aksi utama tertimbun di antara elemen lain

---

## 3. Eye Tracking Pattern

### Primary Pattern: F-Pattern

**Rationale:** Dashboard WaqfWise berisi banyak data dan metrik yang perlu dipindai secara sistematis. F-Pattern memungkinkan nazhir melihat metrik terpenting di bagian atas, lalu memindai ke bawah untuk detail tambahan.

### Pattern Application

#### F-Pattern - Untuk Dashboard & Halaman Data

```
┌──────────────────────────────────────┐
│ ████████████████████████████████████ │  ← Horizontal scan 1 (Focal Point)
│ Total Aset Wakaf: Rp 2.5 Miliar      │
│                                       │
│ ██████████████████████                │  ← Horizontal scan 2 (Primary Metrics)
│ Aset: 152  |  Program: 45  |  ...   │
│ █                                    │
│ █  Daftar Aset Wakaf                  │  ← Vertical scan (Daftar konten)
│ █  1. Tanah wakaf Al-Ikhlas          │
│ █  2. Masjid Jami' Al-Huda           │
│ █  3. Gedung Pesantren Daarul...     │
└──────────────────────────────────────┘
```

#### Z-Pattern - Untuk Landing Page & Halaman Marketing

```
┌──────────────────────────────────────┐
│ WaqfWise         →→→     Daftar/Login │  ← Zone 1: First impression
│                    ↘                  │
│      Kelola Wakaf dengan Transparansi │
│                   ↙                   │
│  Manajemen Wakaf →→→  Mulai Gratis   │  ← Zone 4: Conversion
└──────────────────────────────────────┘
```

### Key Rules

- **Metrik terpenting** = horizontal scan pertama (total aset wakaf)
- **Tombol aksi utama** = sisi kiri atau bagian atas (bukan bottom-right)
- **Jangan sembunyikan info kritis** di pojok kanan bawah

---

## 4. Motion Guidelines

### When to Use Motion

| Use Case | Animation Type | Duration |
|----------|---------------|----------|
| Loading states | Skeleton shimmer dengan warna teal | Continuous |
| Success feedback (donasi berhasil) | Micro-confetti dengan warna gold | 300ms max |
| Error indication | Shake/pulse dengan warna merah lembut | 200ms |
| Page transitions | Fade/slide smooth | 250ms |
| Button hover | Scale/glow dengan efek gold | 150ms |
| Chart/data visualization | Progressive reveal (bars grow from 0) | 400ms |

### When NOT to Use Motion

- ❌ Background decorative animations (distracting dari konten)
- ❌ Auto-playing carousels tanpa pause (kontrol user hilang)
- ❌ Continuous motion saat membaca laporan (mengganggu fokus)
- ❌ Apapun yang mengalihkan perhatian dari focal point

### Easing Presets

```css
--ease-out: cubic-bezier(0, 0, 0.2, 1);     /* Elements appearing */
--ease-in: cubic-bezier(0.4, 0, 1, 1);      /* Elements disappearing */
--ease-in-out: cubic-bezier(0.4, 0, 0.2, 1); /* Moving elements */
```

---

## 5. Whitespace Strategy

### Density Level: Generous

**Rationale:** Sebagai produk trust-based (Islamic, financial), whitespace yang luas melambangkan transparansi, kejelasan, dan premium feel. Whitespace juga memudahkan nazhir memproses informasi keuangan yang kompleks.

| Whitespace Type | Value | Application |
|-----------------|-------|-------------|
| **Macro** (section gaps) | 64-96px | Antara section utama dashboard |
| **Card padding** | 24px | Inside kartu aset dan laporan |
| **Form group gaps** | 16px | Antara field di form registrasi aset |
| **List item gaps** | 12px | Antara item di daftar aset/wakif |
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
   WAQFWISE DESIGN TOKENS
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
--color-warning: ##D97706;
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
--focal-size: 48px;       /* Layer 1: ONE per screen - Total Aset Wakaf */
--primary-size: 30px;     /* Layer 2: 2-3 elements - Key metrics */
--secondary-size: 18px;   /* Layer 3: 4-6 elements - Supporting data */
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

### Dashboard Nazhir

| Element | Specification |
|---------|---------------|
| **Focal Point** | Total nilai aset wakaf (dalam Rupiah) - Large, bold, di bagian atas |
| **Eye Pattern** | F-Pattern - Metrik di atas, daftar aset di bawah |
| **Primary Actions** | "Tambah Aset Baru" (tombol primary di sebelah kiri atas) |
| **Key Metrics** | Jumlah aset, Program aktif, Total donasi bulan ini (Layer 2) |

### Portal Donatur (Wakif)

| Element | Specification |
|---------|---------------|
| **Focal Point** | Total donasi yang sudah diberikan atau QR code untuk scan donasi |
| **Pattern** | Z-Pattern untuk landing, F-Pattern untuk dashboard |
| **CTAs** | "Donasi Sekarang" (tombol gold prominent) |

### Halaman Registrasi Aset

| Element | Specification |
|---------|---------------|
| **Focal Point** | Form input utama (jenis wakaf, nilai aset) |
| **Pattern** | F-Pattern - Form flow dari atas ke bawah |
| **CTAs** | "Simpan Aset" (tombol primary teal) |

### Halaman Laporan Keuangan

| Element | Specification |
|---------|---------------|
| **Focal Point** | Total hasil wakaf yang terkumpul periode ini |
| **Pattern** | F-Pattern - Summary di atas, detail breakdown di bawah |
| **CTAs** | "Download PDF" / "Export Excel" (tombol secondary) |

---

## 8. Peak Moment Design

Based on Peak-End Rule: Users remember the **peak moment** and the **ending**, not the average.

### Peak Moment: Donasi Berhasil

| Moment | Implementation |
|--------|----------------|
| **Trigger** | Pembayaran donasi selesai diverifikasi |
| **Visual** | Full-screen celebration dengan micro-confetti gold + teal, ikon tangan berdoa atau masjid |
| **Duration** | 400ms animation |
| **Micro-copy** | "Alhamdulillah! Wakaf Anda telah diterima. Terima kasih atas keberkahan yang Anda berikan." |
| **Secondary Message** | "Wakaf Anda sudah dirasakan oleh 245 penerima manfaat" (impact personalization) |

### Secondary Peak Moment: Aset Baru Terdaftar

| Moment | Implementation |
|--------|----------------|
| **Trigger** | Nazhir berhasil registrasi aset wakaf baru |
| **Visual** | Card slide-in dengan ikon aset (tanah/bangunan/uang) |
| **Duration** | 300ms animation |
| **Micro-copy** | "Masya Allah! Aset wakaf baru berhasil didaftarkan." |
| **Secondary Message** | "Sertifikat digital akan dikirim ke email Anda." |

### Ending Design

| Moment | Implementation |
|--------|----------------|
| **Trigger** | Logout atau menutup aplikasi |
| **Message** | "Semoga amal sholeh Anda diterima. Sampai jumpa lagi!" |
| **Tone** | Warm, spiritual, respectful |

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

---

## 10. Implementation Checklist

- [ ] Colors match Islamic category palette (Teal + Gold)
- [ ] Single focal point per screen (Total aset / Donasi)
- [ ] Eye tracking pattern applied (F-Pattern for dashboard)
- [ ] Whitespace density appropriate (Generous untuk trust)
- [ ] Motion used sparingly (300ms max untuk micro-animations)
- [ ] Peak moment designed (Donasi berhasil celebration)
- [ ] Design tokens implemented in CSS
- [ ] Accessibility requirements met (WCAG AA)
- [ ] Typography pairing correct (Lora + Inter)
- [ ] Background cream tone applied (#FAF8F5)

---

## 11. Behavioral Design Techniques

### Ethical Design Philosophy

**Islamic Trust Products** should lean toward **Sticky** design karena membangun kebiasaan memberi yang berkelanjutan, bukan urgency-based giving. Focus on spiritual reward and impact transparency.

### Techniques Matrix for WaqfWise

| # | Technique | Applicability | Implementation |
|---|-----------|---------------|----------------|
| 1 | **Anticipation Loop** | ✅ Apply | Donation processing, certificate generation loading |
| 2 | **Invisible Personalization** | ✅ Apply | Program recommendations based on giving history |
| 3 | **Streak + Loss Aversion** | ✅ Apply | Monthly giving streak (building charitable habit) |
| 4 | **Emotional Character** | ❌ Not Applicable | NOT appropriate for Islamic trust product |
| 5 | **Variable Reward Notification** | ✅ Apply | Donation impact update, program milestone |
| 6 | **Social Proof Counter** | ✅ Apply | Total wakif, programs funded, beneficiaries helped |
| 7 | **Annual Wrapped** | ✅ Apply | Yearly wakaf journey, impact created (very meaningful!) |
| 8 | **Personalization Surprise** | ✅ Apply | "Your waqf has helped 50 students this year" |
| 9 | **Flash Sale Countdown** | ❌ Not Applicable | Not appropriate for charity/wakaf |
| 10 | **Social Commerce** | ✅ Apply | Family waqf program (collective giving) |
| 11 | **Gentle Nudge** | ✅ Apply | Giving reminder (Ramadan, special occasions), impact update |

---

### 1. Anticipation Loop

**Purpose:** Build excitement during waiting moments for donation processing and certificate generation.

**Implementation:**

```
Donation Processing Flow:
┌─────────────────────────────────────────────┐
│                                             │
│  Memproses donasi Anda...                   │
│  ████████░░░░░░  80%                        │
│                                             │
│  "Mohon tunggu sebentar...                 │
│   Sertifikat digital Anda sedang            │
│   diproses dengan aman."                    │
│                                             │
└─────────────────────────────────────────────┘
```

**Micro-copy Examples:**
- "Sedang memverifikasi pembayaran..."
- "Menyiapkan sertifikat wakaf digital Anda..."
- "Hampir selesai! Sertifikat akan segera tersedia."

**Neuroscience Rationale:** Anticipation releases dopamine before the reward, making the waiting moment feel like progress rather than delay.

---

### 2. Invisible Personalization

**Purpose:** Recommend relevant wakaf programs based on user's giving history without explicit preference setting.

**Implementation:**

```
Dashboard Section: "Rekomendasi Untuk Anda"
┌─────────────────────────────────────────────┐
│                                             │
│  Berdasarkan riwayat wakaf Anda,            │
│  program ini mungkin relevan:               │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │ 💚 Wakaf Pendidikan                 │   │
│  │ Anda 3x wakaf untuk pendidikan      │   │
│  │ [Lihat Program Pendidikan Lainnya]  │   │
│  └─────────────────────────────────────┘   │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │ 🕌 Pembangunan Masjid               │   │
│  │ Program terdekat dari lokasi Anda   │   │
│  │ [Lihat Detail]                      │   │
│  └─────────────────────────────────────┘   │
│                                             │
└─────────────────────────────────────────────┘
```

**Data Points for Personalization:**
- Category preference (pendidikan, kesehatan, masjid, dll)
- Geographic proximity (program terdekat)
- Giving frequency (bulanan, Ramadhan, Qurban)
- Amount range (rekomendasi sesuai kapasitas)

**Neuroscience Rationale:** Reduces cognitive load by filtering relevant options, making decision-making easier and faster.

---

### 3. Streak + Loss Aversion

**Purpose:** Build sustainable giving habit through monthly wakaf streak.

**Implementation:**

```
Streak Display:
┌─────────────────────────────────────────────┐
│                                             │
│  🔥 6 Bulan Berkelanjutan                   │
│  Wakaf bulanan Anda terjumat 6 bulan!       │
│                                             │
│  Pertahankan streak bulan ini               │
│  untuk mencapai status "Wakif Setia"        │
│                                             │
│  [Wakaf Bulan Ini]  ──  5 Hari tersisa     │
│                                             │
└─────────────────────────────────────────────┘
```

**Streak Milestones:**
- 3 bulan: "Wakif Pemula" - Badge digital
- 6 bulan: "Wakif Konsisten" - Highlight di profil
- 12 bulan: "Wakif Setia" - Sertifikat khusus + annual report
- 24+ bulan: "Wakif Premier" - VIP access ke program eksklusif

**Loss Aversion Messaging:**
- "Jangan putuskan streak Anda! 5 hari lagi untuk wakaf bulan ini."
- "Anda telah 6 bulan konsisten. Pertahankan keberkahan ini."

**Neuroscience Rationale:** Loss aversion (fear of losing streak) is 2x more powerful than gain anticipation. Streaks create emotional investment in continuing.

---

### 4. Emotional Character

**Status:** ❌ **NOT APPLICABLE**

**Rationale:** As an Islamic trust product handling religious endowments (wakaf), adding fictional characters or mascots would be inappropriate and could undermine the solemn, trustworthy nature of the service. Wakaf is a serious spiritual and financial commitment in Islam.

**Alternative:** Use authentic imagery such as:
- Real beneficiaries (students, patients, communities)
- Actual completed projects (mosques, schools, hospitals)
- Documented impact with photos and stories

---

### 5. Variable Reward Notification

**Purpose:** Create surprise and delight through unpredictable but meaningful impact updates.

**Implementation:**

```
Notification Types:
┌─────────────────────────────────────────────┐
│ 1. IMPACT UPDATE (Random timing)            │
│ "Subhanallah! Wakaf Anda telah membantu     │
│  5 siswa baru bulan ini."                   │
│  [Lihat Lengkap]                            │
└─────────────────────────────────────────────┘

┌─────────────────────────────────────────────┐
│ 2. MILESTONE ACHIEVED (Unexpected)          │
│ "Program wakaf yang Anda dukung             │
│  mencapai 75% target!"                      │
│  [Lihat Progres]                            │
└─────────────────────────────────────────────┘

┌─────────────────────────────────────────────┐
│ 3. BENEFICIARY STORY (Surprise)             │
│ "Kisah Ahmad, siswa penerima manfaat        │
│  wakaf pendidikan Anda..."                  │
│  [Baca Cerita]                              │
└─────────────────────────────────────────────┘
```

**Variable Elements:**
- Timing (not predictable, but not annoying)
- Content type (impact, milestone, story)
- Program focus (different programs each time)

**Neuroscience Rationale:** Variable rewards activate dopamine system more strongly than predictable rewards, creating sustained engagement.

---

### 6. Social Proof Counter

**Purpose:** Show collective impact to build trust and encourage participation.

**Implementation:**

```
Social Proof Display:
┌─────────────────────────────────────────────┐
│                                             │
│  👥 1,247 Wakif                             │
│  💚 152 Program Wakaf                       │
│  🙏 45,892 Penerima Manfaat                 │
│  💰 Rp 2.5 Miliar Terkumpul                 │
│                                             │
│  "Bergabung dengan 1,247 wakif lainnya      │
│   yang telah memberikan keberkahan."        │
│                                             │
└─────────────────────────────────────────────┘

Live Activity:
┌─────────────────────────────────────────────┐
│  Hamba Allah baru saja wakaf Rp 500.000     │
│  untuk program pendidikan • 2 menit lalu    │
│                                             │
│  Hamba Allah baru saja wakaf Rp 1.000.000   │
│  untuk pembangunan masjid • 5 menit lalu    │
└─────────────────────────────────────────────┘
```

**Social Proof Locations:**
- Landing page hero section
- Program detail pages
- Donation confirmation page
- Email receipts

**Neuroscience Rationale:** Social proof leverages herd instinct - if many others are doing it, it must be safe and worthwhile.

---

### 7. Annual Wrapped

**Purpose:** Create deeply meaningful annual summary of wakaf journey and impact.

**Implementation:**

```
Annual Wrapped Experience:
┌─────────────────────────────────────────────┐
│                                             │
│  🌟 Wakaf Journey Anda 2026                 │
│                                             │
│  Rp 4.500.000 total wakaf tahun ini         │
│  12x kebaikan                               │
│  5 program wakaf                            │
│  89 penerima manfaat                        │
│                                             │
│  [Lihat Cerita Dampak Anda 2026]            │
│                                             │
└─────────────────────────────────────────────┘

Share Preview:
┌─────────────────────────────────────────────┐
│  "Tahun ini, wakaf saya telah:              │
│                                             │
│   ✨ Membantu 89 orang                       │
│   📚 Mendukung 3 sekolah                     │
│   🕌 Membangun 1 masjid                      │
│                                             │
   Semoga Allah menerima amal kita.           │
   #WakafJourney #WaqfWise"                   │
│                                             │
│  [Bagikan ke WhatsApp]                      │
│  [Bagikan ke Instagram]                     │
└─────────────────────────────────────────────┘
```

**Annual Wrapped Elements:**
1. Total amount wakaf
2. Number of donations
3. Programs supported
4. Direct beneficiaries helped
5. Impact stories (with photos if possible)
6. Geographic reach (if applicable)
7. Badge earned for the year
8. Shareable summary card

**Timing:** Send in early Shafar (after Zulhijjah/Ramadhan cycle) or during Ramadan for maximum spiritual resonance.

**Neuroscience Rationale:** Annual retrospective creates meaningful narrative and emotional connection, turning data into life story and spiritual achievement.

---

### 8. Personalization Surprise

**Purpose:** Deliver unexpected, personalized moments that deepen emotional connection.

**Implementation:**

```
Personalized Impact Message:
┌─────────────────────────────────────────────┐
│                                             │
│  ✨ HIGHLIGHT UNTUK ANDA                    │
│                                             │
│  "Masya Allah! Tahun ini, wakaf Anda        │
│   telah membantu 50 siswa SD               │
│   di Desa Sukamaju melanjutkan             │
│   pendidikan mereka."                       │
│                                             │
│  [Lihat Profil Siswa yang Dibantu]          │
│                                             │
└─────────────────────────────────────────────┘

Other Surprise Moments:
┌─────────────────────────────────────────────┐
│  "Anda adalah top 5% wakif di program       │
│   pendidikan bulan ini. Terima kasih         │
│   atas dedikasi luar biasa Anda!"           │
└─────────────────────────────────────────────┘
```

**Personalization Data Points:**
- Specific beneficiary count
- Geographic impact
- Category focus (education, health, etc)
- Ranking percentile (if appropriate)
- Comparison to previous year

**Delivery Channels:**
- In-app notification
- Email digest
- Dashboard highlight
- Push notification (if opted in)

**Neuroscience Rationale:** Unexpected personalized attention activates brain's reward system more than expected notifications, creating positive surprise and emotional attachment.

---

### 9. Flash Sale Countdown

**Status:** ❌ **NOT APPLICABLE**

**Rationale:** Flash sale tactics (urgency, scarcity, countdown timers) are inappropriate for wakaf and Islamic charity. Wakaf should be given sincerely (ikhlas) for Allah's pleasure, not due to FOMO or artificial time pressure.

**Ethical Alternative:** Use **Seasonal Reminders** instead:
- Ramadan reminder (month of giving)
- Last 10 days of Ramadan (laylatul qadr)
- Zulhijjah/Qurban period
- Islamic new year reflection

These are naturally occurring Islamic occasions, not manufactured urgency.

---

### 10. Social Commerce

**Purpose:** Enable collective giving through family/community waqf programs.

**Implementation:**

```
Family Waqf Program:
┌─────────────────────────────────────────────┐
│                                             │
│  👨‍👩‍👧‍👦 Wakaf Keluarga                      │
│                                             │
│  Ajak keluarga untuk wakaf bersama.         │
│  Satu keluarga, satu keberkahan.            │
│                                             │
│  Target: Rp 5.000.000                       │
│  ████████░░░░░░  65% terkumpul              │
│                                             │
│  [Tambahkan Anggota Keluarga]               │
│  [Share Link]                               │
│                                             │
└─────────────────────────────────────────────┘

Contributors List:
┌─────────────────────────────────────────────┐
│  Anggota Keluarga Ahmad:                    │
│                                             │
│  ✅ Ahmad - Rp 1.000.000 (Organizer)        │
│  ✅ Siti - Rp 500.000                       │
│  ✅ Fatimah - Rp 750.000                    │
│  ⏳ Umar - Menunggu konfirmasi              │
│  📧 Aisyah - Belum bergabung [Undang]       │
│                                             │
└─────────────────────────────────────────────┘
```

**Social Commerce Features:**
1. Family/group waqf pools
2. Collaborative target setting
3. Contribution tracking
4. Invitation system (WhatsApp, email)
5. Progress visualization
6. Group certificate upon completion

**Neuroscience Rationale:** Social commitment and visibility increases follow-through. Group participation leverages social accountability and shared purpose.

---

### 11. Gentle Nudge

**Purpose:** Provide timely, contextually appropriate reminders for giving without being pushy.

**Implementation:**

```
Contextual Nudges:

┌─────────────────────────────────────────────┐
│ RAMADHAN NUDGE (Spiritual context)          │
│                                             │
│  "Ramadhan adalah bulan terbaik untuk       │
│   berwakaf. Keberkahan dilipatgandakan."    │
│                                             │
│  [Wakaf Sekarang]  [Tahun Ini Saja]        │
└─────────────────────────────────────────────┘

┌─────────────────────────────────────────────┐
│ IMPACT UPDATE NUDGE (Transparency)          │
│                                             │
│  "Program yang Anda dukung bulan lalu       │
│   telah mencapai milestone baru.            │
│   Lihat dampak yang telah tercipta."        │
│                                             │
│  [Lihat Laporan Dampak]                     │
└─────────────────────────────────────────────┘

┌─────────────────────────────────────────────┐
│ SPECIAL OCCASION NUDGE (Personal)           │
│                                             │
│  "Hari jadi pernikahan Anda tahun lalu,     │
│   Anda telah memberikan wakaf untuk         │
│   pendidikan 10 anak yatim."                │
│                                             │
│  "Tahun ini, lanjutkan keberkahan..."       │
│                                             │
│  [Wakaf Anniversary]                        │
└─────────────────────────────────────────────┘
```

**Nudge Triggers:**
- Ramadan (spiritual urgency)
- Last 10 days of Ramadan
- Zulhijjah/Qurban period
- Personal anniversaries (wedding, etc)
- Program milestones reached
- Monthly recurring reminder (if opted in)
- End of year (tax deduction reminder)

**Nudge Principles:**
- Always respectful, never pushy
- Easy to dismiss/snooze
- Frequency limited (max 1-2 per month)
- Always opt-outable
- Contextually relevant

**Neuroscience Rationale:** Well-timed nudges leverage memory triggers and contextual cues to prompt action without creating annoyance or resistance.

---

### Implementation Priority

**Phase 1 (Essential):**
1. Social Proof Counter (build initial trust)
2. Gentle Nudge (Ramadan + impact updates)
3. Anticipation Loop (donation processing)

**Phase 2 (Growth):**
4. Variable Reward Notification (engagement)
5. Personalization Surprise (emotional connection)
6. Streak + Loss Aversion (retention)

**Phase 3 (Maturity):**
7. Invisible Personalization (smart recommendations)
8. Social Commerce (viral growth)
9. Annual Wrapped (deep loyalty)

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
