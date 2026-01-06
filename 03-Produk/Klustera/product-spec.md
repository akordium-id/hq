# 📦 Klustera.id - Product Specifications

> Detailed product specifications untuk Klustera.id Housing Management Platform

## 🎯 Product Vision

**Vision Statement:** Menjadi platform manajemen perumahan terdepan di Indonesia yang menggabungkan transparansi open-source dengan kemudahan penggunaan modern, mentransformasi pengelolaan kompleks perumahan tradisional menjadi sistem digital yang efisien dan terpercaya.

**Mission Statement:** Memberdayakan pengelola kompleks perumahan dan developer properti dengan teknologi modern untuk mengoptimalkan operasional, meningkatkan transparansi keuangan kepada warga, dan menciptakan lingkungan hunian yang aman dan nyaman.

**North Star Metric:** Jumlah unit perumahan yang dikelola melalui platform Klustera.id.

---

## 😊 Problem Statement

### Core Problems

1. **Inefficient Financial Management**
   - Manual invoice generation (Excel, Word)
   - Difficult payment tracking (siapa sudah bayar, siapa belum)
   - Tidak ada otomatisasi reminder untuk tunggakan iuran
   - Rekapitulasi keuangan manual dan error-prone
   - **Impact:** 60-70% collection rate di banyak kompleks, cash flow issues untuk pengurus

2. **Lack of Transparency**
   - Warga tidak tahu bagaimana iuran digunakan
   - Trust issues antara pengurus dan warga
   - Curangan pengelolaan dana sering terjadi
   - **Impact:** Konflik antar warga, reluctance untuk membayar iuran

3. **Manual Access Control**
   - Tamu harus dicatat manual di security post
   - Warga lupa membawa access card
   - Tidak ada log siapa masuk/keluar kompleks
   - **Impact:** Security risks, administrative burden untuk satpam

4. **Poor Communication**
   - Pengumuman hanya lewat bocoran atau Mailing List
   - Warga sering miss important announcements
   - Tidak ada platform untuk musyawarah kompleks
   - **Impact:** Low engagement, miscommunication

5. **Operational Inefficiency**
   - Complaint warga sering tidak ter-follow up
   - Booking fasilitas (lapangan, hall) manual
   - Cleaning & security tasks tidak termonitor
   - **Impact:** Resident dissatisfaction, wasted resources

6. **Lack of Data Insights**
   - Pengurus tidak tahu trends keuangan
   - Tidak ada analytics facility usage
   - Sulit membuat keputusan berbasis data
   - **Impact:** Sub-optimal resource allocation

### Current Solutions & Their Limitations

**Excel / Google Sheets:**
- ❌ Manual data entry, error-prone
- ❌ Tidak ada payment integration
- ❌ Collaboration issues (versioning)
- ❌ Tidak mobile-friendly

**WhatsApp Groups:**
- ❌ Announcement mudah hilang di scroll
- ❌ Tidak ada structured database
- ❌ Privacy issues (all residents can see all numbers)
- ❌ Sulit track action items

**Custom Built Systems:**
- ❌ Expensive (Rp 50-100M+ development cost)
- ❌ Black box (trust issues, corruption concerns)
- ❌ Rigid, sulit customize
- ❌ Vendor lock-in

---

## ✨ Solution Overview

Klustera.id adalah **all-in-one housing management platform** dengan:

1. **Automated Billing & Payment Management**
   - Invoice generation otomatis setiap bulan
   - Integrasi Xendit (QRIS, Virtual Account, E-Wallet)
   - Payment tracking & real-time status
   - Auto-reminder untuk tunggakan (WhatsApp + Email)
   - Laporan keuangan otomatis

2. **Transparent Resident Portal**
   - Warga bisa lihat tagihan & payment history
   - Transparansi penggunaan dana (agregat, bukan per-unit)
   - Pengumuman terstruktur dengan notification
   - Online voting untuk keputusan kompleks
   - **Open-source code** = warga bisa verify tidak ada curang

3. **Smart Access Control**
   - QR code di smartphone (tidak perlu kartu fisik)
   - Guest pre-registration (warga approve via app)
   - Security post tablet view (guard mode)
   - Access log & history (audit trail)

4. **Efficient Operations Management**
   - Complaint tracking dengan SLA
   - Facility booking system (real-time availability)
   - Task management untuk cleaning & security staff
   - Photo verification untuk completed tasks

5. **Data-Driven Analytics**
   - Financial dashboards untuk pengurus
   - Collection rate tracking & trends
   - Facility usage analytics
   - Exportable reports (PDF, Excel) untuk rapat pengurus

6. **Mobile Apps for Staff**
   - Satpam app: patrol tracking, incident reporting
   - Cleaning app: task checklists, photo verification
   - Facility app: maintenance tickets
   - **Offline-first** (works tanpa internet)

