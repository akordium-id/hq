# Neurodesign UI/UX Guide

> Panduan visual dan interaksi berbasis neuroscience untuk produk Akordium Lab

**Companion document:** Untuk prinsip behavioral/engagement (dopamine, habit loop, dll.), lihat [neuroscience-design-guide.md](./neuroscience-design-guide.md)

## Daftar Isi

1. [Hierarki Visual & Perhatian Otak](#1-hierarki-visual--perhatian-otak)
2. [Psikologi Warna Per Kategori Produk](#2-psikologi-warna-per-kategori-produk)
3. [Tipografi sebagai Sinyal Neurologis](#3-tipografi-sebagai-sinyal-neurologis)
4. [Prinsip Gestalt](#4-prinsip-gestalt)
5. [Cognitive Load Reduction](#5-cognitive-load-reduction)
6. [Motion & Micro-interactions](#6-motion--micro-interactions)
7. [Emotional Architecture](#7-emotional-architecture)
8. [Akordium Design System](#8-akordium-design-system)
9. [Referensi](#referensi)

---

## 1. Hierarki Visual & Perhatian Otak

Hierarki visual berbasis neurodesign bukan tentang "terlihat bagus" — ini tentang **mengendalikan urutan pemrosesan informasi di otak user secara terprogram**. Otak manusia memproses visual dalam dua fase berbeda yang harus dipahami setiap designer dan programmer.

### 1.1 Dua Fase Pemrosesan Visual Otak

Sebelum masuk ke teknik, pahami arsitektur dasar ini:

| Fase | Sistem | Kecepatan | Karakteristik |
|------|--------|-----------|---------------|
| **Pre-attentive** | System 1 | < 200ms | Otomatis, tak sadar, di V1/V2 cortex |
| **Attentive** | System 2 | > 200ms | Sadar, deliberate, butuh cognitive effort |

**Implikasi terbesar:** semua keputusan desain kritis harus selesai dikomunikasikan di fase pre-attentive — sebelum user sempat berpikir. Tombol CTA, status error, angka penting — semua harus "pop" secara otomatis tanpa user perlu mencarinya.

### 1.2 Color Contrast Neuroscience

Kontras warna adalah **sinyal paling primitif yang diproses otak manusia** — dideteksi bahkan di lapisan retina sebelum sinyal sampai ke korteks visual. Ini sebabnya kontras adalah fondasi mutlak hierarki visual dalam neurodesign, bukan sekadar preferensi estetika.

#### 1.2.1 Neural Pathways for Contrast Processing

Otak memiliki dua jalur terpisah untuk memproses kontras, dan keduanya harus dipahami untuk desain yang efektif:

```
STIMULUS VISUAL MASUK
        ↓
┌─────────────────────────────────────────────────────┐
│ RETINA                                              │
│  ├── ON pathway  → merespons terang di atas gelap   │
│  └── OFF pathway → merespons gelap di atas terang   │
│  [Penelitian 2022: dark-on-light LEBIH visible      │
│   daripada light-on-dark di high contrast]          │
└─────────────────────────────────────────────────────┘
        ↓
┌─────────────────────────────────────────────────────┐
│ JALUR 1: LUMINANCE CONTRAST (Achromatic)            │
│ V1 → V2 → V3a/MT+                                  │
│ Memproses: terang/gelap, edge detection, depth      │
│ Kecepatan: sangat cepat (<80ms)                     │
│ Fungsi hierarki: menentukan "apa yang menonjol"     │
└─────────────────────────────────────────────────────┘
        ↓
┌─────────────────────────────────────────────────────┐
│ JALUR 2: CHROMATIC CONTRAST (Color)                 │
│ V1 → V4 → VO1 → Inferior Temporal Cortex           │
│ Memproses: hue difference, color identity           │
│ Kecepatan: sedikit lebih lambat (80-150ms)          │
│ Fungsi hierarki: menentukan "kategori apa ini"      │
└─────────────────────────────────────────────────────┘
        ↓
┌─────────────────────────────────────────────────────┐
│ KOMBINASI: Luminance + Chromatic sekaligus          │
│ → PCN latency (attention capture) lebih CEPAT       │
│   dibanding luminance saja                          │
│ → Ini adalah teknik paling kuat untuk focal point   │
└─────────────────────────────────────────────────────┘
```

**Implikasi desain terpenting:** Elemen focal point paling kuat adalah yang memiliki **kontras luminance TINGGI sekaligus kontras warna TINGGI** dari background. Bukan hanya salah satu.

#### 1.2.2 WCAG vs Neurodesign Optimal

WCAG (Web Content Accessibility Guidelines) mendefinisikan minimum contrast ratio berbasis formula luminance relatif. Tapi neurodesign memperluas ini menjadi **sistem hierarki neurologis**, bukan sekadar threshold aksesibilitas:

```
WCAG Minimum vs Neurodesign Optimal:

                WCAG Min    Neuro-Optimal   Penggunaan
                ─────────   ─────────────   ──────────────────────────
Body text       4.5 : 1     7 : 1 (AAA)     Semua teks paragraf
Large text      3.0 : 1     4.5 : 1         Heading besar (>18pt)
UI components   3.0 : 1     4.5 : 1         Tombol, input field, icon
Focal CTA       —           9 : 1 +         Tombol utama per halaman
Disabled/muted  —           1.5 : 1         Elemen intentionally de-emphasized
```

Penelitian 2026 dari Blake Crosley membuktikan bahwa typography dan opacity saja — **tanpa warna sama sekali** — mampu membangun hierarki visual yang lengkap jika contrast ratio dikelola dengan benar:

```css
/* Pure luminance hierarchy — tanpa warna, hanya opacity/lightness */
--text-primary:   oklch(10% 0 0);  /* ~7:1 ratio  — focal content */
--text-secondary: oklch(35% 0 0);  /* ~4.5:1 ratio — supporting */
--text-tertiary:  oklch(55% 0 0);  /* ~3:1 ratio  — metadata */
--text-disabled:  oklch(72% 0 0);  /* ~1.8:1 ratio — inactive */
--bg-base:        oklch(99% 0 0);  /* near-white background */
```

#### 1.2.3 Gamma Oscillation Effect: Mengapa Merah Paling "Teriakan"

Studi primate fMRI dari PNAS (2018) menemukan hal yang sangat spesifik: **hue merah/warm menghasilkan gamma oscillations terkuat di V1** dibanding hue lainnya.

```
Gamma oscillations di V1 per warna (relative strength):

  Merah        ████████████████████  Paling kuat
  Oranye       ███████████████
  Kuning       ████████████
  Hijau        ████████
  Biru         ██████
  Ungu         ████████
  Abu/Netral   ███               Paling lemah

Gamma oscillations berkorelasi langsung dengan:
  → Tingkat perhatian (attentional salience)
  → Kecepatan deteksi objek
  → Strength of binding dalam working memory
```

**Implikasi untuk Akordium:**

```
Gunakan merah/oranye HANYA untuk 1 tujuan per screen
karena gamma oscillation = strongest attention interrupt:

✓ SnapKasir: tombol "Catat Transaksi" → oranye (#EA580C)
             + background putih → kombinasi luminance + gamma max
✓ Semua produk: error state → merah (#DC2626)
✓ BibiDiskon: badge "HARI INI SAJA" → merah/oranye
              (birthday context + urgency color = double trigger)

✗ JANGAN: multiple elemen merah/oranye dalam satu screen
          → gamma oscillations saling cancel → chaos, bukan hierarchy
```

#### 1.2.4 Color + Luminance: Formula Kontras Terkuat

Riset EEG 2020 membuktikan bahwa **kombinasi chromatic contrast + luminance contrast menghasilkan attentional capture yang lebih cepat** dari luminance saja. Ini adalah "formula atom bom" dalam visual hierarchy:

```
FORMULA FOCAL POINT MAKSIMUM:

  Focal Element = High Luminance Contrast
                + High Chromatic Contrast
                + Isolated dari surrounding elements

Contoh konkret untuk CTA button Akordium:

  Background screen:  #F8FAFC  (near-white, luminance ~97%)
  Button background:  #EA580C  (oranye, luminance ~38%)
  Button text:        #FFFFFF  (putih, luminance ~100%)

  Luminance contrast button-to-screen:  ~5.8:1  ✓
  Chromatic contrast:  orange vs gray/white = HIGH  ✓
  Color gamma:         warm hue = high oscillation  ✓

  = Triple-channel focal signal → hampir impossible diabaikan
```

Bandingkan dengan anti-pattern umum:

```
❌ Anti-pattern: Blue button on white background
  Background:  #FFFFFF  (luminance 100%)
  Button:      #3B82F6  (blue, luminance ~37%)
  Luminance contrast: ~4.5:1 ✓ (meets WCAG)
  Chromatic contrast: blue vs white = MEDIUM
  Color gamma: blue = low oscillation

  → Technically accessible, tapi neurologis lemah
  → User bisa miss button ini saat scanning

✅ Fix: tambah luminance contrast + warm accent
  Button:      #1D4ED8  (dark blue, luminance ~17%)
  Luminance contrast: ~9.2:1 ✓✓
  + border: 2px solid #EA580C (warm accent) → chromatic boost
```

#### 1.2.5 Simultaneous Contrast: Ilusi yang Mengacaukan Hierarki

Simultaneous contrast adalah fenomena neurologis di mana **warna yang sama terlihat berbeda tergantung warna sekitarnya** — terjadi di area V4 korteks visual. Ini adalah jebakan paling umum dalam desain hierarki:

```
SIMULTANEOUS CONTRAST — Efek di V4:

  Contoh klasik:
  ┌─────────────┐    ┌─────────────┐
  │  ░░░░ A ░░░ │    │  ████ B ████│
  │  ░░ [■] ░░░ │    │  ██ [■] ████│
  │  ░░░░░░░░░░ │    │  ████████████│
  └─────────────┘    └─────────────┘

  Kotak [■] sama persis warnanya di A dan B
  Tapi di A (background terang) → terlihat GELAP
  Di B (background gelap) → terlihat TERANG

  Otak bukan mengukur warna absolut —
  ia mengukur RELASI kontras terhadap sekitarnya
```

**Jebakan simultaneous contrast yang sering terjadi di produk Indonesia:**

```
Kasus nyata — Tombol disabled di Anggarin/SnapKasir:

  Designer pikir:
  Button disabled = abu-abu #9CA3AF
  Background card = abu-abu muda #F3F4F6
  → "Tombol abu di background abu → kontras rendah = disabled feel"

  Yang terjadi di otak user:
  → Simultaneous contrast membuat batas tombol hampir invisible
  → User tidak tahu apakah ada tombol di sana atau tidak
  → Confusion, bukan "disabled affordance"

  Fix berbasis neuroscience:
  Button disabled = #9CA3AF (abu) + border dashed 1px #6B7280
  Background      = #FFFFFF (putih bersih)
  → Kontras cukup untuk perceived, tapi muted untuk disabled state
```

##### Dark Mode Neuroscience

```
Dark mode bukan sekadar inversi warna —
otak memproses light-on-dark BERBEDA dari dark-on-light:

Light mode (dark-on-light):
  → OFF pathway dominan di retina
  → Lebih comfortable untuk extended reading
  → Edge detection lebih tajam (teks lebih readable)

Dark mode (light-on-dark):
  → ON pathway dominan
  → Lebih comfortable di low-light environment
  → Halation effect: teks terang "blur" di sekitarnya
    (pupil membesar → lebih cahaya masuk → glare)

Dark mode best practice berbasis neuroscience:
  ❌ Pure white (#FFFFFF) on pure black (#000000)
     → Maximum halation, sangat melelahkan

  ✅ Off-white (#E2E8F0) on dark gray (#1E293B)
     → Luminance contrast: ~12:1 (sufficient)
     → Reduced halation karena tidak pure white
     → V1 neurons less fatigued
```

#### 1.2.6 OKLCH Contrast Hierarchy System

Berdasarkan semua prinsip neuroscience di atas, berikut sistem kontras yang lengkap menggunakan **OKLCH color space** (perceptually uniform — lebih akurat dari HEX/RGB untuk prediksi kontras neurologis):

##### Light Mode — Semua Produk Akordium

```css
/* === AKORDIUM CONTRAST HIERARCHY SYSTEM (Light) === */
/* OKLCH format: oklch(lightness% chroma hue) */

/* --- BACKGROUND STACK --- */
--bg-canvas:    oklch(99% 0.002 250);   /* Base page background */
--bg-surface:   oklch(97% 0.003 250);   /* Card, panel */
--bg-elevated:  oklch(95% 0.004 250);   /* Dropdown, tooltip */
--bg-sunken:    oklch(93% 0.005 250);   /* Input, code block */

/* --- TEXT HIERARCHY --- */
/* Rasio terhadap --bg-canvas */
--text-display:  oklch(8%  0 0);  /* ~18:1 — Angka hero, display */
--text-primary:  oklch(15% 0 0);  /* ~12:1 — Body, heading */
--text-secondary:oklch(38% 0 0);  /* ~5.5:1 — Supporting text */
--text-tertiary: oklch(52% 0 0);  /* ~3.2:1 — Metadata, placeholder */
--text-disabled: oklch(68% 0 0);  /* ~1.9:1 — Disabled (intentional) */

/* --- BRAND ACCENT per PRODUK --- */
/* SnapKasir: Oranye (high gamma + high luminance contrast) */
--snapkasir-focal:   oklch(52% 0.19 45);  /* Orange #EA580C, ratio ~4.8:1 */
--snapkasir-hover:   oklch(44% 0.19 45);  /* Darker orange on hover */
--snapkasir-muted:   oklch(92% 0.07 45);  /* Very light orange bg */

/* Anggarin/Nanabung: Hijau (growth + safety signal) */
--finance-focal:     oklch(46% 0.15 145); /* Green #16A34A, ratio ~5.2:1 */
--finance-positive:  oklch(46% 0.15 145); /* Positive numbers */
--finance-negative:  oklch(45% 0.20 25);  /* Red #DC2626, negative */

/* WaqfWise/Klustera: Teal-Emerald (trust + institution) */
--trust-focal:       oklch(42% 0.13 168); /* Deep teal */
--trust-muted:       oklch(94% 0.05 168); /* Light teal bg */

/* Atribuo/BibiDiskon: Violet (energy + gamification) */
--game-focal:        oklch(46% 0.22 290); /* Purple #7C3AED */
--game-bright:       oklch(62% 0.22 290); /* Lighter purple for badges */

/* === SEMANTIC COLORS (konsisten lintas SEMUA produk) === */
--semantic-success:  oklch(46% 0.15 145); /* Hijau — selalu sama */
--semantic-warning:  oklch(62% 0.16 80);  /* Amber — selalu sama */
--semantic-error:    oklch(45% 0.20 25);  /* Merah — selalu sama */
--semantic-info:     oklch(48% 0.17 240); /* Biru — selalu sama */
```

##### Dark Mode — Semua Produk Akordium

```css
/* === AKORDIUM CONTRAST HIERARCHY SYSTEM (Dark) === */
/* Off-black backgrounds untuk mengurangi halation */

--bg-canvas:    oklch(14% 0.008 250);   /* NOT pure black */
--bg-surface:   oklch(18% 0.009 250);
--bg-elevated:  oklch(22% 0.010 250);
--bg-sunken:    oklch(11% 0.006 250);

/* Off-white text untuk mengurangi glare */
--text-display:  oklch(96% 0.005 250); /* ~12:1 vs canvas */
--text-primary:  oklch(90% 0.005 250); /* ~9:1 */
--text-secondary:oklch(68% 0.005 250); /* ~4.5:1 */
--text-tertiary: oklch(52% 0.005 250); /* ~3:1 */
--text-disabled: oklch(38% 0.005 250); /* ~1.8:1 */
```

#### 1.2.7 Product-Specific Scenarios

##### Skenario 1: Tabel Data SnapKasir (Daftar Transaksi)

```
Masalah neurologis tabel data:
→ Alternating rows bisa menciptakan "visual noise" jika
  contrast antara odd/even rows terlalu tinggi
→ Otak mulai memperlakukan stripes sebagai informasi,
  bukan sebagai visual separator

Fix berbasis neuroscience:
  Row odd:  background --bg-canvas (#FAFAFA)
  Row even: background --bg-surface (#F4F4F5)
  Contrast ratio antara keduanya: ~1.04:1 (SANGAT subtle)

  → Cukup untuk stripe effect tanpa menciptakan noise
  → Hover state: naik ke --bg-elevated untuk clear selection signal

  Tapi highlight row kritis (misal: void/cancelled):
  background: oklch(96% 0.05 25)  → subtle red tint
  → Chromatic signal tanpa luminance terlalu kontras
```

##### Skenario 2: Form Input Klustera (Validasi Real-time)

```
State-based contrast system:

Default:   border oklch(75% 0 0)    → 3:1 vs bg — visible tapi quiet
Focus:     border oklch(46% 0.17 240) + ring → blue, prominent
Valid:     border oklch(46% 0.15 145) → hijau — success signal
Error:     border oklch(45% 0.20 25) + bg oklch(98% 0.04 25)
           → merah border + pink tint bg — dual-channel error signal
Disabled:  border oklch(88% 0 0), bg oklch(96% 0 0)
           → reduced contrast = intentional "not interactive" affordance
```

**Dual-channel error** (border merah + background pink tint) penting karena **8% pria buta warna merah-hijau** — mereka mendeteksi error dari luminance contrast dan chromatic context, bukan hanya dari hue merah.

##### Skenario 3: Dashboard Anggarin (Angka Keuangan)

```
Neuroscience rule untuk angka finansial:

Positif (surplus, tabungan naik):
  → oklch(40% 0.17 145)  — hijau gelap, ratio > 7:1
  → Jangan pakai hijau muda — luminance terlalu tinggi,
    contrast vs white background turun dramatis

Negatif (defisit, pengeluaran melebihi budget):
  → oklch(42% 0.22 25)  — merah gelap, ratio > 6:1
  → + gamma oscillation dari warm hue = immediate attention capture
  → Tambah ikon ↓ atau ▼ = redundant encoding
    (warna + shape = dual pre-attentive signal)

Netral (rata-rata, bulan lalu):
  → oklch(35% 0 0)  — gelap tapi achromatic
  → Tidak ada emotional tagging dari warna
  → User fokus ke perbandingan angka, bukan warna

PENTING: Jangan encode informasi HANYA via warna (WCAG 1.4.1)
  ✓ Benar:  ↑ +12% (hijau)   ← warna + ikon + sign
  ✗ Salah:  12% (hijau saja)  ← colorblind user kehilangan konteks
```

##### Skenario 4: Notification Badge di Akordium.id

```
Badge dengan angka = kombinasi terkuat color + luminance + shape:

  .badge-critical {
    background: oklch(45% 0.20 25);  /* merah */
    color:      oklch(99% 0 0);       /* near-white */
    /* Contrast ratio: ~8.5:1 */
    /* Gamma oscillation: HIGH (red hue) */
    /* Shape: circle = natural "attention dot" */
  }

  .badge-info {
    background: oklch(48% 0.17 240); /* biru */
    color:      oklch(99% 0 0);
    /* Contrast ratio: ~6.8:1 */
    /* Gamma: medium */
  }

  .badge-subtle {
    background: oklch(52% 0 0);      /* abu gelap */
    color:      oklch(99% 0 0);
    /* Contrast ratio: ~5.2:1 */
    /* Gamma: low — untuk non-urgent info */
  }
```

##### Skenario 5: CTA Hierarchy di Landing Page Semua Produk

```
Satu halaman = satu focal CTA saja (neurologis rule)
Sisanya secara sadar di-de-emphasize:

  PRIMARY CTA (1 per page):
  bg: oklch(52% 0.19 45)  + color: white
  → Highest luminance contrast (~4.8:1)
  → Highest chromatic signal (orange)
  → Largest size
  → Most isolated whitespace

  SECONDARY CTA (1-2 per page):
  bg: transparent + border: oklch(52% 0.19 45)
  → Medium visual weight
  → Same color family → coherent, tidak competing

  TERTIARY / GHOST (opsional):
  bg: transparent + color: oklch(38% 0 0)
  → Low visual weight
  → Achromatic → tidak competing sama sekali dengan primary
```

#### 1.2.8 Tooling Recommendations

Dari neuroscience ke tooling praktis:

```
1. oklch.com atau oklch-picker
   → Color picker berbasis perceptually uniform space
   → Prediksi kontras lebih akurat dari HEX picker biasa

2. Colour Contrast Analyser (app desktop, gratis)
   → Test real-time contrast ratio saat design di Figma/browser
   → Simulasi colorblind modes: protanopia, deuteranopia, tritanopia

3. Polychrom (Figma plugin)
   → Generate color scales yang perceptually uniform
   → Otomatis kalkulasi contrast ratio per step

4. Browser DevTools Accessibility Panel
   → Inspect → Accessibility → Contrast ratio live
   → Tersedia di Chrome, Firefox, Edge

5. Firefox Accessibility Inspector
   → Full audit kontras per elemen dalam satu klik
   → Lebih detail dari Chrome untuk hierarchy check
```

#### 1.2.9 Key Insight

> **Kontras bukan soal cantik atau tidak — kontras adalah cara otak diberitahu mana yang penting dan dalam urutan apa.** Setiap elemen yang salah kontras adalah instruksi yang salah dikirim ke visual cortex user, dan hasil akhirnya adalah confusion, fatigue, atau worse — exit dari produk.

### 1.3 Other Pre-attentive Attributes

Selain color contrast, otak juga di-hardwire untuk mendeteksi 2 properti visual lainnya secara instan: **Ukuran** dan **Gerakan**.

#### 1.3.1 Ukuran (Implied Importance)

Otak secara otomatis menginterpretasi elemen yang lebih besar sebagai lebih penting — ini adalah bias kognitif yang sangat reliable. Gunakan **typographic scale** dengan rasio yang konsisten:

```
Typographic Scale (rasio 1.25 - "Major Third"):
Display  : 48px  → Angka hero (total saldo, omzet hari ini)
H1       : 38px  → Judul halaman
H2       : 30px  → Section header
H3       : 24px  → Card title
Body L   : 18px  → Primary body text
Body     : 16px  → Default body
Body S   : 14px  → Supporting text
Caption  : 12px  → Label, timestamp, metadata
```

**Aplikasi per produk:**

| Produk | Implementasi |
|--------|--------------|
| **Nanabung** | Saldo total `48px bold` di atas, transaksi individual `16px` di bawahnya — gap besar ini secara visual menyatakan "ini yang terpenting" |
| **Katauser** | Jumlah feedback pending tampilkan sebagai angka besar di hero card, bukan dibenamkan dalam tabel — otak langsung tangkap urgency |
| **DukunGPS** | Kecepatan kendaraan real-time tampilkan besar di center screen, informasi lain lebih kecil mengitarinya |

#### 1.3.2 Gerakan (Motion Capture)

Gerakan adalah sinyal paling primitif secara evolusioner — otak mamalia di-hardwire untuk otomatis shift perhatian ke objek bergerak (mekanisme survival). Gunakan ini dengan sangat selektif karena sangat powerful:

```
Kapan pakai motion:
✅ Loading state (skeleton shimmer)
✅ Notifikasi badge muncul (bounce kecil)
✅ Success state (konfeti micro-animation)
✅ Error shake (form field salah)
✅ Transition antar halaman (slide/fade)

Kapan JANGAN pakai motion:
❌ Background animation dekoratif
❌ Auto-playing carousel tanpa pause
❌ Elemen yang terus bergerak saat user sedang baca
```

### 1.4 Eye-Tracking Patterns

Riset eye-tracking mengidentifikasi pola scanning mata yang sangat konsisten. Namun lebih penting dari pola itu sendiri adalah memahami **mengapa otak menghasilkan pola ini** — ini adalah kunci untuk mengeksploitasinya secara efektif dalam desain produk Akordium.

#### 1.4.1 Z-Pattern (untuk halaman minimal/landing page)

Z-pattern terjadi pada halaman dengan visual hierarchy yang dominan dan konten minimal. Otak mengikuti jalur Z karena layout yang terstruktur mengarahkan perhatian secara teratur.

```
┌──────────────────────────────┐
│ LOGO          ←→    NAV/CTA  │  ← Zona 1: Paling pertama dilihat
│                  ↘           │
│        HEADLINE/HERO         │
│           ↙                  │
│ VALUE PROP   →→→    CTA BTN  │  ← Zona 4: Keputusan akhir
└──────────────────────────────┘
```

**Gunakan untuk:** Landing page Akordium.id, halaman sign-up semua produk, halaman pricing SnapKasir/CaptionMania.

**Z vs F — Kapan menggunakan yang mana:**

| Pattern | Konteks | Otak User |
|---------|---------|-----------|
| **Z-Pattern** | Landing page, halaman dengan 1 CTA dominan | Mode eksplorasi — mengikuti visual guidance |
| **F-Pattern** | Dashboard, daftar, content-heavy pages | Mode scanning — memaksimalkan info per saccade |

---

#### 1.4.2 F-Pattern: Neurological Foundations

F-pattern pertama kali diidentifikasi oleh Jakob Nielsen (NNG) melalui studi eye-tracking pada 232 partisipan yang membaca ribuan halaman web. Tapi yang lebih penting: **mengapa otak menghasilkan pola ini?**

Jawabannya ada di tiga mekanisme neurologis yang bekerja bersamaan:

##### Mekanisme 1: Saccade Economics (Kognitif)

```
SACCADE ECONOMICS
─────────────────────────────────────────
Saccade = gerakan mata cepat dari satu titik ke titik lain
Fixation = titik di mana mata berhenti dan otak memproses

Otak diprogram untuk MEMINIMALKAN jumlah saccade
(setiap saccade = biaya energi kognitif)

Implikasi F-pattern:
→ Scan horizontal pertama = high information density per saccade
→ Semakin ke bawah → information scent makin lemah
→ Otak switch ke "vertical skim" untuk efisiensi
→ Hanya scan kiri karena kiri = highest info density per fixation

Ini bukan kebiasaan — ini adalah OPTIMIZATION ALGORITHM
yang dijalankan oleh sistem visual otak secara otomatis
```

##### Mekanisme 2: Predictive Processing (Prediktif)

```
PRIOR KNOWLEDGE WEIGHTING
───────────────────────────────────────────────────
Otak tidak membaca secara reaktif — ia PREDIKTIF

Predictive processing theory:
→ Otak terus membangun model "apa yang akan ada di sini"
→ Mata bergerak ke area yang otak prediksi paling informatif
→ Untuk konten web berbahasa LTR (left-to-right):
  - Kiri = awal kalimat = keyword/topik utama
  - Kanan = akhir kalimat = detail (bisa di-skip)

Setelah ribuan jam browsing, otak "tahu":
→ Informasi paling penting ada di KIRI dan ATAS
→ Kanan dan bawah adalah "diluted information zone"
→ Ini menjadi self-reinforcing neural pathway
```

##### Mekanisme 3: Cognitive Fatigue Cascade (Energi)

```
COGNITIVE FATIGUE CASCADE
────────────────────────────────────────────────
Working memory kapasitas terbatas (Miller's Law: 7±2 chunks)

Saat user mulai scroll:
→ Baris pertama: working memory fresh → baca penuh horizontal
→ Baris kedua: sedikit berkurang → scan lebih pendek
→ Baris ke-3+: fatigue mulai → hanya fixation di kiri
→ Akhirnya: pure vertical skim di margin kiri saja

Ini sebabnya F-pattern LEBIH KUAT di halaman text-heavy
dan LEBIH LEMAH di halaman dengan visual breaks yang baik
```

##### Brain Anatomy: DAN & VAN

fMRI dan studi saccade menunjukkan jaringan otak yang mengontrol F-pattern reading secara konkret:

```
DORSAL ATTENTION NETWORK (DAN)
─────────────────────────────────────────────────
Lokasi: Intraparietal Sulcus (IPS) + Frontal Eye Field (FEF)
Fungsi: Mengarahkan atensi visual secara top-down (voluntary)
Peran dalam F-pattern:
  → Menentukan prioritas area mana yang "worth scanning"
  → Bekerja berdasarkan ekspektasi user tentang content structure

VENTRAL ATTENTION NETWORK (VAN)
─────────────────────────────────────────────────
Lokasi: Temporoparietal Junction (TPJ) + Inferior Frontal Gyrus
Fungsi: Menangkap stimulus unexpected/salient (bottom-up)
Peran dalam F-pattern:
  → Menghentikan F-pattern saat ada elemen yang "pop"
  → Inilah mengapa visual yang kontras bisa BREAK F-pattern

Implikasi desain:
  DAN = pattern yang sudah ada (F-pattern)
  VAN = cara kita OVERRIDE pattern tersebut dengan pre-attentive design
  → Semua teknik pre-attentive attributes bekerja via VAN
```

---

#### 1.4.3 Enam Variasi F-Pattern

Update riset NNG 2024 mengungkapkan bahwa F-pattern tidak monolitik — ada **6 variasi** berdasarkan konteks konten:

##### 1. F-Pattern (Classic)

Konteks: Content pages, blog posts, berita, daftar teks

```
┌────────────────────┐
│████████████████████│ ← Scan penuh (baris pertama)
│████████████        │ ← Scan lebih pendek (baris kedua)
│█                   │
│█                   │ ← Vertical skim kiri
│█                   │
└────────────────────┘
```

**Gunakan untuk:** Blog Akordium, dokumentasi produk, changelog

##### 2. Layer-Cake Pattern

Konteks: Well-formatted content dengan subheadings yang kuat

```
┌────────────────────┐
│████████████████████│ ← Heading di-scan
│                    │ ← Body text di-skip
│████████████████████│ ← Heading berikutnya di-scan
│                    │ ← Body text di-skip lagi
└────────────────────┘
```

**Implikasi:** Subheading adalah SATU-SATUNYA hal yang dibaca oleh banyak user.

##### 3. Spotted Pattern

Konteks: User mencari sesuatu spesifik (angka, nama, link)

```
┌────────────────────┐
│     ●    ●         │ ← Random fixation
│  ●           ●     │   pada elemen yang
│         ●          │   "scent informatif"
│  ●    ●            │
└────────────────────┘
```

**Implikasi:** User dalam mode ini TIDAK membaca — mereka hunting. Bold dan angka menjadi anchor.

##### 4. Bypassing Pattern

Konteks: User sudah familiar dengan layout

```
Mata skip baris pertama dan langsung ke baris ke-2 atau ke-3
Terjadi ketika baris pertama dianggap "boilerplate"
```

**Implikasi:** Jangan taruh info kritis di line pertama jika target audience adalah return visitors.

##### 5. Commitment Pattern (THE GOAL)

Konteks: User sangat tertarik, konten sangat relevan

```
Membaca hampir seperti di buku (linear, word-by-word)
Ini yang ingin kita ciptakan untuk konten kritis (pricing, T&C)
```

**Implikasi penting:** F-pattern adalah sinyal kegagalan konten. Target sebenarnya adalah mendorong user masuk ke **commitment pattern** — di mana konten sangat relevan sehingga otak melepaskan default scan-mode.

##### 6. Structure Pattern (Mobile)

Konteks: Mobile, konten singkat

```
F-pattern terkompres menjadi lebih vertikal
"Left-edge fixation" lebih dominan dari horizontal scan
```

**Implikasi:** Di mobile, konten di sisi kanan semakin diabaikan.

---

#### 1.4.4 Product-Specific Heatmaps

Simulasi heatmap berdasarkan F-pattern untuk produk Akordium:

##### Dashboard Katauser (Feedback Management)

```
┌──────────────────────────────────────────────────┐
│🔴 Katauser    Feedback  Roadmap  Settings  [Notif]│ ← Hot (nav scan)
├──────────────────────────────────────────────────┤
│🔴 47 Feedback Baru   🟡 Roadmap Q1   🔵 Changelog │ ← Hot (hero metrics)
├──────────────────────────────────────────────────┤
│🔴 Tambah dark mode        ↑234 votes    [Respond] │ ← Hot (baris pertama)
│🟡 Fix login bug            ↑89 votes    [Respond] │ ← Medium
│🟡 Export CSV feature       ↑67 votes    [Respond] │ ← Medium
│🔵 Arabic language support  ↑45 votes    [Respond] │ ← Cool
│⚫ Better onboarding flow   ↑23 votes    [Respond] │ ← Mostly ignored
│⚫ Custom domain            ↑12 votes    [Respond] │ ← Mostly ignored
└──────────────────────────────────────────────────┘
Warna: 🔴 Paling diperhatikan → 🟡 → 🔵 → ⚫ Paling diabaikan
```

**Desain insight:** Item ke-5 dan ke-6 dalam daftar hampir tidak pernah dibaca. Untuk Katauser, gunakan **pinning mechanism** untuk force items penting ke atas, terlepas dari urutan kronologis atau votes.

##### Halaman Pricing SnapKasir

```
┌──────────────────────────────────────────────────┐
│🔴 SNAPKASIR     Fitur   Harga   Demo   [Daftar]  │ ← Hot
├──────────────────────────────────────────────────┤
│🔴 Pilih Paket yang Tepat untuk Bisnis Anda        │ ← Hot
│🟡 Mulai gratis, upgrade kapan saja               │ ← Medium
├──────────────────────────────────────────────────┤
│🔴 [GRATIS]    🔴 [STARTER]    🟡 [BISNIS]        │ ← Hot (card headers)
│🔴 Rp 0        🔴 Rp 99rb/bln  🔵 Rp 199rb/bln   │ ← Hot (harga)
│🟡 1 outlet    🟡 3 outlet     ⚫ Unlimited outlet │ ← Medium/Cool
│⚫ Basic POS   ⚫ + Analytics  ⚫ + Multi-user     │ ← Mostly ignored
│⚫ QRIS        ⚫ QRIS+ewallet ⚫ Semua payment    │ ← Mostly ignored
│🔴 [Mulai]     🔴 [Coba Gratis]🟡 [Hubungi Kami] │ ← CTA hot
└──────────────────────────────────────────────────┘
```

**Desain insight:** Feature list di tengah kartu pricing hampir **tidak dibaca**. User hanya membaca nama paket + harga + CTA.

**Optimasi pricing SnapKasir:**

```
❌ Jangan: Feature list panjang per paket (effort sia-sia)

✅ Lakukan:
  1. Nama paket singkat dan bermakna
  2. Harga besar dan jelas
  3. SATU differentiator per paket: "3 outlet" saja, bukan list 10 fitur
  4. Social proof di bawah harga: "2.847 UMKM sudah pakai"
  5. CTA button yang kontras — ini yang paling sering diklik
```

---

#### 1.4.5 Breaking the F-Pattern

Karena F-pattern adalah default behavior otak, ada dua strategi:

**Strategi 1 — Design WITH F-Pattern:** Tempatkan konten sesuai urutan kepentingan mengikuti natural scan path. Optimal untuk content-heavy pages (blog, daftar, dashboard).

**Strategi 2 — Design AGAINST F-Pattern:** Gunakan pre-attentive attributes untuk *interrupt* scan dan paksa otak memperhatikan area yang biasanya di-skip. Optimal untuk conversion pages (landing, pricing, checkout).

##### Teknik Breaking via VAN (Ventral Attention Network):

**1. Visual Interrupts**

Sisipkan elemen yang "berbeda" di titik yang biasanya di-skip:

```
....teks biasa....
....teks biasa....
┌─────────────────────────────────────┐
│  💡 "2.847 UMKM sudah profit lebih  │ ← Visual interrupt
│     dengan SnapKasir"               │   memaksa fixation
└─────────────────────────────────────┘
....teks biasa....
```

**2. Inline Visual Anchors**

Taruh angka, icon, atau highlight tepat di KIRI content area:

```
✅  Fitur pertama yang penting        ← Checkmark = visual anchor kiri
✅  Fitur kedua
✅  Fitur ketiga

Lebih baik dari:
Fitur pertama yang penting
Fitur kedua
Fitur ketiga
```

**3. Progressive Contrast**

```
Baris pertama = normal contrast
Baris kedua   = sedikit lebih muted
Baris ketiga  = LEBIH TERANG/KONTRAS lagi → pattern interrupt!
(counter-intuitive tapi efektif melawan cognitive fatigue)
```

**4. Strategic Bold**

Bold tidak boleh digunakan untuk emphasis sembarangan. Spotted pattern: otak melakukan "bold scan" sebelum F-scan.

```
"Platform POS terbaik untuk **UMKM Indonesia** dengan fitur
**offline-first** yang bekerja tanpa internet."

User spotted pattern akan membaca: "UMKM Indonesia" + "offline-first"
→ Ini sudah cukup untuk keputusan apakah perlu baca lebih lanjut
```

---

#### 1.4.6 Layer-Cake Strategy

Layer-cake pattern — di mana user hanya membaca subheadings — adalah variasi F-pattern yang paling **actionable**. Subheading adalah *the only text many users read*.

##### Contoh: Anggarin Landing Page

```
❌ Salah (subheading generik):
H1: "Platform Keuangan Personal Terbaik"
H2: "Fitur-Fitur Unggulan Kami"
H2: "Kenapa Memilih Kami"
H2: "Testimoni Pengguna"

✅ Benar (subheadings sebagai self-contained pitch):
H1: "Prediksi keuanganmu 90 hari ke depan — otomatis"
H2: "Tahu persis kapan saldo kamu akan habis sebelum kejadian"
H2: "Zakat, THR, dan pajak sudah otomatis diperhitungkan"
H2: "User naik tabungan 34% dalam 3 bulan pertama"
H2: "Mulai gratis — upgrade hanya jika kamu butuh lebih"

User yang hanya baca subheadings sudah dapat FULL PITCH.
```

##### Contoh: WaqfWise Dashboard

Setiap section card harus standalone:

```
✅ "677 Aset Wakaf Terkelola" (bukan "Data Aset")
✅ "Rp 2.4M Distribusi Bulan Ini" (bukan "Laporan Keuangan")
✅ "3 Sertifikasi Pending" (bukan "Status Dokumen")
```

---

#### 1.4.7 Seven Design Rules (Quick Reference)

Aturan final yang berlaku untuk **semua** produk Akordium berdasarkan neuroscience F-pattern:

```
┌─────────────────────────────────────────────────────────────┐
│  RULE 1: KIRI > KANAN                                      │
│  Informasi kritis selalu di kiri content area              │
├─────────────────────────────────────────────────────────────┤
│  RULE 2: ATAS > BAWAH                                      │
│  Hierarki informasi dari atas ke bawah tanpa pengecualian  │
├─────────────────────────────────────────────────────────────┤
│  RULE 3: BARIS 1-2 > ELSE                                  │
│  Above-the-fold adalah prime real estate neurologis         │
├─────────────────────────────────────────────────────────────┤
│  RULE 4: BOLD = SCENT                                      │
│  Bold bukan dekorasi — ini adalah waypoint untuk spotted    │
├─────────────────────────────────────────────────────────────┤
│  RULE 5: SUBHEADINGS = PITCH                               │
│  Setiap H2/H3 harus bisa berdiri sendiri sebagai value prop │
├─────────────────────────────────────────────────────────────┤
│  RULE 6: VISUAL INTERRUPT                                  │
│  Setiap 3-4 baris teks butuh visual break untuk melawan     │
│  cognitive fatigue                                         │
├─────────────────────────────────────────────────────────────┤
│  RULE 7: MOBILE COMPRESSION                                │
│  F-pattern lebih vertikal di mobile — left margin semakin   │
│  kritis, konten kanan semakin diabaikan                    │
└─────────────────────────────────────────────────────────────┘
```

---

#### 1.4.8 Key Insight

> **F-pattern adalah sinyal kegagalan konten.** Saat user membaca dalam F-pattern, artinya konten tidak cukup menarik untuk mempertahankan commitment reading. Target sebenarnya adalah mendorong user masuk ke **Commitment Pattern** — di mana konten sangat relevan sehingga otak melepaskan default scan-mode dan benar-benar membaca.

F-pattern awareness memberi desainer peta jalan untuk mencapai kondisi itu.

### 1.5 Visual Weight & Hierarki 5 Layer

Setiap screen harus punya hierarki yang jelas dalam **5 layer** — tidak lebih, tidak kurang:

```
Layer 1 — FOCAL POINT (1 elemen saja per screen)
          Contoh: Tombol "Catat Transaksi" di SnapKasir
          Teknik: Ukuran terbesar + kontras tertinggi + isolated whitespace

Layer 2 — PRIMARY INFO (2-3 elemen)
          Contoh: Total omzet hari ini, jumlah transaksi
          Teknik: Ukuran besar, warna brand, medium weight

Layer 3 — SECONDARY INFO (4-6 elemen)
          Contoh: Daftar 5 transaksi terakhir
          Teknik: Ukuran normal, warna netral, regular weight

Layer 4 — SUPPORTING INFO (bebas)
          Contoh: Timestamp, nama kasir, kategori
          Teknik: Ukuran kecil, abu-abu, light weight

Layer 5 — STRUCTURAL/UI CHROME (navigasi, border, dll)
          Teknik: Paling subtle, hampir invisible, hanya guide mata
```

**Anti-pattern yang harus dihindari di semua produk Akordium:**

```
❌ "Christmas Tree Effect": semua elemen di-bold, di-highlight,
   berwarna — tidak ada yang jadi focal point karena semua "teriak"

❌ "Flat Hierarchy": semua elemen ukuran dan warna yang sama,
   otak tidak tahu harus mulai baca dari mana

❌ "Hidden CTA": tombol aksi utama bersembunyi di antara
   elemen lain yang visually lebih dominan
```

### 1.6 Whitespace sebagai Tool Neuroscience

Whitespace (ruang kosong) bukan "pemborosan ruang" — ini adalah **neural directing tool** yang aktif. Otak secara otomatis menginterpretasi elemen yang dikelilingi whitespace lebih banyak sebagai **lebih penting dan premium**.

Dua jenis whitespace yang harus dikelola:

| Jenis | Definisi | Minimum |
|-------|----------|---------|
| **Macro whitespace** | Jarak antar section besar | `64px` antar section di desktop |
| **Micro whitespace** | Padding dalam elemen | Card padding `24px`, line-height `1.6` |

**Aplikasi spesifik per produk:**

| Produk | Whitespace Strategy |
|--------|---------------------|
| **WaqfWise & Klustera** | Gunakan whitespace lebih banyak — generous whitespace diasosiasikan dengan trustworthiness dan kualitas premium |
| **Atribuo & BibiDiskon** | Whitespace lebih sedikit dengan elemen lebih rapat — menciptakan rasa energi dan densitas aktivitas |

### 1.7 Design Tokens untuk Visual Hierarchy

```css
/* --- VISUAL WEIGHT SCALE --- */
--focal-size: 48px;       /* Layer 1: satu per screen */
--primary-size: 30px;     /* Layer 2 */
--secondary-size: 18px;   /* Layer 3 */
--supporting-size: 14px;  /* Layer 4 */
--chrome-size: 12px;      /* Layer 5 */

/* --- CONTRAST SYSTEM --- */
--contrast-focal: 7:1;    /* WCAG AAA — untuk focal point */
--contrast-primary: 4.5:1;/* WCAG AA — untuk semua teks body */
--contrast-secondary: 3:1;/* Minimum untuk UI components */

/* --- WHITESPACE RHYTHM --- */
--space-xs: 4px;
--space-sm: 8px;
--space-md: 16px;
--space-lg: 24px;
--space-xl: 48px;
--space-2xl: 64px;         /* Antar section */
--space-3xl: 96px;         /* Antar page sections besar */
```

Dengan design tokens ini terpusat di **Akordium Design System**, semua produk — dari SnapKasir hingga WaqfWise — secara otomatis akan berbagi hierarki visual yang sama. Otak user yang pindah dari satu produk ke produk lain tidak perlu "re-orientasi" karena **neural pattern recognition** sudah terbentuk, dan ini menjadi keunggulan kompetitif yang sangat sulit ditiru kompetitor.

### Key Rules Summary

- **Kontras tertinggi** = elemen paling penting
- **Jangan distribusikan** kontras merata — pilih 1-2 focal points
- **Thumb zone** (mobile): pojok kanan bawah untuk primary action
- **5 Layer hierarchy**: maksimal 1 focal point per screen
- **Whitespace is active**: bukan "kosong" tapi neural directing tool

---

## 2. Psikologi Warna Per Kategori Produk

Otak memproses warna secara emosional *sebelum* pikiran sadar bekerja — 90% snap judgment tentang sebuah produk dibuat berdasarkan warna.

### Color Palette Per Product

| Produk | Warna Primer | Hex | Alasan Neuroscience |
|--------|--------------|-----|---------------------|
| **Anggarin / Nanabung** | Green + Navy Blue | `#16A34A` + Navy | Green = growth & safety finansial; blue = trust & calming |
| **SnapKasir** | Orange + White | `#EA580C` + White | Orange = energi, action, urgency — cocok untuk transaksi cepat |
| **WaqfWise / Klustera** | Dark Green + Gold | Teal + Gold | Green = kepercayaan; gold = nilai & kemuliaan untuk konteks Islam |
| **Guestron / Sesarra** | Rose Gold + Cream | Rose + Cream | Warm colors = romantis, personal, emosional — wedding context |
| **Atribuo / Namerics** | Purple + Black | `#7C3AED` + Black | Purple = kreativitas, premium, misteri — cocok untuk identity & gamification |
| **CaptionMania** | Red-Orange Gradient | `#FF4D4D` → `#FF8C00` | Urgency + excitement = mendorong immediate action |
| **KoalaMail / ExcelCircle** | Blue + Gray | `#2563EB` + Gray | Blue = technical trust, akurasi, reliability untuk developer tools |
| **BibiDiskon** | Pink + White | `#EC4899` + White | Pink = celebration, friendly, birthday joy |
| **AkarKita** | Brown + Cream | Brown + Cream | Brown = heritage, family roots, grounding |
| **DukunGPS** | Teal + White | `#14B8A6` + White | Teal = precision, tech-forward, trustworthy |

### Key Rules

```
┌─────────────────────────────────────────────┐
│  MAX 3 warna dominan per halaman            │
│  ─────────────────────────────────────────  │
│  1. Primary (brand, main actions)           │
│  2. Secondary (accents, highlights)         │
│  3. Neutral (backgrounds, text)             │
└─────────────────────────────────────────────┘
```

**Why:** Otak mengalami *decision fatigue* saat terlalu banyak sinyal warna bersaing.

---

## 3. Tipografi sebagai Sinyal Neurologis

Tipografi memengaruhi *kecepatan pemrosesan* dan *nada emosional* di level bawah sadar. Otak memiliki preferensi hardwired.

### Font Recommendations Per Category

| Kategori | Font Type | Contoh | Untuk Produk |
|----------|-----------|--------|--------------|
| **Consumer Apps** | Rounded sans-serif | Inter, Nunito, Quicksand | Nanabung, BibiDiskon, Sesarra |
| **Tech/Finance** | Geometric sans-serif | Geist, DM Sans, Plus Jakarta | KoalaMail, Anggarin, DukunGPS, SnapKasir |
| **Heritage/Trust** | Serif | Lora, Playfair Display | WaqfWise, AkarKita |

### Typography Scale

```
Typography Ratio: 1:1.5 (minor third)

Body:     16px (base)
H4:       18px (1.125x)
H3:       24px (1.5x)
H2:       32px (2x)
H1:       48px (3x)
Display:  64px (4x)
```

### Key Rules

```
┌─────────────────────────────────────────────┐
│  MAX 2 typeface dalam satu produk           │
│  ─────────────────────────────────────────  │
│  1. Display/Heading font                    │
│  2. Body/UI font                            │
│                                             │
│  Size contrast MINIMUM 1:1.5                │
│  (otak menggunakan ukuran sebagai signal    │
│   hierarki informasi)                       │
└─────────────────────────────────────────────┘
```

---

## 4. Prinsip Gestalt

Otak secara aktif mencari pola dan struktur, bukan memproses pixel individual. Gestalt principles adalah *neural shortcut* yang harus dieksploitasi dalam setiap layout.

### 4 Prinsip Utama

| Prinsip | Definisi | Implementasi Akordium |
|---------|----------|----------------------|
| **Proximity** | Elemen berdekatan dianggap satu kelompok | Classnetic: nilai rapor & nama siswa berdekatan — tidak ada info lain di antara |
| **Similarity** | Elemen mirip dianggap satu fungsi | Semua tombol destructive (hapus, batalkan) selalu merah di semua produk — membangun "muscle memory" |
| **Closure** | Otak mengisi "gap" secara otomatis | Progress bar yang belum penuh lebih menarik perhatian (Zeigarnik Effect visual) |
| **Figure-Ground** | Background harus jelas berbeda dari konten | AkarKita: node pohon keluarga punya shadow/contrast tegas dari background canvas |

### Visual Examples

```
PROXIMITY (Grouping)
┌─────────────────────────────────────┐
│  [Nama Siswa]  [Nilai]              │  ✅ Related items grouped
│                                     │
│  [Action Button 1] [Action Button 2]│
└─────────────────────────────────────┘

SIMILARITY (Consistency)
┌─────────────────────────────────────┐
│  [Save]  [Cancel]  [Delete]         │  ❌ All same = confused user
│                                     │
│  [Save]  [Cancel]  [Delete]         │  ✅ Delete = red = danger
└─────────────────────────────────────┘

CLOSURE (Incompleteness)
┌─────────────────────────────────────┐
│  ████████░░░░░░░░░░  40%            │  ✅ Incomplete = attention
│  ██████████████████  100%           │  ❌ Complete = ignored
└─────────────────────────────────────┘
```

---

## 5. Cognitive Load Reduction

Cognitive load adalah "beban kerja" working memory yang kapasitasnya terbatas. Saat user merasa overwhelmed, mereka *abandon* — bukan complain.

### Hick's Law

> Waktu yang dibutuhkan untuk membuat keputusan meningkat **logaritmik** seiring bertambahnya pilihan.

### Miller's Law

> Working memory dapat menampung **7±2 chunks** informasi sekaligus.

### Implementasi Per Produk

| Produk | Implementasi |
|--------|--------------|
| **SnapKasir** | Menu kategori produk **maksimal 7 item** per layar |
| **Sesarra** | Wizard pernikahan dipecah **step-by-step** — masing-masing hanya 1-2 pertanyaan, bukan 1 form panjang |
| **Katauser** | Dashboard default hanya **3 metrik utama** — user bisa expand untuk lebih |
| **All Products** | **Progressive Disclosure** — tampilkan hanya yang dibutuhkan *saat ini* |

### Progressive Disclosure

```
Level 1: Essential info only (default view)
    ↓ User clicks "Learn more" or scrolls
Level 2: Additional context (expanded view)
    ↓ User explicitly requests
Level 3: Full details (deep dive)
```

**Why:** Otak reward system aktif saat "menemukan" fitur baru, menciptakan rasa discovery yang menyenangkan.

---

## 6. Motion & Micro-interactions

Gerakan adalah stimuli yang **paling cepat ditangkap** oleh visual cortex — lebih primitif dari warna atau bentuk.

### Easing Curves

| Curve | Usage | CSS |
|-------|-------|-----|
| `ease-out` | Elemen muncul | `cubic-bezier(0, 0, 0.2, 1)` |
| `ease-in` | Elemen menghilang | `cubic-bezier(0.4, 0, 1, 1)` |
| `ease-in-out` | Moving elements | `cubic-bezier(0.4, 0, 0.2, 1)` |
| `spring` | Playful interactions | Use `motion` library |

**Why `ease-out` for appearances:** Terasa "natural" karena meniru fisika dunia nyata yang sudah terekam di otak.

### Duration Thresholds

```
┌─────────────────────────────────────────────┐
│  DURASI ANIMASI                             │
│  ─────────────────────────────────────────  │
│  Micro-interaction:  100-200ms              │
│  UI transition:       200-300ms             │
│  Complex animation:   300-500ms             │
│                                             │
│  MAX 300ms untuk transisi UI biasa          │
│  Di atas ini → otak merasa "lag"            │
│  → merusak cognitive flow state             │
└─────────────────────────────────────────────┘
```

### Loading Strategies

| Strategy | When to Use | Why |
|----------|-------------|-----|
| **Skeleton screen** | Content loading | Mengurangi perceived wait time — otak melihat struktur dan mulai "mengisinya" secara mental |
| **Spinner** | Indeterminate wait | Gunakan hanya jika struktur tidak bisa diprediksi |
| **Progress bar** | Known duration | Mengurangi uncertainty anxiety |

### Haptic Feedback (Mobile)

| Produk | Implementasi |
|--------|--------------|
| **Klustera/Classnetic** | Getaran ringan saat QR code berhasil di-scan |
| **SnapKasir** | Haptic pada transaksi berhasil |
| **All Products** | Konfirmasi multi-sensory memperkuat aksi |

### Micro-celebration

```typescript
// Example: Konfeti 300ms di SnapKasir saat transaksi berhasil
import confetti from 'canvas-confetti';

function celebrateTransaction() {
  confetti({
    particleCount: 50,
    spread: 60,
    duration: 300,  // MAX 300ms
    colors: ['#EA580C', '#FFFFFF'],  // SnapKasir colors
  });
}
```

---

## 7. Emotional Architecture

Neuroscience membuktikan bahwa manusia mengingat pengalaman berdasarkan **peak moment** dan **ending** (Peak-End Rule oleh Daniel Kahneman), bukan rata-rata keseluruhan.

### Peak-End Rule

```
┌─────────────────────────────────────────────┐
│  MEMORY = max(peak_moment) + last_moment    │
│                                             │
│  Bukan: average(all_moments)                │
└─────────────────────────────────────────────┘
```

### Peak Moment Design Per Produk

| Produk | Peak Moment | Implementation |
|--------|-------------|----------------|
| **Guestron / Sesarra** | First preview wedding page, Countdown mencapai 0 | Buat visual paling dramatis dan memorable — ini yang diingat dan di-share |
| **Anggarin** | Mencapai savings goal | Full-screen celebration dengan nama goal — jadi *peak emotional memory* |
| **WaqfWise** | Impact visualization | Live counter: *"Wakaf Anda sudah dirasakan oleh 847 penerima manfaat"* — mengaktifkan **altruistic reward pathway** |
| **BibiDiskon** | Birthday reward reveal | Countdown 3 hari → big reveal moment dengan animasi spesial |
| **Atribuo** | Level up / Achievement unlock | Full-screen character evolution animation |

### Ending Design

| Produk | Ending Moment |
|--------|---------------|
| **SnapKasir** | Receipt screen dengan "Thank you" personal |
| **Klustera** | Payment success dengan impact message |
| **All Products** | Logout screen dengan "See you tomorrow" |

---

## 8. Akordium Design System

Konsistensi lintas produk bukan sekadar branding — ini membangun **procedural memory** di otak user. Saat seseorang terbiasa dengan SnapKasir, mereka tidak perlu *belajar lagi* saat pertama buka Anggarin, karena neural pathway navigasi sudah terbentuk.

### System Architecture

```
Akordium Design System
├── 1. Neural Color Tokens
├── 2. Typography Scale
├── 3. Visual Weight & Contrast Tokens
├── 4. Whitespace Rhythm Tokens
├── 5. Motion Library
├── 6. Cognitive Chunk Components
├── 7. Micro-celebration Animations
├── 8. Progress Architecture
└── 9. Gesture Vocabulary
```

### 8.1 Neural Color Tokens

```css
/* Financial Products */
--color-finance-primary: #16A34A;    /* Green - growth */
--color-finance-secondary: #1E3A5F;  /* Navy - trust */

/* Commerce Products */
--color-commerce-primary: #EA580C;   /* Orange - action */
--color-commerce-secondary: #FFFFFF; /* White - clean */

/* Islamic Products */
--color-islamic-primary: #0D5C4D;    /* Dark teal - trust */
--color-islamic-accent: #D4AF37;     /* Gold - nobility */

/* Wedding Products */
--color-wedding-primary: #E8B4B8;    /* Rose - romantic */
--color-wedding-secondary: #F5F5DC;  /* Cream - warm */

/* Creative Products */
--color-creative-primary: #7C3AED;   /* Purple - creativity */
--color-creative-secondary: #000000; /* Black - premium */

/* Developer Tools */
--color-dev-primary: #2563EB;        /* Blue - technical */
--color-dev-secondary: #6B7280;      /* Gray - neutral */
```

### 8.2 Typography Scale

```css
/* Font Families */
--font-display: 'Geist', system-ui, sans-serif;
--font-body: 'Inter', system-ui, sans-serif;
--font-heritage: 'Lora', Georgia, serif;

/* Size Scale (1:1.5 ratio) */
--text-xs: 0.75rem;    /* 12px */
--text-sm: 0.875rem;   /* 14px */
--text-base: 1rem;     /* 16px */
--text-lg: 1.125rem;   /* 18px */
--text-xl: 1.25rem;    /* 20px */
--text-2xl: 1.5rem;    /* 24px */
--text-3xl: 2rem;      /* 32px */
--text-4xl: 2.5rem;    /* 40px */
--text-5xl: 3rem;      /* 48px */
```

### 8.3 Visual Weight & Contrast Tokens

```css
/* --- VISUAL WEIGHT SCALE (5-Layer Hierarchy) --- */
--focal-size: 48px;       /* Layer 1: Focal Point - ONE per screen */
--primary-size: 30px;     /* Layer 2: Primary Info - 2-3 elements */
--secondary-size: 18px;   /* Layer 3: Secondary Info - 4-6 elements */
--supporting-size: 14px;  /* Layer 4: Supporting Info */
--chrome-size: 12px;      /* Layer 5: UI Chrome */

/* Font Weight Scale */
--weight-light: 300;
--weight-regular: 400;
--weight-medium: 500;
--weight-semibold: 600;
--weight-bold: 700;

/* --- CONTRAST SYSTEM (WCAG Compliance) --- */
--contrast-focal: 7:1;      /* WCAG AAA - Focal points */
--contrast-primary: 4.5:1;  /* WCAG AA - Body text */
--contrast-secondary: 3:1;  /* Minimum - UI components */
--contrast-muted: 2:1;      /* Disabled/inactive states */
```

### 8.4 Whitespace Rhythm Tokens

```css
/* --- WHITESPACE RHYTHM --- */
--space-xs: 4px;      /* Tight grouping */
--space-sm: 8px;      /* Related items */
--space-md: 16px;     /* Default spacing */
--space-lg: 24px;     /* Card padding */
--space-xl: 48px;     /* Large gaps */
--space-2xl: 64px;    /* Section separators */
--space-3xl: 96px;    /* Page section breaks */

/* Component-Specific Spacing */
--card-padding: 24px;
--section-gap: 64px;
--form-group-gap: 16px;
--list-item-gap: 12px;

/* Line Heights */
--line-height-tight: 1.25;   /* Headings */
--line-height-normal: 1.5;   /* UI text */
--line-height-relaxed: 1.75; /* Long-form content */
```

### 8.5 Motion Library

```css
/* Duration Tokens */
--duration-fast: 150ms;
--duration-normal: 250ms;
--duration-slow: 350ms;

/* Easing Tokens */
--ease-out: cubic-bezier(0, 0, 0.2, 1);
--ease-in: cubic-bezier(0.4, 0, 1, 1);
--ease-in-out: cubic-bezier(0.4, 0, 0.2, 1);
--ease-spring: cubic-bezier(0.34, 1.56, 0.64, 1);

/* Animation Presets */
--animate-fade-in: fade-in var(--duration-normal) var(--ease-out);
--animate-slide-up: slide-up var(--duration-normal) var(--ease-out);
--animate-scale-in: scale-in var(--duration-fast) var(--ease-spring);
```

### 8.6 Cognitive Chunk Components

```typescript
// Max items per group (Miller's Law: 7±2)
const CHUNK_LIMITS = {
  menuItems: 7,        // Navigation menu
  dashboardCards: 5,   // Dashboard widgets
  formFields: 5,       // Per section
  listItems: 10,       // Before pagination
  tabs: 5,             // Tab navigation
};
```

### 8.7 Micro-celebration Animations

```
/animations
├── confetti-burst.json        # Transaction success
├── checkmark-pop.json         # Task complete
├── star-burst.json            # Achievement unlock
├── heart-pulse.json           # Like/favorite
├── progress-complete.json     # Goal reached
└── level-up.json              # Level up (Atribuo)
```

**Library:** Lottie (After Effects → JSON)

### 8.8 Progress Architecture

```typescript
// Zeigarnik Effect components
interface ProgressComponent {
  current: number;
  total: number;
  showPercentage: boolean;     // Always true
  incompleteStyle: 'gap' | 'dim';  // Gap more effective
  animateOnView: boolean;      // Draw attention
}

// Usage examples:
// - Profile completion: "Profil 75% lengkap"
// - Streak: "5 hari berturut-turut"
// - Goal: "Rp 4.500.000 / Rp 10.000.000"
```

### 8.9 Gesture Vocabulary

| Gesture | Action | Consistent Across |
|---------|--------|-------------------|
| Swipe left | Delete/archive | All list views |
| Swipe right | Quick action | All list views |
| Long press | Context menu | All interactive items |
| Pull down | Refresh | All scrollable views |
| Double tap | Like/favorite | All content views |

---

## Referensi

### Academic & Industry Sources

#### Color Contrast Neuroscience (Section 1.2)

1. [Visual Contrast Processing in the Brain](https://www.annualreviews.org/content/journals/10.1146/annurev-vision-101322-111204) - Annual Review of Vision Science
2. [ON/OFF Pathway Research](https://www.jneurosci.org/lookup/doi/10.1523/JNEUROSCI.1672-22.2022) - Journal of Neuroscience (2022)
3. [Chromatic vs Luminance Contrast Attention Capture](https://pmc.ncbi.nlm.nih.gov/articles/PMC7408945/) - NCBI/PMC (EEG Study 2020)
4. [WCAG Contrast Guidelines](https://webaim.org/articles/contrast/) - WebAIM
5. [Understanding WCAG Color Contrast](https://developer.mozilla.org/en-US/docs/Web/Accessibility/Guides/Understanding_WCAG/Perceivable/Color_contrast) - MDN Web Docs
6. [Color Science for Interfaces](https://blakecrosley.com/blog/color-science-interfaces) - Blake Crosley (2026)
7. [Gamma Oscillations in Visual Cortex](https://pnas.org/doi/full/10.1073/pnas.1717334115) - PNAS (2018 fMRI Study)
8. [Simultaneous Contrast Effect](https://pmc.ncbi.nlm.nih.gov/articles/PMC6583951/) - NCBI/PMC
9. [Color Context Effects in V4](https://www.frontiersin.org/journals/neuroscience/articles/10.3389/fnins.2021.668116/full) - Frontiers in Neuroscience
10. [Colorblind Accessibility](https://dap.berkeley.edu/web-a11y-basics/color) - UC Berkeley Digital Accessibility
11. [Color Contrast Accessibility Guide 2025](https://www.allaccessible.org/blog/color-contrast-accessibility-wcag-guide-2025) - AllAccessible

#### Eye-Tracking & F-Pattern (Section 1.4)

1. [F-Shaped Pattern of Reading on the Web](https://www.nngroup.com/articles/f-shaped-pattern-reading-web-content/) - Nielsen Norman Group (Original study, 2006)
2. [F-Shaped Pattern — How Users Scan Content](https://www.nngroup.com/articles/f-shaped-pattern-reading-web-content-discovered/) - Nielsen Norman Group (Updated 2024)
3. [Eye-Tracking Studies and the F-Pattern](https://www.eyequant.com/resources/eye-tracking-studies-does-the-famous-f-shape-pattern-really-exist/) - EyeQuant
4. [Saccade Economics and Eye Movement Control](https://pmc.ncbi.nlm.nih.gov/articles/PMC8026251/) - NCBI/PubMed
5. [Frontiers in Psychology: Visual Attention](https://www.frontiersin.org/articles/10.3389/fpsyg.2025.1455177/full) - Frontiers
6. [How People Read on the Web](https://www.iso.org/files/live/sites/isoorg/files/styleguide/resources/How_People_Read_on_the_Web.pdf) - ISO

#### General Neuroscience & Design

7. [Neurodesign Using Neuroscience for Better UX](https://bejamas.com/blog/neurodesign-using-neuroscience-for-better-ux-design) - Bejamas
8. [Neurodesign and Cognitive UX](https://boryanachervilova.com/blog/neurodesign-and-cognitive-ux) - Boryana Chervilova
9. [Neuroscience Design Principles](https://zamora.design/neuroscience-design-principles/) - Zamora Design
10. [Color Psychology in Digital Design](https://nmqdigital.com/blog/color-psychology-in-digital-design) - NMQ Digital
11. [Color Psychology in UI Design](https://voya.digital/en/blog/color-psychology-in-ui-design-how-does-it-influence-user-decisions/) - Voya Digital
12. [Psychology of Color in UI/UX](https://uxmag.com/articles/the-psychology-of-color-in-ui-ux-design) - UX Magazine
13. [Typography and Color Psychology](https://www.linkedin.com/advice/0/how-do-you-apply-typography-color-psychology) - LinkedIn
14. [Designing for the Mind: 6 Psychological Principles](https://www.linkedin.com/pulse/designing-mind-6-psychological-principles-every-ux-sidorovskaya-rw7pe) - LinkedIn
15. [Gestalt Principles of Design](https://www.lazarev.agency/articles/gestalt-principles-of-design) - Lazarev Agency
16. [Neuroscience-Based App Design](https://thisisglance.com/blog/neuroscience-based-app-design-the-ultimate-guide) - Glance
17. [Dopamine-Driven Design](https://thisisglance.com/blog/dopamine-driven-design-creating-apps-users-cant-delete) - Glance
18. [UX and Neuroscience](https://aguayo.co/en/blog-aguayo-user-experience/ux-and-neuroscience/) - Aguayo
19. [Peak-End Rule in UX](https://www.eyequant.com/resources/how-to-use-neuroscience-to-create-the-best-ux/) - EyeQuant

---

**Last Updated:** 2026-03-03
**Document Version:** 1.2 (Added comprehensive Color Contrast Neuroscience section)
**Author:** Akordium Lab Team
**Status:** Living Document
**Related:** [neuroscience-design-guide.md](./neuroscience-design-guide.md) (Behavioral Psychology)
