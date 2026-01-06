# 👥 Klustera.id - User Stories & Personas

**Version:** 1.0.0-concept
**Last Updated:** 2026-01-06
**Status:** Pre-Development

---

## 📋 Overview

Dokumen ini mendefinisikan user personas dan user stories untuk Klustera.id. User stories mencerminkan kebutuhan nyata dari pengelola kompleks perumahan, ketua RT/RW, developer perumahan, dan warga residensial di Indonesia.

---

## 🎯 User Personas

### Persona 1: Budi Santoso - Pengelola Kompleks (Primary)

**Profile:**
- **Nama:** Budi Santoso
- **Umur:** 42 tahun
- **Pekerjaan:** Pengelola Kompleks Perumahan (Full-time)
- **Lokasi:** Tangerang Selatan
- **Kompleks Dikelola:** Grand Harmoni (250 unit)

**Background:**
Budi adalah pengelola kompleks full-time yang mengelola 250 unit rumah di kawasan Tangerang Selatan. Ia bekerja sendirian dengan bantuan 2 satpam dan 3 cleaning service. Sebelumnya, ia bekerja sebagai admin di property management company selama 10 tahun.

**Pain Points:**
- Memproses iuran 250 unit setiap bulan secara manual (Excel, kwitansi ketik, WhatsApp reminder)
- Menagih pembayaran ke 20-30 warga yang telat setiap bulan (sangat melelahkan)
- Pengumuman disebar via WhatsApp group, tapi banyak warga tidak baca
- Keluhan warga datang via WhatsApp personal, jadi sulit dilacak
- Booking fasilitas (clubhouse, kolam renang) masih manual lewat WA, sering double booking
- Laporan keuangan bulanan dibuat manual di Excel, rawan error

**Goals:**
- "Saya ingin sistem yang otomatis kirim tagihan iuran setiap bulan"
- "Saya ingin warga bisa bayar iuran sendiri via transfer atau e-wallet, jadi saya tidak perlu ketemuan"
- "Saya ingin dashboard yang menampilkan siapa yang belum bayar, berapa total tertunggak"
- "Saya ingin sistem yang bisa kirim reminder otomatis ke yang telat bayar"
- "Saya ingin pengumuman yang pasti terbaca oleh semua warga"
- "Saya ingin tracking keluhan warga yang terstruktur (bukan chat WA)"
- "Saya ingin booking fasilitas yang real-time, tidak ada double booking"

**Tech Proficiency:** Medium (bisa pakai Excel, WhatsApp, basic email)

**Quote:**
> "Setiap awal bulan saya stres memikirkan cara menagih iuran ke 250 warga. Ada yang selalu telat, ada yang pura-pura lupa, ada yang hilang dari radar. Kalau ada sistem yang otomatis, hidup saya jauh lebih mudah."

---

### Persona 2: Ibu Ratna - Ketua RT/RW (Secondary)

**Profile:**
- **Nama:** Ratna Sari
- **Umur:** 48 tahun
- **Pekerjaan:** Ibu Rumah Tangga + Ketua RW 05 (Part-time, unpaid)
- **Lokasi:** Bekasi
- **Warga Dikelola:** 150 KK (Kepala Keluarga)

**Background:**
Ibu Ratna adalah ketua RW yang mengelola 150 kepala keluarga di kawasan Bekasi. Ia adalah ibu rumah tangga yang rela mengabdi untuk komunitas. Tidak ada gaji sebagai ketua RW, hanya pengabdian. Ia punya waktu terbatas karena juga harus mengurus keluarga.

**Pain Points:**
- Mengumpulkan iuran kebersihan dan keamanan setiap bulan (sangat memakan waktu)
- Tidak ada sistem yang teratur untuk tracking siapa yang sudah bayar
- Pengumuman RT/RW hanya lewat spanduk di jalan atau WA group, sering tidak sampai
- Warga sering komplain soal kebersihan dan keamanan, tapi tidak ada sistem keluhan
- Tidak ada transparansi keuangan (warga tidak tahu uang iuran dipakai untuk apa)
- Musyawarah untuk keputusan kompleks selalu diadakan fisik, sulit cari waktu yang cocok untuk semua warga

