# LayanganLegacy Design System

> Neurodesign-based visual hierarchy untuk Platform E-commerce Legacy

**Category:** E-commerce Legacy

**Related:** [neurodesign-uiux-guide.md](../_templates/neurodesign-uiux-guide.md)

---

## 1. Visual Identity

### Color Palette

| Role | Color | Hex | Neuroscience Rationale |
|------|-------|-----|------------------------|
| Primary | Terra Cotta | `#C67B5C` | Warna tanah merah bata yang hangat dan energik - memicu emosi kehangatan, keramahan, dan keakraban. Cocok untuk e-commerce lokal yang ingin terasa approachable dan authentic. |
| Secondary | Warm Sand | `#E8D5C4` | Memberikan kesan natural, organic, dan grounded - menciptakan latar belakang yang hangat tanpa mengganggu produk |
| Accent | Deep Teal | `#2D6A4F` | Menambahkan kontras dan kepercayaan untuk highlight penting seperti tombol beli, promo, atau status |
| Background | Off-White | `#FDFBF7` | Warm neutral yang nyaman di mata untuk browsing produk yang lama |
| Text Primary | Dark Brown | `#3E2723` | Kontras tinggi dengan nuansa earthy untuk keterbacaan maksimal |
| Text Secondary | Warm Gray | `#6B5B5B` | Untuk teks pendukung dengan kontras yang cukup |

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
| Display/Hero | Inter | 48px | Bold (700) |
| H1 | Inter | 38px | Semibold (600) |
| H2 | Inter | 30px | Semibold (600) |
| H3 | Inter | 24px | Medium (500) |
| Body Large | Inter | 18px | Regular (400) |
| Body | Inter | 16px | Regular (400) |
| Caption/Meta | Inter | 12px | Regular (400) |

**Typography Rationale:** Inter untuk seluruh typography memberikan kesan modern, clean, dan highly readable yang sangat penting untuk e-commerce. Font ini memiliki excellent legibility di berbagai ukuran dan terlihat professional tapi tetap approachable. Cocok untuk platform legacy yang ingin mudah digunakan oleh semua kalangan.

---

## 2. Visual Hierarchy (5-Layer)

### Layer Definitions

| Layer | Use Case | Size | Weight | Contrast |
|-------|----------|------|--------|----------|
| **1. Focal Point** | Produk unggulan / Promo banner | 48px | Bold | 7:1 (AAA) |
| **2. Primary** | Nama produk / Harga | 30px | Medium | 4.5:1 (AA) |
| **3. Secondary** | Deskripsi produk / Rating | 18px | Regular | 4.5:1 (AA) |
| **4. Supporting** | Stok, pengiriman, garansi | 14px | Light | 3:1 |
| **5. UI Chrome** | Filter kategori, pagination, badges | 12px | Regular | 3:1 |

### Focal Point Strategy

**Single Focal Element per Screen:** Produk yang sedang ditampilkan atau promo yang sedang berlangsung

```
Example:
┌─────────────────────────────────────┐
│                                     │
│    [PRODUK UNGGULAN]                │  ← Layer 1: Focal Point
│    [Gambar Produk Besar]            │
│                                     │
│  Jam Tangan Klasik                  │  ← Layer 2: Nama & Harga
│  Rp 450.000                         │
│                                     │
│  ⭐⭐⭐⭐⭐ (128 ulasan)              │  ← Layer 3: Rating & desc
│  Jam tangan dengan desain vintage   │
│                                     │
│  Stok: 50 | Pengiriman: Gratis      │  ← Layer 4: Supporting info
│                                     │
│  [BELI SEKARANG]                    │  ← CTA Utama
└─────────────────────────────────────┘
```

### Anti-Patterns to Avoid

- ❌ **Christmas Tree Effect:** Semua produk/promo highlighted = tidak ada focal point
- ❌ **Flat Hierarchy:** Semua elemen ukuran sama = sulit membedakan produk penting
- ❌ **Hidden CTA:** Tombol beli tersembunyi di antara elemen lain

