# AkarKita Design System

> Neurodesign-based visual hierarchy untuk Silsilah Keluarga Digital

**Category:** Heritage

**Related:** [neurodesign-uiux-guide.md](../_templates/neurodesign-uiux-guide.md)

---

## 1. Visual Identity

### Color Palette

| Role | Color | Hex | Neuroscience Rationale |
|------|-------|-----|------------------------|
| Primary | Brown | `#8B4513` | Warna cokelat tanah melambangkan akar, grounding, dan warisan - memicu rasa kedalaman, kestabilan, dan koneksi dengan masa lalu. Sangat cocok untuk produk genealogi/family tree. |
| Secondary | Cream | `#F5F5DC` | Memberikan kesan klasik, hangat, dan nostalgis - menciptakan latar belakang yang nyaman seperti kertas tua tanpa mengganggu konten |
| Accent | Deep Green | `#2D5A27` | Melambangkan pertumbuhan, kelangsungan hidup, dan alam - cocok untuk metafora "pohon keluarga" yang terus tumbuh |
| Background | Warm Beige | `#FDF5E6` | Nuansa hangat yang menenangkan, seperti kanvas vintage untuk cerita keluarga |
| Text Primary | Dark Brown | `#3E2723` | Kontras tinggi dengan nuansa earthy untuk keterbacaan maksimal |
| Text Secondary | Warm Gray | `#6B5B5B` | Untuk teks pendukung dengan kontras yang cukup tapi tidak dominan |

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

**Typography Rationale:** Lora (serif) untuk semua heading memberikan kesan heritage, traditional, dan elegan yang sangat cocok untuk tema silsilah keluarga. Font ini memiliki karakter klasik seperti yang digunakan dalam dokumen sejarah. Sementara Inter untuk body text memastikan keterbacaan yang baik untuk informasi detail tentang anggota keluarga.

---

## 2. Visual Hierarchy (5-Layer)

### Layer Definitions

| Layer | Use Case | Size | Weight | Contrast |
|-------|----------|------|--------|----------|
| **1. Focal Point** | Anggota keluarga yang sedang dipilih | 48px | Bold | 7:1 (AAA) |
| **2. Primary** | Nama anggota keluarga utama / Tanggal lahir-wafat | 30px | Medium | 4.5:1 (AA) |
| **3. Secondary** | Detail hubungan keluarga / Foto kecil | 18px | Regular | 4.5:1 (AA) |
| **4. Supporting** | Caption, catatan sejarah | 14px | Light | 3:1 |
| **5. UI Chrome** | Navigation, buttons tree view | 12px | Regular | 3:1 |

### Focal Point Strategy

**Single Focal Element per Screen:** Anggota keluarga yang sedang dipilih/dilihat detailnya

```
Example:
┌─────────────────────────────────────┐
│                                     │
│       H. AHMAD NASUTION              │  ← Layer 1: Nama (Focal Point)
│       1920 - 1995                    │
│       [Foto Besar]                   │
│                                     │
│  Ayah dari:                          │  ← Layer 2: Primary info
│  • Budi Nasution (1950)              │
│  • Siti Nasution (1955)              │
│                                     │
│  Menikah dengan: Fatmawati (1922)    │  ← Layer 3: Secondary info
│  Catatan: Pendiri desa               │
│                                     │
└─────────────────────────────────────┘
```

### Anti-Patterns to Avoid

- ❌ **Christmas Tree Effect:** Semua nama bold/highlighted = tidak ada focal point
- ❌ **Flat Hierarchy:** Semua anggota keluarga ukuran sama = sulit mencari siapa yang sedang dipilih
- ❌ **Hidden Navigation:** Kontrol navigasi tree tersembunyi di antara elemen lain

---

## 3. Eye Tracking Pattern

### Primary Pattern: F-Pattern

**Rationale:** F-Pattern sangat cocok untuk family tree karena pengguna cenderung memindai secara vertikal di sisi kiri (navigasi hirarki/hubungan) lalu membaca horizontal untuk detail setiap anggota keluarga. Pattern ini mengikuti struktur alami pohon keluarga: dari atas ke bawah (generasi) dan kiri ke kanan (sibling/spouse).

### Pattern Application

