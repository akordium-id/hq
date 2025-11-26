# ⚔️ Atribuo (Atribuo.com)

**Tagline:** Visualisasikan Statistik Karakter & Skillmu.
**Status:** 🥚 Concept / Prototyping
**Repo Code:** `github.com/akordium/atribuo` (Private)

## 1. Visi Produk
Platform *gamification* untuk kehidupan nyata (Real Life RPG). User bisa membuat profil karakter, menilai skill mereka (misal: Coding: 80, Cooking: 40), dan menampilkannya dalam bentuk diagram radar/chart yang menarik (seperti game RPG/FIFA).

## 2. Tech Stack Strategy
* **Backend:** Go (Golang).
* **Alasan:** Membutuhkan performa tinggi untuk kalkulasi statistik real-time jika user base membesar, dan sebagai portofolio skill Go Akordium Lab.
* **Frontend:** Next.js (React).
* **Infra:** Coolify @ Oracle Cloud.

## 3. Fitur Utama (MVP)
1.  **Character Builder:** Input nama, job class, dan atribut dasar.
2.  **Hexagon/Radar Chart:** Visualisasi skill menggunakan library charting (mis: Recharts/Chart.js).
3.  **Shareable Profile:** Halaman publik yang bisa di-share ke medsos (Linktree alternative).
4.  **Embed Widget:** Widget iframe untuk dipasang di blog/portfolio user.

## 4. Roadmap
* **Phase 1:** Generator statis (User input -> Jadi Gambar).
* **Phase 2:** Social features (Compare stats dengan teman).
* **Phase 3:** API untuk developer lain integrasi data skill.