**Goals:**
- "Saya ingin sistem sederhana untuk kirim iuran kebersihan setiap bulan"
- "Saya ingin warga bisa bayar via transfer atau GoPay/OVO, mudah dan praktis"
- "Saya ingin transparansi keuangan (laporannya otomatis)"
- "Saya ingin sistem pengumuman yang pasti dibaca semua warga"
- "Saya ingin warga bisa komplain lewat sistem, bukan chat WA pribadi saya"
- "Saya ingin bisa adakan voting online untuk keputusan-keputusan kompleks"

**Tech Proficiency:** Low to Medium (bisa WhatsApp, basic internet, struggle dengan Excel)

**Quote:**
> "Saya mengabdi sebagai ketua RW tanpa bayar, jadi saya butuh tools yang simple dan tidak memakan banyak waktu. Saya tidak mau dipusingkan dengan admin manual yang bisa diotomasi."

---

### Persona 3: Hendra Wijaya - Developer Perumahan (Tertiary)

**Profile:**
- **Nama:** Hendra Wijaya
- **Umur:** 35 tahun
- **Pekerjaan:** Director di PT Bumi Sejahtera (Developer Perumahan)
- **Lokasi:** Bogor
- **Kompleks Dimiliki:** 8 kompleks (total 1,500 unit)

**Background:**
Hendra adalah developer perumahan yang sudah membangun 8 kompleks perumahan di area Bogor dan sekitarnya. Setiap kompleks memiliki pengelola sendiri, tapi Hendra butuh sistem terpusat untuk memantau kinerja semua kompleks.

**Pain Points:**
- Tidak ada visibility ke kinerja pengelola kompleks (berapa collection rate, berapa komplain)
- Setiap kompleks pakai sistem berbeda (ada yang Excel, ada yang manual, ada yang pakai app berbeda)
- Sulit untuk membandingkan kinerja antar kompleks
- Tidak ada standard operating procedure (SOP) yang konsisten
- Laporan keuangan dari setiap kompleks datang terlambat dan sering tidak akurat
- Sulit untuk mendeteksi kompleks yang bermasalah (collection rate rendah, komplain tinggi)

**Goals:**
- "Saya ingin satu dashboard yang menampilkan kinerja semua 8 kompleks saya"
- "Saya ingin sistem yang sama dipakai di semua kompleks untuk konsistensi"
- "Saya ingin bisa membandingkan kinerja antar kompleks (benchmarking)"
- "Saya ingin laporan otomatis dari setiap kompleks setiap bulan"
- "Saya ingin alert jika ada kompleks yang bermasalah (collection rate drop, komplain naik)"
- "Saya ingin bisa memberikan akses ke pengelola kompleks untuk manage harian, tapi saya tetap punya visibility"

**Tech Proficiency:** High (baca laporan financial, pakai business intelligence tools)

**Quote:**
> "Saya sudah investasi miliaran rupiah untuk bangun 8 kompleks, tapi saya tidak punya visibility ke kinerja mereka. Saya butuh sistem yang memberikan saya data real-time untuk membuat keputusan bisnis yang tepat."

---

### Persona 4: Andi Pratama - Resident/Warga (Quaternary)

**Profile:**
- **Nama:** Andi Pratama
- **Umur:** 32 tahun
- **Pekerjaan:** Software Engineer di Tech Startup
- **Lokasi:** Jakarta Selatan
- **Tinggal di:** Cluster Green Valley (180 unit)

**Background:**
Andi adalah warga kompleks yang sibuk bekerja remote dari rumah. Ia dan istrinya sering lupa untuk bayar iuran kompleks setiap bulan karena tidak ada reminder. Ia juga sering tidak baca pengumuman di WA group karena terlalu banyak chat.

**Pain Points:**
- Sering lupa bayar iuran karena tidak ada reminder otomatis
- Harus ketemu pengelola atau transfer ke rekening pengelola pribadi (tidak transparan)
- Pengumuman di WA group sering tenggelam dengan chat lain
- Tidak tahu bagaimana cara komplain soal masalah di kompleks (sampah tidak diangkat, lampu mati)
- Ingin booking clubhouse untuk acaran keluarga, tapi tidak tahu caranya
- Tidak tahu kemana uang iuran dipakai (tidak ada transparansi)