### Key Differentiators

| Feature | Klustera.id | Competitors | Advantage |
|---------|-------------|-------------|-----------|
| **Code Transparency** | ✅ Open-source (AGPL) | ❌ Black box | Trust building di Indonesia market |
| **Pricing** | Rp 3,500-5,000/unit/month | Rp 10,000+/unit/month | 50-70% cheaper |
| **Mobile Staff Apps** | ✅ Native, offline-first | ❌ Web only or none | Better untuk areas dengan poor connectivity |
| **Access Control** | ✅ QR-based guest management | ❌ Manual or card-based | Modern & convenient |
| **Payment Integration** | ✅ Xendit (all methods) | ⚠️ Limited options | Higher payment success rate |
| **Setup Speed** | < 1 week | 1-3 months | Faster time-to-value |
| **Customization** | ✅ Open-source, bisa modify | ❌ Rigid | Fit local needs |

---

## 👥 Target Market

### Primary Market: Urban Middle-Class Housing Complexes (200-500 units)

**Demographics:**
- **Location:** Jabodetabek (Jakarta, Bogor, Depok, Tangerang, Bekasi)
- **Unit Count:** 200-500 units per complex
- **Property Value:** Rp 800M - Rp 2M per unit
- **Monthly Iuran:** Rp 500K - Rp 2M per unit
- **Resident Profile:** Middle to upper-middle class, tech-savvy, professionals

**Characteristics:**
- Pain point: Busy professionals, tidak ada waktu untuk manual management
- Budget: Mampu membayar Rp 1-1.5M/bulan untuk platform (cheaper dari hiring admin)
- Decision Maker: Pengurus kompleks (biasanya 3-5 orang volunteer)
- Tech Readiness: High (90%+ smartphone penetration, familiar dengan digital payments)

**Buying Motivations:**
- Transparency: Open-source code = tidak ada curang
- Convenience: Satu platform untuk semua needs
- Affordability: Cheaper dari hiring 1 admin staff (Rp 3-5M/bulan)
- Modern: QR code access, mobile apps, online payments

### Secondary Market: Property Management Companies & RT/RW Modern

**Characteristics:**
- Manage multiple complexes (5-20+)
- Need consolidated reporting across all complexes
- Willing to pay premium untuk efficiency
- Require white-label branding options

**Estimated Market Size:**
- Indonesia has 10,000+ modern housing complexes
- Jabodetabek: ~3,000 complexes (primary target)
- 200-500 unit complexes: ~40% of total = 1,200 complexes in Jabodetabek
- Total addressable market (TAM): 10,000 complexes × 300 units avg = 3M units

### Tertiary Market: Large Property Developers (Multi-Complex)

**Target Customers:**
- Ciputra Group, Permata, Summarecon, Bumi Serpong Damai, etc.
- Manage dozens of complexes
- Need enterprise features (multi-complex management, API, custom integrations)
- Willing to pay Rp 10-50M/month

**Market Size:**
- Top 20 property developers in Indonesia
- Each manages 10-100+ complexes
- High-value, low-volume market

---

## 👤 User Personas

### Persona 1: Budi Santoso - Property Manager (Pengurus Kompleks)

**Demographics:**
- **Age:** 45 years old
- **Occupation:** Civil engineer, complex volunteer
- **Tech Savviness:** Medium (uses Excel, WhatsApp, email)
- **Time Availability:** 2-5 hours/week untuk complex management

**Goals:**
- Reduce time spent on administrative tasks
- Improve collection rate (currently only 65%)
- Provide transparency to residents to reduce conflicts
- Make data-driven decisions (facility maintenance, budgeting)

**Pain Points:**
- Spending 10+ hours/week on manual invoice generation
- Constant conflicts with residents about financial transparency
- Difficult to chase late payments (awkward conversations)
- No visibility into operational tasks (cleaning, security)

**Quote:**
> "Saya kerja lembur setiap hari, masih harus urus admin kompleks. Kadang sampai lupa tagih iuran ke tetangga sendiri. Susah juga ngatur cleaning & security kalau tidak ada monitoring."

**Klustera Value Proposition:**
- Automated billing = saves 8 hours/week
- Transparent financial portal = fewer conflicts with residents
- Automated payment reminders = no awkward conversations
- Staff task management = operational oversight without micromanaging

---

### Persona 2: Siti Aminah - Resident (Warga)

**Demographics:**
- **Age:** 32 years old
- **Occupation:** Marketing manager at startup
- **Tech Savviness:** High (mobile-first, digital payments)
- **Living Situation:** Owns unit in 300-unit complex, lived there 2 years

**Goals:**
- Pay iuran conveniently (online, anytime)
- Know where her money goes (transparency)
- Receive important announcements (not miss anything)
- Book facilities easily (lapangan badminton untuk family)

