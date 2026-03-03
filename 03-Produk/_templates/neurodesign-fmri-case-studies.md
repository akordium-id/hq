# fMRI Case Studies for UI Design

> **Evidence-based neurodesign:** Temuan neuroscience untuk optimasi UI berdasarkan studi fMRI

**Related:**
- [neurodesign-uiux-guide.md](./neurodesign-uiux-guide.md) - Prinsip dasar neurodesign
- [neurodesign-vs-ux-traditional.md](./neurodesign-vs-ux-traditional.md) - Perbandingan pendekatan
- [neurodesign-behavioral.md](./neurodesign-behavioral.md) - Teknik behavioral design

---

## 1. Overview: Cara Kerja fMRI untuk UI Design

fMRI (functional Magnetic Resonance Imaging) memungkinkan peneliti melihat aktivitas otak secara real-time saat user melihat stimulus visual. Ini adalah salah satu topik paling menarik dalam ilmu desain modern — di mana neuroscience dan UI design bertemu secara literal di dalam scanner MRI.

### Prosedur Studi fMRI Estetika UI

```
1. Partisipan berbaring di dalam mesin fMRI
2. Ditampilkan stimulus visual: website, app screen, warna, layout
3. fMRI mengukur perubahan aliran darah (BOLD signal)
   → Lebih banyak aliran darah = area otak lebih aktif
4. Partisipan diminta menilai: "Apakah ini indah/tidak indah?"
5. Pola aktivasi otak di-map ke penilaian subjektif
```

### Key Finding

> **"Penilaian subjektif user sering BERBEDA dengan respons otak objektif"**
>
> Ini adalah temuan terpenting — otak bereaksi sebelum pikiran sadar.

Riset ini membuktikan bahwa user **tidak bisa secara akurat melaporkan** apa yang membuat sebuah desain "terasa enak" — tapi otak mereka tahu.

---

## 2. Brain Map untuk Estetika Visual

fMRI mengidentifikasi jaringan otak yang terlibat dalam memproses estetika visual secara berlapis:

### Visual Processing Hierarchy

```
STIMULUS VISUAL (UI Screen)
           ↓
┌─────────────────────────────────────────┐
│  V1/V2 Visual Cortex (Occipital)        │
│  Proses: warna, kontras, tepi, gerakan  │  ← <100ms, pre-conscious
│  fMRI: aktif proporsional dengan        │
│        kompleksitas visual              │
└─────────────────────────────────────────┘
           ↓
┌─────────────────────────────────────────┐
│  Occipito-Temporal Cortex               │
│  Proses: pengenalan objek, pola, wajah  │  ← 100-200ms
│  fMRI: aktivasi lebih tinggi untuk      │
│        desain yang familiar & teratur   │
└─────────────────────────────────────────┘
           ↓
┌─────────────────────────────────────────┐
│  CORE AESTHETIC CIRCUIT                 │
│  ├── Orbitofrontal Cortex (OFC)         │  ← "Beauty Evaluator"
│  ├── Anterior Insula                    │  ← Interoceptive feeling
│  ├── Nucleus Accumbens (Ventral Str.)   │  ← Reward signal
│  └── Amygdala                           │  ← Emotional tagging
└─────────────────────────────────────────┘
           ↓
┌─────────────────────────────────────────┐
│  Default Mode Network (DMN)             │
│  Proses: self-referential aesthetic     │  ← "Ini relevan dengan aku"
│  fMRI: aktif kuat saat estetika intens  │
│        dan personal                     │
└─────────────────────────────────────────┘
```

### Processing Timeline

| Time | Brain Area | What Happens |
|------|------------|--------------|
| <100ms | V1/V2 Visual Cortex | Pre-conscious processing of color, contrast, edges |
| 100-200ms | Occipito-Temporal | Object recognition, pattern detection |
| 200-500ms | Core Aesthetic Circuit | Beauty evaluation, emotional tagging |
| >500ms | Default Mode Network | Personal relevance, self-reference |

---

## 3. Case Study 1: Core Circuit Estetika (93 Studies Meta-analysis)

**Penelitian:** Vessel et al. — meta-analisis terbesar neuroaesthetics, 93 neuroimaging studies lintas 4 modalitas sensorik.

**Metode:** fMRI pada partisipan yang melihat stimulus visual indah (seni, wajah, lanskap) vs tidak indah.

### Temuan Kunci