#### F-Pattern - Untuk Family Tree Navigation

```
┌──────────────────────────────────────┐
│ Kakek        Nenek     Paman  Bibi   │  ← Horizontal scan 1 (generasi 1)
│ Budi         Siti      Andi   Dewi   │  ← Horizontal scan 2 (generasi 2)
│ █                                    │  ← Vertical scan (navigasi tree)
│ █  [DETAIL KAKEK - FOCAL POINT]      │
│ █                                    │
└──────────────────────────────────────┘
```

### Key Rules

- **Most important person** (yang sedang dipilih) = left side vertical scan
- **Most important info** (nama, tanggal) = horizontal scan pertama
- **Never hide critical info** di bottom-right corner (blind spot)

---

## 4. Motion Guidelines

### When to Use Motion

| Use Case | Animation Type | Duration |
|----------|---------------|----------|
| Loading states | Skeleton shimmer dengan efek earth tone | Continuous |
| Success feedback | Subtle leaf fall animation (hijau) | 300ms max |
| Error indication | Shake dengan pulse merah | 200ms |
| Tree navigation | Smooth expand/collapse | 250ms |
| Member selection | Fade dengan subtle highlight | 150ms |
| Photo reveal | Scale dengan vintage fade | 200ms |

### When NOT to Use Motion

- ❌ Background decorative animations (mengganggu fokus pada tree)
- ❌ Auto-playing carousels tanpa pause
- ❌ Continuous motion saat menelusuri silsilah
- ❌ Apa pun yang mengalihkan perhatian dari anggota keluarga yang sedang dipilih

### Easing Presets

```css
--ease-out: cubic-bezier(0, 0, 0.2, 1);     /* Elements appearing */
--ease-in: cubic-bezier(0.4, 0, 1, 1);      /* Elements disappearing */
--ease-in-out: cubic-bezier(0.4, 0, 0.2, 1); /* Moving elements */
```

---

## 5. Whitespace Strategy

### Density Level: Generous

**Rationale:** Whitespace yang luas menciptakan kesan hormat, penting, dan bermakna - sangat penting untuk produk heritage tentang keluarga. Ruang kosong memberikan "ruang penghormatan" bagi setiap anggota keluarga dan membuat informasi mudah dicerna.

| Whitespace Type | Value | Application |
|-----------------|-------|-------------|
| **Macro** (section gaps) | 64-96px | Antara generasi/section utama |
| **Card padding** | 28px | Inside card components (profil anggota) |
| **Form group gaps** | 20px | Antara form fields (tambah anggota) |
| **List item gaps** | 16px | Antara list items (daftar anak/saudara) |
| **Micro** (tight) | 8-12px | Related inline elements (badge, hubungan) |

### Density by Product Category

| Category | Density | Why |
|----------|---------|-----|
| Heritage (AkarKita) | Generous | Whitespace = respect, importance, dan clarity |
| Commerce/Action | Minimal | Density = energy & urgency |
| Standard | Moderate | Balance of clarity & efficiency |

---

## 6. Design Tokens

```css
/* ===========================================
   AKARKITA DESIGN TOKENS
   Based on Akordium Neurodesign System
   =========================================== */

/* --- COLOR TOKENS --- */
--color-primary: #8B4513;
--color-primary-hover: #6B3410;
--color-primary-light: #A0522D;
--color-secondary: #F5F5DC;
--color-accent: #2D5A27;

--color-background: #FDF5E6;
--color-surface: #FFFFFF;
--color-surface-elevated: #FFFAF0;

--color-text-primary: #3E2723;
--color-text-secondary: #6B5B5B;
--color-text-muted: #8B7355;

/* Semantic Colors (Consistent Across All Products) */
--color-success: #16A34A;
--color-warning: #D97706;
--color-error: #DC2626;
--color-info: #2563EB;

/* --- TYPOGRAPHY TOKENS --- */
--font-display: 'Lora', Georgia, serif;
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
--card-padding: 28px;
--section-gap: 80px;
--form-group-gap: 20px;
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
--shadow-sm: 0 1px 2px rgba(139, 69, 19, 0.1);
--shadow-md: 0 4px 6px rgba(139, 69, 19, 0.15);
--shadow-lg: 0 10px 15px rgba(139, 69, 19, 0.2);
--shadow-xl: 0 20px 25px rgba(139, 69, 19, 0.25);
```