**Pain Points:**
- Lupa transfer iuran (busy work schedule)
- Tidak tahu bagaimana iuran digunakan (is it wasted?)
- Miss announcements di WhatsApp group (too many messages)
- Must call security untuk booking facility (inconvenient)
- Concerned about security (strangers entering complex freely)

**Quote:**
> "Setiap bulan harus inget transfer iuran, padahal sibuk banget. Terus nggak tahu juga dana kita dipakai buat apa. Pengumuman di WA sering kelewat karena terlalu banyak chat."

**Klustera Value Proposition:**
- Auto-pay with Xendit = never forget to pay
- Transparent financial dashboard = trust in management
- Push notifications = never miss announcements
- Online facility booking = convenient, real-time availability
- Guest pre-registration = better security

---

### Persona 3: Pak Joko - Security Guard (Satpam)

**Demographics:**
- **Age:** 52 years old
- **Occupation:** Security guard at complex (6 years experience)
- **Tech Savviness:** Low to Medium (uses WhatsApp, basic smartphone)
- **Education:** High school graduate

**Goals:**
- Perform patrols efficiently
- Report incidents quickly
- Know which guests are approved
- Avoid conflicts with residents

**Pain Points:**
- Manual guest log (paper-based, slow)
- Must call resident untuk verify guest (wasting time)
- Patrol tracking manual (buku patroli)
- Difficult to report incidents (must call pengurus)

**Quote:**
> "Kalau ada tamu, harus telp dulu tuan rumah. Kalau tidak angkat, tamu menunggu. Ribet juga isi buku patroli setiap round."

**Klustera Value Proposition:**
- Guest pre-registration = residents approve in advance, guard sees verified guests
- Tablet view at security post = modern interface, easy to use
- Mobile app for patrol = GPS tracking, photo incident reports
- No more calling residents = faster guest processing

---

### Persona 4: Ibu Susi - Cleaning Service Coordinator

**Demographics:**
- **Age:** 38 years old
- **Occupation:** Leads cleaning team (5 staff)
- **Tech Savviness:** Medium (uses WhatsApp, Instagram)
- **Education:** Vocational high school

**Goals:**
- Ensure all areas cleaned according to schedule
- Track staff performance
- Report equipment/supply needs
- Receive resident feedback

**Pain Points:**
- Manual checklist (kertas, mudah hilang)
- Tidak ada proof cleaning was done properly
- Sulit track staff yang tidak perform
- Supplies sering habis tidak ada yang report

**Quote:**
> "Saya nggak tahu kalau ada staff yang malas. Checklist sering hilang. Kita juga sering kehabisan sabun atau pewangi tapi nggak ada yang lapor."

**Klustera Value Proposition:**
- Mobile app with task checklist = staff check off completed tasks
- Photo verification = proof of cleaning quality
- GPS tracking = ensure staff was at location
- Supply request feature = never run out of cleaning materials

---

### Persona 5: Hendra Wijaya - Property Developer

**Demographics:**
- **Age:** 50 years old
- **Occupation:** Director at mid-sized property developer
- **Portfolio:** 8 completed complexes, 3 under construction
- **Annual Revenue:** Rp 50-100M from complex management fees

**Goals:**
- Standardize management across all complexes
- Reduce operational costs
- Improve resident satisfaction (better for future projects)
- Consolidated reporting untuk board meetings

**Pain Points:**
- Each complex uses different systems (Excel, manual)
- Difficult to get consolidated view of all complexes
- High overhead costs (admin staff di setiap complex)
- Resident complaints about transparency

**Quote:**
> "Setiap kompleks pakai sistem berbeda. Saya sulit monitor performance. Biaya admin juga tinggi, makan margin kita."

**Klustera Value Proposition:**
- Multi-complex management = one platform for all properties
- Consolidated reporting = board-ready reports in minutes
- Standardized processes = consistency across complexes
- Reduce overhead = fewer admin staff needed per complex

---

## 🚀 Core Features

### Feature Area 1: Financial Management (Iuran & Tagihan)

**Priority:** P0 (Critical)

#### 1.1 Invoice Generation

**Description:** Automated monthly invoice generation untuk setiap unit

**Capabilities:**
- Setup fee structures (IPL, kebersihan, keamanan, air, listrik, etc.)
- Recurring billing automation (generate on schedule, e.g., 1st of every month)
- Customizable fee per unit (some units pay different amounts)
- Prorata calculations untuk new residents mid-month
- Penalty/late fee calculations
- PDF invoice generation dengan custom branding

**User Stories:**
- As a **property manager**, I want to set up fee structures so that invoices are generated automatically
- As a **property manager**, I want to customize fees per unit so that penthouse units pay more
- As a **resident**, I want to receive itemized invoices so I know what I'm paying for

