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

Otak memproses visual mengikuti urutan yang sangat predictable: **kontras → warna → ukuran → gerakan**. Desain yang menumpuk semua sinyal ini pada elemen kunci akan menangkap perhatian secara reliable, sedangkan desain yang menyebarnya merata menciptakan "visual noise" di mana tidak ada yang menonjol.

### Eye-Tracking Patterns

Riset eye-tracking membuktikan dua pola scanning dominan:

| Pattern | Platform | Pergerakan Mata |
|---------|----------|-----------------|
| **F-Pattern** | Desktop | Horizontal di atas → turun ke kiri → scan horizontal pendek |
| **Z-Pattern** | Mobile | Zig-zag dari kiri-atas ke kanan-bawah |

### Implementasi Akordium

| Produk | Implementasi |
|--------|--------------|
| **SnapKasir** | Tombol "Catat Transaksi" di pojok kanan bawah (thumb zone mobile) dengan kontras warna tertinggi |
| **Anggarin/Nanabung** | Angka saldo/surplus di kiri-atas dengan ukuran besar — "anchor visual" pertama dibaca otak |
| **All Products** | CTA utama (upgrade, bayar) di zona paling aktif pola F/Z — bukan di tengah halaman secara simetris |

### Key Rules

- **Kontras tertinggi** = elemen paling penting
- **Jangan distribusikan** kontras merata — pilih 1-2 focal points
- **Thumb zone** (mobile): pojok kanan bawah untuk primary action

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
├── 3. Motion Library
├── 4. Cognitive Chunk Components
├── 5. Micro-celebration Animations
├── 6. Progress Architecture
└── 7. Gesture Vocabulary
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

### 8.3 Motion Library

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

### 8.4 Cognitive Chunk Components

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

### 8.5 Micro-celebration Animations

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

### 8.6 Progress Architecture

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

### 8.7 Gesture Vocabulary

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
