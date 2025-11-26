# 🕌 WaqfWise (WaqfWise.com)

**Tagline:** Sistem Manajemen Wakaf Terpercaya & Transparan.
**Status:** 🚧 In Development
**Repo Code:** `github.com/akordium/waqfwise` (Private)

## 1. Visi Produk
Menyediakan platform SaaS bagi lembaga Nazhir (pengelola wakaf) untuk mencatat aset, pelaporan donatur (Wakif), dan penyaluran manfaat (Mauquf 'Alaih) secara transparan dan akuntabel.

## 2. Tech Stack Strategy
* **Stack:** TALL Stack (Tailwind, Alpine.js, Laravel, Livewire).
* **Alasan:** Aplikasi ini bersifat administratif (dashboard-heavy). Livewire memungkinkan pengembangan fitur CRUD kompleks jauh lebih cepat daripada memisahkan React Frontend. Server-side rendering juga lebih aman untuk logika bisnis sensitif.
* **Infra:** Coolify @ Oracle Cloud.

## 3. Fitur Utama (MVP)
1.  **Manajemen Aset Wakaf:** Database tanah, bangunan, uang, atau saham wakaf.
2.  **CRM Wakif:** Database donatur dan riwayat donasi mereka.
3.  **Laporan Keuangan:** Neraca sederhana dan laporan arus kas wakaf.
4.  **Sertifikat Wakaf Digital:** Generate PDF otomatis untuk Wakif setelah donasi.

## 4. Target Pasar
* Lembaga Nazhir perorangan / Masjid.
* Yayasan Islam skala kecil-menengah.

## 5. Notes
* *Compliance:* Harus mengikuti standar akuntansi wakaf (PSAK) sebisa mungkin.
* *UI:* Fokus pada kemudahan input data (Data Entry), gunakan tabel yang responsif.
