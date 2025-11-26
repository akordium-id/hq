# 🚀 Coolify Deployment Guide

Akordium Lab menggunakan **Coolify** sebagai PaaS internal (alternatif Vercel/Heroku). Ini memungkinkan kita deploy aplikasi Laravel, Go, dan Next.js hanya dengan `git push`.

## 1. Akses Dashboard
* **URL:** `http://panel.akordium.id:8000` (atau domain yang sudah diset)
* **Login:** Gunakan kredensial Admin yang tersimpan di Password Manager.

## 2. Cara Deploy Aplikasi Baru

### A. Hubungkan Source
1.  Di Coolify, buat **New Resource** -> **Application** -> **Private Repository (GitHub App)**.
2.  Pilih Repo (misal: `akordium/waqfwise`) dan Branch (`main`).

### B. Konfigurasi Build Pack
Coolify cukup pintar mendeteksi bahasa, tapi berikut standar kita:

* **Laravel:** Gunakan Build Pack **Nixpacks**.
    * *Start Command:* `php artisan serve --host=0.0.0.0 --port=$PORT` (atau pakai `octane` jika high performance).
    * *Pre-deployment:* `php artisan migrate --force`.
* **Next.js / Nuxt:** Gunakan Build Pack **Nixpacks** atau **Docker**.
    * Pastikan script `build` dan `start` ada di `package.json`.
* **Go (Golang):** Gunakan **Dockerfiile** statis (lihat folder root project Go kita) untuk hasil image terkecil (multi-stage build).

### C. Environment Variables (Sangat Penting!)
Jangan pernah hardcode *secrets* di kodingan. Masukkan di tab **Environment Variables** di Coolify:
* `DATABASE_URL`
* `APP_KEY`
* `NEXT_PUBLIC_API_URL`
* dll.

### D. Domain Mapping
Di tab **Settings**, set domain:
* `https://waqfwise.com` (Production)
* `https://dev.waqfwise.com` (Staging - opsional)
* Jangan lupa atur **DNS A Record** di provider domain (Cloudflare) ke IP Public Server Oracle.

## 3. Database Management
Kita menggunakan Database Postgres yang diprovisioning oleh Coolify.
* **Akses Internal:** Aplikasi dalam satu server Coolify bisa saling bicara menggunakan *Internal Hostname* (misal: `postgres-uuid:5432`). Gunakan ini untuk latency 0ms.
* **Akses Eksternal:** Jika ingin mengakses DB dari laptop (TablePlus), aktifkan fitur **"Make Public"** sementara di Coolify, lalu matikan lagi setelah selesai.

## 4. Backups
Coolify sudah diset untuk backup database harian ke **S3 Storage** (Cloudflare R2 / AWS S3).
* **Lokasi Backup:** Cek menu "Scheduled Backups" di service Database.
* **Restore:** Download file `.dump` dari S3 dan restore manual jika terjadi bencana.