**Acceptance Criteria:**
- [ ] Can create fee types (IPL, kebersihan, keamanan)
- [ ] Can set fee amounts per unit type
- [ ] Invoices generated automatically on scheduled date
- [ ] PDF invoices downloadable by residents
- [ ] Prorata calculations work correctly for mid-month move-ins

**Technical Requirements:**
- Job scheduling (Laravel Queue + database scheduler)
- PDF generation (DomPDF atau Snappy)
- Database entities: `fee_types`, `fee_structures`, `invoices`, `invoice_items`

---

#### 1.2 Payment Integration (Xendit)

**Description:** Accept online payments melalui Xendit gateway

**Capabilities:**
- QRIS payments (scan QR code di resident portal)
- Virtual Account (BCA, Mandiri, BNI, BRI, etc.)
- E-Wallet integration (GoPay, OVO, DANA, ShopeePay)
- Credit/Debit Card payments
- Payment auto-reconciliation via webhook
- Payment expiration handling
- Partial payment support (e.g., pay in installments)

**User Stories:**
- As a **resident**, I want to pay via QRIS so I can use GoPay/OVO
- As a **resident**, I want to pay via Virtual Account so I can transfer from banking app
- As a **property manager**, I want automatic payment reconciliation so I don't manually update spreadsheets
- As a **property manager**, I want to receive notifications when payments are made

**Acceptance Criteria:**
- [ ] QRIS payment flow works (generate QR → resident scans → Xendit processes → webhook updates status)
- [ ] Virtual Account payment flow works
- [ ] E-Wallet payment flow works
- [ ] Webhook handler correctly updates invoice status
- [ ] Payment notifications sent via WhatsApp & Email
- [ ] Failed payments handled gracefully with retry logic

**Technical Requirements:**
- Xendit API integration
- Webhook handler dengan signature verification
- Idempotent payment processing (handle duplicate webhooks)
- Payment status tracking: `pending`, `paid`, `failed`, `expired`, `refunded`

---

#### 1.3 Payment Tracking & Reporting

**Description:** Track payment status dan generate financial reports

**Capabilities:**
- Real-time payment status dashboard
- Outstanding AR tracking (siapa belum bayar)
- Collection rate analytics (bulan ini vs bulan lalu)
- Payment trend reports (6-month, 12-month views)
- Export reports to PDF/Excel (untuk rapat pengurus)
- Budget vs actual reporting
- Late fee calculations dan tracking

**User Stories:**
- As a **property manager**, I want to see collection rate for this month so I know if we're on target
- As a **property manager**, I want to export financial reports to Excel untuk rapat pengurus
- As a **property manager**, I want to see which units are overdue so I can send reminders

**Acceptance Criteria:**
- [ ] Dashboard shows: Total billed, Total collected, Outstanding AR, Collection rate %
- [ ] Can filter reports by date range, fee type, payment status
- [ ] Export to Excel generates formatted .xlsx file
- [ ] Export to PDF generates report with charts
- [ ] Drill-down from month → unit → individual payment

**Technical Requirements:**
- Chart.js atau Chart library untuk visualizations
- Laravel Excel (PHPSpreadsheet) untuk Excel exports
- Aggregation queries optimized untuk large datasets (1000+ units)

---

### Feature Area 2: Resident Portal & Communication

**Priority:** P0 (Critical)

#### 2.1 Resident Authentication & Dashboard

**Description:** Resident login dengan personalized dashboard

**Capabilities:**
- Registration (by admin invitation atau self-registration with verification)
- Login dengan email/phone + OTP
- Forgot password flow
- Resident dashboard showing:
  - Outstanding invoices
  - Payment history
  - Recent announcements
  - Active complaints
  - Upcoming facility bookings

**User Stories:**
- As a **resident**, I want to log in with my phone number so I don't need to remember password
- As a **resident**, I want to see my outstanding balance at a glance
- As a **resident**, I want to see my payment history so I can verify payments

**Acceptance Criteria:**
- [ ] Self-registration works with phone number verification
- [ ] Dashboard displays: unpaid invoices count, total amount due, last payment date
- [ ] Payment history is paginated (show last 10 payments)
- [ ] Mobile-responsive design works on smartphones

**Technical Requirements:**
- Laravel Sanctum untuk API authentication
- OTP gateway integration (WhatsApp SMS)
- Role-based access control (residents only see their own data)

---

#### 2.2 Announcement System

**Description:** Pengumuman kompleks dengan rich content dan notifications

**Capabilities:**
- Create announcements dengan rich text editor
- Target announcements by: all residents, specific blocks, specific units
- Push notifications (WhatsApp + Email + In-app)
- Announcement categories: Important, Info, Event, Security Alert
- Announcement expiry date
- Read receipt tracking
- Announcement comments (optional, can be disabled)

**User Stories:**
- As a **property manager**, I want to send announcements to all residents via WhatsApp
- As a **property manager**, I want to target specific blocks for maintenance announcements
- As a **resident**, I want to receive push notifications for important announcements
- As a **property manager**, I want to know who has read the announcement