**Goals:**
- "Saya ingin reminder otomatis via email/WA/WhatsApp setiap kali iuran jatuh tempo"
- "Saya ingin bayar iuran via transfer bank atau e-wallet (GoPay/OVO), mudah dan praktis"
- "Saya ingin bisa lihat riwayat pembayaran iuran saya (sudah bayar berapa, bulan apa yang belum)"
- "Saya ingin pengumuman penting yang tidak tenggelam dengan chat lain"
- "Saya ingin bisa komplain lewat sistem yang simple (bukan chat WA)"
- "Saya ingin bisa booking clubhouse langsung dari HP, tanpa perlu chat pengelola"
- "Saya ingin transparansi keuangan (kemana uang iuran dipakai)"

**Tech Proficiency:** High (software engineer, familiar dengan apps dan digital tools)

**Quote:**
> "Saya sibuk kerja dan sering lupa bayar iuran. Kalau ada sistem yang kirim reminder otomatis dan saya bisa bayar via e-wallet dalam 2 menit, itu sangat membantu. Saya juga ingin transparency soal keuangan kompleks."

---

## 📖 User Stories (Epic-Based)

### Epic 1: Financial Management (Iuran & Tagihan)

#### Story 1.1: Automatic Billing Generation

**As a** pengelola kompleks,
**I want to** generate monthly bills untuk semua units secara otomatis,
**So that** saya tidak perlu input manual 250 tagihan setiap bulan.

**Acceptance Criteria:**
- [ ] Pengelola bisa klik "Generate Monthly Bills" dan sistem membuat tagihan untuk semua units
- [ ] Billing amount calculated otomatis berdasarkan tipe unit dan billing configuration
- [ ] Billing categories (Iuran Kebersihan, Iuran Keamanan, Iuran Satpam, dll) configurable
- [ ] Bills generated pada tanggal 1 setiap bulan secara otomatis (cron job)
- [ ] Pengelola bisa review bills sebelum kirim ke residents
- [ ] Pengelola bisa adjust individual bill amount jika ada special case
- [ ] Bills bisa dikirim ke residents via email/WA/WhatsApp dalam 1 klik

**Priority:** High (P0)
**Estimate:** 5 story points

---

#### Story 1.2: Online Payment

**As a** resident,
**I want to** pay my bills via bank transfer atau e-wallet,
**So that** saya tidak perlu ketemu pengelola atau transfer ke rekening pribadi.

**Acceptance Criteria:**
- [ ] Resident bisa melihat semua outstanding bills di portal
- [ ] Resident bisa klik "Pay Now" dan diarahkan ke payment page (Midtrans)
- [ ] Payment methods supported:
  - Virtual Account (BCA, Mandiri, BNI, BRI)
  - E-wallets (GoPay, OVO, Dana)
  - Credit Card (optional untuk MVP)
- [ ] Setelah payment successful, bill status otomatis update ke "Paid"
- [ ] Resident menerima payment confirmation via email/WA/WhatsApp
- [ ] Pengelola menerima notification via email/WA/WhatsApp
- [ ] Payment history available untuk resident view

**Priority:** High (P0)
**Estimate:** 8 story points

---

#### Story 1.3: Payment Reminder Automation

**As a** pengelola kompleks,
**I want to** sistem kirim reminder otomatis ke residents yang belum bayar,
**So that** saya tidak perlu kirim manual reminder ke 20-30 orang setiap bulan.

**Acceptance Criteria:**
- [ ] Reminder otomatis dikirim via email/SMS/WhatsApp:
  - 7 days sebelum due date
  - Pada due date
  - 3 days setelah due date (late fee warning)
  - 7 days setelah due date (second reminder)
  - 14 days setelah due date (final warning)
- [ ] Reminder content customizable oleh pengelola (template)
- [ ] Resident bisa klik link di reminder untuk langsung bayar
- [ ] Pengelola bisa view reminder history (siapa yang sudah dikirim reminder berapa kali)
- [ ] System track berapa banyak reminder yang dikirim sebelum resident bayar

**Priority:** High (P0)
**Estimate:** 5 story points

---

#### Story 1.4: Financial Dashboard

