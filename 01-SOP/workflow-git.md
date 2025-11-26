# 🔀 Workflow Git & GitHub

Di Akordium Lab, Git bukan hanya alat untuk kode, tapi juga "mesin waktu" perusahaan. Kita menggunakan **Feature Branch Workflow** yang disederhanakan.

## 1. Golden Rules
1.  **Main/Master is Sacred:** Branch `main` harus selalu dalam kondisi siap *deploy*. Jangan pernah *push* langsung ke `main` kecuali untuk perbaikan *typo* super kecil.
2.  **One Feature, One Branch:** Jangan mencampur perbaikan bug A dengan fitur baru B dalam satu branch.
3.  **Atomic Commits:** Lakukan commit sesering mungkin untuk perubahan kecil, jangan menumpuk pekerjaan satu minggu dalam satu commit.

## 2. Standar Penamaan Branch
Gunakan format: `tipe/nama-deskriptif-singkat`

* **Fitur baru:** `feat/login-page`, `feat/integrasi-midtrans`
* **Perbaikan Bug:** `fix/header-mobile`, `fix/typo-landing-page`
* **Dokumentasi:** `docs/update-sop`, `docs/readme-waffwise`
* **Refactor/Chores:** `chore/update-dependencies`, `refactor/clean-code`

## 3. Pesan Commit (Commit Messages)
Kita mengadopsi gaya *Conventional Commits* agar sejarah perubahan mudah dibaca manusia (dan AI).

**Format:** `tipe: deskripsi singkat apa yang dilakukan`

**Contoh:**
* ✅ `feat: add whatsapp floating button on homepage`
* ✅ `fix: resolve login error on safari browser`
* ✅ `docs: update onboarding guide for new staff`
* ❌ `update code` (Terlalu umum)
* ❌ `fix` (Memperbaiki apa?)

## 4. Siklus Kerja (The Flow)

### Langkah 1: Sync & Branch
Sebelum mulai, pastikan repo lokal Anda *up-to-date*:
```bash
git checkout main
git pull origin main
git checkout -b feat/nama-fitur-anda
````

### Langkah 2: Work & Commit

Lakukan pekerjaan Anda. Gunakan Cursor/Copilot untuk membantu koding.

```bash
git add .
git commit -m "feat: setup basic layout for dashboard"
```

### Langkah 3: Push & Pull Request (PR)

Upload branch Anda ke GitHub:

```bash
git push origin feat/nama-fitur-anda
```

Kemudian buka GitHub dan buat **Pull Request (PR)**.

* **Judul PR:** Samakan dengan fitur.
* **Deskripsi:** Jelaskan apa yang berubah. Jika terkait dengan Issue tertentu, tulis `Closes #NomorIssue` (misal: `Closes #12`).

### Langkah 4: Review & Merge

* Minta rekan tim (atau Owner) untuk me-review.
* Jika sudah di-approve, tekan tombol **Squash and Merge** agar history di `main` tetap rapi.

<!-- end list -->