**Acceptance Criteria:**
- [ ] Announcement creation includes title, content, category, target audience
- [ ] WhatsApp notifications sent to all targeted residents
- [ ] Email notifications sent as backup
- [ ] Read receipt tracking shows % of residents who read announcement
- [ ] Announcement list is paginated with search and filters

**Technical Requirements:**
- Rich text editor (TinyMCE atau Quill)
- WhatsApp gateway API integration
- Email queue (Laravel Queue)
- Database entities: `announcements`, `announcement_recipients`, `read_receipts`

---

#### 2.3 Online Voting System

**Description:** Musyawarah kompleks decisions dengan online voting

**Capabilities:**
- Create voting topics (e.g., "Increase IPL by 10%?")
- Set voting deadline
- Anonymous voting atau identified voting
- Voting options: Yes/No/Abstain atau multiple choice
- Real-time vote counting
- One vote per unit (hak suara per unit, bukan per resident)
- Voting result export (PDF) untuk dokumentasi rapat

**User Stories:**
- As a **property manager**, I want to conduct online voting untuk kompleks decisions
- As a **property manager**, I want one vote per unit so voting is fair
- As a **resident**, I want to vote anonymously so I'm not pressured
- As a **property manager**, I want to export voting results untuk meeting documentation

**Acceptance Criteria:**
- [ ] Can create voting topics with deadline
- [ ] Each unit gets exactly one vote (validated against unit ownership)
- [ ] Anonymous voting hides individual choices
- [ ] Real-time results update as votes come in
- [ ] Export to PDF generates official-looking document with vote counts

**Technical Requirements:**
- Database entities: `voting_topics`, `votes`
- Validation: one vote per unit (unique constraint on `unit_id` + `voting_topic_id`)
- Real-time updates: Livewire polling atau WebSocket

---

### Feature Area 3: Access Control & Guest Management

**Priority:** P1 (High)

#### 3.1 QR Code Access System

**Description:** Residents generate QR codes untuk access, no physical card needed

**Capabilities:**
- QR code generation in resident portal (valid for 30 days)
- QR code display in smartphone (Apple Wallet style)
- QR code scanning at security post (via tablet or scanner)
- Automatic QR code refresh (security)
- Temporary QR codes untuk guests

**User Stories:**
- As a **resident**, I want to generate QR code in app so I don't need to carry access card
- As a **security guard**, I want to scan QR code with tablet so entry is faster
- As a **resident**, I want QR code to auto-refresh so it's secure (cannot be screenshot)

**Acceptance Criteria:**
- [ ] QR code generation works in resident portal
- [ ] QR code displays with countdown timer (shows expiry)
- [ ] QR code scanning validates dan logs entry
- [ ] Expired QR codes are rejected
- [ ] Temporary QR codes work for time-limited access (e.g., 2 hours for delivery)

**Technical Requirements:**
- QR code generation library (BaconQrCode)
- Database entities: `access_codes`, `access_logs`
- Real-time QR code refresh: Livewire polling (every 30 seconds)

---

#### 3.2 Guest Pre-Registration

**Description:** Residents register guests in advance, guards verify dengan tablet

**Capabilities:**
- Resident registers guest via app (name, purpose, date/time, car plate)
- Guest receives SMS with confirmation code
- Guard enters code at security post → system validates
- Guest photo (optional, resident uploads guest photo)
- Recurring guests (e.g., domestic helpers) - one-time registration
- Guest access history

**User Stories:**
- As a **resident**, I want to pre-register guests so they don't need to call me when arriving
- As a **guest**, I want to receive confirmation code so security knows I'm expected
- As a **security guard**, I want to enter confirmation code so I can quickly verify guests
- As a **resident**, I want to register recurring guests (e.g., babysitter) so I don't register every time

**Acceptance Criteria:**
- [ ] Guest registration form includes: name, purpose, visit date/time, car plate (optional)
- [ ] SMS sent to guest phone with 6-digit confirmation code
- [ ] Guard mode tablet allows entering confirmation code
- [ ] System validates code against active guest registrations
- [ ] Recurring guests flagged in system (no expiry, valid until revoked)
- [ ] Guest access history shows past visits

**Technical Requirements:**
- SMS gateway integration (WhatsApp SMS gateway)
- Database entities: `guests`, `guest_visits`, `confirmation_codes`
- Confirmation code: 6-digit random number dengan 15-minute expiry

---

#### 3.3 Security Post Mode (Guard Interface)

**Description:** Tablet view untuk security guards dengan simplified interface

**Capabilities:**
- Resident QR code scanning
- Guest confirmation code entry
- Manual entry log (walk-in visitors)
- Access log view (recent entries/exits)
- Incident reporting (quick form with photo upload)
- Shift handover notes

