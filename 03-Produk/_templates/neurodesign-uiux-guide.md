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

### 1.2 Pre-attentive Attributes: 4 Senjata Utama

Otak di-hardwire untuk mendeteksi 4 properti visual secara instan, dalam urutan prioritas:

#### 1. Kontras (Paling Kuat)

Kontras adalah sinyal paling primitif yang diproses oleh retina bahkan sebelum sinyal sampai ke korteks. **Kontras tinggi = perhatian wajib. Kontras rendah = sinyal diabaikan.**

```
❌ Salah: Tombol "Bayar Sekarang" warna biru di background biru muda
✅ Benar: Tombol "Bayar Sekarang" warna solid gelap di background putih
         dengan contrast ratio minimum 4.5:1 (WCAG AA standard)
```

**Aplikasi Akordium:**

| Produk | Implementasi |
|--------|--------------|
| **SnapKasir** | Tombol "Catat Transaksi" harus memiliki contrast ratio tertinggi dari semua elemen di layar; segala elemen lain sengaja dibuat lebih "soft" |
| **Anggarin** | Angka surplus/defisit cashflow tampilkan dengan kontras berbeda: hijau terang untuk positif, merah untuk negatif — otak langsung "tahu" kondisi keuangan sebelum membaca angkanya |

#### 2. Warna (Emotional Tagging)

Warna diproses di area V4 korteks visual dan langsung ter-routing ke amygdala untuk tagging emosional. Ini sebabnya merah = bahaya/urgent bisa dipahami otak tanpa membaca teks apapun.

**Sistem warna hierarkis untuk semua produk Akordium:**

```
Tier 1 — Primary Action    : Brand color paling saturasi tinggi
Tier 2 — Secondary Action  : Brand color versi lebih muted/outlined
Tier 3 — Tertiary/Passive  : Abu-abu netral
Tier 4 — Destructive       : Merah (#DC2626) — konsisten di SEMUA produk
Tier 5 — Success           : Hijau (#16A34A) — konsisten di SEMUA produk
Tier 6 — Warning           : Amber (#D97706) — konsisten di SEMUA produk
```

Konsistensi tier warna lintas seluruh produk Akordium membangun **semantic memory** — user tidak perlu "belajar ulang" arti warna setiap pindah produk.

#### 3. Ukuran (Implied Importance)

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

#### 4. Gerakan (Motion Capture)

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

### 1.3 Eye-Tracking Patterns

Riset eye-tracking mengidentifikasi pola scanning mata yang sangat konsisten:

#### Z-Pattern (untuk halaman minimal/landing page)

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

#### F-Pattern (untuk halaman konten/dashboard)

```
┌──────────────────────────────┐
│ ████████████████████████████ │  ← Scan horizontal pertama (penuh)
│ ████████████████             │  ← Scan horizontal kedua (lebih pendek)
│ █                            │
│ █                            │  ← Vertical scan di sisi kiri
│ █                            │
└──────────────────────────────┘
```

**Gunakan untuk:** Dashboard Katauser, laporan keuangan Anggarin, daftar feedback/transaksi.

**Aturan F-Pattern untuk dashboard Akordium:**

- Letakkan **metric terpenting** di horizontal pertama (top row cards)
- Letakkan **aksi terpenting** di sisi **kiri** kolom, bukan kanan — mata selalu kembali ke kiri
- Jangan taruh informasi kritis di pojok kanan bawah — area paling jarang di-scan

### 1.4 Visual Weight & Hierarki 5 Layer

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

### 1.5 Whitespace sebagai Tool Neuroscience

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

### 1.6 Design Tokens untuk Visual Hierarchy

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

1. [Neurodesign Using Neuroscience for Better UX](https://bejamas.com/blog/neurodesign-using-neuroscience-for-better-ux-design) - Bejamas
2. [Neurodesign and Cognitive UX](https://boryanachervilova.com/blog/neurodesign-and-cognitive-ux) - Boryana Chervilova
3. [Neuroscience Design Principles](https://zamora.design/neuroscience-design-principles/) - Zamora Design
4. [Color Psychology in Digital Design](https://nmqdigital.com/blog/color-psychology-in-digital-design) - NMQ Digital
5. [Color Psychology in UI Design](https://voya.digital/en/blog/color-psychology-in-ui-design-how-does-it-influence-user-decisions/) - Voya Digital
6. [Psychology of Color in UI/UX](https://uxmag.com/articles/the-psychology-of-color-in-ui-ux-design) - UX Magazine
7. [Typography and Color Psychology](https://www.linkedin.com/advice/0/how-do-you-apply-typography-color-psychology) - LinkedIn
8. [Designing for the Mind: 6 Psychological Principles](https://www.linkedin.com/pulse/designing-mind-6-psychological-principles-every-ux-sidorovskaya-rw7pe) - LinkedIn
9. [Gestalt Principles of Design](https://www.lazarev.agency/articles/gestalt-principles-of-design) - Lazarev Agency
10. [Neuroscience-Based App Design](https://thisisglance.com/blog/neuroscience-based-app-design-the-ultimate-guide) - Glance
11. [Dopamine-Driven Design](https://thisisglance.com/blog/dopamine-driven-design-creating-apps-users-cant-delete) - Glance
12. [UX and Neuroscience](https://aguayo.co/en/blog-aguayo-user-experience/ux-and-neuroscience/) - Aguayo
13. [Peak-End Rule in UX](https://www.eyequant.com/resources/how-to-use-neuroscience-to-create-the-best-ux/) - EyeQuant

---

**Last Updated:** 2026-03-03
**Document Version:** 1.0
**Author:** Akordium Lab Team
**Status:** Living Document
**Related:** [neuroscience-design-guide.md](./neuroscience-design-guide.md) (Behavioral Psychology)