---

## 3. Eye Tracking Pattern

### Primary Pattern: F-Pattern

**Rationale:** F-Pattern sangat cocok untuk e-commerce karena pengguna cenderung memindai horizontal di atas (banner/promo), lalu vertical di kiri (kategori/navigasi), dan membaca horizontal untuk detail setiap produk. Pattern ini efisien untuk browsing produk dan scanning informasi penting seperti harga dan rating.

### Pattern Application

#### F-Pattern - Untuk Product Listing

```
┌──────────────────────────────────────┐
│ PROMO SPESIAL    GRATIS ONGKIR       │  ← Horizontal scan 1 (banner)
│ █                                    │
│ █  [KATEGORI PRODUK]                 │  ← Vertical scan (navigasi)
│ █  Elektronik       [Product Card]   │  ← Horizontal scan 2
│ █  Fashion          [Product Card]   │
│ █  Home & Living    [Product Card]   │
└──────────────────────────────────────┘
```

### Key Rules

- **Most important product/promo** = top horizontal scan
- **Most important action** (tombol beli) = left side of product card (bukan right)
- **Never hide critical info** (harga, stok) di bottom-right corner (blind spot)

---

## 4. Motion Guidelines

### When to Use Motion

| Use Case | Animation Type | Duration |
|----------|---------------|----------|
| Loading states | Skeleton shimmer dengan efek earth tone | Continuous |
| Success feedback | Subtle checkmark dengan glow | 300ms max |
| Error indication | Shake dengan pulse merah | 200ms |
| Product image hover | Scale/zoom dengan smooth transition | 250ms |
| Add to cart | Cart icon bounce animation | 200ms |
| Promo reveal | Fade dengan subtle glow | 350ms |

### When NOT to Use Motion

- ❌ Background decorative animations (mengganggu fokus pada produk)
- ❌ Auto-playing carousels tanpa pause (sangat mengganggu untuk e-commerce)
- ❌ Continuous motion saat browsing produk
- ❌ Apa pun yang mengalihkan perhatian dari produk/CTA beli

### Easing Presets

```css
--ease-out: cubic-bezier(0, 0, 0.2, 1);     /* Elements appearing */
--ease-in: cubic-bezier(0.4, 0, 1, 1);      /* Elements disappearing */
--ease-in-out: cubic-bezier(0.4, 0, 0.2, 1); /* Moving elements */
```

---

## 5. Whitespace Strategy

### Density Level: Moderate

**Rationale:** Whitespace moderate menciptakan balance antara clarity dan efficiency - penting untuk e-commerce yang harus menampilkan banyak produk tapi tetap mudah dibaca. Tidak terlalu longgar (membuang screen real estate) dan tidak terlalu padat (sulit dibaca), tapi tepat untuk shopping experience.

| Whitespace Type | Value | Application |
|-----------------|-------|-------------|
| **Macro** (section gaps) | 48-64px | Antara section utama (promo, categories, products) |
| **Card padding** | 16px | Inside product cards |
| **Form group gaps** | 16px | Antara form fields (checkout, search) |
| **List item gaps** | 12px | Antara product items |
| **Micro** (tight) | 4-8px | Related inline elements (badges, tags) |

### Density by Product Category

| Category | Density | Why |
|----------|---------|-----|
| E-commerce Legacy (LayanganLegacy) | Moderate | Balance clarity & efficiency untuk produk banyak |
| Wedding/Heritage | Generous | Whitespace = trust, premium, respect |
| POS/Marketing | Minimal | Density = energy & urgency |

---

## 6. Design Tokens

