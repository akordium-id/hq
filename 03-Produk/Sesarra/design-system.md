# Sesarra Design System

> Neurodesign-based visual hierarchy untuk Wedding Website Builder

**Category:** Wedding

**Related:** [neurodesign-uiux-guide.md](../_templates/neurodesign-uiux-guide.md)

---

## 1. Visual Identity

### Color Palette

| Role | Color | Hex | Neuroscience Rationale |
|------|-------|-----|------------------------|
| Primary | Rose | `#E8B4B8` | Warna romantis dan hangat yang memicu emosi cinta, kelembutan, dan intim - sangat cocok untuk momen pernikahan yang penuh kasih sayang |
| Secondary | Cream | `#F5F5DC` | Memberikan kesan premium, elegan, dan tenang - menciptakan latar belakang yang bersih dan hangat tanpa mengganggu konten utama |
| Accent | Gold | `#D4AF37` | Menambahkan sentuhan mewah dan spesial untuk highlight penting seperti tombol publish atau elemen dekoratif website |
| Background | Cream Light | `#FAFAF0` | Nuansa hangat yang nyaman di mata untuk pengalaman editing yang lama |
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

**Typography Rationale:** Playfair Display untuk heading memberikan kesan romantis, klasik, dan elegan yang sangat cocok untuk tema pernikahan. Sementara Inter untuk body text memastikan keterbacaan yang baik dengan tampilan modern yang clean. Kombinasi ini menciptakan harmoni antara keanggunan tradisional dan fungsionalitas modern untuk website builder.

---

## 2. Visual Hierarchy (5-Layer)

### Layer Definitions

| Layer | Use Case | Size | Weight | Contrast |
|-------|----------|------|--------|----------|
| **1. Focal Point** | Preview website pernikahan | 48px | Bold | 7:1 (AAA) |
| **2. Primary** | Tombol Publish / Status website | 30px | Medium | 4.5:1 (AA) |
| **3. Secondary** | Opsi template / Nama domain | 18px | Regular | 4.5:1 (AA) |
| **4. Supporting** | Label setting, help text | 14px | Light | 3:1 |
| **5. UI Chrome** | Navigation editor, toolbar | 12px | Regular | 3:1 |

### Focal Point Strategy

**Single Focal Element per Screen:** Live preview website pernikahan yang sedang dibuat

```
Example:
┌─────────────────────────────────────┐
│                                     │
│    [PREVIEW WEBSITE]                │  ← Layer 1: Live preview (Focal Point)
│    ANDI & PUTRI                     │
│    25 DESEMBER 2025                 │
│                                     │
│  ┌─────────┐  ┌─────────┐          │  ← Layer 2: Primary actions
│  │  SAVE   │  │ PUBLISH │          │
│  └─────────┘  └─────────┘          │
│                                     │
│  Template: Romantic Garden          │  ← Layer 3: Settings
│  Domain: andi-putri.sesarra.id      │
│                                     │
└─────────────────────────────────────┘
```

### Anti-Patterns to Avoid

- ❌ **Christmas Tree Effect:** Semua elemen bold/highlighted = tidak ada focal point
- ❌ **Flat Hierarchy:** Semua elemen ukuran sama = otak bingung mulai dari mana
- ❌ **Hidden CTA:** Tombol Publish tersembunyi di antara opsi lain

---

## 3. Eye Tracking Pattern

### Primary Pattern: Z-Pattern

**Rationale:** Z-Pattern sangat cocok untuk website builder karena pengguna cenderung memindai dari kiri atas (preview/nama website) ke kanan atas (tombol publish/CTA), lalu ke tengah (area editing), dan akhirnya ke kanan bawah (tombol aksi sekunder). Pattern ini mengikuti alur kerja natural: preview -> edit -> publish.

### Pattern Application

#### Z-Pattern - Untuk Editor Screen

```
┌──────────────────────────────────────┐
│ ANDI & PUTRI     →→→    PUBLISH ▲    │  ← Zone 1: First impression + CTA
│                      ↘                │
│       [LIVE PREVIEW AREA]            │
│       Website Builder                │
│                   ↙                   │
│ TEMPLATES      →→→   CUSTOM DOMAIN   │  ← Zone 4: Secondary actions
└──────────────────────────────────────┘
```