---

## 7. Per-Screen Specifications

### Dashboard/Home

| Element | Specification |
|---------|---------------|
| **Focal Point** | Family tree overview dengan generasi teratas di tengah |
| **Eye Pattern** | F-Pattern (dari atas ke bawah, kiri ke kanan) |
| **Primary Actions** | Tombol "Tambah Anggota" dengan accent green |
| **Key Metrics** | Total anggota keluarga, generasi terdalam (Layer 2) |

### Detail Anggota Keluarga

| Element | Specification |
|---------|---------------|
| **Focal Point** | Nama dan foto anggota keluarga yang dipilih |
| **Pattern** | F-Pattern (dari nama ke detail hubungan) |
| **CTAs** | Tombol "Edit" dan "Tambah Anak/Pasangan" di kiri atas |

### Tree View

| Element | Specification |
|---------|---------------|
| **Focal Point** | Anggota keluarga yang sedang aktif/highlighted |
| **Pattern** | F-Pattern (vertical scan di kiri, horizontal untuk detail) |
| **CTAs** | Tombol expand/collapse di sisi kiri setiap nama |

---

## 8. Peak Moment Design

Based on Peak-End Rule: Users remember the **peak moment** and the **ending**, not the average.

### Peak Moment: Menemukan Hubungan Keluarga

| Moment | Implementation |
|--------|----------------|
| **Trigger** | User berhasil menemukan koneksi keluarga yang dicari |
| **Visual** | Path highlight dengan animasi garis connecting antar anggota |
| **Duration** | 500ms animation |
| **Micro-copy** | "Koneksi ditemukan! Beliau adalah kakek buyut dari pihak ayah 🌳" |

### Peak Moment: Tree Lengkap Terbentuk

| Moment | Implementation |
|--------|----------------|
| **Trigger** | User berhasil melengkapi silsilah sampai generasi tertentu |
| **Visual** | Celebration dengan animasi tree "tumbuh" dari akar ke pucuk |
| **Duration** | 600ms animation |
| **Micro-copy** | "Silsilah lengkap! 5 generasi telah terdata. Warisan hidup terus 🌱" |

### Ending Design

| Moment | Implementation |
|--------|----------------|
| **Trigger** | User logout atau menutup aplikasi |
| **Message** | "Silsilah tersimpan. Sampai jumpa di penjelajahan sejarah berikutnya 📜" |
| **Tone** | Warm, respectful, historical |

---

## 9. Accessibility Requirements

| Requirement | Standard |
|-------------|----------|
| Contrast Ratio | WCAG AA minimum (4.5:1 for text) |
| Focal Points | AAA contrast (7:1) |
| Interactive Elements | Minimum 44px touch target |
| Focus States | Visible focus ring dengan warna primary brown |
| Motion | Respect `prefers-reduced-motion` |

---

## 10. Implementation Checklist

- [ ] Colors match category palette (Brown, Cream, Green)
- [ ] Single focal point per screen (Anggota keluarga yang dipilih)
- [ ] Eye tracking pattern applied (F-Pattern untuk tree navigation)
- [ ] Whitespace density appropriate (Generous)
- [ ] Motion used sparingly (subtle, respectful)
- [ ] Peak moment designed (Menemukan koneksi, tree lengkap)
- [ ] Design tokens implemented in CSS
- [ ] Accessibility requirements met

---

## 11. Behavioral Design Techniques

### Ethical Design Philosophy

**Design Goal: Sticky (Not Addictive)**

AkarKita sebagai produk heritage harus berfokus pada membangun koneksi keluarga yang bermakna dan berkelanjutan, bukan menciptakan addiction. Teknik behavioral digunakan untuk memperkuat bonding antar-generasi, bukan untuk memaksimalkan time-on-site dengan cara manipulatif.

### Technique Implementation Matrix