**As a** pengelola kompleks,
**I want to** dashboard yang menampilkan collection metrics secara real-time,
**So that** saya tahu seberapa healthy keuangan kompleks saya.

**Acceptance Criteria:**
- [ ] Dashboard menampilkan:
  - Total collected this month (Rp XX,XXX,XXX)
  - Outstanding amount (Rp XX,XXX,XXX)
  - Collection rate percentage (XX%)
  - Number of overdue residents (XX residents)
  - Top 5 residents dengan tertunggak tertinggi
- [ ] Filterable by month/year
- [ ] Comparison dengan bulan sebelumnya (growth/decline)
- [ ] Drill-down ke detail: klik "30 overdue residents" untuk lihat list
- [ ] Export laporan ke Excel/CSV

**Priority:** High (P1)
**Estimate:** 5 story points

---

### Epic 2: Resident Portal (Pengumuman & Komunikasi)

#### Story 2.1: Announcement Creation & Delivery

**As a** pengelola kompleks,
**I want to** membuat pengumuman dan mengirimkannya ke semua residents dengan cara yang pasti terbaca,
**So that** pengumuman penting tidak missed oleh warga.

**Acceptance Criteria:**
- [ ] Pengelola bisa create announcement dengan rich text editor
- [ ] Announcement categories: Penting, Info Kompleks, Kegiatan Komunitas, Maintenance Notice
- [ ] Targeting options:
  - All residents
  - Specific blok/cluster
  - Specific residents (by name)
- [ ] Pengelola bisa schedule announcement delivery (send now atau schedule untuk later)
- [ ] Residents menerima notification via:
  - In-app notification (bell icon)
  - Email (jika email provided)
  - WhatsApp/SMS (jika phone provided, untuk "Penting" category only)
- [ ] Pengelola bisa see read receipt (berapa banyak yang sudah baca)
- [ ] Announcement history available dengan search/filter

**Priority:** High (P0)
**Estimate:** 5 story points

---

#### Story 2.2: Voting System untuk Keputusan Kompleks

**As a** ketua RT/RW,
**I want to** buat voting/poll online untuk keputusan kompleks,
**So that** tidak perlu adakan musyawarah fisik yang sulit jadwalkan.

**Acceptance Criteria:**
- [ ] Pengelola/ketua RT bisa create poll:
  - Question (e.g., "Apakah setuju jika iuran keamanan naik 10%?")
  - Options (multiple choice)
  - Single select atau multiple select
  - Expiration date (e.g., 7 days from now)
- [ ] Residents bisa vote (sekali per poll)
- [ ] Real-time result display (percentage dan count per option)
- [ ] Anonymous voting (residents tidak bisa lihat siapa pilih apa)
- [ ] Result otomatis revealed setelah expiration date
- [ ] Export result ke Excel untuk dokumentasi rapat

**Priority:** Medium (P1)
**Estimate:** 3 story points

---

#### Story 2.3: Document Repository

**As a** resident,
**I want to** akses dokumen-dokumen penting kompleks (peraturan, laporan keuangan, meeting minutes),
**So that** saya tahu rules dan transparansi keuangan kompleks.

**Acceptance Criteria:**
- [ ] Pengelola bisa upload dokumen (PDF, Word, Excel)
- [ ] Document categories:
  - Peraturan Kompleks
  - Laporan Keuangan (summary only, tidak detail per resident)
  - Meeting Minutes
  - Formulir/Aplikasi
- [ ] All residents bisa view dan download dokumen
- [ ] Document versioning (jika ada update, versi lama diarsipkan)
- [ ] Pengelola bisa track berapa banyak download per dokumen

**Priority:** Medium (P2)
**Estimate:** 3 story points

---

### Epic 3: Complaint Tracking (Keluhan Warga)

#### Story 3.1: Complaint Submission

**As a** resident,
**I want to** submit keluhan lewat sistem yang terstruktur,
**So that** keluhan saya tidak hilang di chat WA dan bisa dilacak.

**Acceptance Criteria:**
- [ ] Resident bisa submit complaint via portal atau mobile app:
  - Category: Kebersihan, Keamanan, Facility, Lainnya
  - Priority: Low, Medium, High, Urgent
  - Description (text box)
  - Photo upload (opsional, max 3 photos)
  - Location (blok, nomor, area)