### Key Rules

- **Most important element** (preview website) = top horizontal scan (Zone 1-2)
- **Most important action** (tombol publish) = top-right corner (Zone 1)
- **Never hide critical info** di bottom-left corner (blind spot)

---

## 4. Motion Guidelines

### When to Use Motion

| Use Case | Animation Type | Duration |
|----------|---------------|----------|
| Loading states | Skeleton shimmer dengan efek rose | Continuous |
| Success feedback | Confetti dengan warna rose-gold saat publish | 300ms max |
| Error indication | Shake lembut dengan pulse merah | 200ms |
| Page transitions | Fade/slide dengan rose tint | 250ms |
| Button hover | Scale dengan glow rose | 150ms |
| Preview updates | Smooth transition (bukan instant swap) | 300ms |

### When NOT to Use Motion

- ❌ Background decorative animations (mengganggu fokus pada editing)
- ❌ Auto-playing carousels tanpa pause
- ❌ Continuous motion saat mengedit konten
- ❌ Apa pun yang mengalihkan perhatian dari preview website

### Easing Presets

```css
--ease-out: cubic-bezier(0, 0, 0.2, 1);     /* Elements appearing */
--ease-in: cubic-bezier(0.4, 0, 1, 1);      /* Elements disappearing */
--ease-in-out: cubic-bezier(0.4, 0, 0.2, 1); /* Moving elements */
```

---

## 5. Whitespace Strategy

### Density Level: Generous

**Rationale:** Whitespace yang luas menciptakan kesan premium, eksklusif, dan romantis - sangat penting untuk produk pernikahan. Ruang kosong juga memberikan "ruang bernafas" bagi pengguna saat berkreasi membuat website pernikahan impian mereka.

| Whitespace Type | Value | Application |
|-----------------|-------|-------------|
| **Macro** (section gaps) | 80-120px | Antara section utama (preview, editor, settings) |
| **Card padding** | 32px | Inside card components (template cards, settings) |
| **Form group gaps** | 24px | Antara form fields (input data pernikahan) |
| **List item gaps** | 16px | Antara list items (daftar template) |
| **Micro** (tight) | 8-12px | Related inline elements (badge, status) |

### Density by Product Category

| Category | Density | Why |
|----------|---------|-----|
| Wedding (Sesarra) | Generous | Whitespace = premium, emosional, dan romantis |
| Commerce/Action | Minimal | Density = energy & urgency |
| Standard | Moderate | Balance of clarity & efficiency |

---

## 6. Design Tokens

