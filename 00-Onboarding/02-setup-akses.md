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