- [ ] Setelah submit, resident dapat ticket number (e.g., CMP-2024-001)
- [ ] Resident menerima confirmation email/WA dengan ticket number
- [ ] Resident bisa view status complaint saya (Open, In Progress, Resolved, Closed)

**Priority:** High (P0)
**Estimate:** 3 story points

---

#### Story 3.2: Complaint Assignment & SLA Tracking

**As a** pengelola kompleks,
**I want to** assign complaint ke staff/satpam/technician dan track SLA,
**So that** semua complaints ditangani dengan tepat waktu.

**Acceptance Criteria:**
- [ ] Pengelola view dashboard all complaints dengan status
- [ ] Pengelola bisa assign complaint ke staff (satpam, cleaning service, technician)
- [ ] Staff receive notification via email/WA/WhatsApp saat ada assignment
- [ ] SLA tracking:
  - Response time target: < 4 hours untuk High/Urgent, < 24 hours untuk Medium, < 48 hours untuk Low
  - Resolution time target: < 24 hours untuk Urgent, < 3 days untuk High, < 7 days untuk Medium, < 14 days untuk Low
- [ ] Alert jika complaint melewati SLA (overdue complaints highlighted di dashboard)
- [ ] Pengelola bisa view staff performance (berapa complaints resolved per staff)

**Priority:** High (P1)
**Estimate:** 5 story points

---

#### Story 3.3: Complaint Communication

**As a** resident,
**I want to** bisa chat dengan pengelola/staff tentang complaint saya,
**So that** saya bisa update info tambahan atau tanya progress.

**Acceptance Criteria:**
- [ ] Resident bisa add comment di complaint page (text only, no photo)
- [ ] Pengelola/staff bisa reply comment
- [ ] Notification sent ke resident setiap kali ada update (status change atau new comment)
- [ ] Notification sent ke pengelola/staff setiap kali resident add comment
- [ ] Comment history available di complaint detail page

**Priority:** Medium (P2)
**Estimate:** 3 story points

---

### Epic 4: Facility Booking

#### Story 4.1: View Facility Availability & Booking

**As a** resident,
**I want to** lihat ketersediaan fasilitas dan booking slot waktu,
**So that** saya bisa gunakan clubhouse/lapangan tanpa perlu chat pengelola.

**Acceptance Criteria:**
- [ ] Resident bisa lihat semua facilities di kompleks (Clubhouse, Kolam Renang, Lapangan Badminton, Gym)
- [ ] Resident bisa lihat calendar view (monthly, weekly, daily)
- [ ] Available slots shown hijau, booked slots shown merah
- [ ] Resident bisa select facility → select date → select time slot → select duration
- [ ] Resident bisa add notes (e.g., "Untuk ulang tahun anak")
- [ ] Sistem show booking summary (facility, date, time, duration, notes)
- [ ] Resident confirm booking
- [ ] If facility is paid, resident redirected ke payment page (Midtrans)

**Priority:** High (P1)
**Estimate:** 5 story points

---

#### Story 4.2: Booking Management

**As a** resident,
**I want to** manage booking saya (view, cancel, reschedule),
**So that** saya punya kontrol penuh atas bookings saya.

**Acceptance Criteria:**
- [ ] Resident bisa view "My Bookings" page:
  - Upcoming bookings (status, date, time)
  - Past bookings (history)
- [ ] Resident bisa cancel booking dengan rules:
  - Cancellation allowed max 24 hours sebelum booking time
  - If paid, refund processed ke original payment method
  - Cancellation fee (e.g., 10%) jika kurang dari 24 hours
- [ ] Resident receive confirmation email/WA setelah cancel
- [ ] Resident cannot reschedule (must cancel dan re-book)

**Priority:** Medium (P2)
**Estimate:** 3 story points

---

#### Story 4.3: Facility Management untuk Pengelola

**As a** pengelola kompleks,
**I want to** manage facilities (set capacity, operating hours, pricing),
**So that** sistem sesuai dengan rules kompleks saya.

**Acceptance Criteria:**
- [ ] Pengelola bisa create/edit/delete facilities:
  - Facility name
  - Capacity (max concurrent users, e.g., 50 orang untuk clubhouse)
  - Operating hours (e.g., 08:00 - 22:00)
  - Pricing (free atau paid per hour)
  - Description
