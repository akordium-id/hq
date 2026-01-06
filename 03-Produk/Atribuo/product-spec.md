# ⚔️ Atribuo (Atribuo.com)

**Tagline:** Visualisasikan Statistik Karakter & Skillmu.
**Status:** 🥚 Concept / Prototyping
**Repo Code:** `github.com/akordium/atribuo` (Private)

## 1. Visi Produk
Platform *gamification* untuk kehidupan nyata (Real Life RPG). User bisa membuat profil karakter, menilai skill mereka (misal: Coding: 80, Cooking: 40), dan menampilkannya dalam bentuk diagram radar/chart yang menarik (seperti game RPG/FIFA).

**Target Market:** Hybrid (Gamers + Young Professionals)

- **Primary:** Gen Z Gamers (16-25 tahun) - viral potential di TikTok/Instagram
- **Secondary:** Young Professionals (25-35 tahun) - portfolio & career advancement
- **Focus:** Indonesia market dengan global expansion potential

## 2. Tech Stack Strategy
* **Backend:** Go (Golang).
* **Alasan:** Membutuhkan performa tinggi untuk kalkulasi statistik real-time jika user base membesar, dan sebagai portofolio skill Go Akordium Lab.
* **Frontend:** Next.js (React).
* **Infra:** Coolify @ Oracle Cloud.

## 3. Fitur Utama (MVP)

### Phase 1: Foundation (MVP - Bulan 1-3)

**Must-Have Features:**

1.  **Character Sheet Generator**
    - Input nama, job class, dan atribut dasar
    - Hexagon/Radar chart visualization (Recharts.js)
    - Skill categories & levels (1-10 scale)
    - Basic avatar customization

2.  **Social Sharing & Viral Loop**
    - Halaman publik yang bisa di-share ke medsos (Linktree alternative)
    - Social media sharing (Twitter, Instagram, LinkedIn)
    - Embed widget untuk blog/portfolio (iframe)
    - Image export (PNG/JPEG untuk sharing)

3.  **Gamification Mechanics**
    - XP system & level up logic
    - Achievement badges (50+ initial badges)
    - Progress tracking dashboard
    - Daily habits gamification

4.  **Mobile-First Experience**
    - Responsive design (Tailwind mobile-first)
    - PWA configuration dengan offline support
    - Touch-optimized UI gestures
    - Cross-device data sync (WebSocket + API polling)

## 4. Roadmap

### Phase 0: Product Validation (Minggu 1-4)
**Goal:** Validate market demand, technical feasibility, dan monetization potential sebelum development penuh.

**Validation Activities:**
- Market sizing research (Gen Z gamers + young professionals)
- Competitive analysis (skill visualization platforms)
- Technical feasibility PoC (Go + Next.js performance benchmarks)
- User behavior research (engagement patterns)
- Pricing sensitivity research (freemium model)

**Go/No-Go Decision:** End of Week 4 - jika validation positive, lanjut ke Phase 1

### Phase 1: Foundation (MVP - Bulan 1-3)
**Goal:** Launch MVP dengan 4 core features

**Deliverables:**
- Character Sheet Generator dengan hexagon charts
- Social Sharing & Viral Loop features
- Gamification Mechanics (XP, badges, progress)
- Mobile-First Experience dengan cross-device sync

### Phase 2: Growth & Social (Bulan 4-6)
**Goal:** Community building dan social features

**Features:**
- User discovery & following system
- Skill leaderboards
- Community challenges
- Comparison tools

### Phase 3: Advanced Features (Bulan 7-9)
**Goal:** Premium features launch

**Features:**
- Advanced analytics & insights
- Custom templates & branding
- Mobile applications (iOS + Android)
- API developer access

### Phase 4: Ecosystem Expansion (Bulan 10-12)
**Goal:** Market leadership & global expansion

**Features:**
- Educational integrations
- Business solutions (B2B)
- AI-powered insights
- Multi-language support