```
Orbitofrontal Cortex (OFC) + Anterior Insula = "Core Circuit"

OFC: mengkodekan reward value dari stimulus visual
     → semakin indah persepsi → semakin kuat sinyal OFC
     → bekerja lintas semua modalitas (visual, auditori, taktil)

Anterior Insula: memproses "gut feeling" tentang estetika
     → menghubungkan persepsi eksternal dengan perasaan internal
     → ini sebabnya desain yang "terasa benar" sulit dijelaskan —
       prosesnya adalah interoceptive, bukan linguistic
```

### Implikasi untuk Akordium Products

| Temuan fMRI | Prinsip Desain | Aplikasi |
|:--|:--|:--|
| OFC aktif lebih kuat untuk stimuli high-reward value | Tampilkan value/manfaat secara visual, bukan hanya teks | **Anggarin**: visualisasi "simulasi kebebasan finansial" > angka tabungan biasa |
| Anterior Insula = gut feeling | Desain harus "terasa konsisten" — mismatch elemen memicu insula negatif | Semua produk: jangan mix visual style dalam satu screen |
| OFC merespons reward prediction | Hint tentang reward yang datang lebih powerful dari reward itu sendiri | **BibiDiskon**: preview deals sehari sebelum ultah, bukan cukup di hari-H |

---

## 4. Case Study 2: Website Color vs No Color

**Penelitian:** Studi neuroimaging users' reactions to website designs — paling relevan langsung untuk UI.

**Metode:** Partisipan ditunjukkan versi colored vs uncolored website sambil di-scan fMRI.

### Temuan

```
Website BERWARNA vs TANPA WARNA:

  ✓ Lebih banyak pleasure (ventral striatum lebih aktif)
  ✓ Lebih tinggi arousal (amygdala activation lebih besar)
  ✓ Lebih sedikit distrust (insula negatif lebih rendah)
  ✓ Lebih positif attitude overall

Paradoks yang ditemukan:
  User dalam interview berkata "desain minimalis/putih lebih profesional"
  Tapi otak mereka LEBIH engage dengan versi berwarna

→ Ini adalah bukti konkret Say-Do Gap dalam studi fMRI
```

### Implikasi untuk Akordium Products

| Product Type | Implication |
|--------------|-------------|
| **KoalaMail, ExcelCircle, Klustera** (developer tools) | Sering di-design full abu/putih demi kesan "technical" — tapi fMRI membuktikan ini bukan pilihan terbaik untuk brain engagement. Tambahkan aksen warna strategis meski produknya developer-facing. |
| **WaqfWise** (formal products) | Tambahan color accent pada elemen kritis tetap meningkatkan trust dan engagement secara neurologis, bukan menguranginya. |

---

## 5. Case Study 3: DMN & Intense Aesthetic Experience

**Penelitian:** Vessel, Starr & Rubin (2012) — *"The Brain on Art"*, fMRI study di NYU.

**Metode:** 16 partisipan melihat 109 lukisan seni sambil di-scan. Dibagi berdasarkan tingkat aesthetic response (skala 4 level).

### Temuan

```
Dua network berbeda untuk dua level estetika:

Level 1-2 (Desain "Bagus biasa"):
→ Hanya occipito-temporal cortex aktif
→ Sensory processing saja — "oh ini bagus"
→ User lanjut tanpa terkesan

Level 3-4 (Desain "Sangat menyentuh"):
→ Occipito-temporal PLUS Default Mode Network aktif
→ DMN biasanya aktif saat: self-reflection, autobiographical memory,
  imagining the future — aktivitas yang sangat personal
→ Artinya: desain level tinggi membuat otak user
  secara otomatis menghubungkannya dengan diri sendiri
```

### Insight Revolusioner untuk UI Design

```
Desain yang hanya "bagus" → diproses sebagai objek eksternal
Desain yang "resonan secara personal" → diproses sebagai bagian dari diri user

Implikasi: Produk dengan estetika yang "menyentuh identitas user"
akan membentuk attachment yang jauh lebih kuat
```

### Aplikasi ke Akordium Products

| Product | DMN Activation Strategy |
|---------|------------------------|
| **Sesarra & Guestron** (wedding) | Seluruh estetika UI harus memanggil DMN — gunakan tipografi yang personal, foto placeholder yang emosional, copy yang berbicara tentang *their* story bukan generic wedding. User yang otak-nya masuk ke DMN saat melihat preview produk akan *feel ownership* sebelum membeli. |
| **AkarKita** | Landing page harus memunculkan memori keluarga — foto-foto warm tones, narasi tentang *silsilah* bukan *database*. DMN activation = user langsung teringat orang tua/kakek mereka. |
| **Atribuo** | Karakter visual harus benar-benar feel seperti *representasi diri* user, bukan generic avatar — ini yang memicu DMN dan membuat attachment kuat ke produk. |

