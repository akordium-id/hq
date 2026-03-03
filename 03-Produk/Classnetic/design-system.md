# Classnetic Design System

> Neurodesign-based visual hierarchy untuk Sistem Manajemen Sekolah Klasik

**Category:** EdTech

**Related:** [neurodesign-uiux-guide.md](../_templates/neurodesign-uiux-guide.md)

---

## 1. Visual Identity

### Color Palette

| Role | Color | Hex | Neuroscience Rationale |
|------|-------|-----|------------------------|
| Primary | Blue | `#2563EB` | Warna biru melambangkan kepercayaan, kestabilan, dan intelektual - sangat cocok untuk pendidikan. Biru juga menenangkan dan meningkatkan fokus, penting untuk environment belajar. |
| Secondary | Green | `#16A34A` | Melambangkan pertumbuhan, perkembangan, dan pembelajaran - cocok untuk progress tracking dan achievement siswa |
| Accent | Amber | `#F59E0B` | Menambahkan energi dan optimism untuk highlight penting seperti badge, notifikasi, atau CTA |
| Background | Light Gray | `#F9FAFB` | Netral dan clean untuk konten yang padat (grade, attendance) |
| Text Primary | Dark Blue | `#1E3A5F` | Kontras tinggi dengan nuansa professional |
| Text Secondary | Slate Gray | `#64748B` | Untuk teks pendukung dengan kontras yang cukup |

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
| Display/Hero | Nunito | 48px | Bold (700) |
| H1 | Nunito | 38px | Semibold (600) |
| H2 | Nunito | 30px | Semibold (600) |
| H3 | Nunito | 24px | Medium (500) |
| Body Large | Inter | 18px | Regular (400) |
| Body | Inter | 16px | Regular (400) |
| Caption/Meta | Inter | 12px | Regular (400) |

**Typography Rationale:** Nunito untuk heading memberikan kesan friendly, approachable, dan educational dengan rounded edges yang ramah. Sempurna untuk produk edukasi yang ingin terlihat welcoming tapi tetap professional. Inter untuk body text memastikan keterbacaan maksimal untuk data yang padat seperti nilai dan kehadiran.

---

## 2. Visual Hierarchy (5-Layer)

### Layer Definitions

| Layer | Use Case | Size | Weight | Contrast |
|-------|----------|------|--------|----------|
| **1. Focal Point** | Nilai siswa / Statistik kehadiran | 48px | Bold | 7:1 (AAA) |
| **2. Primary** | Nama siswa / Kelas / Semester | 30px | Medium | 4.5:1 (AA) |
| **3. Secondary** | Detail mata pelajaran / Tanggal | 18px | Regular | 4.5:1 (AA) |
| **4. Supporting** | Catatan guru / Timestamp | 14px | Light | 3:1 |
| **5. UI Chrome** | Navigation, filter, pagination | 12px | Regular | 3:1 |

### Focal Point Strategy

**Single Focal Element per Screen:** Grade/nilai atau attendance siswa yang sedang dilihat

```
Example:
┌─────────────────────────────────────┐
│                                     │
│       AHMAD RIZKY - X-IPA-1          │  ← Layer 1: Nama (Focal Point)
│       Semester Ganjil 2024/2025     │
│                                     │
│  ┌─────────┐  ┌─────────┐          │  ← Layer 2: Primary metrics
│  │  85.5   │  │  92%    │          │
│  │ Rata-rata│  │Hadir    │          │
│  └─────────┘  └─────────┘          │
│                                     │
│  Matematika: 90                     │  ← Layer 3: Subject grades
│  Fisika: 85                         │
│  Biologi: 82                        │
│                                     │
└─────────────────────────────────────┘
```

### Anti-Patterns to Avoid

- ❌ **Christmas Tree Effect:** Semua nilai/highlighted = tidak ada focal point
- ❌ **Flat Hierarchy:** Semua data ukuran sama = sulit mencari informasi penting
- ❌ **Hidden Actions:** Tombol input nilai tersembunyi di antara data lain

---

## 3. Eye Tracking Pattern

### Primary Pattern: F-Pattern

**Rationale:** F-Pattern sangat cocok untuk dashboard grade dan attendance karena data terstruktur dalam tabel/list. Pengguna memindai horizontal di atas (summary/rata-rata), lalu vertical di kiri (nama siswa/mapel), dan membaca horizontal untuk detail setiap baris. Pattern ini efisien untuk scanning data padat.