```css
/* ===========================================
   SESARRA DESIGN TOKENS
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
| **Focal Point** | Live preview website pernikahan di tengah atas |
| **Eye Pattern** | Z-Pattern (dari preview ke tombol publish) |
| **Primary Actions** | Tombol "Publish" dengan accent gold di kanan atas |
| **Key Metrics** | Status website, jumlah pengunjung (Layer 2) |

### Template Selection

| Element | Specification |
|---------|---------------|
| **Focal Point** | Template yang sedang dipilih/di-highlight |
| **Pattern** | F-Pattern (untuk scanning daftar template) |
| **CTAs** | Tombol "Pilih Template" di kiri atas (bukan kanan) |

### Editor Screen

| Element | Specification |
|---------|---------------|
| **Focal Point** | Live preview website yang sedang diedit |
| **Pattern** | Z-Pattern (dari preview ke panel editor) |
| **CTAs** | Tombol "Save" dan "Publish" di kanan atas |

---

## 8. Peak Moment Design

Based on Peak-End Rule: Users remember the **peak moment** and the **ending**, not the average.

### Peak Moment: Website Published

| Moment | Implementation |
|--------|----------------|
| **Trigger** | User pertama kali publish website pernikahan |
| **Visual** | Full-screen celebration dengan animasi website "mengudara", confetti rose-gold |
| **Duration** | 500ms animation |
| **Micro-copy** | "Wedding website kamu sudah online! 🎉 Bagikan ke keluarga dan teman ya!" |

### Peak Moment: First Preview Selected

| Moment | Implementation |
|--------|----------------|
| **Trigger** | User memilih template dan melihat preview pertama |
| **Visual** | Smooth reveal dengan fade-in dari tengah |
| **Duration** | 400ms animation |
| **Micro-copy** | "Template cantik! Lanjutkan dengan edit konten 💒" |

### Ending Design

| Moment | Implementation |
|--------|----------------|
| **Trigger** | User logout atau menutup editor |
| **Message** | "Proyek kamu tersimpan. Sampai jumpa di kreasi indah berikutnya! ✨" |
| **Tone** | Warm, encouraging, creative |

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
- [ ] Single focal point per screen (Live Preview Website)
- [ ] Eye tracking pattern applied (Z-Pattern untuk editor, F-Pattern untuk template)
- [ ] Whitespace density appropriate (Generous)
- [ ] Motion used sparingly (romantic, tidak berlebihan)
- [ ] Peak moment designed (Website published, preview pertama)
- [ ] Design tokens implemented in CSS
- [ ] Accessibility requirements met

---

## 11. Behavioral Design Techniques

Berikut adalah 11 teknik behavioral design dengan implementasi spesifik untuk Sesarra (Wedding Website Builder):

### 1. Variable Reward

**Neuroscience Basis:** Dopamine surge terjadi saat reward tidak predictable - membuat eksplorasi template dan fitur menjadi engaging.

| Implementasi Sesarra | Detail |
|---------------------|--------|
| **Template Discovery** | Saat user browse template, kadang muncul "Hidden Gem" badge dengan efek glow rose-gold - template ini mendapat highlight visual khusus yang tidak muncul setiap saat |
| **AI Content Suggestions** | Fitur saran konten (vows, quotes, love story) kadang memberikan hasil yang biasa, kadang sangat personal dan menyentuh hati - user terus mencoba karena tidak tahu kapan dapat "perfect suggestion" |
| **Random Romance Tips** | Saat publish, kadang munculkan tips spesial: "Tip: Tambahkan playlist lagu masa pacaran di section music untuk personal touch yang kuat" |

### 2. Habit Loop (Cue → Routine → Reward)

**Neuroscience Basis:** Basal ganglia membentuk neural pathway otomatis untuk perilaku yang berulang.

| Loop Element | Implementasi Sesarra |
|--------------|---------------------|
| **Cue** | Notifikasi pagi: "Ada 3 update baru di website Andi & Putri yang menunggu" |
| **Routine** | User membuka editor untuk mengecek dan menambahkan konten baru |
| **Reward** | Micro-celebration dengan confetti rose-gold setiap kali ada perubahan yang di-save + progress bump: "Website kamu 85% lengkap!" |

**Wedding Countdown Habit:**
- Cue: Notifikasi harian pada jam yang sama dengan countdown menuju hari H
- Routine: User membuka untuk melihat countdown timer berkurang
- Reward: Anticipation dopamine yang semakin kuat mendekati hari pernikahan

### 3. Zeigarnik Effect

**Neuroscience Basis:** Uncompleted tasks stay in working memory - otak terus mengingat tugas yang belum selesai.

| Implementasi Sesarra | Visual Treatment |
|---------------------|------------------|
| **Profile Completion** | "Website pernikahanmu 72% lengkap - ada 5 section yang belum diisi" dengan progress bar rose yang ada gap-nya (incomplete = attention grabber) |
| **Gallery Upload** | "24 dari 50 foto prewedding terupload - lanjutkan ya!" dengan visual gap di gallery grid |
| **RSVP Checklist** | Checklist tamur dengan icon yang jelas terlihat mana yang belum (gap effect lebih kuat daripada sekadar angka) |

**Progress Visualization:**
```css
/* Zeigarnik Progress Bar - Incomplete lebih menarik perhatian */
.wedding-progress {
  background: linear-gradient(90deg, #E8B4B8 72%, #F5D5D8 72%);
  position: relative;
}
.wedding-progress::after {
  content: "";
  position: absolute;
  right: 0;
  width: 28%;
  height: 100%;
  background: repeating-linear-gradient(
    45deg,
    transparent,
    transparent 10px,
    rgba(232, 180, 184, 0.3) 10px,
    rgba(232, 180, 184, 0.3) 20px
  );
}
```

### 4. Loss Aversion

**Neuroscience Basis:** Kehilangan terasa 2x lebih sakit dari gain setara - sangat powerful untuk wedding context dengan deadline yang fixed.

| Implementasi Sesarra | Copywriting |
|---------------------|-------------|
| **Countdown to Hari H** | "23 hari lagi menuju hari pernikahan - websitemu harus sudah siap dibagikan ke tamu!" |
| **Domain Reminder** | "Domain andi-putri.sesarra.id masih tersedia - tapi 5 orang lain juga melihat domain ini hari ini" |
| **Early Bird Discount** | "Diskon 30% berakhir dalam 47 jam - hemat Rp 300.000 untuk premium themes" |
| **Memory Warning** | "Jangan sampai lupa membagikan momen-momen kecil yang tak ternilai ini - upload sekarang sebelum hilang dari ingatan" |

### 5. Social Proof + FOMO

**Neuroscience Basis:** Mirror neurons dan amygdala merespons kehadiran orang lain - wedding adalah inherently social event.

| Implementasi Sesarra | Example |
|---------------------|---------|
| **Real-time Activity** | "3 pasangan lain sedang membuat website untuk tanggal 25 Desember 2025 juga" |
| **Template Popularity** | "Template 'Romantic Garden' dipilih oleh 127 pasangan bulan ini" |
| **Success Stories** | Testimoni dengan foto: "Rina & Diman: 'Website kami mendapat 347 kunjungan dari tamu undangan!'" |
| **Share Count** | "Website ini sudah dibagikan ke 89 tamu - tambah lagi ya!" |

**Social Proof Widget:**
```
┌─────────────────────────────────────────┐
│  🔥 Trending Template Bulan Ini         │
│  ┌─────────────────────────────────┐   │
│  │  [PREVIEW] Romantic Garden       │   │
│  │  ✨ Dipilih oleh 127 pasangan    │   │
│  │  ⭐ 4.9/5 dari 89 reviews        │   │
│  └─────────────────────────────────┘   │
└─────────────────────────────────────────┘
```

### 6. Endowment Effect

**Neuroscience Basis:** User yang sudah invest (waktu, data, identitas) akan terus pakai - sangat relevant untuk wedding website yang berisi memories personal.

| Implementasi Sesarra | Detail |
|---------------------|--------|
| **Love Story Timeline** | User mengisi timeline cinta mereka sendiri - semakin lengkap, semakin tidak mau pindah ke platform lain |
| **Personalized URL** | Setelah dapat domain custom, user merasa "website ini milik kita" - tidak mau kehilangan |
| **Guest Messages** | Buku tamu digital dengan pesan dari keluarga/teman - semakin banyak pesan, semakin valuable |
| **Anniversary Vault** | Fitur time capsule yang hanya bisa dibuka 1 tahun setelah hari H - investment dalam jangka panjang |

**Identity Lock-in:**
- Character card "Couple Profile" yang bisa di-share ke Instagram
- Badge "Wedding Website Premium" dengan tema rose-gold yang eksklusif

### 7. Cognitive Ease

**Neuroscience Basis:** Otak lebih menyukai yang mudah diproses secara kognitif - sangat penting karena calon pengantin biasanya busy dan stressed.

| Implementasi Sesarra | Detail |
|---------------------|--------|
| **Smart Pre-fill** | Isi data undangan dari form sederhana dulu, AI generate konten lengkap otomatis |
| **One-Click Templates** | Setelah pilih template, semua section langsung terisi dengan placeholder romantis - tinggal edit |
| **Instant Preview** | Setiap perubahan langsung terlihat di live preview tanpa reload - zero friction |
| **Mobile-First Editor** | Drag-and-drop yang smooth di mobile dengan thumb zone optimization |

**Smart Wizard Pattern:**
```
Step 1: Nama Pasangan + Tanggal Pernikahan (2 field saja)
    ↓ [AI generates complete website draft]
Step 2: Review & Customize (optional)
    ↓
Step 3: Publish & Share
```

### 8. Peak Moment Design (Enhanced)

**Neuroscience Basis:** Peak-End Rule - users remember peak moments and endings, not average.

| Peak Moment | Implementasi Sesarra |
|-------------|---------------------|
| **First Publish** | Full-screen celebration dengan website preview yang "mengudara" (scale up + fade) + confetti rose-gold + sound effect romantis |
| **Countdown Zero** | Saat countdown mencapai 0, tampilkan special animation: "The Big Day is Here! Selamat menempuh hidup baru!" |
| **First RSVP** | Saat tamu pertama konfirmasi kehadiran: "Yeay! Budi & Sarah sudah konfirmasi - wedding website kamu sudah mulai bekerja!" |
| **Gallery Milestone** | Setiap kelipatan 10 foto: "10 kenangan indah terabadikan - tambah lagi untuk melengkapi cerita cintamu!" |

### 9. Anticipation Architecture

**Neuroscience Basis:** Anticipation dopamine sering lebih kuat dari reward itu sendiri - wedding is all about anticipation.

| Implementasi Sesarra | Detail |
|---------------------|--------|
| **Countdown Timer** | Timer besar di dashboard dengan efek pulse rose - setiap hari yang berkurang terasa significant |
| **Reveal Countdown** | Untuk fitur premium: "Fitur Surprise akan terbuka dalam 3 hari" |
| **Guest Reveal** | Real-time counter: "7 tamu sudah melihat website kamu hari ini" |
| **Anniversary Countdown** | Setelah hari H, mulai countdown ke anniversary pertama |

**Visual Timer Design:**
```
┌─────────────────────────────────────────┐
│         23 : 14 : 45 : 32              │
│    HARI    JAM   MENIT  DETIK          │
│                                         │
│  Menuju Hari Pernikahan Andi & Putri   │
└─────────────────────────────────────────┘
```

### 10. Memory Anchoring

**Neuroscience Basis:** Otak menyimpan memori dengan emosi yang kuat - wedding adalah ultimate emotional memory event.

| Implementasi Sesarra | Detail |
|---------------------|--------|
| **Memory Lane** | Timeline visual dengan highlight "First Kiss", "First Date", "Proposal" dengan icon dan animasi spesial |
| **Voice Notes** | Fitur upload voice message (vows, personal messages) yang bisa didengar tamu - audio lebih emotional daripada teks |
| **Photo Stories** | Gallery dengan caption yang men-trigger memory: "Ingat moment ini? Saat kamu bilang 'I do' di hadapan keluarga" |
| **Anniversary Reminders** | Setiap tahun, kirim "Memory from Your Wedding Day" dengan highlight dari website |

### 11. Altruistic Reward

**Neuroscience Basis:** Acts of giving activate reward pathways - wedding inherently about sharing joy with others.

| Implementasi Sesarra | Detail |
|---------------------|--------|
| **Thank You Notes** | Fitur kirim ucapan terima kasih otomatis ke tamu yang sudah RSVP - membuat user merasa helpful |
| **Charity Registry** | Opsional charity donation di wedding website - "Alih-alih kado, kami mohon doa restu" |
| **Family Connection** | Fitur khusus untuk menghubungkan keluarga jauh: "Share website ini ke keluarga di luar kota agar mereka bisa merasakan kebahagiaanmu" |
| **Vendor Showcase** | Highlight vendor (photographer, caterer) di website - supporting others feels good |

---

### Ethical Design Note

Untuk produk kategori **Wedding**, pendekatan behavioral design harus:

✅ **DO:**
- Gunakan loss aversion untuk membantu user menghindari missed opportunities (memories lost, domain taken)
- Fokus pada anticipation yang positif menuju hari yang bahagia
- Buat habit yang helpful (mengupdate konten, membagikan ke tamu)
- Social proof yang genuine (real testimonials, real activity)

❌ **DON'T:**
- Exploit wedding stress dengan artificial urgency
- Create FOMO yang excessive tentang template/domain availability
- Push features yang tidak needed dengan aggressive tactics
- Make user feel inadequate jika wedding website tidak "perfect"

**North Star:** Wedding website harus menjadi alat yang mengurangi stress dan meningkatkan joy selama masa persiapan pernikahan - bukan menambah beban mental calon penganten.

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
*Document Version: 1.0*
