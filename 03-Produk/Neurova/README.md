# Neurova.id - Cognitive Performance & Brain Wellness Platform

**Status:** 🥚 Concept
**Tanggal Ide:** 2026-03-02
**Prioritas:** High

## 1. Elevator Pitch

**Tagline:** *"Train your brain like an athlete trains your body."*

Platform optimasi performa kognitif berbasis neurosains untuk knowledge workers, pelajar, dan profesional Indonesia menjadi lebih tajam, lebih fokus, dan lebih tahan burnout. Ini adalah *performance tool*, bukan *wellness tool* biasa. Analoginya: Strava untuk otak.

## 2. Masalah & Solusi

### Problem
- Knowledge workers dan profesional Indonesia sering mengalami burnout, decision fatigue, dan penurunan performa kognitif
- Aplikasi meditasi dan mental health yang ada bersifat *reactive* (fokus ke terapi penyakit), bukan *proactive* (optimasi performa)
- Tidak ada platform Indonesia yang menggunakan evidence-based neuroscience untuk cognitive performance optimization

### Solution
Neurova adalah platform **optimasi performa kognitif berbasis neurosains** dengan foundation scientific yang kuat:
- **Chronobiology**: Deteksi chronotype untuk jadwal deep work otomatis
- **Ultradian Rhythm**: Smart focus timer 90 menit kerja, 20 menit recovery
- **Flow State Theory**: Challenge-skill matcher agar user selalu di zona flow
- **Neuroplasticity**: Adaptive cognitive training yang evidence-based
- **Dopamine Architecture**: Reward timing optimal untuk motivasi jangka panjang

## 3. Target Audience

### Primary
- **10 juta+ knowledge workers** Indonesia (IT, finance, marketing, consulting)
- **8 juta+ mahasiswa** universitas (study optimization)

### Secondary (B2B)
- Perusahaan tech/startup yang peduli employee productivity & retention
- HR departments yang mencari solusi burnout prevention

## 4. Rencana Teknis (Tech Stack Draft)

```
Backend:    Go + Fiber (high-performance API, real-time scoring)
Frontend:   SvelteKit Web + Flutter Mobile (offline-first)
Database:   PostgreSQL + Redis (caching cognitive scores & sessions)
ML Engine:  Python (FastAPI) - cognitive pattern analysis & prediction
Queue:      RabbitMQ - async assessment processing
Auth:       SSO via Akordium.id (integrasi ekosistem)
Infra:      Hetzner VPS + Cloudflare CDN
```

## 5. Model Bisnis (Monetization)

### B2C (Individual)
- **Free**: Brain profiling + 5 sesi training/minggu
- **Premium**: Rp 79k/bulan - unlimited training + Focus Optimizer + Sleep module + weekly report
- **Annual**: Rp 699k/tahun (~hemat 2 bulan)

### B2B (Corporate)
- **Starter**: Rp 50k/karyawan/bulan (min 20 orang)
- **Growth**: Rp 40k/karyawan/bulan (min 50 orang) + HR analytics dashboard
- **Enterprise**: Custom pricing + white-label + onsite training session
- **Workshop**: Rp 5-15 juta/sesi corporate training

## 6. Core Features

### Brain Profiling Engine
- Asesmen kognitif: working memory, focus span, processing speed, cognitive flexibility
- Chronotype detection via questionnaire + behavioral pattern
- Output: **"Brain Score"** - baseline yang bisa dibandingkan, divisualisasikan, dan ditingkatkan
- *Viral mechanic*: "Skor Otak Kamu Berapa? Share ke Instagram!"

### Focus Optimizer
- **Smart Ultradian Timer**: 90-menit deep work + 20-menit recovery
- **Chronotype-aware Scheduler**: Rekomendasi deep work sesuai peak performance time
- **Decision Fatigue Alert**: Hindari keputusan penting saat otak lelah
- **Cognitive Load Heatmap**: Visualisasi kapasitas otak dalam sehari

### Cognitive Training Engine
- 15 menit/hari, adaptive difficulty (tetap di zona flow)
- Latihan: N-Back (working memory), Stroop Task (inhibitory control), Task Switching (cognitive flexibility)
- Progress tracking dengan metrik nyata

### Neuro-Journal
- Check-in harian 30 detik: mood, energi, kualitas tidur
- Pattern recognition otomatis
- Weekly **Cognitive Performance Report** dengan insight neurosains