### Pattern Application

#### F-Pattern - Untuk Grade Dashboard

```
┌──────────────────────────────────────┐
│ AHMAD RIZKY    85.5    92%    A      │  ← Horizontal scan 1 (summary)
│ █                                    │
│ █  [DETAIL GRADES]                   │  ← Vertical scan (navigasi)
│ █  Matematika:     90    A           │  ← Horizontal scan 2
│ █  Fisika:         85    B+          │
│ █  Biologi:        82    B+          │
└──────────────────────────────────────┘
```

### Key Rules

- **Most important metric** (rata-rata/grade terakhir) = top horizontal scan
- **Most important action** (input nilai/absen) = left side (bukan right)
- **Never hide critical info** di bottom-right corner (blind spot)

---

## 4. Motion Guidelines

### When to Use Motion

| Use Case | Animation Type | Duration |
|----------|---------------|----------|
| Loading states | Skeleton shimmer dengan efek blue | Continuous |
| Success feedback | Subtle checkmark dengan confetti hijau | 300ms max |
| Error indication | Shake dengan pulse merah | 200ms |
| Grade updates | Smooth number transition (count-up) | 400ms |
| Attendance toggle | Scale dengan color change | 150ms |
| Badge earned | Pop animation dengan glow amber | 250ms |

### When NOT to Use Motion

- ❌ Background decorative animations (mengganggu fokus pada data)
- ❌ Auto-playing carousels tanpa pause
- ❌ Continuous motion saat memasukkan nilai
- ❌ Apa pun yang mengalihkan perhatian dari data siswa

### Easing Presets

```css
--ease-out: cubic-bezier(0, 0, 0.2, 1);     /* Elements appearing */
--ease-in: cubic-bezier(0.4, 0, 1, 1);      /* Elements disappearing */
--ease-in-out: cubic-bezier(0.4, 0, 0.2, 1); /* Moving elements */
```

---

## 5. Whitespace Strategy

### Density Level: Moderate

**Rationale:** Whitespace moderate menciptakan balance antara clarity dan efficiency - penting untuk sistem manajemen sekolah yang data-padat tapi tetap harus mudah dibaca. Tidak terlalu longgar (seperti wedding) dan tidak terlalu padat (seperti POS), tapi tepat untuk edukasi.

| Whitespace Type | Value | Application |
|-----------------|-------|-------------|
| **Macro** (section gaps) | 48-64px | Antara section utama (summary, detail grades) |
| **Card padding** | 20px | Inside card components (siswa card, subject card) |
| **Form group gaps** | 16px | Antara form fields (input nilai) |
| **List item gaps** | 12px | Antara list items (daftar mata pelajaran) |
| **Micro** (tight) | 4-8px | Related inline elements (badge, status) |

### Density by Product Category

| Category | Density | Why |
|----------|---------|-----|
| EdTech (Classnetic) | Moderate | Balance of clarity & efficiency untuk data padat |
| Wedding/Heritage | Generous | Whitespace = trust, premium, respect |
| Commerce/Action | Minimal | Density = energy & urgency |

---

## 6. Design Tokens

```css
/* ===========================================
   CLASSNETIC DESIGN TOKENS
   Based on Akordium Neurodesign System
   =========================================== */

/* --- COLOR TOKENS --- */
--color-primary: #2563EB;
--color-primary-hover: #1D4ED8;
--color-primary-light: #3B82F6;
--color-secondary: #16A34A;
--color-accent: #F59E0B;

--color-background: #F9FAFB;
--color-surface: #FFFFFF;
--color-surface-elevated: #F0F9FF;

--color-text-primary: #1E3A5F;
--color-text-secondary: #64748B;
--color-text-muted: #94A3B8;

/* Semantic Colors (Consistent Across All Products) */
--color-success: #16A34A;
--color-warning: #D97706;
--color-error: #DC2626;
--color-info: #2563EB;

/* --- TYPOGRAPHY TOKENS --- */
--font-display: 'Nunito', system-ui, sans-serif;
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
--card-padding: 20px;
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
--radius-sm: 6px;
--radius-md: 10px;
--radius-lg: 14px;
--radius-xl: 18px;
--radius-full: 9999px;

/* --- SHADOWS --- */
--shadow-sm: 0 1px 2px rgba(37, 99, 235, 0.05);
--shadow-md: 0 4px 6px rgba(37, 99, 235, 0.1);
--shadow-lg: 0 10px 15px rgba(37, 99, 235, 0.15);
--shadow-xl: 0 20px 25px rgba(37, 99, 235, 0.2);
```