| # | Technique | AkarKita Implementation | Ethical Consideration |
|---|-----------|------------------------|----------------------|
| 1 | **Anticipation Loop** | Family tree reveal animation dengan gradual "unfolding" dari generasi tertua ke terbaru + ancestor discovery progress | Membangun anticipation terhadap sejarah keluarga, bukan terhadap reward dopamin |
| 2 | **Invisible Personalization** | Suggested family connections berdasarkan data (tanggal lahir, lokasi, nama keluarga) yang ditampilkan secara subtle tanpa highlight agresif | Personalization harus transparan - user tahu mengapa rekomendasi muncul |
| 3 | **Streak + Loss Aversion** | Weekly family story contribution streak dengan "family memory fire" yang perlu dijaga agar tidak padam | Streak untuk konsistensi mendokumentasikan sejarah, bukan untuk FOMO |
| 4 | **Emotional Character** | Family avatar/mascot "Akar" (pohon kecil dengan wajah ramah) yang celebrates discoveries dengan animasi subtle | Karakter mendukung tujuan (family bonding), bukan manipulatif untuk engagement |
| 5 | **Variable Reward Notification** | "New family member found" dan "New story shared" dari kerabat dengan varied timing (social connection reward, bukan gambling) | Reward berbasis koneksi sosial nyata, bukan variable schedule yang addictive |
| 6 | **Social Proof Counter** | Display jumlah family members in tree, total stories shared, dan kontribusi aktif keluarga (transparent, meaningful metrics) | Social proof untuk validasi aktivitas positif, bukan peer pressure |
| 7 | **Annual Wrapped** | "Family Tree Year in Review" - summary pertumbuhan silsilah, top contributors, milestones tercapai (reflection & gratitude) | Celebration of family legacy, bukan gamification berlebihan |
| 8 | **Personalization Surprise** | "You might be related to..." suggestions berdasarkan common surnames, lokasi geografis, dan timeline | Delightful discovery yang memperkaya pemahaman sejarah keluarga |
| 9 | **Flash Sale Countdown** | **NOT APPLICABLE** - Heritage products tidak menggunakan urgency tactics yang manipulatif | - |
| 10 | **Social Commerce** | Family subscription plan referrals - "Share AkarKita with family" dengan benefit: unlimited members, collaborative editing | Incentive untuk inklusivitas keluarga, bukan aggressive sales tactics |
| 11 | **Gentle Nudge** | Reminder untuk add family stories dengan timing yang contextual (misal: saat ada moment keluarga/anniversary) | Nudge untuk nilai sentimental, bukan spam notifications |

### 1. Anticipation Loop - Family Tree Reveal

**Implementation:**

```css
/* Tree reveal animation - gradual unfolding */
@keyframes treeUnfold {
  from {
    opacity: 0;
    transform: translateY(-20px) scale(0.95);
  }
  to {
    opacity: 1;
    transform: translateY(0) scale(1);
  }
}

.family-node {
  animation: treeUnfold 0.4s ease-out forwards;
  animation-delay: calc(var(--generation) * 0.1s);
}
```

**UX Pattern:**
- Generasi 1 (tertua) muncul pertama dengan 100ms delay
- Setiap generasi berikutnya muncul dengan +100ms cumulative delay
- Progress bar: "Membuka silsilah... 3 dari 5 generasi"

**Ethical Guardrail:**
- User dapat skip animation dengan tombol "Lihat Semua"
- Animation tidak repeat untuk user yang sudah melihat tree tersebut

### 2. Invisible Personalization - Connection Suggestions

**Implementation:**

```javascript
// Personalization logic (transparent to user)
function suggestConnections(userProfile) {
  return {
    basedOn: {
      surname: userProfile.lastName,
      location: userProfile.birthPlace,
      timeline: userProfile.birthYear ± 10
    },
    confidence: 'high', // Display to user
    reason: 'Sama nama keluarga dan lokasi kelahiran'
  };
}
```

**UX Pattern:**
- Suggestion card muncul di sidebar dengan subtle highlight (cream background)
- Transparan: "Karena Anda dan Budi keduanya lahir di Medan dengan nama keluarga Nasution"
- User bisa dismiss dengan feedback: "Tidak ada hubungan" (improves algorithm)

### 3. Streak + Loss Aversion - Family Story Contribution

**Implementation:**

