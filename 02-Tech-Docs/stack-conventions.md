# 💻 Tech Stack & Coding Conventions

Di Akordium Lab, kita menulis kode yang **mudah dibaca**, **mudah dites**, dan **tipe-aman (type-safe)**.

Kita menggunakan **Cursor + Copilot**. Untuk hasil AI terbaik, selalu referensikan file ini di `.cursorrules` setiap project.

## 1. General Principles (Semua Bahasa)
* **English Codebase:** Nama variabel, fungsi, dan komentar dalam Bahasa Inggris.
* **Descriptive Naming:** `calculateTotalWaqfAmount()` lebih baik daripada `calc()`.
* **No Magic Numbers:** Gunakan konstanta atau Enum.
* **DRY (Don't Repeat Yourself):** Tapi hati-hati, "Duplikasi lebih baik daripada abstraksi yang salah".

---

## 2. Laravel Framework (PHP)
Digunakan untuk: *WaqfWise, Anggarin, Klustera*.

* **Architecture:** Kita menghindari *Fat Controllers*.
    * Gunakan **Service Classes** atau **Actions** untuk logika bisnis yang kompleks.
    * Contoh: `App\Actions\CreateTransactionAction.php`.
* **Frontend:**
    * Gunakan **Livewire 3** untuk interaktivitas (hindari React/Vue jika tidak perlu SPA kompleks).
    * Gunakan **Alpine.js** untuk interaksi UI ringan.
    * Gunakan **Tailwind CSS** untuk styling.
* **Typing:** Wajib gunakan **Type Hinting** dan **Return Types** di setiap method PHP.
    ```php
    public function calculate(int $amount): float { ... }
    ```

---

## 3. Next.js / React (TypeScript)
Digunakan untuk: *Atribuo, SnapKasir (Frontend), Landing Pages*.

* **Framework:** Next.js (App Router). Tinggalkan `pages/` directory lama.
* **Language:** **TypeScript Strict Mode** wajib. `any` adalah musuh.
* **State Management:**
    * Gunakan `React Context` atau `Zustand` untuk global state.
    * Hindari Redux (terlalu *bloated* untuk tim kecil).
* **Data Fetching:**
    * Gunakan **TanStack Query** (React Query) untuk client-side fetching.
    * Gunakan **Server Components** untuk data statis/awal.
* **UI Library:** Shadcn/UI (berbasis Radix & Tailwind). Jangan install library UI berat (MUI/AntD) kecuali terpaksa.

---

## 4. Go (Golang)
Digunakan untuk: *SnapKasir (Backend), Microservices performa tinggi*.

* **Project Layout:** Standar Go (`cmd/`, `internal/`, `pkg/`).
    * `internal/`: Kode privat aplikasi.
    * `cmd/api/`: Entry point aplikasi.
* **Error Handling:** Jangan abaikan error.
    ```go
    if err != nil {
        return nil, fmt.Errorf("failed to process: %w", err)
    }
    ```
* **Framework:** Gunakan library minimalis/standar.
    * Router: `Chi` atau `Gin`.
    * ORM: `GORM` atau `sqlc` (prefer `sqlc` untuk type-safety dari raw SQL).

---

## 5. Database (Postgres)
* **Naming:** `snake_case` untuk nama tabel dan kolom (`user_profiles`, `created_at`).
* **Foreign Keys:** Selalu definisikan foreign key constraint di migration level database, jangan hanya di level aplikasi.
* **Indexing:** Selalu index kolom yang dipakai untuk `WHERE`, `ORDER BY`, dan `JOIN`.

---

## 6. Cursor & AI Rules 🤖
Untuk setiap project baru, buat file `.cursorrules` di root folder, dan isikan instruksi spesifik project tersebut.
Contoh:
> "You are an expert Laravel developer. Use Livewire 3 syntax. Prefer Actions over Controllers for business logic. Always type-hint PHP code."

Ini memastikan AI langsung paham konteks proyek Anda.