---

## 7. Per-Screen Specifications

### Dashboard/Home

| Element | Specification |
|---------|---------------|
| **Focal Point** | Grade summary atau attendance summary di tengah atas |
| **Eye Pattern** | F-Pattern (dari summary ke detail data) |
| **Primary Actions** | Tombol "Input Nilai" dan "Input Absen" dengan primary blue |
| **Key Metrics** | Rata-rata kelas, kehadiran hari ini (Layer 2) |

### Input Nilai

| Element | Specification |
|---------|---------------|
| **Focal Point** | Field input nilai yang sedang aktif |
| **Pattern** | F-Pattern (dari nama siswa ke field nilai) |
| **CTAs** | Tombol "Simpan" di kiri atas (bukan kanan) |

### Detail Siswa

| Element | Specification |
|---------|---------------|
| **Focal Point** | Grade rata-rata dan attendance percentage |
| **Pattern** | F-Pattern (dari summary ke detail per mapel) |
| **CTAs** | Tombol "Edit Nilai" dan "Lihat Riwayat" |

---

## 8. Peak Moment Design

Based on Peak-End Rule: Users remember the **peak moment** and the **ending**, not the average.

### Peak Moment: Grade Mengalami Peningkatan

| Moment | Implementation |
|--------|----------------|
| **Trigger** | Siswa mendapatkan nilai lebih baik dari sebelumnya |
| **Visual** | Trend chart dengan animasi naik dan confetti hijau |
| **Duration** | 400ms animation |
| **Micro-copy** | "Hebat! Nilai Fisika naik 5 poin. Terus bersemangat! 📚" |

### Peak Moment: Perfect Attendance

| Moment | Implementation |
|--------|----------------|
| **Trigger** | Siswa/siswa mencapai kehadiran sempurna 100% |
| **Visual** | Badge celebration dengan gold glow animation |
| **Duration** | 500ms animation |
| **Micro-copy** | "Sempurna! 100% kehadiran semester ini. Pertahankan prestasimu! 🏆" |

### Ending Design

| Moment | Implementation |
|--------|----------------|
| **Trigger** | User logout atau menutup aplikasi |
| **Message** | "Data tersimpan. Sampai jumpa di hari pembelajaran berikutnya! 🎓" |
| **Tone** | Professional, encouraging, educational |

---

## 9. Accessibility Requirements

| Requirement | Standard |
|-------------|----------|
| Contrast Ratio | WCAG AA minimum (4.5:1 for text) |
| Focal Points | AAA contrast (7:1) |
| Interactive Elements | Minimum 44px touch target |
| Focus States | Visible focus ring dengan warna primary blue |
| Motion | Respect `prefers-reduced-motion` |

---

## 10. Implementation Checklist

- [ ] Colors match category palette (Blue, Green, Amber)
- [ ] Single focal point per screen (Grade/Attendance summary)
- [ ] Eye tracking pattern applied (F-Pattern untuk data dashboard)
- [ ] Whitespace density appropriate (Moderate)
- [ ] Motion used sparingly (encouraging, tidak berlebihan)
- [ ] Peak moment designed (Grade improvement, perfect attendance)
- [ ] Design tokens implemented in CSS
- [ ] Accessibility requirements met

---

## 11. Behavioral Design Techniques

> **Ethical Design Note:** Education B2B products should lean toward **Sticky** design karena membantu educator be more effective, bukan membuat mereka glued to screen.

### Technique Application Matrix