```
┌─────────────────────────────────┐
│  🔥 3 Minggu Berturut-turut     │
│  Api cerita keluarga menyala!   │
│                                 │
│  [Tambah Cerita Minggu Ini]     │
│  (Jaga agar api tetap menyala)  │
└─────────────────────────────────┘
```

**UX Pattern:**
- Visual: "Family Memory Fire" yang mengecil jika tidak ada kontribusi
- Loss framing: "Jangan biarkan cerita buyut Neni hilang"
- Recovery: Mudah restart streak dengan 1 kontribusi

**Ethical Guardrail:**
- Tidak ada penalty yang nyata (hanya visual fire fades)
- Streak reset hanya setelah 4 minggu (tidak agresif)
- Emphasis pada value: "Dokumentasi untuk generasi mendatang"

### 4. Emotional Character - "Akar" Family Avatar

**Character Design:**
- Nama: Akar (pohon kecil dengan wajah ramah)
- Personality: Wise, warm, family-oriented
- Expression changes: Celebrates (smile), curious (tilt head), thoughtful (hand on chin)

**Implementation:**

```
┌─────────────────────────────────┐
│                                 │
│     🌱 Akar                      │
│     "Hebat! Kamu menemukan       │
│      hubungan baru!"             │
│                                 │
│     [Lihat Koneksi]             │
│                                 │
└─────────────────────────────────┘
```

**UX Pattern:**
- Muncul saat milestone: New member, tree growth, story added
- Animation: Subtle (bouncing leaves, smiling)
- Tidak interruptive - muncul di corner, dismissible

### 5. Variable Reward Notification - Discovery Moments

**Implementation:**

```javascript
// Notification scheduling (not truly random - social-based)
function scheduleNotifications() {
  const triggers = [
    'new_member_added_by_relative',
    'story_shared_by_cousin',
    'comment_on_ancestor_story',
    'tree_anniversary'
  ];

  // Vary timing but keep contextual relevance
  return scheduleBasedOnActivity(triggers, {minDelay: 2, maxDelay: 24});
}
```

**UX Pattern:**
- Push notification: "Budi menambahkan cerita baru tentang Kakek Ahmad!"
- In-app celebration: Confetti subtle saat membuka
- Content preview: 2-3 sentences dari cerita

**Ethical Guardrail:**
- Not truly random - only real family activity triggers
- Batch notifications: Max 2 per day
- Quiet hours: 9PM - 7AM no notifications

### 6. Social Proof Counter - Family Participation

**Implementation:**

```
┌─────────────────────────────────┐
│  👨‍👩‍👧‍👦 24 Anggota Keluarga      │
│  📖 47 Cerita Terdokumentasi     │
│  🌳 5 Generasi Terdata           │
│                                 │
│  Kontributor Teraktif:          │
│  • Siti (12 cerita)             │
│  • Budi (8 cerita)              │
└─────────────────────────────────┘
```

**UX Pattern:**
- Display di dashboard dengan earth tone colors
- Highlight contributors, bukan competitors
- Collective framing: "Keluarga kita telah mendokumentasikan..."

**Ethical Guardrail:**
- Tidak ada leaderboard yang creates FOMO
- Focus pada collective achievement, bukan individual ranking
- Anonymous opt-out untuk privacy-conscious users

### 7. Annual Wrapped - Family Tree Year in Review

**Implementation:**

```
┌─────────────────────────────────────────┐
│  2025 Family Tree Wrap                  │
│                                         │
│  🌳 Tahun ini keluarga kita:            │
│  • Menambahkan 8 anggota baru           │
│  • Mendokumentasikan 24 cerita          │
│  • Menemukan koneksi ke 3 kota lain     │
│                                         │
│  Pencapaian Terbesar:                   │
│  Melengkapi 5 generasi silsilah!        │
│                                         │
│  Terima kasih atas kontribusinya:       │
│  [Top Contributors List]                │
│                                         │
│  [Share ke WhatsApp Family Group]       │
└─────────────────────────────────────────┘
```

**UX Pattern:**
- Available di akhir tahun (December) atau anniversary sign-up
- Visual: Animated timeline dengan milestones
- Shareable: Format WhatsApp/Instagram friendly