- [ ] Pengelola bisa view facility usage analytics:
  - Most booked facilities
  - Peak usage times (jam berapa paling ramai)
  - No-show rate (booking tapi tidak datang)
  - Revenue per facility (jika paid)

**Priority:** Low (P2)
**Estimate:** 3 story points

---

### Epic 5: Multi-Complex Management (Developer Perumahan)

#### Story 5.1: Centralized Dashboard

**As a** developer perumahan,
**I want to** satu dashboard yang menampilkan kinerja semua kompleks saya,
**So that** saya bisa compare dan identify kompleks yang bermasalah.

**Acceptance Criteria:**
- [ ] Developer bisa view list semua complexes dengan key metrics:
  - Total units
  - Collection rate (%)
  - Outstanding amount
  - Number of complaints (open)
  - Average complaint resolution time
- [ ] Developer bisa click complex untuk drill-down ke detail
- [ ] Developer bisa compare complexes side-by-side:
  - Collection rate comparison (graph)
  - Complaint volume comparison
- [ ] Developer bisa filter by region atau complex size

**Priority:** Medium (P1)
**Estimate:** 5 story points

---

#### Story 5.2: Automated Reporting

**As a** developer perumahan,
**I want to** laporan otomatis dari setiap kompleks setiap bulan,
**So that** saya tidak perlu nanti-nanti report ke pengelola.

**Acceptance Criteria:**
- [ ] System otomatis generate monthly report untuk setiap complex pada tanggal 1 setiap bulan:
  - Financial summary (total collected, outstanding, collection rate)
  - Operational summary (complaint volume, resolution time, facility usage)
  - Comparison dengan bulan sebelumnya
- [ ] Report sent ke developer via email (PDF attachment)
- [ ] Developer bisa juga download report dari dashboard
- [ ] Developer bisa schedule custom report (e.g., quarterly report)

**Priority:** Low (P2)
**Estimate:** 3 story points

---

### Epic 6: Guest Management (v2.0 Feature)

#### Story 6.1: Guest Pre-Registration

**As a** resident,
**I want to** pre-register guest saya sebelum mereka datang,
**So that** satpam di gate sudah tahu dan tidak perlu call saya.

**Acceptance Criteria:**
- [ ] Resident bisa add guest:
  - Guest name
  - Phone number
  - Vehicle plate (opsional)
  - Date & time of visit
  - Duration (e.g., 2 hours)
- [ ] System generate QR code/barcode untuk guest
- [ ] Resident bisa share QR code ke guest via WhatsApp/SMS
- [ ] Guest bisa show QR code di gate untuk check-in
- [ ] Satpam bisa scan QR code dan verify guest details

**Priority:** Medium (P1, v2.0)
**Estimate:** 5 story points

---

#### Story 6.2: Guest Arrival Notification

**As a** resident,
**I want to** menerima notification ketika guest saya sampai di gate,
**So that** saya bisa persiapkan atau turun ke lobi untuk jemput.

**Acceptance Criteria:**
- [ ] System detect guest check-in via QR scan
- [ ] System send notification ke resident:
  - "Guest Anda [Nama Guest] sudah sampai di gate pada [Time]"
  - Via WhatsApp/SMS/push notification (mobile app)
- [ ] Notification sent dalam < 30 seconds setelah guest check-in
- [ ] Resident bisa view guest history (siapa saja yang pernah visit, kapan)

**Priority:** Medium (P1, v2.0)
**Estimate:** 3 story points

---

## 🎯 User Story Prioritization

### MVP (Milestone 1-4) - Must Have

**Epic 1: Financial Management**
- Story 1.1: Automatic Billing Generation (P0)
- Story 1.2: Online Payment (P0)
- Story 1.3: Payment Reminder Automation (P0)
- Story 1.4: Financial Dashboard (P1)

**Epic 2: Resident Portal**
- Story 2.1: Announcement Creation & Delivery (P0)
- Story 2.2: Voting System (P1)
- Story 2.3: Document Repository (P2)

