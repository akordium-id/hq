# 📋 Manajemen Tugas (Project Management)

Di Akordium Lab, kita tidak menggunakan Trello, Jira, atau Asana. Kita menggunakan **GitHub Projects**.
Prinsipnya sederhana: **"If it’s not an Issue, it doesn’t exist."** (Jika tidak ada di Issue, pekerjaan itu dianggap tidak ada).

## 1. Struktur Board
Kita menggunakan satu Board utama di level organisasi dengan kolom status sebagai berikut:

| Kolom | Arti |
| :--- | :--- |
| **📋 Backlog** | Ide, keinginan, atau tugas masa depan yang belum prioritas minggu ini. |
| **todo** | Tugas yang **siap dikerjakan** sekarang/minggu ini. Semua detail sudah jelas. |
| **🚧 In Progress** | Sedang dikerjakan aktif. Maksimal 1-2 tugas per orang di sini (fokus!). |
| **👀 Review** | Tugas selesai dikerjakan, menunggu review (PR dibuka) atau pengecekan admin. |
| **✅ Done** | Tugas selesai sepenuhnya (Merged, Deployed, atau Disetujui). |

## 2. Cara Membuat Tugas (Issue)
Jangan hanya membuat kartu kosong. Setiap tugas (Issue) harus memiliki konteks.

1.  Masuk ke Repo yang sesuai (misal: `akordium/waqfwise` untuk app, atau `akordium/hq` untuk admin).
2.  Klik tab **Issues** -> **New Issue**.
3.  **Judul:** Jelas dan mengandung kata kerja (Contoh: *"Buat desain banner Instagram"* atau *"Fix bug tombol error"*).
4.  **Body/Isi:**
    * Deskripsi masalah/tugas.
    * *Acceptance Criteria* (Syarat tugas dianggap selesai).
    * Lampiran (Screenshot/Dokumen) jika ada.
5.  **Assignees:** Pilih diri sendiri atau orang yang dituju.
6.  **Projects:** (PENTING) Masukkan ke Project `Akordium Main Board` agar muncul di papan kanban.

## 3. Siklus Hidup Tugas
1.  **Ambil Tugas:** Pindahkan kartu dari `Todo` ke `In Progress`. Ini sinyal ke tim bahwa "Saya sedang mengerjakan ini".
2.  **Update:** Jika ada kendala, tulis di komentar Issue tersebut. Jangan diam saja.
3.  **Selesai:** Saat PR dibuat atau tugas admin selesai, pindahkan ke `Review`.
4.  **Tutup:** Setelah dicek, pindahkan ke `Done` dan tutup Issue-nya.

## 4. Labeling
Gunakan label untuk memudahkan filter:
* `bug`: Sesuatu yang rusak.
* `enhancement`: Fitur baru.
* `admin`: Tugas administratif.
* `high-priority`: Kerjakan segera.