**Ethical Guardrail:**
- Tidak pushy - available on demand
- Focus pada gratitude & reflection
- Data transparency: User bisa review semua data sebelum share

### 8. Personalization Surprise - "You Might Be Related"

**Implementation:**

```javascript
// Surprise suggestion algorithm
function findPotentialRelatives(user, allProfiles) {
  return allProfiles
    .filter(p => {
      const surnameMatch = p.lastName === user.lastName;
      const locationProximity = distance(p.birthPlace, user.birthPlace) < 50km;
      const generationOverlap = Math.abs(p.birthYear - user.birthYear) < 30;

      return (surnameMatch && locationProximity) ||
             (surnameMatch && generationOverlap);
    })
    .map(p => ({
      profile: p,
      confidence: calculateConfidence(user, p),
      reason: explainMatch(user, p) // Transparent
    }));
}
```

**UX Pattern:**
- Card appears: "Kemungkinan besar Anda terkait dengan Budi Nasution"
- Explanation: "Karena nama keluarga sama dan lahir di lokasi yang dekat"
- Action: "Lihat Silsilah" atau "Tidak Ada Hubungan"

**Ethical Guardrail:**
- Always provide explanation
- User can dismiss permanently
- Low confidence suggestions tidak ditampilkan

### 9. Flash Sale Countdown - NOT APPLICABLE

**Rationale:**
Produk heritage tidak cocok dengan urgency tactics yang manipulatif. AkarKita berfokus pada long-term value building, bukan impulse decisions.

### 10. Social Commerce - Family Plan Referrals

**Implementation:**

```
┌─────────────────────────────────┐
│  Ajak Keluarga Bergabung        │
│                                 │
│  Family Plan Benefits:          │
│  • Unlimited family members     │
│  • Collaborative editing        │
│  • Shared photo storage         │
│  • Priority support             │
│                                 │
│  [Share Invitation Link]        │
│                                 │
│  Saat bergabung:                │
│  • 5 anggota keluarga aktif     │
│  • 10+ cerita terdokumentasi    │
│                                 │
└─────────────────────────────────┘
```

**UX Pattern:**
- Focus pada value untuk family unity
- Incentive: Better collaborative features, bukan discount
- Social proof: "5 keluarga lain menggunakan family plan"

**Ethical Guardrail:**
- Transparent pricing
- No aggressive upselling
- Feature-based benefits, bukan FOMO-based

### 11. Gentle Nudge - Contextual Reminders

**Implementation:**

```javascript
// Contextual nudge scheduling
function scheduleNudges(user) {
  const nudges = [
    {
      trigger: 'family_anniversary',
      message: 'Anniversary pernikahan Kakek & Nenek tiba. Tambahkan cerita momen ini?',
      timing: '3 days before',
      dismissible: true
    },
    {
      trigger: 'new_photo_uploaded',
      message: 'Foto baru diupload. Ceritakan kisah di balik foto ini?',
      timing: '1 hour after',
      dismissible: true
    },
    {
      trigger: 'inactivity_2_weeks',
      message: 'Cerita keluarga menunggu. Ada yang bisa ditambahkan?',
      timing: '2 weeks inactive',
      dismissible: true
    }
  ];

  return nudges.filter(n => !user.hasDismissed(n.trigger));
}
```

**UX Pattern:**
- Timing: Contextual, bukan random
- Tone: Gentle suggestion, bukan demanding
- Action: Single clear CTA
- Dismissible: Forever mute option

**Ethical Guardrail:**
- Max 1 nudge per week
- Always dismissible permanently
- Respect user's stated preferences

### Behavioral Design Audit Checklist

- [ ] **Transparency:** Semua personalization dapat dijelaskan kepada user
- [ ] **No Dark Patterns:** Tidak ada deceptive UI atau hidden costs
- [ ] **User Control:** User dapat mengontrol semua notifikasi dan nudges
- [ ] **Sticky Over Addictive:** Fokus pada long-term engagement, bukan short-term dopamine
- [ ] **Value-First:** Setiap behavioral technique memberikan nilai nyata kepada user
- [ ] **Respectful:** Tidak mengganggu saat user inactive atau busy
- [ ] **Family-Centric:** Semua design mendukung tujuan utama: family connection & legacy

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