**Epic 3: Complaint Tracking**
- Story 3.1: Complaint Submission (P0)
- Story 3.2: Complaint Assignment & SLA Tracking (P1)
- Story 3.3: Complaint Communication (P2)

**Epic 4: Facility Booking**
- Story 4.1: View Facility Availability & Booking (P1)
- Story 4.2: Booking Management (P2)
- Story 4.3: Facility Management untuk Pengelola (P2)

### Post-MVP (Milestone 7+) - Nice to Have

**Epic 5: Multi-Complex Management**
- Story 5.1: Centralized Dashboard (P1)
- Story 5.2: Automated Reporting (P2)

**Epic 6: Guest Management**
- Story 6.1: Guest Pre-Registration (P1, v2.0)
- Story 6.2: Guest Arrival Notification (P1, v2.0)

---

## 📊 User Story Matrix

| Epic | Total Stories | P0 (Critical) | P1 (High) | P2 (Medium) | MVP Scope |
|------|--------------|---------------|-----------|-------------|-----------|
| Financial Management | 4 | 3 | 1 | 0 | ✅ All |
| Resident Portal | 3 | 1 | 1 | 1 | ✅ All (P2 optional) |
| Complaint Tracking | 3 | 1 | 1 | 1 | ✅ All (P2 optional) |
| Facility Booking | 3 | 0 | 2 | 1 | ✅ P0 + P1 |
| Multi-Complex Management | 2 | 0 | 1 | 1 | ❌ Post-MVP |
| Guest Management | 2 | 0 | 2 | 0 | ❌ v2.0 |
| **Total** | **17** | **5** | **8** | **4** | **14 Stories** |

**MVP Story Points Estimate:** ~50 story points (assuming 2-week sprints dengan 20-25 story points per sprint = 4-5 sprints = 8-10 weeks development, aligns dengan Milestone 1-4 timeline)

---

## 🔄 User Feedback Loop

**Beta Testing (Milestone 5):**
- Recruit 5 pilot complexes dari 4 personas (Budi, Ibu Ratna, Hendra, Andi types)
- Conduct weekly feedback sessions (30 min setiap minggu)
- Collect feedback via:
  - In-app feedback form (thumbs up/down + comment)
  - Quarterly survey (Net Promoter Score)
  - 1-on-1 interviews (depth feedback)

**Feedback Categories:**
1. **Usability:** Apakah UI intuitive? Apakah ada confusion?
2. **Feature Fit:** Apakah features solve their problems? Apakah ada missing features?
3. **Performance:** Apakah system fast enough? Apakah ada lag?
4. **Bugs:** Apakah ada errors atau unexpected behaviors?
5. **Support:** Apakah documentation cukup? Apakah butuh training lebih?

**Feedback Integration:**
- Critical bugs: Fix dalam 24 hours
- High priority improvements: Add ke backlog untuk next sprint
- Low priority suggestions: Park untuk future releases (v2.0+)

---

## 📝 Validation Plan

**Pre-Development Validation (Recommended):**
Sebelum mulai development, validate personas dan problems dengan:

1. **Customer Interviews** (5-10 pengelola kompleks)
   - "Bagaimana cara Anda manage iuran saat ini?"
   - "Berapa banyak waktu yang Anda habiskan untuk admin iuran setiap bulan?"
   - "Apakah Anda pernah miss payment karena proses manual?"
   - "Apakah Anda willing to pay untuk software solution? Berapa?"

2. **Observation** (Visit 2-3 complexes)
   - Observe pengelola bekerja (berapa manual, apa pain points nyata)
   - Lihat tools yang mereka pakai (Excel, WA, manual book)
   - Measure collection rate saat ini (berapa persen yang bayar on-time)

3. **Survey** (Online survey ke 50+ pengelola kompleks)
   - Top 3 challenges dalam manajemen kompleks
   - Current tools yang dipakai
   - Willingness to pay untuk software solution
   - Feature prioritization (apa yang most important)

**Note:** Produk ini masih CONCEPT tanpa market validation. Disarankan untuk melakukan validation di atas sebelum mulai development.

---

**Last Updated:** 2026-01-06
**User Stories Version:** 1.0.0
**Maintainer:** Najib - Akordium Lab

**Note:** User stories akan terus di-update berdasarkan customer feedback dan market changes selama development process.
