# 🎯 Namerics: Si Dukun Nama Digital

> AI-Powered Social Identity Generator dengan Kearifan Lokal 🇮🇩

## 🏷️ Product Identity

- **Nama Produk:** Namerics
- **Tagline:** "Dukun Nama Digital & Social Identity Generator"
- **Status:** 🚧 In Development (Pivot Strategy 2.0)
- **Repo Code:** `github.com/akordium/namerics-fe`
- **Live Site:** https://namerics.com (Coming Soon)
- **Staging:** https://staging.namerics.com (Coming Soon)

## 📋 Quick Overview

**Deskripsi Singkat:**
Platform generator nama bisnis dan username media sosial yang dirancang khusus untuk pasar Indonesia. Namerics menggunakan AI untuk menghasilkan nama yang "membumi", unik, dan sesuai dengan "vibe" lokal (seperti UMKM, Indie, atau Gaul), serta menyediakan pengecekan ketersediaan domain dan media sosial secara cerdas.

**Target Market:**
- **Primary:** UMKM & Pedagang Online (Butuh nama toko yang hoki).
- **Secondary:** Content Creator & Gamer (Butuh username unik & tersedia).
- **Tertiary:** Digital Agency (Butuh ide branding cepat untuk klien).

**Problem yang Diselesaikan:**
- Generator nama global (seperti Namelix) tidak paham konteks bahasa & budaya Indonesia.
- Mengecek ketersediaan username di banyak platform secara manual itu melelahkan.
- Kebanyakan generator hanya memberikan ide, tanpa mengarahkan ke eksekusi (beli domain/buat akun).

## 🌶️ Fitur Utama (The "Dukun" Features)

1.  **Lokal Vibe Selector (AI Prompting)**
    -   **👔 UMKM Berkah:** Nama yang membawa doa dan rejeki (*Sumber, Jaya, Makmur, Abadi*).
    -   **☕ Indie Senopati:** Nama estetik, campuran Inggris-Indo, minimalis (*Kala, Ruang, Cerita, .jkt*).
    -   **😎 Gaul & Santuy:** Nama slang, singkatan, asik (*Kuy, Sobat, Hype, .id*).
    -   **🌶️ Juragan Lokal:** Sentuhan bahasa daerah yang kuat (*Omah, Cak, Juragan, Warung*).

2.  **Smart Aggregator & Deep Linking**
    -   **Domain Check:** Integrasi API untuk cek ketersediaan `.com`, `.id`, `.my.id` secara real-time.
    -   **Social Shortcut:** Tombol "Deep Link" yang membuka halaman profil medsos secara langsung (`instagram.com/user`) untuk validasi manual yang akurat tanpa API yang mahal.

3.  **Profile Page (Retainer)**
    -   Landing page sederhana di `namerics.com/username` untuk mengklaim identitas digital sementara sebelum punya website sendiri.

## 🛠 Tech Stack

### Frontend & Backend (Monorepo)
-   **Framework:** Remix v2 (Future v3 Ready)
-   **Language:** TypeScript
-   **Styling:** Tailwind CSS (Mobile First)
-   **AI Engine:** OpenAI GPT-4o / Claude 3.5 Sonnet (via Server Side Action)

### Infrastructure
-   **Hosting:** Cloudflare Pages
-   **Deployment:** GitHub Actions -> Cloudflare Pages (Direct Integration)
-   **Analytics:** Cloudflare Web Analytics
-   **Domain:** Cloudflare DNS

### Third-party Services
-   **AI:** OpenAI API
-   **Domain Check:** GoDaddy / Namecheap / Exabytes API
-   **Affiliate Network:** Niagahoster / Accesstra.de (untuk monetisasi)

## 💻 Local Development Setup

### Prerequisites
- [ ] Node.js 20+ (LTS)
- [ ] npm / pnpm / yarn
- [ ] Akun Cloudflare (untuk deploy)
- [ ] OpenAI API Key

### Installation Steps

1.  **Clone repository**
    ```bash
    git clone https://github.com/akordium/namerics-fe.git
    cd namerics-fe
    ```

2.  **Install dependencies**
    ```bash
    npm install
    ```

3.  **Environment setup**
    ```bash
    cp .env.example .env
    # Isi OPENAI_API_KEY dan variable lain
    ```

4.  **Start development server**
    ```bash
    npm run dev
    # Aplikasi jalan di http://localhost:5173
    ```

## 🧪 Testing Strategy

-   **Unit Tests:** Vitest untuk logic generator & prompt formatting.
-   **E2E Tests:** Playwright untuk flow user (Input -> Generate -> Click Social Link).
-   **Manual Testing:** Validasi "Vibe" hasil generate secara berkala.

## 🚢 Deployment Process

**Cloudflare Pages (Git Integration)**
-   Push ke `main` -> Deploy ke Production (`namerics.com`)
-   Push ke branch lain -> Deploy ke Preview URL (`<branch>.namerics.pages.dev`)

## 💰 Monetisasi & Metrics

### Business Metrics (Target)
-   **Click-Through Rate (CTR) Affiliate:** Target 5% user klik tombol "Beli Domain".
-   **User Retention:** 20% user kembali untuk generate nama proyek lain.

### Revenue Stream
1.  **Affiliate Domain:** Komisi penjualan domain & hosting.
2.  **Premium Prompt:** Bayar sekali putus untuk akses prompt "Spesifik Industri" (misal: Prompt Khusus Nama Startup Fintech).

## 📈 Roadmap (Milestones)

### Phase 1: MVP "Jago Kandang" (Minggu 1-4)
-   [ ] Setup Remix + Tailwind + Cloudflare Pages.
-   [ ] Integrasi OpenAI API dengan Prompt "Lokal Vibe".
-   [ ] UI Input Sederhana (Keyword + Vibe Selector).
-   [ ] Deep Link Button ke Instagram & TikTok.

### Phase 2: Domain Cuan (Minggu 5-8)
-   [ ] Integrasi API Cek Domain (.com, .id, .my.id).
-   [ ] Daftar Program Afiliasi Domain Lokal.
-   [ ] Pasang Link Afiliasi di UI.

### Phase 3: Profile Page (Bulan 3)
-   [ ] Fitur "Claim This Name" (Page generator sederhana).
-   [ ] Simple Dashboard untuk user manage link mereka.

## 🤝 Team (One Man Army)

-   **Lead Developer / Shaman:** Najib Zain
-   **Role:** Fullstack Dev, Prompt Engineer, Growth Hacker.

---

**Last Updated:** 2026-02-06
**Version:** 0.2.0-dukun-strategy
**Maintainer:** Najib Zain