| # | Technique | Applicable | Implementation for Classnetic |
|---|-----------|------------|-------------------------------|
| 1 | Anticipation Loop | ✅ Yes | Grade calculation, report generation loading |
| 2 | Invisible Personalization | ✅ Yes | Student performance insights |
| 3 | Streak + Loss Aversion | ✅ Yes (Light) | Daily attendance logging streak |
| 4 | Emotional Character | ❌ No | Professional tool - not applicable |
| 5 | Variable Reward Notification | ✅ Yes | New student enrolled, payment received |
| 6 | Social Proof Counter | ✅ Yes | Total students, classes conducted, successful graduates |
| 7 | Annual Wrapped | ✅ Yes | Yearly class performance summary |
| 8 | Personalization Surprise | ✅ Yes | "Student X improved by Y% this semester" |
| 9 | Flash Sale Countdown | ❌ No | Not applicable for education B2B |
| 10 | Social Commerce | ❌ No | Not applicable for education B2B |
| 11 | Gentle Nudge | ✅ Yes | Attendance reminder, schedule notifications |

### 1. Anticipation Loop

**Use Case:** Grade calculation and report generation

| Component | Implementation |
|-----------|----------------|
| **Trigger** | User clicks "Generate Report" or "Calculate Grades" |
| **Anticipation Build** | Progress bar dengan phases: "Mengambil data...", "Menghitung nilai...", "Generating report..." |
| **Duration** | 2-3 seconds (artificial jika cepat, untuk create anticipation) |
| **Peak Moment** | Report ready dengan subtle celebration animation |
| **Micro-copy** | "Laporan sedang disiapkan...", "Hampir selesai...", "Laporan siap! 📊" |

**Implementation Example:**
```typescript
// Phase-based progress instead of linear
const reportPhases = [
  { text: "Mengambil data siswa...", duration: 800 },
  { text: "Menghitung rata-rata nilai...", duration: 1000 },
  { text: "Generating laporan...", duration: 700 },
  { text: "Laporan siap! 📊", duration: 0 }
];
```

### 2. Invisible Personalization

**Use Case:** Student performance insights without explicit input

| Component | Implementation |
|-----------|----------------|
| **Data Points** | Grade trends, attendance patterns, subject strengths |
| **AI Insights** | "Fisika adalah mata pelajaran terkuat Ahmad (rata-rata 90)" |
| **Smart Recommendations** | "Pertimbangkan extra session untuk Matematika" |
| **Privacy Note** | Semua insights based on existing data, no additional input needed |

**Implementation Example:**
```typescript
// Auto-generated insight card
interface StudentInsight {
  strongestSubject: string;
  improvementArea: string;
  trend: "improving" | "stable" | "declining";
  suggestion: string;
}
```

### 3. Streak + Loss Aversion (Light Version)

**Use Case:** Daily attendance logging streak

| Component | Implementation |
|-----------|----------------|
| **Streak Type** | Light - professional, not gamified berlebihan |
| **Trigger** | Guru input attendance setiap hari |
| **Visual** | Subtle badge: "5 hari berturut-turut" |
| **Loss Aversion** | "Jangan putus streak! Input attendance hari ini" |
| **Cap** | Max 7 days untuk avoid obsession |

**Ethical Consideration:** Keep it professional. Bukan "challenge" tapi "consistency reminder" untuk better classroom management.

### 4. Emotional Character

**Status:** ❌ **NOT APPLICABLE**

**Rationale:** Classnetic adalah professional B2B tool untuk educators. Emotional character (mascot, personality) akan mengurangi credibility dan professional appearance. Tetap gunakan clean, professional UI tanpa character anthropomorphic.

### 5. Variable Reward Notification

**Use Case:** New student enrolled, payment received

| Component | Implementation |
|-----------|----------------|
| **Trigger Types** | New enrollment, payment received, parent inquiry |
| **Variable Element** | Different notification styles/timing per type |
| **Dopamine Hit** | Subtle celebration untuk positive events |
| **Timing** | Random 1-3 hours delay untuk natural feel (bukan instant batch) |

**Implementation Example:**
```typescript
// Variable notification timing
const notifyEnrollment = () => {
  const delay = Math.random() * 7200 + 3600; // 1-3 hours
  setTimeout(() => {
    showNotification("🎓 Siswa baru terdaftar: Ahmad Rizky");
  }, delay * 1000);
};
```

### 6. Social Proof Counter

**Use Case:** Trust-building through statistics

| Counter Type | Implementation |
|--------------|----------------|
| **Total Students** | "1,247 siswa terdaftar" di dashboard |
| **Classes Conducted** | "5,342 kelas telah diadakan" |
| **Successful Graduates** | "892 lulusan dengan predikat memuaskan" |
| **Active Schools** | "23 sekolah aktif menggunakan Classnetic" |
| **Placement** | Subtle di footer atau dashboard widget, bukan hard sell |