**User Stories:**
- As a **security guard**, I want a simple tablet interface so I can quickly process entries
- As a **security guard**, I want to report incidents with photos so pengurus is informed
- As a **property manager**, I want to see access logs so I know who entered complex

**Acceptance Criteria:**
- [ ] Guard mode dashboard optimized for tablet (large buttons, high contrast)
- [ ] QR code scanning uses device camera
- [ ] Guest code entry has large numeric keypad
- [ ] Incident report form includes: type, description, photo, location
- [ ] Access log shows recent entries with timestamps
- [ ] Shift handover notes allow guards to communicate issues

**Technical Requirements:**
- Device camera integration untuk QR scanning (HTML5 Camera API)
- Optimized UI untuk tablets (1024x768 resolution)
- Database entities: `incidents`, `shift_notes`

---

### Feature Area 4: Operations Management

**Priority:** P1 (High)

#### 4.1 Complaint/Ticketing System

**Description:** Residents submit complaints, staff track resolution

**Capabilities:**
- Complaint submission via portal (text + photo)
- Complaint categories: Kebersihan, Keamanan, Fasilitas, Lainnya
- Auto-assignment to staff based on category
- SLA tracking (e.g., kebersihan must be resolved within 24 hours)
- Status updates: Open → In Progress → Resolved → Closed
- Resident can rate resolution
- Complaint history dan analytics

**User Stories:**
- As a **resident**, I want to submit complaints with photos so staff can see the issue
- As a **property manager**, I want to assign complaints to staff so nothing falls through cracks
- As a **resident**, I want to track complaint status so I know when it will be resolved
- As a **property manager**, I want to see resolution times so I can measure staff performance

**Acceptance Criteria:**
- [ ] Complaint form includes: category, description, photo, location
- [ ] Auto-assignment works based on category rules
- [ ] SLA tracking shows overdue complaints in red
- [ ] Resident receives status updates via WhatsApp
- [ ] Resolution rating scale: 1-5 stars
- [ ] Analytics dashboard shows complaint volume by category, resolution time

**Technical Requirements:**
- Database entities: `complaints`, `complaint_comments`, `sla_rules`
- Auto-assignment logic: Rule-based engine
- WhatsApp notification triggers on status changes

---

#### 4.2 Facility Booking System

**Description:** Online booking untuk complex facilities (lapangan, hall, etc.)

**Capabilities:**
- Facility inventory (lapangan badminton, hall, gym, etc.)
- Real-time availability calendar
- Booking rules (max hours per day, advance booking limit, cancellation policy)
- Conflict prevention (double booking prevention)
- Booking confirmation via WhatsApp
- Payment (optional) untuk facility usage
- Booking history dan cancellation

**User Stories:**
- As a **resident**, I want to book badminton court online so I don't need to call security
- As a **resident**, I want to see real-time availability so I know when slots are open
- As a **property manager**, I want to set booking rules so facilities are fairly used
- As a **resident**, I want to cancel bookings if plans change

**Acceptance Criteria:**
- [ ] Facility list shows: name, description, photos, booking rules, hourly rate (if paid)
- [ ] Calendar view shows available/booked slots
- [ ] Booking form includes: date, time slot, purpose, number of people
- [ ] System prevents double booking (validates conflicts)
- [ ] Booking confirmation sent via WhatsApp
- [ ] Cancellation allowed up to X hours before booking (configurable)
- [ ] Booking history shows past dan upcoming bookings

**Technical Requirements:**
- Database entities: `facilities`, `bookings`, `booking_slots`
- Calendar UI: FullCalendar atau similar
- Conflict validation: query overlapping time slots for same facility
- Transaction: Atomic booking creation (prevent race conditions)

---

#### 4.3 Staff Task Management

**Description:** Task management untuk cleaning & security staff

**Capabilities:**
- Task creation dengan checklist items
- Recurring tasks (daily cleaning routes, patrol schedules)
- Task assignment to specific staff
- Photo verification untuk task completion
- Time tracking (task start/end times)
- Task performance analytics

**User Stories:**
- As a **property manager**, I want to create recurring tasks so cleaning happens every day without reminder
- As a **cleaning staff**, I want to see my daily task list so I know what to do
- As a **cleaning staff**, I want to upload photos so pengurus knows work was done
- As a **property manager**, I want to see task completion rates so I can measure staff performance

**Acceptance Criteria:**
- [ ] Task creation includes: title, description, assigned staff, due date, checklist items
- [ ] Recurring task setup: frequency (daily, weekly), end date (optional)
- [ ] Staff mobile app shows task list filtered by assigned staff
- [ ] Photo upload required for task completion (configurable)
- [ ] Time tracking: task auto-starts when staff clicks "Start", auto-ends when "Complete"
- [ ] Analytics dashboard shows: tasks created, completed, overdue, completion rate by staff

