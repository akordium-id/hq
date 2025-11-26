# 🛠 Setup Akses & Tools

Dokumen ini berisi daftar akun dan aplikasi yang wajib Anda siapkan untuk mulai bekerja di Akordium Lab.

⚠️ **PENTING:** Jangan pernah menyimpan password atau kredensial sensitif (API Key, Secret Key) di dalam file teks atau chat. Gunakan Password Manager yang disetujui.

## 1. Wajib Untuk Semua Role (All Roles)

Mohon selesaikan langkah ini di Hari ke-1:

### A. Akun GitHub
Akordium Lab menggunakan GitHub untuk hampir segalanya (Manajemen Proyek, Kode, SOP).
* [ ] Pastikan Anda memiliki akun [GitHub](https://github.com).
* [ ] Setorkan *username* GitHub Anda kepada *Owner* untuk diundang ke Organization `akordium-hq`.
* [ ] Aktifkan **2FA (Two-Factor Authentication)** di akun GitHub Anda demi keamanan.

### B. Komunikasi & Admin
* [ ] **Email:** Anda akan diberikan akses email domain `@akordium.id` (jika berlaku untuk posisi Anda). Setup di mail client favorit Anda.
* [ ] **WhatsApp/Telegram:** Pastikan nomor Anda sudah terhubung dengan Owner untuk komunikasi *urgent*.

---

## 2. Khusus Tim Teknis (Developer) 💻

Sebagai Engineer di Akordium, *stack* kita cukup modern. Siapkan *environment* lokal Anda:

### A. Code Editor (Wajib)
Kita menggunakan **Cursor** (fork dari VS Code) untuk memaksimalkan AI.
* [ ] Download & Install [Cursor](https://cursor.sh).
* [ ] (Opsional) Install ekstensi **GitHub Copilot** jika Anda memiliki lisensinya, atau gunakan fitur AI bawaan Cursor.

### B. Git Configuration
Pastikan identitas Git Anda sesuai dengan email kerja:
```bash
git config --global user.name "Nama Anda"
git config --global user.email "nama@akordium.id"
````

### C. Runtime & Tools Dasar

Sesuaikan dengan proyek yang akan Anda pegang, namun umumnya kita butuh:

  * [ ] **Docker Desktop / OrbStack:** Untuk menjalankan database lokal (Postgres) tanpa mengotori OS.
  * [ ] **Bahasa Pemrograman:**
      * Go (versi terbaru)
      * Node.js (versi LTS) & npm/pnpm/bun
      * PHP & Composer (jika menangani proyek Laravel seperti *WaqfWise*)
  * [ ] **Database Client:** Rekomendasi: TablePlus, DBeaver, atau ekstensi Database di Cursor.

### D. Akses Server (Jika Diperlukan)

  * [ ] Generate SSH Key di laptop Anda (`ssh-keygen -t ed25519`).
  * [ ] Kirim **Public Key** (`.pub`) Anda ke Owner untuk ditambahkan ke server Oracle Cloud / Coolify.
  * [ ] Minta akses ke dashboard **Coolify** untuk melihat status deployment.

-----

## 3\. Khusus Tim Non-Teknis (Admin/Marketing) 📝

Anda tidak perlu menginstal coding tools. Fokus Anda adalah manajemen konten dan operasional.

### A. Browser Setup

  * [ ] Gunakan browser modern (Chrome/Edge/Arc).
  * [ ] Bookmark repositori utama: `github.com/akordium/akordium-hq`.

### B. Menulis Dokumen

  * [ ] Pelajari **Markdown** dasar. Anda akan sering menulis dokumen menggunakan format ini.
      * *Tips: Di halaman GitHub mana saja, tekan tombol `.` (titik) di keyboard untuk masuk ke mode tulis yang nyaman.*
  * [ ] (Opsional) Install [Obsidian](https://obsidian.md) jika Anda lebih suka menulis draft di aplikasi desktop sebelum di-upload ke GitHub.

### C. Akses Media Sosial (Marketing)

  * [ ] Minta akses delegasi ke akun Instagram `@akordium.id` dan aset digital lainnya.
  * [ ] Akses ke folder aset desain (Logo, Brand Kit) yang ada di `akordium-hq/04-Marketing-Brand`.

-----

**🎉 Jika semua checklist di atas sudah tercentang, Anda siap menerima tugas pertama\!**
Silakan menuju tab **Projects** di GitHub untuk melihat *board* pekerjaan Anda.