### Sleep-Brain Module
- Sync dengan Apple Health / Google Fit / Samsung Health
- Sleep debt calculator dengan dampak ke decision-making quality
- Performance predictor berdasarkan kualitas tidur

### Corporate Module (B2B)
- Team cognitive health dashboard (anonymized, GDPR-compliant)
- **Meeting Optimizer**: Jadwalkan rapat di window kognitif rendah
- Burnout early warning system berbasis pola behavioral

## 7. Competitive Edge

1. **Science-backed, bukan brain games** - Mayoritas "brain training" app terbukti tidak efektif; Neurova pakai protokol klinis tervalidasi
2. **Tanpa hardware mahal** - Tidak butuh EEG; behavioral proxy data sudah cukup untuk MVP
3. **Indonesia-first** - Konten Bahasa Indonesia, konteks lokal: produktivitas saat Ramadan, kerja hybrid, budaya rapat panjang
4. **B2B2C flywheel** - Perusahaan bayar → karyawan pakai → mereka subscribe B2C personal
5. **Kredibilitas akademis** - Potential research collaboration dengan departemen psikologi/neurosains
6. **Neuroscience-driven UX** - Menggunakan [7 Prinsip Neuroscience](../_templates/neuroscience-design-guide.md) untuk engagement yang etis dan efektif:
   - **Variable Reward:** Brain Score yang berubah sesuai performa
   - **Habit Loop:** Daily training streak dengan visual progress
   - **Loss Aversion:** *"Streak 7 harimu akan putus!"*
   - **Endowment Effect:** Identity Badge "Brain Athlete Level X"

## 8. Integrasi Ekosistem Akordium

- **Atribuo.com** → Engine data untuk stat "Intelligence" & "Focus" di character sheet RPG
- **Anggarin.com** → Alert: *"Cognitive performance rendah - hindari keputusan finansial besar hari ini"*
- **Classnetic.com** → Modul "Student Cognitive Performance" untuk guru dan orang tua
- **Akordium.id Dashboard** → Flagship premium product yang menarik user high-value

## 9. Posisi dalam Priority Matrix Akordium

| Dimensi | Nilai |
|---------|-------|
| **Development Time** | 4-6 bulan MVP |
| **Market Readiness** | ⭐⭐⭐⭐ (demand ada, awareness perlu dibangun) |
| **Revenue Potential** | ⭐⭐⭐⭐⭐ (B2B LTV sangat tinggi) |
| **Viral Coefficient** | ⭐⭐⭐⭐⭐ (Brain Score sharing mechanic) |
| **Strategic Synergy** | ⭐⭐⭐⭐⭐ (integrasi seluruh ekosistem) |
| **Defensibility** | ⭐⭐⭐⭐⭐ (data moat + academic credibility) |

## 10. Roadmap MVP (12 Bulan)

### Phase 1 (Bulan 1-3)
- Brain Profiling + 20 cognitive exercises + Basic Focus Timer
- MVP launch ke komunitas startup & mahasiswa

### Phase 2 (Bulan 4-6)
- Neuro-Journal + Sleep Module + Chronotype Scheduler
- MVP B2B dashboard

### Phase 3 (Bulan 7-12)
- ML pattern engine + Flutter mobile
- Full B2B corporate module + wearable integration

## 11. Go-To-Market Strategy

### B2C
- **Lead magnet viral**: Free "Brain Score Assessment" - shareable ke Instagram/TikTok
- Content: TikTok/YouTube series *"Neuroscience untuk Produktivitas"*
- Partnership: productivity influencer Indonesia (Fellexandro Ruby, Sepositif, dll)

### B2B
- Direct pitch ke startup/tech company Surabaya & Jakarta
- Free "Team Brain Health Assessment" sebagai door opener
- Conference speaking: HR Tech, startup events, campus productivity workshop
- Academic partnership dengan program Psikologi Airlangga

---

## Market Analysis

Pasar mental health Indonesia bernilai **$45 juta USD** dan tumbuh post-pandemi.

**Competitive Landscape:**
- Riliv, Bicarakan.id, Halodoc → fokus pada **terapi penyakit** (reactive)
- **Neurova** → fokus pada **optimasi performa** (proactive)

Ini adalah **Blue Ocean** di Indonesia.

---
*Keputusan: [GO / NO GO]?*