**Technical Requirements:**
- Database entities: `tasks`, `task_checklists`, `task_completions`, `task_photos`
- Recurring task generation: Laravel scheduler (runs daily to create tasks)
- Mobile app APIs untuk staff task lists

---

### Feature Area 5: Analytics & Reporting

**Priority:** P1 (High)

#### 5.1 Executive Dashboard

**Description:** High-level metrics dashboard untuk pengurus

**Capabilities:**
- Financial overview: Total billed, collected, outstanding AR, collection rate
- Payment trends: 6-month line chart
- Top overdue units: list of units dengan largest outstanding amounts
- Facility usage: Most booked facilities, utilization rates
- Complaint metrics: Open complaints, resolution time, average rating
- Operational metrics: Task completion rate, staff performance

**User Stories:**
- As a **property manager**, I want to see financial overview at a glance so I know complex health
- As a **property manager**, I want to see payment trends so I can identify issues early
- As a **property manager**, I want to see overdue units so I can prioritize collection efforts
- As a **property manager**, I want to see complaint metrics so I can measure satisfaction

**Acceptance Criteria:**
- [ ] Dashboard shows all key metrics in single view (no scrolling)
- [ ] Metrics update real-time (auto-refresh every 30 seconds)
- [ ] Charts interactive (hover for details, click to drill down)
- [ ] Can filter by date range (this month, last 3 months, custom)
- [ ] Export dashboard to PDF atau PowerPoint (untuk rapat pengurus)

**Technical Requirements:**
- Chart.js atau ApexCharts untuk visualizations
- Aggregation queries optimized untuk dashboard (cache results)
- Real-time updates: Livewire polling atau WebSocket

---

#### 5.2 Custom Report Builder

**Description:** Drag-and-drop report builder untuk custom reports

**Capabilities:**
- Select data sources: financials, complaints, bookings, tasks
- Select dimensions: date range, unit type, building, etc.
- Select metrics: sum, count, average, etc.
- Add filters dan groupings
- Preview report before export
- Save report templates untuk reuse

**User Stories:**
- As a **property manager**, I want to create custom reports so I can answer specific questions
- As a **property manager**, I want to save report templates so I don't recreate same report monthly
- As a **property manager**, I want to export reports to Excel so I can do further analysis

**Acceptance Criteria:**
- [ ] Report builder UI has drag-and-drop interface (select columns, filters, groupings)
- [ ] Preview shows sample data (first 100 rows)
- [ ] Can save report with name (e.g., "Monthly Financial Report")
- [ ] Saved reports appear in report library untuk quick access
- [ ] Export to Excel generates formatted .xlsx with charts

**Technical Requirements:**
- Report builder UI: Vue.js atau Alpine.js dengan drag-and-drop library
- Report generation engine: Dynamic SQL builder based on user selections
- Report storage: Database entities `reports`, `report_templates` (JSON config)

---

### Feature Area 6: Mobile Apps for Operational Staff

**Priority:** P2 (Medium - Post-MVP)

#### 6.1 Satpam (Security) App

**Platform:** Flutter atau React Native (cross-platform)

**Core Features:**
- **Check-in/Check-out:** GPS location verification, photo selfie verification
- **Patrol Tracking:** Map-based patrol route, checkpoint scanning (QR codes at checkpoints)
- **Incident Reporting:** Quick form with photo, voice note, GPS location
- **Guest Notifications:** Real-time alerts when guest is pre-registered
- **Shift Schedule:** View upcoming shifts, request shift swaps
- **Offline Mode:** Works without internet, syncs when connection restored

**User Stories:**
- As a **security guard**, I want to check in with GPS so supervisor knows I'm on duty
- As a **security guard**, I want to track patrol routes so there's proof I completed rounds
- As a **security guard**, I want to report incidents quickly with photos
- As a **property manager**, I want to see patrol logs so I know security is being maintained

**Acceptance Criteria:**
- [ ] Check-in requires GPS verification (within 100m of complex)
- [ ] Patrol route shows map with checkpoints
- [ ] Checkpoint scanning works with QR codes
- [ ] Incident report form includes: type, description, photo, location, voice note (optional)
- [ ] Guest notifications received in real-time (push notification)
- [ ] Offline mode: data cached locally, syncs when internet available

**Technical Requirements:**
- Flutter atau React Native
- Background geolocation tracking
- Local database (SQLite) untuk offline caching
- Background sync service (upload cached data when connection restored)

---

#### 6.2 Cleaning Service App

**Platform:** Flutter atau React Native (cross-platform)

**Core Features:**
- **Task List:** Daily tasks assigned to staff, filtered by staff
- **Task Checklist:** Checklist items for each task (e.g., "Lobi floor: sweep, mop, polish")
- **Photo Verification:** Before/after photos required for task completion
- **Supply Requests:** Request cleaning materials (soap, floor polish, etc.)
- **Time Tracking:** Task duration tracking
- **Offline Mode:** Works without internet

