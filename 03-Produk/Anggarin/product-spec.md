# 💰 Anggarin (Anggarin.com)

**Tagline:** Perencanaan Keuangan Pribadi yang Manusiawi.
**Status:** 🚧 In Development
**Repo Code:** `github.com/akordium/anggarin` (Private)

## 1. Visi Produk
Membantu individu (khususnya pasar Indonesia) mengelola keuangan bukan hanya mencatat pengeluaran, tapi merencanakan masa depan (Financial Planning). Berbeda dengan *expense tracker* biasa, Anggarin fokus pada **Budgeting** dan **Goal Setting**.

## 2. Tech Stack Strategy
* **Backend:** Laravel (API Only). Dipilih karena ketangguhan Eloquent ORM untuk relasi data keuangan yang kompleks.
* **Frontend:** Next.js. Dipilih untuk UI yang interaktif dan *snappy* (SPA feel).
* **Infra:** Coolify @ Oracle Cloud.

## 3. Fitur Utama (MVP)
1.  **Multi-Wallet:** Mendukung berbagai akun (Bank, E-Wallet, Cash).
2.  **Budgeting Rules:** Metode 50/30/20 atau Zero-based budgeting.
3.  **Recurring Transactions:** Input otomatis untuk langganan bulanan.
4.  **Goal Tracking:** Progress bar untuk tujuan tabungan (mis: Dana Darurat, Nikah).

## 4. User Roles
* **Free User:** Fitur dasar, limit wallet.
* **Pro User:** Unlimited wallets, export report, AI insights.

## 5. Notes & Keputusan Desain
* *Security:* Data sensitif user tidak boleh bocor. Pertimbangkan enkripsi kolom saldo jika perlu.
* *Currency:* Fokus IDR dulu, tapi struktur database harus support multi-currency untuk masa depan.