---

## 6. Case Study 4: OFC & First Negative Impression (200ms)

**Penelitian:** Lateral OFC & Initial Negative Aesthetic Impression Formation.

**Metode:** fMRI saat partisipan pertama kali melihat gambar yang dinilai "tidak estetis".

### Temuan

```
Lateral OFC aktif kuat dalam 200ms PERTAMA saat melihat desain "jelek"

→ OFC lateral = "beauty rejection signal"
→ Begitu sinyal ini muncul, sangat sulit di-override oleh informasi
  selanjutnya (confirmation bias dalam estetika)

Timeline:
  0ms        → stimulus muncul
  <200ms     → OFC lateral fires jika desain dinilai negatif
  200-500ms  → Amygdala tag emotional response
  >500ms     → Sadar baru mulai memproses — sudah terlambat

"First impression bukan hanya pepatah — ini hardwired di OFC"
```

### Implikasi Kritis untuk Semua Produk Akordium

```
Above-the-fold = OFC Territory

Dalam 200ms pertama halaman dimuat, OFC user sudah membuat
keputusan tentang desain. Ini yang harus dioptimalkan:

✓ Hero section harus bekerja secara pre-attentive
✓ Color palette harus memberikan sinyal emosi yang benar
✓ Typography harus conveying trust/fun/professional sesuai produk
✓ Tidak boleh ada "visual debt" — elemen yang terasa tidak harmonis

Konten bisa sempurna, fitur bisa luar biasa —
tapi jika OFC sudah membuat penilaian negatif dalam 200ms,
user TIDAK AKAN membaca kontennya.
```

---

## 7. Case Study 5: Hierarchical Aesthetic Value Construction

**Penelitian:** Neural mechanisms underlying the hierarchical construction of perceived aesthetic value — fMRI + computational modeling, 2023.

**Metode:** fMRI dikombinasikan dengan computational models untuk memetakan bagaimana otak *menghitung* nilai estetika dari fitur-fitur visual.

### Temuan

```
Otak membangun aesthetic value secara HIERARKIS:

Layer 1 — Low-level features (V1/V2 cortex):
  → Warna, kontras, tepi, tekstur
  → Diproses secara otomatis, paralel

Layer 2 — Mid-level features (Parietal cortex):
  → Komposisi, simetri, balance, rhythm
  → Pattern recognition

Layer 3 — High-level integration (Lateral Prefrontal):
  → Meaning, context, coherence
  → "Apakah ini semua masuk akal bersama?"

Layer 4 — Final Value Signal (Medial Prefrontal Cortex / aMPFC):
  → Overall aesthetic judgment: "beautiful" atau "not"
  → Ini yang user rasakan sebagai intuisi estetika

Key finding: Kelemahan di Layer 1 tidak bisa dikompensasi Layer 3
→ Warna dan kontras buruk tidak bisa diselamatkan oleh "meaningful content"
```

### Design Review Checklist Berbasis fMRI Hierarchy

#### Layer 1 Check (V1/V2 - Low-level Features)
- [ ] Contrast ratio memenuhi minimum 4.5:1?
- [ ] Tidak ada color clashing yang menyiksa retina?
- [ ] Typography ukuran cukup untuk easy reading?

#### Layer 2 Check (Parietal - Mid-level Features)
- [ ] Layout memiliki visual rhythm yang konsisten?
- [ ] Ada simetri atau balance yang jelas?
- [ ] Whitespace terdistribusi harmonis?

#### Layer 3 Check (Lateral PFC - High-level Integration)
- [ ] Semua elemen "berbicara bahasa visual yang sama"?
- [ ] Tidak ada elemen yang kontradiksi tone keseluruhan?
- [ ] Icon style, photo style, illustration style konsisten?

#### Layer 4 Check (aMPFC - Final Value)
- [ ] 5-second test: apakah kesan pertama sesuai tujuan?
- [ ] Tunjukkan ke orang yang tidak kenal produk ini — apa kata pertama mereka?

---

## 8. Pre-Launch Neuroaesthetics Checklist

