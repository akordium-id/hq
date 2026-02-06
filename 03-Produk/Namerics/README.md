# 🎯 Namerics: Si Dukun Nama Digital

> AI-Powered Social Identity Generator dengan Kearifan Lokal 🇮🇩

## 🏷️ Product Identity

- **Nama Produk:** Namerics
- **Tagline:** "Dukun Nama Digital & Social Identity Generator"
- **Status:** 📋 Development Phase (Pivot Strategy 2.0)
- **Live Site:** https://namerics.com (Coming Soon)
- **Repo Code:** `github.com/akordium/namerics-fe` (Remix Version)

## 🔮 Visi Baru: "Smart Aggregator"

Namerics bukan sekadar "Name Generator" biasa. Kita adalah **Konsultan Branding Digital** untuk UMKM, Kreator, dan Gamer Indonesia. Kita mengisi celah yang ditinggalkan pemain global (seperti Namelix) yang terlalu kaku dan tidak paham konteks lokal.

**Filosofi:** "Jalur Tengah" (Pareto Principle).
- **80% Value:** Ide kreatif yang "membumi" dan relevan.
- **20% Effort:** Validasi domain otomatis & deep-linking ke medsos (tanpa scraping berat).

## 🌶️ Fitur Unggulan "Kearifan Lokal"

1.  **The "Lokal Vibe" Selector**
    Alih-alih "Modern" atau "Classic", user memilih "Rasa" yang relate:
    -   👔 **UMKM Berkah:** (e.g., *SumberRejeki, MakmurJaya*)
    -   ☕ **Indie Senopati:** (e.g., *KopiKala, RuangTemu*)
    -   😎 **Gaul & Santuy:** (e.g., *JajanKuy, SobatRebahan*)
    -   🌶️ **Juragan Lokal:** (e.g., *OmahDahar, CakTech*)

2.  **Smart Aggregator & Deep Linking**
    -   **Domain Check:** Langsung cek ketersediaan domain `.com`, `.id`, `.my.id` (via API GoDaddy/Namecheap/Exabytes).
    -   **Social Check Shortcut:** Tombol pintar untuk cek manual instan:
        -   [IG Icon] -> Buka `instagram.com/username` (Biarkan user lihat sendiri).
        -   [TikTok Icon] -> Buka `tiktok.com/@username`.
    -   *Keuntungan:* Bebas maintenance API medsos yang mahal & ribet.

3.  **Profile Page (The Retainer)**
    -   User bisa "mengunci" nama mereka di `namerics.com/username`.
    -   Berfungsi sebagai kartu nama digital sederhana.

## 💰 Monetisasi (Lean Strategy)

1.  **Affiliate Marketing (Main Engine):**
    -   Komisi dari penjualan domain (Niagahoster, Exabytes, Dewaweb).
    -   Fokus dorong domain murah meriah (`.my.id`, `.sch.id`) untuk volume.
2.  **Freemium Model:**
    -   **Free:** Generate nama basic.
    -   **Premium (Sawer Dukun):** Akses ke "Mantra Khusus" (Prompt AI yang lebih canggih/spesifik) & Custom Profile Page.

## 🛠 Tech Stack (Final Decision)

Kita menggunakan stack yang *lean*, SEO-friendly, dan cepat untuk deploy.

### Frontend & Backend (Monorepo)
-   **Framework:** RemixJS (React Router v7 ready)
-   **Runtime:** Cloudflare Pages (Serverless/Edge)
-   **Styling:** Tailwind CSS (Mobile First)
-   **State:** React Server Actions (No complex client state needed)
-   **AI Engine:** OpenAI GPT-4o / Claude 3.5 Sonnet (via Server Side Action)

### Infrastructure
-   **Hosting:** Cloudflare Pages
-   **Database (Future):** Cloudflare D1 (Jika butuh simpan user profile)
-   **Analytics:** Cloudflare Web Analytics

## 🗺️ Roadmap: "From Sabang to Global"

### Phase 1: Jago Kandang (Indonesia) 🇮🇩
-   Fokus: UMKM, Gamer Lokal, Content Creator Pemula.
-   Goal: Menjadi top-of-mind generator nama yang "ngerti bahasa kita".
-   Keyword SEO: "Nama olshop aesthetic", "Nama channel gaming hoki".

### Phase 2: Tetangga Serumpun (Regional) 🌏
-   Ekspansi ke Malaysia & Brunei.
-   Tweak prompt untuk menyesuaikan dialek Melayu ("Kedai", "Empire").

### Phase 3: Global Niche 🌐
-   Serang niche spesifik global (e.g., "Anime Username", "K-Pop Fan Account").

---

**Maintainer:** Najib Zain (Lead Shaman/Developer)
**Last Updated:** 2026-02-06