**Implementation Example:**
```typescript
// Dashboard widget
interface SocialProofWidget {
  totalStudents: number;
  classesConducted: number;
  successfulGraduates: number;
  activeSchools: number;
}
```

### 7. Annual Wrapped

**Use Case:** Yearly class performance summary

| Component | Implementation |
|-----------|----------------|
| **Timing** | Available di akhir tahun ajaran (Juni/Desember) |
| **Content** | Total kelas diajar, rata-rata grade, improvement moments, perfect attendance count |
| **Visual Style** | Professional dengan subtle celebration, bukan playful berlebihan |
| **Shareability** | Optional: "Bagikan ke kepala sekolah" |
| **Tone** | Professional achievement summary |

**Implementation Example:**
```typescript
interface AnnualWrapped {
  year: number;
  totalClasses: number;
  averageGrade: number;
  improvementCount: number;
  perfectAttendanceCount: number;
  highlightMoment: string;
}
```

### 8. Personalization Surprise

**Use Case:** "Student X improved by Y% this semester"

| Component | Implementation |
|-----------|----------------|
| **Trigger** | Significant improvement detected (>10% grade increase) |
| **Surprise Element** | Unexpected insight notification |
| **Visual** | Trend chart dengan arrow up hijau |
| **Micro-copy** | "Ahmad improved by 15% in Matematika this semester! 📈" |
| **Timing** | Random 2-4 hours setelah improvement terdeteksi |

**Implementation Example:**
```typescript
// Surprise improvement notification
const checkImprovements = () => {
  const improvements = analyzeStudentProgress();
  improvements.forEach(imp => {
    if (improvement > 10) {
      setTimeout(() => {
        showNotification(`${student.name} improved by ${improvement}% in ${subject}! 📈`);
      }, Math.random() * 7200 + 7200); // 2-4 hours delay
    }
  });
};
```

### 9. Flash Sale Countdown

**Status:** ❌ **NOT APPLICABLE**

**Rationale:** Education B2B tidak memerlukan urgency tactics seperti flash sale. Classnetic adalah operational tool, bukan e-commerce. Use gentle reminders untuk deadlines administratif (misal: "Batas input nilai: 3 hari lagi") dengan tone professional, bukan urgency.

### 10. Social Commerce

**Status:** ❌ **NOT APPLICABLE**

**Rationale:** Classnetic bukan social commerce platform. Education B2B tidak memerlukan social proof berbasis pembelian atau FOMO tactics. Focus pada professional trust melalui case studies, testimonials, dan proven results.

### 11. Gentle Nudge

**Use Case:** Attendance reminder, schedule notifications

| Component | Implementation |
|-----------|----------------|
| **Trigger** | Missed attendance input, upcoming class schedule |
| **Timing** | 2 hours sebelum kelas, atau end of day jika belum input |
| **Tone** | Helpful, tidak judgmental |
| **Frequency** | Max 2 reminders per day |
| **Channel** | In-app notification + optional email |

**Implementation Example:**
```typescript
// Gentle nudge untuk attendance
interface AttendanceNudge {
  type: "upcoming_class" | "missed_input";
  message: string;
  timing: "2_hours_before" | "end_of_day";
  tone: "helpful";
}

// Example messages
const nudgeMessages = {
  upcoming_class: "Kelas X-IPA-1 akan dimulai dalam 2 jam. Siapkan materi belajar! 📚",
  missed_input: "Jangan lupa input kehadiran untuk kelas hari ini 😊"
};
```

### Ethical Design Principles

For Classnetic as an Education B2B product:

1. **Sticky over Addictive:** Design for efficiency, not engagement at all costs
2. **Professional First:** No gamification yang mengurangi credibility
3. **Respect Educator Time:** Helpful reminders, bukan notification spam
4. **Focus on Outcomes:** Behavioral techniques harus support student success, bukan vanity metrics
5. **Transparent AI:** Jelaskan kapan insights di-generate oleh algorithm

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

*Based on: [neurodesign-uiux-guide.md](../_templates/neurodesign-uiux-guide.md)*

*Last Updated: 2026-03-03*
*Document Version: 1.1*