**User Stories:**
- As a **cleaning staff**, I want to see my daily tasks so I know what to clean
- As a **cleaning staff**, I want to upload before/after photos so pengurus verifies quality
- As a **cleaning staff**, I want to request supplies so I never run out
- As a **property manager**, I want to see task completion with photos so I know work was done

**Acceptance Criteria:**
- [ ] Task list shows all tasks assigned to logged-in staff
- [ ] Task checklist items must be checked off before task can be marked complete
- [ ] Photo upload requires 1 before photo dan 1 after photo
- [ ] Supply request form includes: item name, quantity, urgency
- [ ] Time tracking auto-starts when task is started, auto-ends when completed
- [ ] Offline mode: tasks cached locally, syncs when internet available

**Technical Requirements:**
- Flutter atau React Native
- Camera integration untuk photo upload
- Local database (SQLite) untuk offline caching
- Image compression (reduce photo size before upload)

---

#### 6.3 Facility Staff App

**Platform:** Flutter atau React Native (cross-platform)

**Core Features:**
- **Maintenance Tickets:** Tickets assigned to facility staff
- **Ticket Details:** Problem description, location, photos, priority
- **Work Order Tracking:** Status updates, parts used, time spent
- **Completion Photos:** Before/after photos of repair work
- **Parts Requests:** Request spare parts, materials
- **Offline Mode:** Works without internet

**User Stories:**
- As a **facility technician**, I want to see assigned tickets so I know what to fix
- As a **facility technician**, I want to update ticket status so residents know progress
- As a **facility technician**, I want to request parts so I can complete repairs
- As a **property manager**, I want to see ticket history so I know what was fixed

**Acceptance Criteria:**
- [ ] Ticket list shows assigned tickets with priority (high/medium/low)
- [ ] Ticket details include: description, location, photos, reporter info
- [ ] Status updates: In Progress → Awaiting Parts → Resolved
- [ ] Completion photos required before ticket can be closed
- [ ] Parts request form includes: part name, quantity, urgency
- [ ] Offline mode: tickets cached locally, syncs when internet available

**Technical Requirements:**
- Flutter atau React Native
- Camera integration untuk photo upload
- Local database (SQLite) untuk offline caching
- Background sync service

---

## 🏆 Success Metrics

### Product Metrics (Year 1 Targets)

- **Active Complexes:** 20+ paying complexes
- **Total Units Managed:** 6,000+ units
- **Monthly Active Users:** 80% of registered residents
- **Payment Collection Rate:** 90%+ on-time payments
- **User Satisfaction:** 4.5/5 average rating

### Business Metrics (Year 1 Targets)

- **MRR (Monthly Recurring Revenue):** Rp 50M+
- **ARR (Annual Recurring Revenue):** Rp 600M+
- **Setup Fees Revenue:** Rp 100M (20 complexes × Rp 5M)
- **Total Year 1 Revenue:** Rp 388M

### Operational Metrics (Year 1 Targets)

- **Customer Acquisition Cost (CAC):** < Rp 5M per complex
- **Customer Lifetime Value (LTV):** > Rp 43M over 3 years
- **LTV:CAC Ratio:** > 8:1
- **Churn Rate:** < 5% annually
- **Freemium Conversion:** 10-15% free-to-paid conversion

---

## 📚 Competitive Analysis

### Direct Competitors

| Competitor | Pricing | Strengths | Weaknesses | Klustera Advantage |
|------------|---------|-----------|------------|-------------------|
| **Jelajah.id** | Rp 8,000/unit/month | Established brand | Black box, expensive | 50% cheaper, open-source |
| **Propertiku** | Rp 10,000/unit/month | Good UI | No access control | Complete solution, QR access |
| **IuranApp** | Rp 5,000/unit/month | Simple | Basic features only | Full feature parity |
| **Excel/Manual** | Rp 0 + time cost | Free | Time-consuming, error-prone | Saves 8 hours/week |

### Indirect Competitors

- **WhatsApp Groups + Excel** - Most common current solution
- **Custom Built Systems** - Large complexes build their own (expensive)
- **Property Management Companies** - Use legacy software (on-premise)

### Klustera Competitive Moat

1. **Open-Source Trust** - Code transparency appeals to Indonesian market corruption concerns
2. **Price Leadership** - Rp 3,500-5,000 vs competitors Rp 8,000-10,000
3. **Complete Solution** - End-to-end from billing to access control (competitors lack this)
4. **Mobile-First Operations** - Native apps for staff (competitors web-only)
5. **Rapid Deployment** - < 1 week vs competitors 1-3 months

---

**Last Updated:** 2026-01-06
**Version:** 1.0.0-concept
**Maintainer:** Product Team