Berdasarkan semua studi fMRI di atas, berikut checklist yang bisa diaplikasikan langsung sebelum setiap produk launch:

### OFC / First Impression (200ms)
- [ ] Above-fold screenshot: apakah warna & layout harmonis?
- [ ] Tidak ada "visual debt" — elemen yang terasa janggal?
- [ ] Hero CTA terlihat jelas tanpa effort?

### Core Aesthetic Circuit (OFC + Insula)
- [ ] Konsistensi visual 100% — tidak ada style mismatch?
- [ ] Warna sesuai emotional target produk?
- [ ] Typography menciptakan gut feeling yang tepat?

### DMN Activation Potential
- [ ] Apakah konten hero berbicara tentang user, bukan produk?
- [ ] Ada visual atau copy yang memicu personal memory/aspiration?
- [ ] Identity resonance: user bisa bayangkan diri mereka di sini?

### Hierarchical Value Construction
- [ ] Layer 1: Contrast & warna ✓
- [ ] Layer 2: Komposisi & rhythm ✓
- [ ] Layer 3: Coherence visual language ✓
- [ ] Layer 4: 5-second test dengan orang baru ✓

---

## 9. Say-Do Gap: Bukti Neurologis

Ini adalah temuan meta yang paling penting dari semua studi fMRI:

### SWOT Analysis: fMRI vs Self-Report dalam UX

| Aspect | fMRI | Self-Report |
|--------|------|-------------|
| **Accuracy** | Mengukur respons NYATA otak, bukan opini | Dipengaruhi rationalization, social desirability |
| **Reliability** | Tidak bisa di-fake atau rasionalisasi | User bisa tidak jujur atau tidak aware |
| **Coverage** | Menangkap processing yang tidak sadar | Hanya mengakses conscious thought |

### fMRI Limitations

| Weakness | Impact |
|----------|--------|
| Sangat mahal | $500-2000/jam mesin |
| Artificial environment | User tidak scrolling natural |
| Small sample size | Karena cost tinggi |
| Low temporal resolution | Tidak secepat EEG |

### Praktis untuk Akordium

```
Tidak perlu fMRI sendiri →
  → Manfaatkan published findings sebagai design principles
  → Gunakan proxy yang murah: eye-tracking software,
    heatmap tools, 5-second tests — sebagai approximasi
```

---

## 10. Summary: Key Takeaways

### The 200ms Rule

> **Dalam 200ms pertama, OFC user sudah membuat penilaian tentang desain.**
>
> First impression bukan pepatah — ini hardwired di otak.

### Evidence Summary

| Finding | Implication | Application |
|---------|-------------|-------------|
| OFC aktif untuk high-reward stimulus | Tampilkan value secara visual | Hero section harus convey value instantly |
| Color > No Color untuk engagement | Tambahkan aksen warna strategis | Bahkan developer tools perlu color accent |
| DMN activation = personal resonance | Konten harus berbicara tentang user | Gunakan "you" language, personal relevance |
| Layer 1 weakness can't be compensated | Fix basics first | Color, contrast, typography sebelum "meaning" |

---

## Referensi Penelitian

1. [A Review of fMRI in UX Design (2021)](https://downloads.hindawi.com/journals/cin/2021/2070209.pdf)
2. [Neuroscience of Aesthetic Experience (PMC)](https://pmc.ncbi.nlm.nih.gov/articles/PMC8702354/)
3. [fMRI Methods in Design Research (PubMed)](https://pubmed.ncbi.nlm.nih.gov/34956344/)
4. [Lateral OFC & Negative Aesthetic Impression (PLoS ONE)](https://journals.plos.org/plosone/article?id=10.1371%2Fjournal.pone.0038152)
5. [Core Aesthetic Circuit Meta-analysis (PMC)](https://pmc.ncbi.nlm.nih.gov/articles/PMC8005853/)
6. [Website Color Neuroimaging Study (ScienceDirect)](https://www.sciencedirect.com/science/article/pii/S0747563224000359)
7. [The Brain on Art - DMN Study (Frontiers)](https://www.frontiersin.org/articles/10.3389/fnhum.2012.00066/pdf)
8. [DMN & Aesthetic Experience (PMC)](https://pmc.ncbi.nlm.nih.gov/articles/PMC3330757/)
9. [Hierarchical Aesthetic Value Construction (PMC)](https://pmc.ncbi.nlm.nih.gov/articles/PMC9873760/)

---

*Last Updated: 2026-03-03*
*Document Version: 1.0*