```css
/* ===========================================
   LAYANGANLEGACY DESIGN TOKENS
   Based on Akordium Neurodesign System
   =========================================== */

/* --- COLOR TOKENS --- */
--color-primary: #C67B5C;
--color-primary-hover: #A65D3D;
--color-primary-light: #D9997A;
--color-secondary: #E8D5C4;
--color-accent: #2D6A4F;

--color-background: #FDFBF7;
--color-surface: #FFFFFF;
--color-surface-elevated: #F5F1EB;

--color-text-primary: #3E2723;
--color-text-secondary: #6B5B5B;
--color-text-muted: #8B7355;

/* Semantic Colors (Consistent Across All Products) */
--color-success: #16A34A;
--color-warning: #D97706;
--color-error: #DC2626;
--color-info: #2563EB;

/* --- TYPOGRAPHY TOKENS --- */
--font-display: 'Inter', system-ui, -apple-system, sans-serif;
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
--card-padding: 16px;
--section-gap: 56px;
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
--shadow-sm: 0 1px 2px rgba(198, 123, 92, 0.1);
--shadow-md: 0 4px 6px rgba(198, 123, 92, 0.15);
--shadow-lg: 0 10px 15px rgba(198, 123, 92, 0.2);
--shadow-xl: 0 20px 25px rgba(198, 123, 92, 0.25);
```

---

## 7. Per-Screen Specifications

### Homepage

| Element | Specification |
|---------|---------------|
| **Focal Point** | Banner promo atau produk unggulan di tengah atas |
| **Eye Pattern** | F-Pattern (dari banner ke kategori) |
| **Primary Actions** | Tombol "Belanja Sekarang" dengan accent teal |
| **Key Metrics** | Promo terbaru, produk trending (Layer 2) |

### Product Listing

| Element | Specification |
|---------|---------------|
| **Focal Point** | Produk yang sedang di-hover/filter |
| **Pattern** | F-Pattern (dari filter kategori ke produk) |
| **CTAs** | Tombol "Tambah ke Keranjang" di kiri setiap card (bukan kanan) |

### Product Detail

| Element | Specification |
|---------|---------------|
| **Focal Point** | Gambar produk dan nama produk |
| **Pattern** | F-Pattern (dari gambar ke detail ke CTA) |
| **CTAs** | Tombol "Beli Sekarang" dan "Tambah ke Keranjang" |

### Checkout

| Element | Specification |
|---------|---------------|
| **Focal Point** | Ringkasan order dan total harga |
| **Pattern** | Z-Pattern (dari ringkasan ke form pembayaran) |
| **CTAs** | Tombol "Bayar Sekarang" di kanan bawah |

---

## 8. Peak Moment Design

Based on Peak-End Rule: Users remember the **peak moment** and the **ending**, not the average.

### Peak Moment: Produk Ditambahkan ke Keranjang

| Moment | Implementation |
|--------|----------------|
| **Trigger** | User berhasil menambahkan produk ke keranjang |
| **Visual** | Cart icon bounce dengan badge count update animation |
| **Duration** | 300ms animation |
| **Micro-copy** | "Produk ditambahkan! Keranjang: 3 item" |

### Peak Moment: Order Berhasil

| Moment | Implementation |
|--------|----------------|
| **Trigger** | User berhasil menyelesaikan pembayaran |
| **Visual** | Full-screen success dengan confetti subtle dan order summary |
| **Duration** | 500ms animation |
| **Micro-copy** | "Order berhasil! Pesanan #ORD12345 sedang diproses. Terima kasih!" |

### Ending Design

| Moment | Implementation |
|--------|----------------|
| **Trigger** | User meninggalkan website (exit intent) |
| **Message** | (Optional) Promo reminder di modal exit |
| **Tone** | Friendly, encouraging, transactional |

---

## 9. Accessibility Requirements

| Requirement | Standard |
|-------------|----------|
| Contrast Ratio | WCAG AA minimum (4.5:1 for text) |
| Focal Points | AAA contrast (7:1) |
| Interactive Elements | Minimum 44px touch target |
| Focus States | Visible focus ring dengan warna primary terra cotta |
| Motion | Respect `prefers-reduced-motion` |

