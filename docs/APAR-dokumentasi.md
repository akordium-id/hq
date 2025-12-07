# DOKUMENTASI PROYEK: APAR Management System

**Nama Proyek:** APAR Management System  
**Klien:** PT. Penyedia APAR  
**Tipe Proyek:** Sistem Informasi Manajemen Terintegrasi  
**Status:** In Development  
**Tim:** 1 Developer (Full-stack)  
**Timeline:** 3 bulan  

---

## 📋 DAFTAR ISI

1. [Ringkasan Eksekutif](#ringkasan-eksekutif)
2. [Arsitektur Sistem](#arsitektur-sistem)
3. [Modul & Fitur](#modul--fitur)
4. [Rincian Biaya](#rincian-biaya)
5. [Stack Teknologi](#stack-teknologi)
6. [Timeline Pengembangan](#timeline-pengembangan)

---

## 🎯 RINGKASAN EKSEKUTIF

### Masalah yang Dipecahkan

| Masalah | Solusi |
|---------|--------|
| Input Excel manual → error-prone | ✅ Sistem terintegrasi, auto-generate dokumen |
| Hitung komisi manual → sulit audit | ✅ Komisi auto-calculate, transparent |
| Admin cuma punya data lokal | ✅ Backup cloud + offline capability |
| Owner tidak bisa monitor real-time | ✅ Dashboard cloud + laporan instant |
| Internet sering mati (offline risk) | ✅ Aplikasi desktop 100% offline-capable |
| Dokumen tercecer (invoice, SJ, kwitansi) | ✅ 1 input SO → semua dokumen auto-generate |

### Solusi Delivered

✅ **Web App (Cloud):** Remote access untuk owner + backup cloud  
✅ **Desktop App (NativePHP):** Offline-first untuk admin (5 komputer)  
✅ **Database Lokal:** SQLite/MySQL embedded per desktop  
✅ **Sync Engine:** Bidirectional push/pull saat online  
✅ **Role-Based Access:** Admin, Owner, Developer  

---

## 🏗️ ARSITEKTUR SISTEM

### Arsitektur Deployment

```bash
LARAVEL CLOUD SERVER
├─ Frontend (Web Browser Access - Filament Admin Panel)
├─ Backend API REST (Laravel Routes)
├─ PostgreSQL/MySQL (Master Database)
├─ Queue & Cache (Redis)
├─ File Storage (Laravel Storage)
└─ Backup & Audit Log

        ↓↑ Sync (HTTP REST API)

DESKTOP APPS (5 Komputer - NativePHP)
├─ NativePHP Desktop App
├─ Laravel Backend (embedded)
├─ Filament/Livewire UI (embedded)
├─ SQLite/MySQL Database (local file)
└─ Offline-capable architecture
```

### Data Flow

**Online Mode (Desktop → Cloud):**

```text
User Input → NativePHP Desktop App
           → Filament UI / Livewire Components
           → Laravel Controller (local)
           → Local SQLite/MySQL (immediate save)
           → HTTP API Call to Cloud
           → Cloud Laravel API
           → PostgreSQL Master (sync)
```

**Offline Mode:**

```text
User Input → NativePHP Desktop App
           → Filament UI / Livewire Components
           → Laravel Controller (local)
           → Local SQLite/MySQL (save)
           → Sync Queue (pending)
           [Internet Down]
           → Local DB tetap jalan 100%
```

**Sync Process:**

```text
Push: Local changes → Server API → Master DB
Pull: Master DB updates → Local SQLite/MySQL
Conflict Resolution: Server-priority or Last-Write-Wins
```

---

## 📦 MODUL & FITUR

### MODUL 1: Master Data Management

#### 1.1 Customer Management

- ✅ CRUD Customer (Create, Read, Update, Delete)
- ✅ Kategori: Perorangan, Instansi, Toko, Apotek, Puskesmas, Perusahaan
- ✅ Customer tagging: VIP/Reguler/Tender
- ✅ Credit limit & payment term default
- ✅ History transaksi per customer
- ✅ Search & filter (by nama, tipe, status)
- ✅ Export to Excel

**User:** Admin  
**Effort:** 8 jam  

#### 1.2 Product & Service Catalog

- ✅ CRUD Produk (kategori: Isi Ulang, Apar Baru, Tukar Tambah, Reparasi, O2, Evakuasi)
- ✅ Tipe APAR: Powder, CO2, Foam
- ✅ Size: 1kg, 3kg, 5kg, 9kg, dst
- ✅ Harga modal, harga jual, margin auto-calculate
- ✅ Bulk import Excel
- ✅ Price history tracking
- ✅ Status: Aktif/Non-aktif

**User:** Admin, Developer  
**Effort:** 6 jam  

#### 1.3 Customer-Specific Pricing

- ✅ Set harga khusus per customer per produk
- ✅ Valid date range (contract management)
- ✅ Auto-expire setelah periode
- ✅ Alert expire (7 hari sebelum)
- ✅ Bulk setup multi-produk
- ✅ Discount & special rate history

**User:** Admin  
**Effort:** 6 jam  

#### 1.4 Sales Person Management

- ✅ CRUD Sales (nama, kontak, email)
- ✅ Assign commission plan
- ✅ Performance dashboard per sales:
  - Total omzet bulan ini
  - Jumlah SO closing
  - Tier yang dicapai
  - Estimasi komisi
- ✅ History komisi per bulan

**User:** Admin, Owner  
**Effort:** 6 jam  

#### 1.5 Commission Plan & Tiers

- ✅ CRUD Commission Plan (Standard, Promo, Tender)
- ✅ Basis perhitungan: Revenue/Margin/Count
- ✅ Multiple tiers (max 5 per plan):
  - Bronze: 0-50 juta → 5%
  - Silver: 50-100 juta → 6%
  - Gold: 100M+ → 7%
- ✅ Bonus flat per tier
- ✅ Visualisasi tier (grafik)
- ✅ Simulation tool (cek komisi jika omzet X)

**User:** Owner (setup), Admin (view)  
**Effort:** 8 jam  

**Subtotal Modul 1:** 34 jam

---

### MODUL 2: Sales Order & Invoicing

#### 2.1 Sales Order Creation (Wizard-based)

- ✅ Step 1: Customer info (pilih/tambah baru, auto-load alamat)
- ✅ Step 2: Items (multi-select product, qty, auto-price)
  - Auto-load catalog price
  - Show customer-specific price ⭐ jika ada
  - Custom price dengan reason (nego/promo/kontrak/tender)
  - Discount per item
  - Subtotal auto-calculate
- ✅ Step 3: Summary
  - Subtotal items
  - Discount SO level
  - PPN 11% (checkbox)
  - Ongkir
  - Grand Total
  - Assign sales person
  - Payment term & method
  - PO/WO customer
  - Notes
- ✅ Status: Draft → Pending Approval → Confirmed → Delivered → Paid
- ✅ Auto-generate SO number: SO-YYYY-XXXX
- ✅ Duplicate SO (repeat order)
- ✅ Edit (hanya status Draft)
- ✅ Cancel dengan reason
- ✅ Print preview SO

**Validasi:**

- ❗ Custom price > 30% discount → trigger approval
- ❗ Total SO < Rp 50k → warning
- ❗ Outstanding customer > credit limit → warning

**User:** Admin  
**Effort:** 20 jam  

#### 2.2 Price Approval Workflow

- ✅ Queue SO custom price
- ✅ Notification badge ke owner
- ✅ Detail approval page (SO info, catalog vs custom, margin impact)
- ✅ Approve/Reject dengan notes
- ✅ Auto-notify admin
- ✅ History approval decisions

**User:** Owner (approve), Admin (view)  
**Effort:** 8 jam  

#### 2.3 Invoice Generator (Auto from SO)

- ✅ Auto-generate dari SO confirmed
- ✅ Invoice number: 0XXX/APK/AJI/MM/YYYY
- ✅ PDF template sesuai existing invoice
- ✅ Header: Logo, company info
- ✅ Customer: Nama, alamat
- ✅ Items table (No, Items, Size, Qty, Unit, Price, Amount)
- ✅ Subtotal, Discount, PPN 11%, Ongkir, Net Total
- ✅ Terbilang (Indo & English)
- ✅ Bank info footer (BRI: 058501001419309)
- ✅ Digital signature/cap
- ✅ Multiple invoice per SO (partial billing, Phase 2)
- ✅ Export PDF
- ✅ Email/WhatsApp integration (Phase 2)
- ✅ Invoice history & tracking

**User:** Admin  
**Effort:** 16 jam  

#### 2.4 Surat Jalan Generator

- ✅ Auto-generate dari SO delivering
- ✅ SJ number: SJ-YYYY-XXXX
- ✅ Template sesuai existing SJ
- ✅ Header: Logo, company info
- ✅ Customer: Nama, alamat pengiriman
- ✅ Items list (barang yang dikirim)
- ✅ Tanggal kirim, PIC penerima
- ✅ Tanda tangan penerima
- ✅ QR code tracking (Phase 2)
- ✅ Link ke SO terkait
- ✅ Export PDF
- ✅ Signature tracking (digital/photo, Phase 2)
- ✅ SJ history

**User:** Admin, Driver (Phase 2)  
**Effort:** 12 jam  

#### 2.5 Kwitansi/Receipt Generator

- ✅ Auto-generate saat payment diterima
- ✅ Kwitansi number: KWT-YYYY-XXXX
- ✅ Template sesuai existing kwitansi
- ✅ Payment detail (jumlah, metode, bukti transfer)
- ✅ Export PDF
- ✅ Archive digital (semua kwitansi tersimpan)
- ✅ Kwitansi history & search

**User:** Admin  
**Effort:** 8 jam  

**Subtotal Modul 2:** 64 jam

---

### MODUL 3: Payment Tracking & Receivables

#### 3.1 Payment Recording

- ✅ Form input payment:
  - Invoice selection (unpaid invoices dropdown)
  - Payment date
  - Amount paid (auto-load invoice amount, bisa partial)
  - Payment method: Cash/Transfer BRI/Transfer BCA/Lainnya
  - Bukti pembayaran (upload foto transfer/kwitansi)
  - Reference number (untuk transfer)
  - Notes
- ✅ Status payment: Pending → Confirmed → Lunas
- ✅ Auto-generate kwitansi saat payment Confirmed
- ✅ Mark invoice as Paid saat 100%
- ✅ Partial payment support
- ✅ Edit payment (sebelum confirmed)
- ✅ Delete payment (dengan soft-delete)
- ✅ Search & filter payment

**User:** Admin  
**Effort:** 12 jam  

#### 3.2 Receivables Dashboard (Admin)

- ✅ Summary card:
  - Total outstanding
  - Total received (bulan ini)
  - Overdue amount
  - Not yet due
- ✅ Aging report:
  - 0-30 hari (Due Soon)
  - 31-60 hari (Overdue)
  - 61-90 hari (Highly Overdue)
  - 90+ hari (At Risk)
- ✅ Detail list (customer, invoice, amount, due date, status)
- ✅ Filter by aging bucket
- ✅ Export Excel
- ✅ Mark payment received langsung dari list

**User:** Admin, Owner  
**Effort:** 8 jam  

#### 3.3 Collection Management (Phase 2)

- ✅ Collection task creation (reminder untuk collect)
- ✅ Priority system (based on amount & aging)
- ✅ Follow-up log (track conversation dengan customer)
- ✅ SMS/WhatsApp reminder template (Phase 2)
- ✅ Automation: auto-send reminder jika 30 hari overdue

**User:** Admin, Sales  
**Effort:** 12 jam  

**Subtotal Modul 3:** 32 jam

---

### MODUL 4: Commission Management

#### 4.1 Commission Calculation Engine

- ✅ Auto-calculate komisi based on:
  - Sales person
  - Period (bulanan)
  - Commission plan assigned
  - Total omzet delivered (SO yang sudah dikirim)
  - Paid amount (SO yang sudah lunas) ← basis perhitungan
- ✅ Tier progression (auto-select tier based on omzet)
- ✅ Formula: Omzet × Tier Rate% + Bonus flat
- ✅ Example:
  - Tier 1 (0-50 juta): 5% + Rp 0
  - Tier 2 (50-100 juta): 6% + Rp 500k bonus
  - Tier 3 (100M+): 7% + Rp 1 juta bonus
- ✅ Recalculation saat payment received
- ✅ Rounding rules (ke rib terdekat)

**User:** System (automatic)  
**Effort:** 12 jam  

#### 4.2 Commission Report (Admin)

- ✅ Monthly commission recap per sales:
  - Nama sales
  - Total omzet
  - Total delivered
  - Total paid (basis komisi)
  - Tier achieved
  - Commission rate & bonus
  - Total komisi
- ✅ Status: Draft → Calculated → Approved → Paid
- ✅ Filter by period & sales
- ✅ View detail breakdown per SO
- ✅ Export Excel (untuk verifikasi)

**User:** Admin  
**Effort:** 8 jam  

#### 4.3 Commission Approval & Payment (Owner)

- ✅ View draft commission report
- ✅ Review total per sales
- ✅ Approve/Reject (dengan notes)
- ✅ Mark as Paid (terima pembayaran komisi)
- ✅ Payment tracking (kapan komisi dibayar)
- ✅ History approval & payment

**User:** Owner  
**Effort:** 6 jam  

#### 4.4 Commission Payment Slip (Phase 2)

- ✅ Generate slip pembayaran komisi
- ✅ Slip detail: nama sales, periode, total, tanda tangan
- ✅ Export PDF
- ✅ Archive payment slips

**User:** Admin  
**Effort:** 4 jam  

**Subtotal Modul 4:** 30 jam

---

### MODUL 5: Reporting & Analytics

#### 5.1 Daily/Monthly Recap Report

- ✅ Otomatis generate report setiap hari/bulan
- ✅ Report content:
  - List SO (no, customer, amount, status)
  - Filter: by date, customer, sales, status
  - Summary:
    - Total SO count
    - Total penjualan (so yang delivered)
    - Total terbayar (lunas)
    - Total outstanding
    - Breakdown cash vs transfer
- ✅ Margin analysis:
  - Total discount diberikan
  - Margin loss dari custom price
- ✅ Export Excel (sesuai format existing)
- ✅ Email auto-send ke admin (daily) & owner (daily/weekly)

**User:** Admin, Owner  
**Effort:** 12 jam  

#### 5.2 Financial Dashboard (Owner)

- ✅ Cashflow chart (daily/weekly/monthly):
  - Pemasukan (payment received)
  - Pengeluaran (opsional phase 2)
  - Net cashflow (trend line)
- ✅ Top performers:
  - Top customer (by revenue)
  - Top sales (by omzet & komisi)
  - Best-selling products
- ✅ Payment health:
  - On-time payment rate (%)
  - Overdue amount
  - Average payment cycle (hari)
- ✅ Visualisasi grafik (line, bar, pie)
- ✅ Date range filter (custom period)
- ✅ Export chart as image/PDF

**User:** Owner  
**Effort:** 14 hours  

#### 5.3 Tax Report (PPN)

- ✅ Auto-track PPN 11% per SO
- ✅ Summary per bulan:
  - Total PPN collected (dari customer)
  - Detail SO with PPN
  - Export format siap untuk SPT
- ✅ Period filter (by bulan)
- ✅ Export Excel (untuk SPT filing)

**User:** Admin (input), Owner (review)  
**Effort:** 8 jam  

#### 5.4 Inventory Tracking (Phase 2)

- ✅ Track APAR stock:
  - APAR kosong (untuk isi ulang)
  - APAR baru (untuk penjualan)
  - APAR expired/damage
- ✅ Stock alert (low stock notification)
- ✅ Stock movement history (in/out)
- ✅ Stock valuation (cost at risk)

**User:** Admin  
**Effort:** 10 jam  

**Subtotal Modul 5:** 44 jam

---

### MODUL 6: Document Management & Archive

#### 6.1 Scan Nota / Upload Dokumen

- ✅ Upload foto nota dari customer
- ✅ Scan barcode/QR code (opsional)
- ✅ OCR auto-extract (via Laravel package):
  - Tanggal
  - Nominal
  - Customer name
  - PIC
- ✅ Link to invoice (manual/auto match)
- ✅ Upload multiple files per SO
- ✅ Storage: Laravel Storage (local/cloud)
- ✅ File size limit: 10MB per file

**User:** Admin  
**Effort:** 10 jam  

#### 6.2 Document Archive & Search

- ✅ Archive semua dokumen:
  - Invoice PDF
  - Surat Jalan PDF
  - Kwitansi PDF
  - Nota scan (image)
  - Attachment lainnya
- ✅ Full-text search (by customer, date, amount)
- ✅ Filter: by document type, date range, customer
- ✅ Link ke transaksi terkait (SO/Invoice/Payment)
- ✅ Batch download (download multiple docs)
- ✅ Document retention policy (keep 7 years)

**User:** Admin, Owner  
**Effort:** 8 jam  

#### 6.3 Digital Signature (Phase 2)

- ✅ Digital signature pada dokumen:
  - Invoice
  - Surat Jalan (penerima)
  - Kwitansi
- ✅ Signature capture: touch/mouse draw atau upload image
- ✅ Timestamp signature
- ✅ Verification badge

**User:** Admin, Penerima  
**Effort:** 8 jam  

**Subtotal Modul 6:** 26 jam

---

### MODUL 7: Offline & Sync

#### 7.1 Desktop App Offline Mode (NativePHP)

- ✅ Aplikasi jalan 100% tanpa internet
- ✅ Local SQLite/MySQL database
- ✅ All features work offline:
  - Input SO (Filament Form + Livewire)
  - Input payment
  - Generate invoice/SJ/kwitansi (PDF lokal)
  - View reports (dari lokal data)
  - Access customer/product master data
- ✅ Offline indicator (🔴 OFFLINE / 🟢 ONLINE)
- ✅ Data saved ke local immediately
- ✅ Performance: instant response (no network latency)

**User:** Admin (desktop)  
**Effort:** 16 jam  

#### 7.2 Sync Engine (Background)

- ✅ Auto-sync every 5 minutes (saat online)
- ✅ Bidirectional sync:
  - **Push:** Local changes → Server
  - **Pull:** Server updates → Local DB
- ✅ Sync queue (tampilkan pending items):
  - Badge count ("📦 5 pending")
  - Detail list (what's pending)
  - Manual "Sync Now" button
- ✅ Smart sync:
  - Priority (today's transactions = urgent)
  - Batching (multiple requests in 1)
  - Retry logic (exponential backoff)
  - Network detection (wake on online)
- ✅ Sync log (history untuk debugging)
- ✅ Conflict resolution:
  - Strategy: Server-Priority (server always win)
  - Manual resolution UI (jika complex, Phase 2)

**User:** System (automatic)  
**Effort:** 20 jam  

#### 7.3 Sync Status Dashboard

- ✅ Real-time status indicator:
  - Connection status (online/offline)
  - Pending count
  - Last sync time
  - Sync errors (jika ada)
- ✅ Manual action:
  - "Sync Now" button
  - "Clear pending" button (Phase 2)
  - "View sync log" (debugging)
- ✅ Visual feedback:
  - Green/Red indicator
  - Progress bar (saat syncing)
  - Success/error toast notification

**User:** Admin  
**Effort:** 8 jam  

#### 7.4 Data Backup & Recovery

- ✅ Auto-backup local DB (daily):
  - Time: 23:00 (default, configurable)
  - Format: ZIP
  - Location: Application storage
- ✅ Manual backup on-demand
- ✅ Restore from backup (import DB)
- ✅ Server-side backup (automatic, Phase 2)
- ✅ Disaster recovery procedure (dokumentasi)

**User:** Admin, Developer  
**Effort:** 6 jam  

**Subtotal Modul 7:** 50 jam

---

### MODUL 8: User & Role Management

#### 8.1 User Management (Filament)

- ✅ CRUD User (via Filament Admin Panel):
  - Username
  - Email
  - Full name
  - Role assignment
  - Status: Aktif/Non-aktif
- ✅ Password:
  - Set/reset password
  - Change password (self)
  - Password strength validation
- ✅ User list & filter
- ✅ Activity log (siapa yang login kapan)

**User:** Developer/Super Admin  
**Effort:** 8 jam  

#### 8.2 Role-Based Access Control (Filament)

- ✅ 3 Roles (via Filament Authorization):
  - **Admin:** Input SO, payment, print dokumen, input nota
  - **Owner:** View dashboard, reports, approval (custom price, komisi)
  - **Developer:** Full access (user management, system config, DB backup)
- ✅ Permission matrix:
  - Module-level (akses modul apa)
  - Feature-level (action apa bisa dilakukan)
  - Data-level (data apa bisa dilihat)
- ✅ Custom role (Phase 2)

**User:** Developer  
**Effort:** 12 jam  

#### 8.3 Audit Log (Activity Log)

- ✅ Track semua action:
  - Who (user)
  - What (action: create/update/delete)
  - When (timestamp)
  - Which (object: SO #123, Payment #456)
  - Data before/after (untuk sensitive action)
- ✅ Searchable & filterable
- ✅ Export audit trail (Excel/PDF)
- ✅ Retention: 1 year minimum

**User:** Developer, Owner  
**Effort:** 10 jam  

#### 8.4 Login & Authentication (Filament)

- ✅ Login form (username/password) - built-in Filament
- ✅ Session management (timeout 30 menit)
- ✅ "Remember me" (optional)
- ✅ Password reset email (Phase 2)
- ✅ OTP/2FA (Phase 2, optional)
- ✅ Login attempt logging (security)

**User:** All  
**Effort:** 8 jam  

**Subtotal Modul 8:** 38 jam

---

## 💰 RINCIAN BIAYA

### A. DEVELOPMENT COST

| Modul                          | Fitur                                              | Effort (jam) | Rate (Rp/jam)  | Subtotal            |
|--------------------------------|----------------------------------------------------|--------------|----------------|---------------------|
| **Master Data**                | Customer, Product, Pricing, Sales, Commission Plan | 34           |  Rp 25.000.00  |  Rp 850.000,00      |
| **Sales & Invoice**            | SO, Invoice, SJ, Kwitansi, Approval                | 64           |  Rp 25.000,00  |  Rp 1.600.000,00    |
| **Payment**                    | Payment recording, Receivables, Collection         | 32           |  Rp 25.000,00  |  Rp 800.000,00      |
| **Commission**                 | Calculation, Report, Approval, Payment             | 30           |  Rp 25.000,00  |  Rp 750.000,00      |
| **Reporting**                  | Daily/Monthly, Financial Dashboard, Tax, Inventory | 44           |  Rp 25.000,00  |  Rp 1.100.000,00    |
| **Document Mgmt**              | Scan, Archive, Signature                           | 26           |  Rp 25.000,00  |  Rp 650.000,00      |
| **Offline & Sync**             | Desktop app, Sync engine, Backup, Status           | 50           |  Rp 25.000,00  |  Rp 1.250.000,00    |
| **User & Auth**                | User management, RBAC, Audit log, Login            | 38           |  Rp 25.000,00  |  Rp 950.000,00      |
| **Testing & QA**               | Unit test, Integration test, UAT                   | 40           |  Rp 25.000,00  |  Rp 1.000.000,00    |
| **Deployment & Documentation** | Setup cloud, Deploy desktop, Documentation         | 20           |  Rp 25.000,00  |  Rp 500.000,00      |
|                                |                                                    | **378**      |                |  **Rp 9.450.000,00**|

**Total Development: Rp 9.450.000**

---

### B. INFRASTRUCTURE COST (Monthly / Annual)

#### B1. Laravel Cloud Infrastructure

| Service | Kebutuhan | Cost/Bulan | Cost/Tahun | Catatan |
|---------|-----------|-----------|-----------|---------|
| **Laravel Cloud (Official)** | All-in-one hosting + deployment | Rp 100k - 1M | Rp 1.2M - 12M | Managed PostgreSQL, Redis, S3, auto-scaling |
| **Database (PostgreSQL on Laravel Cloud)** | Master database | Included | Included | Auto-backup, replication included |
| **File Storage (S3 on Laravel Cloud)** | Upload foto nota (Phase 2) | Rp 50k - 200k | Rp 0.6M - 2.4M | Usage-based pricing |
| **Email Service (Laravel Horizon/Mailable)** | Transactional emails | Rp 0 - 100k | Rp 0 - 1.2M | Can use SendGrid alternative |
| **Domain (.com / .id)** | Domain tahunan | Rp 150k - 300k | Rp 150k - 300k | One-time per tahun |
| **SSL Certificate** | HTTPS | Rp 0 | Rp 0 | Free (Let's Encrypt) |
| | | **Rp 300k - 1.6M** | **Rp 3.6M - 16.2M** | **Recommended: ~Rp 500k-750k/bulan** |

#### B2. Desktop App Infrastructure (NativePHP)

| Item | Requirement | Cost |
|------|-------------|------|
| **NativePHP (open-source)** | Desktop framework | Rp 0 |
| **Build Server** | GitHub Actions CI/CD | Rp 0 |
| **Distribution** | USB/Network share | Rp 0 |
| **Auto-updater Server (Phase 2)** | Simple HTTP server | Included in Laravel Cloud |
| | **Subtotal** | **Rp 0** |

#### B3. Optional Services (Phase 2)

| Service | Purpose | Cost/Bulan | Cost/Tahun |
|---------|---------|-----------|-----------|
| **SendGrid / Mailgun** | Email notifications | Rp 0 - 300k | Rp 0 - 3.6M |
| **Twilio** | SMS notifications | Rp 200k - 500k | Rp 2.4M - 6M |
| **WhatsApp Business API** | WhatsApp integration | Rp 500k - 2M | Rp 6M - 24M |
| **Monitoring & Uptime** | Uptime monitoring, Alerting | Rp 100k - 300k | Rp 1.2M - 3.6M |

---

### C. TOTAL COST SUMMARY

| Category | Cost | Timeline |
|----------|------|----------|
| **Development** | **Rp 9.450.000** | 3 bulan (sekali) |
| **Infrastructure (minimal setup)** | **Rp 500.000-750k/bulan** | Ongoing |
| **Infrastructure (annual)** | **Rp 6-9.000.000** | 12 bulan |
| **Optional: Annual support & maintenance** | **Rp 24.000.000** | Tahun 1 (optional) |
| | | |
| **TOTAL YEAR 1** | **~Rp 18.450.000** | Incl. Dev + Infra (12 bulan) |
| **TOTAL YEAR 2+** | **Rp 6-9.000.000/tahun** | Infra only (maintenance minimal) |

---

### D. BIAYA PER FITUR (Detail Breakdown)

#### Infrastructure Cost Attribution

| Fitur | Infrastructure Required | Monthly Cost |
|-------|------------------------|--------------|
| Web Access (Cloud Dashboard - Filament) | Laravel Cloud | Rp 300-500k |
| Desktop App (Offline - NativePHP) | GitHub Actions (free) | Rp 0 |
| Sync Engine | Laravel Cloud API | Incl. above |
| Document Storage (Phase 2) | S3/Laravel Storage | Rp 50-200k |
| Email/SMS (Phase 2) | SendGrid/Twilio | Rp 0-300k |
| **TOTAL** | | **Rp 300-1000k/bulan** |

---

### E. COST OPTIMIZATION TIPS

✅ **Leverage Laravel Cloud free tier:**

- Free tier: 1 app, 1 environment, limited resources
- Scale up as needed when traffic grows

✅ **Start minimal, scale up:**

- Month 1-3: Development phase (no traffic yet) - use free tier
- Month 4+: Live phase (~Rp 500-750k/bulan)
- Year 2: Stable operations (~Rp 300-500k/bulan)

✅ **Laravel Cloud benefits:**

- All-in-one solution (no juggling multiple services)
- Automatic backups & scaling
- Redis cache included
- S3 storage integration
- One-click deploys from Git

---

## 🛠️ STACK TEKNOLOGI

### Architecture Pattern: Unified Laravel Stack (Web + Desktop)

```bash
┌─────────────────────────────────────────┐
│ CLIENT SIDE                             │
├─────────────────────────────────────────┤
│ CLOUD WEB (Browser)                     │
│ └─ Filament PHP Admin Panel             │
│    └─ Tailwind CSS + Alpine.js/Livewire │
│    └─ Laravel Blade Templates           │
│                                         │
│ DESKTOP APP (Windows Standalone)        │
│ └─ NativePHP (Tauri-like wrapper)       │
│    └─ Laravel Controllers + Views       │
│    └─ Filament/Livewire UI (embedded)   │
│    └─ Embedded SQLite/MySQL DB          │
└─────────────────────────────────────────┘
        ↕ HTTP REST API
┌─────────────────────────────────────────┐
│ SERVER SIDE (Laravel Cloud)             │
├─────────────────────────────────────────┤
│ Backend                                 │
│ └─ Laravel 11 (API Routes)              │
│ └─ Controllers & Models (Eloquent)      │
│ └─ Service Layer (Business Logic)       │
│                                         │
│ Database (Master)                       │
│ └─ PostgreSQL (Laravel Cloud managed)   │
│                                         │
│ Cache/Queue                             │
│ └─ Redis (included in Laravel Cloud)    │
│                                         │
│ Storage                                 │
│ └─ S3 (AWS, included in Laravel Cloud)  │
│                                         │
│ Scheduled Jobs                          │
│ └─ Laravel Scheduler (reports, sync)    │
└─────────────────────────────────────────┘
```

### Frontend Stack

#### Web Application (Cloud)

- **Framework:** Laravel 11 + Filament Admin Panel
- **Admin UI:** FilamentPHP (pre-built admin components)
- **Styling:** Tailwind CSS (built-in Filament)
- **Interactivity:** Livewire 3 (real-time without JavaScript)
- **Lightweight JS:** Alpine.js (for simple interactions)
- **Forms:** Filament Forms Builder (drag & drop forms)
- **Tables:** Filament Tables (sortable, filterable, exportable)
- **Charts:** FilamentPHP Charts (Recharts integration)
- **PDF Export:** Laravel-DomPDF / Spatie/LaravelPdf
- **Excel Export:** Laravel Excel (Maatwebsite)

#### Desktop Application (Offline)

- **Framework:** NativePHP (native wrapper for Laravel)
- **Frontend:** Filament PHP + Livewire (same as web)
- **Styling:** Tailwind CSS (same as web)
- **Build Output:** .exe file (Windows executable)
- **Local Database:** SQLite + Eloquent ORM
- **Offline Storage:** Built-in SQLite queries
- **Sync:** HTTP client (Guzzle) + Laravel Jobs

### Backend Stack

#### Laravel 11 Ecosystem

```text
Framework:     Laravel 11 (latest LTS)
Database ORM:  Eloquent (with relationships)
Query Builder: Laravel Query Builder
Authentication: Laravel Fortify / Filament Auth
Authorization: Laravel Policies (RBAC)
Validation:    Laravel Validation Rules
File Handling: Laravel Storage (local/S3)
PDF:           Laravel-DomPDF / Spatie/LaravelPdf
Excel:         Laravel Excel (Maatwebsite)
Queue:         Laravel Queue (for async jobs)
Scheduler:     Laravel Scheduler (automated tasks)
Cache:         Laravel Cache (Redis)
Testing:       PHPUnit + Laravel Testing
Deployment:    Laravel Cloud (one-click)
```

### Database Schema (SQLite for Desktop, PostgreSQL for Cloud)

```sql
-- Core tables
customers (id, name, address, type, contact, credit_limit, status, created_at, updated_at)
products (id, code, name, category, size, price_cost, price_sell, margin, status, created_at)
sales_people (id, name, contact, email, commission_plan_id, status, created_at, updated_at)
commission_plans (id, name, basis, period, status, created_at, updated_at)
commission_tiers (id, plan_id, threshold_from, threshold_to, rate, bonus, created_at)

-- Transactions
sales_orders (id, no_so, customer_id, sales_id, date, subtotal, discount, tax, total, status, created_at, updated_at)
sales_order_items (id, so_id, product_id, qty, unit_price, subtotal, created_at)
invoices (id, no_invoice, so_id, date, due_date, total, status, created_at, updated_at)
payments (id, invoice_id, date, amount, method, proof_file, status, created_at, updated_at)
commissions (id, sales_id, period, total_omzet, tier, amount_commission, status, created_at, updated_at)

-- Documents
surat_jalan (id, no_sj, so_id, date, status, created_at, updated_at)
receipts (id, no_kwitansi, payment_id, date, created_at, updated_at)
document_attachments (id, type, reference_id, file_path, uploaded_at, created_at)

-- Sync & Audit
sync_log (id, sync_type, status, message, synced_at, created_at)
activity_log (id, causer_id, action, subject_type, subject_id, properties, created_at)

-- Users
users (id, name, email, email_verified_at, password, role, status, remember_token, created_at, updated_at)
```

### Development Tools & Packages

- **Version Control:** Git + GitHub
- **Package Manager:** Composer (PHP)
- **Build Tool:** Laravel Mix (Vite)
- **Testing:** PHPUnit, Laravel Dusk
- **Code Analysis:** PHPStan, Laravel Pint
- **Documentation:** Scribe API docs
- **CI/CD:** GitHub Actions (auto-deploy to Laravel Cloud)
- **Monitoring:** Laravel Telescope, Sentry
- **Desktop Build:** NativePHP CLI

#### Key Laravel Packages

```
filament/filament - Admin panel & forms
livewire/livewire - Real-time reactivity
spatie/laravel-activity-log - Activity logging
maatwebsite/excel - Excel export/import
barryvdh/laravel-dompdf - PDF generation
guzzlehttp/guzzle - HTTP client (for sync)
spatie/laravel-backup - Database backup
```

---

## 📅 TIMELINE PENGEMBANGAN

### Phase 1: MVP Development (12 Weeks)

```
MINGGU 1-2: Setup & Architecture
├─ Setup Laravel 11 project
├─ Install Filament + Livewire
├─ Database schema design (migrations)
├─ PostgreSQL setup on Laravel Cloud
├─ Authentication with Filament
├─ RBAC setup (Admin, Owner, Developer)
└─ Git workflow & CI/CD pipeline

MINGGU 3-4: Master Data & Filament Resources
├─ Customer Resource (Filament CRUD)
├─ Product Catalog Resource
├─ Sales Person Resource
├─ Commission Plan & Tiers
├─ Custom Pricing Resource
├─ Relationships & validation
└─ Search, filter, export features

MINGGU 5-6: Sales Order & Invoicing
├─ Sales Order Wizard (multi-step form)
├─ Livewire wizard components
├─ Price approval workflow (Filament)
├─ Invoice generator (DomPDF)
├─ Surat Jalan generator (DomPDF)
├─ Kwitansi generator (DomPDF)
└─ PDF template styling

MINGGU 7-8: Desktop App (NativePHP) & Offline
├─ NativePHP project setup
├─ Embed Laravel backend
├─ Local SQLite database
├─ Filament views in desktop context
├─ Offline capability testing
├─ Manual sync implementation
└─ .exe build & packaging

MINGGU 9: Sync Engine
├─ HTTP sync API endpoints
├─ Bidirectional sync logic (push/pull)
├─ Conflict resolution (server-priority)
├─ Sync queue with status tracking
├─ Data backup & recovery
├─ Testing offline→online scenarios

MINGGU 10: Payment & Commission
├─ Payment Recording Resource
├─ Receivables Dashboard (Livewire)
├─ Commission Calculation Engine
├─ Commission Report Resource
├─ Approval workflow
├─ Status tracking

MINGGU 11: Reporting & Testing
├─ Daily/Monthly Reports (Livewire)
├─ Financial Dashboard (charts)
├─ Tax Report (PPN tracking)
├─ Unit tests & integration tests
├─ UAT with client
├─ Performance optimization
└─ Security audit

MINGGU 12: Deployment & Handover
├─ Deploy to Laravel Cloud
├─ Desktop app distribution (.exe)
├─ Documentation & guides
├─ User training session
├─ Live monitoring
├─ Bug fixes & adjustments

```

### Phase 2: Enhancement (Future, 4-6 weeks)

**Post-launch improvements (Month 4-6):**

- ✅ Email/WhatsApp integration (Notifications via Filament)
- ✅ OCR nota scanning (Laravel package)
- ✅ Inventory tracking
- ✅ Multiple invoice per SO (partial billing)
- ✅ Digital signature (PDF)
- ✅ Advanced analytics & dashboards
- ✅ Mobile app (React Native, Phase 3)

---

## 📋 DELIVERABLES

### Code & Documentation

- ✅ Laravel 11 source code (GitHub private repo)
- ✅ API documentation (Scribe OpenAPI)
- ✅ User guide (Filament navigation)
- ✅ Admin guide (system configuration)
- ✅ Developer guide (code walkthrough)
- ✅ Database schema documentation
- ✅ Deployment guide (Laravel Cloud)

### Artifacts

- ✅ Web application (live on Laravel Cloud)
- ✅ Desktop application (.exe file, 5 licenses)
- ✅ Database (PostgreSQL + initial data)
- ✅ API endpoints (fully functional)
- ✅ Demo data (50 sample transactions)

### Support

- ✅ 30-day post-launch support
- ✅ Bug fixes & optimization
- ✅ User training session (4 hours)
- ✅ Technical handover
- ✅ Emergency support (3 months)

---

## ✅ SUCCESS CRITERIA

| Aspek | Target | Measurement |
|-------|--------|-------------|
| **Performance** | < 1 detik load time | Filament dashboard |
| **Availability** | 99.5% uptime | Laravel Cloud monitoring |
| **Offline Mode** | 100% functionality | UAT testing |
| **Sync Accuracy** | 0 data loss | Test scenarios |
| **Security** | No vulnerabilities | OWASP top 10 check |
| **User Adoption** | 5/5 users active | Activity logs |
| **Documentation** | 100% complete | Checklist |
| **Support** | < 24 jam response | Support ticket SLA |

---

## 🎯 ASUMSI & CONSTRAINTS

### Asumsi

- ✅ Klien menyediakan contoh dokumen (invoice, SJ, kwitansi)
- ✅ Klien memberikan akses contoh data (customer, product)
- ✅ Developer memiliki Laravel 11 expertise
- ✅ Admin team tersedia untuk UAT
- ✅ Owner tersedia untuk approval testing

### Constraints

- ❗ 5 users desktop → NativePHP app harus lightweight
- ❗ Offline-first → sync logic perlu robust error handling
- ❗ Internet unstable → queue jobs + retry logic wajib
- ❗ Single location → no multi-location complexity (Phase 2)
- ❗ Laravel Cloud → no custom server configuration needed

---

## 📞 CONTACT & SUPPORT

**Developer:** Faiq Najib  
**Email:** [faiq.najib@gmail.com]  
**Phone:** [+62-823-3607-1367]  
**Laravel Expertise:** Full-stack (Filament, Livewire, NativePHP)  
**Timeline:** Available untuk development 3 bulan  
**Support:** 30-hari post-launch, kemudian maintenance as-needed  

---

**Dokumen ini adalah living document dan akan di-update seiring perkembangan project.**

*Last Updated: December 2025*
