# [Nama Produk]

> Deskripsi singkat satu baris.

## 🔗 Quick Links
* **Live Site:** https://[namaproduk].com
* **Project Management:** [Link ke GitHub Project Board di Org Akordium]
* **Documentation:** [Link ke folder produk di akordium-hq]
* **Staging:** https://dev.[namaproduk].com

## 🛠 Tech Stack
* **Framework:** Laravel / Next.js / Go
* **Database:** Postgres
* **Infra:** Coolify

## 💻 Local Development Setup
1. Clone repo.
2. `cp .env.example .env`
3. `docker-compose up -d` (jika pakai docker)
4. `npm install` / `composer install` / `go mod tidy`
5. `npm run dev`

## 🧪 Testing
Run test suite: `php artisan test` atau `go test ./...`

## 🚢 Deployment
Deploy otomatis via **Coolify** saat push ke branch `main`.