---

## 10. Implementation Checklist

- [ ] Colors match category palette (Terra Cotta, Warm Sand, Teal)
- [ ] Single focal point per screen (Produk unggulan/Promo)
- [ ] Eye tracking pattern applied (F-Pattern untuk product listing)
- [ ] Whitespace density appropriate (Moderate)
- [ ] Motion used sparingly (functional, tidak berlebihan)
- [ ] Peak moment designed (Add to cart, order berhasil)
- [ ] Design tokens implemented in CSS
- [ ] Accessibility requirements met

---

## 11. Behavioral Design Techniques

**Product Category:** Trust-based - Legacy Planning

**Ethical Design Note:** Legacy products should lean toward **Sticky** design karena deal dengan sensitive, emotional content dan trust is paramount. Avoid aggressive addictive patterns; prioritize gentle, supportive engagement.

### Technique Applicability Matrix

| # | Technique | Applicable | Implementation Priority |
|---|-----------|------------|------------------------|
| 1 | Anticipation Loop | ✅ Yes | High - Loading/generation states |
| 2 | Invisible Personalization | ✅ Yes | Medium - Suggestion engine |
| 3 | Streak + Loss Aversion | ❌ No | N/A - Legacy is one-time setup |
| 4 | Emotional Character | ✅ Yes | High - Guide for emotional support |
| 5 | Variable Reward Notification | ✅ Yes | Medium - Milestone celebrations |
| 6 | Social Proof Counter | ✅ Yes | High - Trust-building metrics |
| 7 | Annual Wrapped | ✅ Yes | Medium - Yearly reflection |
| 8 | Personalization Surprise | ✅ Yes | Low - Delight moments |
| 9 | Flash Sale Countdown | ❌ No | N/A - Not applicable for legacy |
| 10 | Social Commerce | ✅ Yes | Low - Family plan sharing |
| 11 | Gentle Nudge | ✅ Yes | High - Very light touch reminders |

### 1. Anticipation Loop

**Purpose:** Build positive anticipation during loading/processing states to reduce perceived wait time and create excitement.

**Implementation for LayanganLegacy:**

| Use Case | Visual Pattern | Copy Example |
|----------|----------------|--------------|
| **Legacy Preview Loading** | Staggered card reveal dengan warm fade-in | "Menyiapkan warisan Anda..." → "Kenangan ditemukan: 47" → "Hampir selesai..." |
| **Document Generation** | Progress bar dengan milestone markers | "Mengumpulkan cerita hidup Anda... 47%" → "Menyusun timeline keluarga... 78%" → "Membuat dokumen warisan... 92%" |
| **Memory Upload** | Photo masonry cascade animation | "Mengunggah kenangan... 3/15 foto" → "Menyusun galeri hidup..." → "Selesai! 15 kenangan tersimpan" |

**Technical Specs:**
- Duration: 2-4 seconds total (staggered reveals)
- Animation: Fade-in dengan slight upward slide (20px)
- Easing: `cubic-bezier(0.4, 0, 0.2, 1)` (ease-in-out)
- Color progress: Warm Sand → Terra Cotta progression

### 2. Invisible Personalization

**Purpose:** Surface relevant content without asking, creating "this knows me" feeling.

**Implementation for LayanganLegacy:**

| Data Source | Personalization Output | Example |
|-------------|------------------------|---------|
| **Life Events** | Suggest legacy items based on milestones | "Sepertinya Anda baru saja merayakan ulang tahun ke-50. Ingin mendokumentasikan pelajaran hidup dari 5 dekade terakhir?" |
| **Family Structure** | Tailor legacy categories | "Terdeteksi 3 anak. Ingin membuat pesan khusus untuk setiap anak?" |
| **Photo Metadata** | Auto-group memories by era | "Kami menemukan 23 foto dari era 2010-2015. Ingin membuat cerita untuk masa itu?" |
| **Location Data** | Suggest place-based memories | "Kenangan di Jakarta: 12 foto. Ingin menambahkan cerita tentang kota ini?" |

**Privacy Note:** Always opt-in with clear explanation. Allow users to disable personalization.

### 3. Streak + Loss Aversion

**Status:** ❌ **NOT APPLICABLE**

**Rationale:** Legacy planning is a one-time meaningful setup, not a daily habit. Forcing streaks would be inappropriate and could create anxiety around sensitive emotional tasks.

**Alternative:** Use **Gentle Nudge** (Technique #11) for light, supportive reminders.

### 4. Emotional Character

**Purpose:** Provide empathetic guidance through emotional legacy planning process.

**Character Specification:**

| Attribute | Design Choice | Rationale |
|-----------|---------------|-----------|
| **Name** | "Penjaga Kenangan" (Memory Keeper) | Warm, reverent, non-intrusive |
| **Visual** | Subtle glow icon (warm light) | Symbolizes hope and preservation |
| **Tone** | Gentle, patient, respectful | Legacy is sensitive; avoid urgency |
| **Presence** | On-demand + key moments | Available but not overbearing |

**Trigger Lines:**

| Moment | Character Message |
|--------|-------------------|
| **First Sign-up** | "Selamat datang. Saya di sini untuk membantu Anda menyusun warisan yang bermakna. Ambil waktu Anda, tidak ada yang buru-buru." |
| **Adding Difficult Memory** | "Terkadang kenangan yang paling berat adalah yang paling berharga. Anda tidak sendirian dalam proses ini." |
| **Completing Milestone** | "Setiap kenangan yang Anda dokumentasikan adalah hadiah bagi generasi berikutnya. Terima kasih." |
| **Long Absence** | "Masih banyak cerita hidup Anda yang belum terdokumentasi. Ingin melanjutkan kapan saja Anda siap." |
| **Final Legacy Complete** | "Warisan Anda kini aman. Generasi berikutnya akan mengenal Anda melalui cerita-cerita ini. Terima kasih telah membagikan hidup Anda." |

**Technical Implementation:**
- Display: Toast/bottom sheet (non-blocking)
- Timing: 2-second delay after trigger event
- Dismissible: Always, with "Don't show again" option
- Animation: Gentle fade-in (400ms), no exit animation (respectful)

### 5. Variable Reward Notification

**Purpose:** Create delight through unexpected positive reinforcement at key milestones.

**Implementation for LayanganLegacy:**

| Milestone Trigger | Reward Type | Visual Pattern | Copy Example |
|-------------------|-------------|----------------|--------------|
| **Legacy Milestone Completed** | Confetti warm-toned + milestone badge | Subtle particle celebration | "Milestone tercapai! Bab 'Keluarga' selesai. 4 bab lagi." |
| **Memory Added** | Photo gallery animation + count celebration | Card cascade effect | "Kenangan #10 ditambahkan! Anda telah menyimpan 10 momen berharga." |
| **First Video Message** | Spotlight animation + special icon | Glowing border effect | "Pesan video pertama! Generasi mendatang akan bisa melihat senyuman Anda." |
| **Legacy Document Generated** | Document reveal animation + download ready | Unfold effect | "Dokumen warisan Anda siap! 47 halaman kehidupan, terdokumentasi dengan indah." |

**Reward Schedule (Variable):**
- Not after every action (becomes expected/boring)
- Random intervals: 30%, 50%, 70% completion points
- Always for: First action, major milestones, completion
- Never for: Deleting/editing (negative actions)

**Ethical Note:** Rewards should celebrate progress, not create FOMO or pressure. Keep it warm, not urgent.

### 6. Social Proof Counter

**Purpose:** Build trust through collective action indicators (privacy-preserving).

**Implementation for LayanganLegacy:**

| Metric | Display Location | Example Copy | Privacy Note |
|--------|------------------|--------------|--------------|
| **Families Protected** | Homepage hero section | "12,847 keluarga telah melindungi warisan mereka" | Aggregate count only |
| **Legacies Preserved** | Feature section | "8,234 warisan digital telah dibuat tahun ini" | Monthly updated |
| **Memories Stored** | Trust indicator | "2.3 juta kenangan tersimpan aman" | Rounded figures |
| **Active Users** | Optional footer | "Dipercaya oleh 5,000+ penjaga kenangan" | Current month |

**Design Specifications:**
- Display: Subtle, Layer 4-5 (not focal)
- Animation: Gentle count-up on page load (2 seconds)
- Color: Warm Gray (muted, not attention-grabbing)
- Icon: Simple shield/lock icon (trust symbol)

**Privacy-First Approach:**
- Never show real-time counts
- Round to nearest thousand/hundred
- Update monthly, not real-time
- No user profiles or avatars
- No geographic or demographic breakdowns

### 7. Annual Wrapped

**Purpose:** Create yearly reflection moment that reinforces value and emotional connection.

**Implementation for LayanganLegacy:**

**"Life Story: Year in Review"**

| Section | Content Example | Visual Pattern |
|---------|----------------|----------------|
| **Opening** | "2025: Tahun penuh kenangan" | Full-screen warm gradient |
| **Memories Added** | "47 kenangan baru ditambahkan" | Photo masonry reveal |
| **Top Categories** | "Keluarga (23), Wisata (12), Karier (8)" | Category breakdown chart |
| **Most Viewed** | "Kenangan paling sering dilihat: Gradiasi Anak" | Spotlight card |
| **Emotional Highlight** | "Anda mendokumentasikan 3 momen sulit dengan indah" | Gentle acknowledgment |
| **Sharing** | "Bagikan refleksi tahun ini (opsional)" | Single share button |

**Timing:**
- Trigger: January 1-7 each year
- Notification: "Life Story 2025 sudah siap. Lihat sekarang atau nanti."
- Availability: Entire month of January
- Archive: Saved to user profile, accessible anytime

**Export Options:**
- PDF: "Unduh Life Story 2025 sebagai PDF"
- Video: (Premium) "Buat video refleksi otomatis"
- Print: "Siap untuk dicetak sebagai buku"

### 8. Personalization Surprise

**Purpose:** Create "this really gets me" moments through personalized insights.

**Implementation for LayanganLegacy:**

| Surprise Type | Trigger Condition | Example Message |
|---------------|-------------------|-----------------|
| **Memory Milestone** | User adds 50th memory | "Anda telah mendokumentasikan 50 kenangan berharga. Ini lebih dari kebanyakan orang orang seumur hidup mereka. Terima kasih sudah merawat ingatan ini." |
| **Dedication Detect** | User active for 30 days | "Anda telah kembali selama 30 hari berturut-turut. Komitmen Anda pada warisan keluarga luar biasa." |
| **Category Affinity** | 70%+ memories in one category | "Anda menyukai memori 'Keluarga'. Ingin kami buatkan kumpulan cerita khusus keluarga?" |
| **Legacy Completeness** | All core sections filled | "Warisan Anda 85% lengkap. Bagian 'Pesan Masa Depan' masih kosong. Ingin mengisinya?" |
| **First Video** | User records first video message | "Generasi mendatang akan sangat berterima kasih bisa mendengar suara Anda. Ini adalah hadiah yang tak ternilai." |

**Design Principles:**
- Unexpected: Don't show these every time
- Genuine: Feel personal, not templated
- Respectful: Acknowledge emotional weight
- No pressure: Always allow "Maybe later" option

### 9. Flash Sale Countdown

**Status:** ❌ **NOT APPLICABLE**

**Rationale:** Legacy planning is not a transactional e-commerce product. Time pressure is inappropriate and could cause anxiety around sensitive emotional tasks.

**Alternative:** Use **Variable Reward Notification** (Technique #5) for milestone celebrations, not urgency.

### 10. Social Commerce

**Purpose:** Enable organic sharing of family legacy plans (optional, privacy-respecting).

**Implementation for LayanganLegacy:**

| Feature | Description | Privacy Control |
|---------|-------------|-----------------|
| **Family Legacy Plan** | Share overview of planned legacy sections | "Bagikan ringkasan warisan (tanpa detail rahasia)" |
| **Memory Collaboration** | Invite family to contribute their memories | "Undang anggota keluarga untuk menambahkan kenangan mereka" |
| **Legacy Preview** | Share sanitized preview (non-sensitive content) | "Tampilkan cuplikan (tanpa password, aset, dll)" |
| **Gift Subscription** | Share gift link for LayanganLegacy Premium | "Berikan hadiah warisan digital kepada orang tersayang" |

**Share Copy Examples:**

| Platform | Message Template |
|----------|------------------|
| **WhatsApp** | "Aku sedang membuat warisan digital di LayanganLegacy. Ingin membantu dengan menambahkan kenangan bersama?" |
| **Email** | "Hai! Aku sedang menyusun cerita hidupku untuk generasi mendatang. Mau lihat ringkasannya?" (link) |
| **Social** | "Mulai mendokumentasikan warisan keluarga di LayanganLegacy. Ternyata menyimpan kenangan itu menyenangkan 🌱" |

**Ethical Safeguards:**
- Never auto-share (always explicit user action)
- Preview shows only non-sensitive content
- Recipient must opt-in to collaborate
- Easy revocation of access
- Clear data ownership communication

### 11. Gentle Nudge

**Purpose:** Provide light, supportive reminders without creating pressure or anxiety.

**Implementation for LayanganLegacy:**

**"Very Light Touch" Approach**

| Trigger Condition | Nudge Message | Timing | Channel |
|-------------------|---------------|--------|---------|
| **30+ days inactive** | "Masih ada cerita hidup yang belum terdokumentasi. Kapan saja Anda siap, kami di sini." | Once | Email |
| **Draft detected** | "Draf 'Pesan untuk Anak' tersimpan. Ingin melanjutkannya?" | Once | In-app toast |
| **Milestone nearby** | "Warisan Anda hampir lengkap! Tinggal 1 bagian lagi." | Once | In-app toast |
| **Life event detected** | "Sepertinya ada momen baru dalam hidup Anda. Ingin mendokumentasikannya?" | Once | Email |

**Nudge Design Principles:**

| Principle | Implementation |
|-----------|----------------|
| **Frequency** | Maximum 1 nudge per 30 days |
| **Opt-out** | Always include "Jangan reminder saya lagi" link |
| **Tone** | Gentle, optional, supportive (never urgent) |
| **Content** | Focus on value, not FOMO |
| **Timing** | Respect local time, avoid late nights |
| **Escalation** | Never increase frequency over time |

**Anti-Patterns to Avoid:**

- ❌ "Anda belum login 14 hari!" (shaming)
- ❌ "Warisan Anda terbengkalai!" (anxiety-inducing)
- ❌ "Selesaikan sebelum terlambat!" (false urgency)
- ❌ Daily/weekly reminders (too frequent)

**Valid Examples:**

- ✅ "Masih ada cerita yang belum terdokumentasi. Kami di sini saat Anda siap."
- ✅ "Draf pesan untuk anak Anda tersimpan. Ingin melanjutkan kapan saja?"
- ✅ "Kenangan baru tersimpan. Terima kasih merawat ingatan ini."

---

*Based on: [neurodesign-uiux-guide.md](../_templates/neurodesign-uiux-guide.md)*

*Last Updated: 2026-03-03*
*Document Version: 1.0*
