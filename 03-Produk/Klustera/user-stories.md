# 👥 Klustera.id - User Stories & Requirements

> User personas, user stories, dan acceptance criteria untuk Klustera.id

## 👤 User Personas

### Primary Personas

#### 1. Budi Santoso - Property Manager (Pengurus Kompleks)

**Demographics:**
- **Age:** 45 years old
- **Occupation:** Civil engineer, volunteer pengurus kompleks
- **Tech Savviness:** Medium (Excel, WhatsApp, Email)
- **Time Available:** 2-5 hours/week untuk complex management
- **Pain Points:** Manual billing (10+ hours/week), chasing payments, resident conflicts, no operational oversight

**Goals:**
- Reduce administrative workload
- Improve collection rate (currently 65%)
- Provide financial transparency to reduce conflicts
- Monitor operational tasks without micromanaging

---

#### 2. Siti Aminah - Resident (Warga)

**Demographics:**
- **Age:** 32 years old
- **Occupation:** Marketing manager at startup
- **Tech Savviness:** High (mobile-first, digital payments)
- **Living Situation:** Owns unit in 300-unit complex
- **Pain Points:** Forget to pay iuran, don't know how money is used, miss announcements, inconvenient facility booking

**Goals:**
- Pay iuran conveniently (online, auto-pay)
- Know where her money goes (transparency)
- Never miss important announcements
- Book facilities easily from phone

---

#### 3. Pak Joko - Security Guard (Satpam)

**Demographics:**
- **Age:** 52 years old
- **Occupation:** Security guard (6 years experience)
- **Tech Savviness:** Low-Medium (WhatsApp, basic smartphone)
- **Education:** High school graduate
- **Pain Points:** Manual guest log (slow), must call residents to verify guests, manual patrol tracking

**Goals:**
- Process guests quickly
- Verify guests without calling residents
- Complete patrols efficiently
- Report incidents easily

---

#### 4. Ibu Susi - Cleaning Service Coordinator

**Demographics:**
- **Age:** 38 years old
- **Occupation:** Leads cleaning team (5 staff)
- **Tech Savviness:** Medium (WhatsApp, Instagram)
- **Education:** Vocational high school
- **Pain Points:** Manual paper checklist (lost easily), no proof of cleaning quality, can't track underperforming staff

**Goals:**
- See daily task list clearly
- Verify cleaning quality dengan photos
- Track staff performance
- Request supplies easily

---

#### 5. Hendra Wijaya - Property Developer

**Demographics:**
- **Age:** 50 years old
- **Occupation:** Director at mid-sized property developer
- **Portfolio:** 8 completed complexes, 3 under construction
- **Pain Points:** Different systems per complex, difficult consolidated reporting, high overhead costs

**Goals:**
- Standardize management across all complexes
- Reduce operational costs
- Get consolidated reporting quickly
- Improve resident satisfaction (better for future projects)

---

## 📋 User Stories by Epic

### Epic 1: Financial Management (Iuran & Tagihan)

#### Story 1.1: Automated Invoice Generation

**As a** property manager  
**I want to** automatically generate invoices every month  
**So that** I don't spend 10 hours manually creating invoices in Excel

**Acceptance Criteria:**
- [ ] Given I have set up fee structures (IPL, kebersihan, keamanan)
- [ ] When the 1st of every month arrives at 00:00
- [ ] Then invoices are automatically generated for all active units
- [ ] And each invoice shows: unit number, resident name, fee items (IPL: Rp 500K, Kebersihan: Rp 200K, Keamanan: Rp 300K), total amount, due date (25th of month)
- [ ] And invoices are saved in database dengan status "pending"
- [ ] And PDF invoices are generated dan downloadable

**Priority:** P0 (Critical)  
**Story Points:** 8  
**Technical Requirements:**
- Laravel Scheduler untuk cron job
- PDF generation library (DomPDF)
- Database: `invoices`, `invoice_items`, `fee_structures` tables

---

#### Story 1.2: Pay Invoice via Xendit QRIS

**As a** resident  
**I want to** pay my invoice using QRIS dengan GoPay/OVO  
**So that** I can pay conveniently without going to ATM or bank transfer

**Acceptance Criteria:**
- [ ] Given I am logged in as resident
- [ ] And I have an unpaid invoice
- [ ] When I click "Pay with QRIS" on the invoice
- [ ] Then I see a QRIS code generated from Xendit
- [ ] And I can scan the QR code dengan my mobile payment app (GoPay/OVO/DANA/ShopeePay)
- [ ] And the payment status updates to "paid" within 10 seconds after successful payment
- [ ] And I receive a WhatsApp notification confirming payment

**Priority:** P0 (Critical)  
**Story Points:** 5  
**Technical Requirements:**
- Xendit API integration (QRIS creation)
- Webhook handler untuk payment status updates
- WhatsApp notification trigger

---

#### Story 1.3: Payment Auto-Reconciliation

**As a** property manager  
**I want to** automatically reconcile payments without manual data entry  
**So that** I save 8 hours/week on administrative work

**Acceptance Criteria:**
- [ ] Given a resident has paid via Xendit
- [ ] When Xendit sends a webhook notification
- [ ] Then the system automatically finds the corresponding invoice
- [ ] And updates the invoice status to "paid"
- [ ] And records the payment details (amount, payment method, transaction ID, timestamp)
- [ ] And sends a WhatsApp notification to the resident confirming payment
- [ ] And sends a WhatsApp notification to the property manager about the payment

**Priority:** P0 (Critical)  
**Story Points:** 8  
**Technical Requirements:**
- Xendit webhook handler dengan signature verification
- Idempotent payment processing (handle duplicate webhooks)
- Database: `payments` table dengan webhook payload

---

#### Story 1.4: View Outstanding AR

**As a** property manager  
**I want to** see a list of units dengan outstanding payments  
**So that** I can prioritize collection efforts

**Acceptance Criteria:**
- [ ] Given I am logged in as property manager
- [ ] When I navigate to "Outstanding AR" page
- [ ] Then I see a list of units dengan unpaid invoices
- [ ] And each row shows: unit number, resident name, outstanding amount, days overdue, last payment date
- [ ] And the list is sorted by days overdue (highest first)
- [ ] And I can filter by: building, days overdue (30+, 60+, 90+), amount range
- [ ] And I can click "Send Reminder" to send WhatsApp reminder to resident

**Priority:** P1 (High)  
**Story Points:** 5  
**Technical Requirements:**
- Aggregation query untuk outstanding AR
- Filter logic (SQL WHERE clauses)
- WhatsApp notification trigger

---

### Epic 2: Resident Portal & Communication

#### Story 2.1: Resident Registration & Login

**As a** new resident  
**I want to** register my account using my phone number  
**So that** I can access the resident portal

**Acceptance Criteria:**
- [ ] Given I am a new resident di kompleks
- [ ] When I go to registration page
- [ ] And I enter: phone number, unit number, full name
- [ ] Then I receive a 6-digit OTP via WhatsApp/SMS within 30 seconds
- [ ] And I can enter the OTP to verify my account
- [ ] And my account is created dengan role "resident"
- [ ] And I can only see data for my own unit (not other residents' data)

**Priority:** P0 (Critical)  
**Story Points:** 5  
**Technical Requirements:**
- OTP generation dan delivery (WhatsApp gateway)
- Role-based access control (resident only sees their data)
- Multi-tenancy: resident belongs to specific complex (tenant)

---

#### Story 2.2: View My Dashboard

**As a** resident  
**I want to** see my dashboard showing outstanding bills dan recent activity  
**So that** I can quickly see my account status

**Acceptance Criteria:**
- [ ] Given I am logged in as resident
- [ ] When I navigate to dashboard
- [ ] Then I see:
  - Outstanding invoices count (e.g., "You have 2 unpaid invoices")
  - Total outstanding amount (e.g., "Rp 1,500,000 due")
  - Last payment date dan amount (e.g., "Last paid: 25 Jan 2026, Rp 1,000,000")
  - Recent announcements (last 5)
  - Active complaints (if any)
- [ ] And I can click "Pay Now" button to pay outstanding invoices

**Priority:** P0 (Critical)  
**Story Points:** 3  
**Technical Requirements:**
- Aggregation queries untuk outstanding data
- Dashboard UI components
- Real-time data (Livewire polling)

---

#### Story 2.3: Receive WhatsApp Announcements

**As a** resident  
**I want to** receive important announcements via WhatsApp  
**So that** I don't miss critical information

**Acceptance Criteria:**
- [ ] Given property manager creates an announcement
- [ ] And the announcement category is "Important" atau "Security Alert"
- [ ] And I am a resident in that complex
- [ ] When the announcement is published
- [ ] Then I receive a WhatsApp message within 1 minute
- [ ] And the message includes: announcement title, summary, link to full announcement
- [ ] And I can click the link to view full announcement di resident portal

**Priority:** P0 (Critical)  
**Story Points:** 5  
**Technical Requirements:**
- WhatsApp gateway API integration
- Announcement categories database
- Link generation (short URL to announcement page)

---

#### Story 2.4: Create Announcement

**As a** property manager  
**I want to** create announcements dengan rich text dan photos  
**So that** I can communicate important information to residents

**Acceptance Criteria:**
- [ ] Given I am logged in as property manager
- [ ] When I click "Create Announcement"
- [ ] Then I see form dengan fields:
  - Title (required, max 100 chars)
  - Category dropdown: Important, Info, Event, Security Alert (required)
  - Content (rich text editor, supports bold, italic, bullet points, links)
  - Photo upload (optional, max 3 photos)
  - Target audience: All residents, specific buildings, specific units
  - Publish immediately atau schedule for later
- [ ] And I can preview announcement before publishing
- [ ] And when I publish, WhatsApp notifications sent to target audience

**Priority:** P0 (Critical)  
**Story Points:** 8  
**Technical Requirements:**
- Rich text editor (TinyMCE atau Quill)
- Photo upload (Cloudflare R2 or Oracle Object Storage)
- Target audience logic (filter by building/unit)
- WhatsApp notification queue (Laravel Queue)

---

#### Story 2.5: Online Voting

**As a** property manager  
**I want to** conduct online voting untuk kompleks decisions  
**So that** I can get resident feedback without holding physical meetings

**Acceptance Criteria:**
- [ ] Given I am logged in as property manager
- [ ] When I click "Create Voting"
- [ ] Then I see form dengan fields:
  - Question (e.g., "Setuju kah IPL naik 10% mulai bulan depan?")
  - Options: Yes/No/Abstain atau custom options
  - Description (context untuk decision)
  - Voting deadline (date dan time)
  - Anonymous voting checkbox
- [ ] And I can publish the voting topic
- [ ] And residents can vote (one vote per unit, validated by unit ownership)
- [ ] And I can see real-time results (count per option, percentage)
- [ ] And I can export results to PDF untuk meeting documentation

**Priority:** P1 (High)  
**Story Points:** 8  
**Technical Requirements:**
- Database: `voting_topics`, `votes` tables
- Unique constraint: one vote per unit per topic
- Real-time updates: Livewire polling atau WebSocket
- PDF export (DomPDF)

---

### Epic 3: Access Control & Guest Management

#### Story 3.1: Generate QR Access Code

**As a** resident  
**I want to** generate a QR code on my phone for access  
**So that** I don't need to carry a physical access card

**Acceptance Criteria:**
- [ ] Given I am logged in as resident di mobile app
- [ ] When I navigate to "My Access Code"
- [ ] Then I see a QR code displayed on screen
- [ ] And the QR code includes: my unit number, encrypted timestamp, signature
- [ ] And the QR code is valid for 30 days dari generation
- [ ] And the QR code auto-refreshes every 30 seconds untuk security
- [ ] And I can see a countdown timer showing when QR code expires

**Priority:** P1 (High)  
**Story Points:** 5  
**Technical Requirements:**
- QR code generation library (BaconQrCode)
- Encryption (AES-256 untuk QR data)
- Real-time QR refresh: Livewire polling (every 30 seconds)

---

#### Story 3.2: Pre-Register Guest

**As a** resident  
**I want to** pre-register my guest before they arrive  
**So that** security can verify them without calling me

**Acceptance Criteria:**
- [ ] Given I am logged in as resident
- [ ] When I click "Register Guest"
- [ ] Then I see form dengan fields:
  - Guest name (required)
  - Guest phone number (required)
  - Visit date dan time (required)
  - Purpose of visit (dropdown: Family, Friend, Delivery, Service Provider, Other)
  - Car plate number (optional)
  - Guest photo (optional)
- [ ] And when I submit, guest receives SMS dengan 6-digit confirmation code
- [ ] And the code is valid for 24 hours dari registration
- [ ] And I can see my registered guests di "My Guests" page

**Priority:** P1 (High)  
**Story Points:** 5  
**Technical Requirements:**
- SMS gateway integration (WhatsApp SMS)
- Database: `guests`, `confirmation_codes` tables
- Confirmation code: 6-digit random, 24-hour expiry

---

#### Story 3.3: Guard Mode - Verify Guest

**As a** security guard  
**I want to** enter guest confirmation code to verify guests  
**So that** I can quickly process guests without calling residents

**Acceptance Criteria:**
- [ ] Given I am logged in di Guard Mode tablet
- [ ] When a guest arrives and provides confirmation code
- [ ] And I enter the 6-digit code
- [ ] Then system validates code against registered guests
- [ ] And if valid, I see guest details: name, resident name, purpose, car plate (if provided)
- [ ] And I can click "Allow Entry" to log the entry
- [ ] And the entry log is saved dengan timestamp
- [ ] If invalid, I see error message: "Invalid code. Please check with resident."

**Priority:** P1 (High)  
**Story Points:** 5  
**Technical Requirements:**
- Guard Mode UI (tablet-optimized, large buttons)
- Database query untuk code validation
- Access log: `access_logs` table

---

#### Story 3.4: View Access Logs

**As a** property manager  
**I want to** see access logs showing who entered complex  
**So that** I can review security if needed

**Acceptance Criteria:**
- [ ] Given I am logged in as property manager
- [ ] When I navigate to "Access Logs"
- [ ] Then I see a list of entries/exits dengan:
  - Timestamp
  - Type: Resident Entry, Guest Entry, Staff Entry, Exit
  - Name (resident/guest name)
  - Unit number (for residents)
  - Entry method: QR Code, Guest Code, Manual
  - Security guard on duty
- [ ] And I can filter by: date range, entry type, specific unit
- [ ] And I can export logs to CSV atau PDF

**Priority:** P2 (Medium)  
**Story Points:** 3  
**Technical Requirements:**
- Access logs query dengan filters
- Export functionality (CSV/PDF)

---

### Epic 4: Operations Management

#### Story 4.1: Submit Complaint

**As a** resident  
**I want to** submit a complaint dengan photo  
**So that** management can address issues quickly

**Acceptance Criteria:**
- [ ] Given I am logged in as resident
- [ ] When I click "Submit Complaint"
- [ ] Then I see form dengan fields:
  - Category dropdown: Kebersihan, Keamanan, Fasilitas, Lainnya (required)
  - Description (required, max 500 chars)
  - Location (e.g., "Lobi Lt. 1", "Lapangan Badminton")
  - Photo upload (required, max 3 photos)
  - Urgency: Low, Medium, High (required)
- [ ] And when I submit, complaint is created dengan status "Open"
- [ ] And I receive confirmation via WhatsApp dengan ticket number
- [ ] And I can track complaint status di "My Complaints" page

**Priority:** P1 (High)  
**Story Points:** 5  
**Technical Requirements:**
- Database: `complaints` table
- Photo upload (Cloudflare R2)
- WhatsApp notification

---

#### Story 4.2: Auto-Assign Complaint

**As a** property manager  
**I want to** auto-assign complaints to staff based on category  
**So that** complaints are resolved quickly

**Acceptance Criteria:**
- [ ] Given I have set up assignment rules (e.g., "Kebersihan" → Cleaning Staff Team A)
- [ ] When a new complaint is submitted
- [ ] Then system automatically assigns complaint based on category
- [ ] And assigned staff receives notification via mobile app
- [ ] And I can manually reassign if needed

**Priority:** P1 (High)  
**Story Points:** 3  
**Technical Requirements:**
- Assignment rules database
- Auto-assignment logic (rule-based engine)
- Push notification to staff mobile app

---

#### Story 4.3: Track Complaint Resolution

**As a** resident  
**I want to** track my complaint status  
**So that** I know when it will be resolved

**Acceptance Criteria:**
- [ ] Given I have submitted a complaint
- [ ] When I navigate to "My Complaints"
- [ ] Then I see my complaints dengan:
  - Ticket number
  - Category
  - Description
  - Status: Open, In Progress, Resolved, Closed
  - Assigned staff
  - Created date
  - Resolution ETA (based on SLA)
- [ ] And I can click complaint to see details dan status history
- [ ] And I receive WhatsApp notifications when status changes

**Priority:** P1 (High)  
**Story Points:** 3  
**Technical Requirements:**
- Complaint status workflow
- SLA calculations (e.g., Kebersihan = 24 hours)
- WhatsApp notifications on status change

---

#### Story 4.4: Book Facility

**As a** resident  
**I want to** book a facility (e.g., badminton court) online  
**So that** I don't need to call security

**Acceptance Criteria:**
- [ ] Given I am logged in as resident
- [ ] When I navigate to "Facilities"
- [ ] Then I see list of facilities: Lapangan Badminton, Hall, Gym, etc.
- [ ] And I can click facility to view details: description, photos, hourly rate, booking rules
- [ ] And I can see availability calendar (green = available, red = booked)
- [ ] When I select a date dan time slot (e.g., Saturday 6-7 PM)
- [ ] And I click "Book"
- [ ] Then booking is created
- [ ] And I receive confirmation via WhatsApp
- [ ] And the time slot is marked "booked" in calendar

**Priority:** P1 (High)  
**Story Points:** 8  
**Technical Requirements:**
- Database: `facilities`, `bookings`, `booking_slots` tables
- Calendar UI (FullCalendar atau similar)
- Conflict validation (prevent double booking)
- Transaction locking (prevent race conditions)

---

#### Story 4.5: Create Recurring Tasks

**As a** property manager  
**I want to** create recurring tasks untuk cleaning staff  
**So that** tasks are generated automatically every day

**Acceptance Criteria:**
- [ ] Given I am logged in as property manager
- [ ] When I click "Create Recurring Task"
- [ ] Then I see form dengan fields:
  - Task title (e.g., "Clean Lobby Lt. 1")
  - Description
  - Assigned staff (required)
  - Frequency: Daily, Weekly, Monthly (required)
  - Start date (required)
  - End date (optional, leave blank for infinite)
  - Checklist items (e.g., "Sweep floor", "Mop floor", "Polish furniture")
- [ ] And when I save, system generates task instances based on frequency
- [ ] And assigned staff sees tasks in mobile app on scheduled dates

**Priority:** P1 (High)  
**Story Points:** 5  
**Technical Requirements:**
- Database: `tasks`, `task_checklists` tables
- Laravel Scheduler untuk generate task instances
- Task generation logic (daily/weekly/monthly)

---

#### Story 4.6: Staff Completes Task dengan Photo

**As a** cleaning staff  
**I want to** complete tasks dan upload photos  
**So that** property manager can verify work quality

**Acceptance Criteria:**
- [ ] Given I am logged in di Cleaning Staff mobile app
- [ ] When I view my assigned tasks
- [ ] Then I see task list: title, description, location, due date, checklist items
- [ ] When I click "Start Task"
- [ ] Then task status changes to "In Progress"
- [ ] And time tracking starts
- [ ] And I can check off checklist items
- [ ] And I must upload 1 "before" photo dan 1 "after" photo
- [ ] When I click "Complete"
- [ ] Then task status changes to "Completed"
- [ ] And photos are uploaded to server
- [ ] And property manager can view completion dengan photos

**Priority:** P1 (High)  
**Story Points:** 8  
**Technical Requirements:**
- Mobile app API endpoints
- Photo upload (compression, then upload)
- Time tracking (task start/end timestamps)
- Offline-first (cache tasks locally, sync when online)

---

### Epic 5: Analytics & Reporting

#### Story 5.1: View Executive Dashboard

**As a** property manager  
**I want to** see executive dashboard dengan key metrics  
**So that** I can quickly assess complex health

**Acceptance Criteria:**
- [ ] Given I am logged in as property manager
- [ ] When I navigate to dashboard
- [ ] Then I see:
  - **Financial Overview:**
    - Total Billed This Month: Rp 150,000,000
    - Total Collected This Month: Rp 135,000,000 (90% collection rate)
    - Outstanding AR: Rp 15,000,000
    - Chart: Collection trend last 6 months
  - **Operational Overview:**
    - Open Complaints: 5
    - Avg Resolution Time: 18 hours
    - Facilities Booked This Week: 12 bookings
    - Tasks Completed Today: 8/10 (80%)
- [ ] And all metrics update real-time (auto-refresh every 30 seconds)
- [ ] And I can click any metric to drill down

**Priority:** P1 (High)  
**Story Points:** 8  
**Technical Requirements:**
- Aggregation queries (optimized untuk performance)
- Chart library (Chart.js atau ApexCharts)
- Real-time updates: Livewire polling atau WebSocket
- Caching strategy (Redis untuk expensive queries)

---

#### Story 5.2: Export Financial Reports

**As a** property manager  
**I want to** export financial reports to Excel/PDF  
**So that** I can present them di board meetings

**Acceptance Criteria:**
- [ ] Given I am logged in as property manager
- [ ] When I navigate to "Financial Reports"
- [ ] Then I can select:
  - Report type: Income Statement, Cash Flow, Collection Report, Budget vs Actual
  - Date range: This month, Last month, Last 3 months, Last 12 months, Custom
  - Format: Excel atau PDF
- [ ] When I click "Generate Report"
- [ ] Then report is generated within 10 seconds
- [ ] And if Excel, file includes:
  - Summary sheet dengan charts
  - Detailed transactions sheet
  - Formatted dengan company logo
- [ ] And if PDF, file includes:
  - Executive summary
  - Charts dan graphs
  - Detailed tables
- [ ] And I can download file

**Priority:** P1 (High)  
**Story Points:** 8  
**Technical Requirements:**
- Report generation engine (dynamic SQL builder)
- Excel export (Laravel Excel / PHPSpreadsheet)
- PDF export (DomPDF dengan custom templates)
- Queue processing (large reports may take time)

---

### Epic 6: Mobile Apps for Staff

#### Story 6.1: Security Guard - Check In dengan GPS

**As a** security guard  
**I want to** check in dengan GPS verification  
**So that** supervisor knows I'm on duty at the complex

**Acceptance Criteria:**
- [ ] Given I have installed Satpam App on my phone
- [ ] When I open app and click "Check In"
- [ ] Then app verifies my GPS location
- [ ] And if I am within 100m of the complex
- [ ] Then check-in is successful
- [ ] And app shows: Check-in time, Location, Shift duration
- [ ] And if I am outside 100m radius
- [ ] Then app shows error: "You must be at the complex to check in"

**Priority:** P2 (Medium)  
**Story Points:** 5  
**Technical Requirements:**
- Flutter atau React Native
- Background geolocation tracking
- GPS distance calculation (Haversine formula)
- Offline-first (cache check-in if no internet, sync later)

---

#### Story 6.2: Security Guard - Patrol Tracking

**As a** security guard  
**I want to** track patrol route dengan checkpoint scanning  
**So that** there is proof I completed my rounds

**Acceptance Criteria:**
- [ ] Given I am on duty
- [ ] When I start patrol
- [ ] Then app shows map dengan checkpoint locations
- [ ] And I can navigate to each checkpoint
- [ ] When I arrive at checkpoint
- [ ] And I scan QR code at checkpoint
- [ ] Then app logs: Checkpoint ID, Scan time, GPS location
- [ ] And I can add notes (e.g., "Lampu rusak di titik ini")
- [ ] And when I complete all checkpoints
- [ ] Then patrol is marked complete
- [ ] And supervisor can view patrol log

**Priority:** P2 (Medium)  
**Story Points:** 8  
**Technical Requirements:**
- Mobile map UI (Google Maps atau Mapbox)
- QR code scanner (camera integration)
- GPS location tracking
- Offline-first (cache checkpoints, sync when online)

---

#### Story 6.3: Cleaning Staff - View Daily Tasks

**As a** cleaning staff  
**I want to** see my daily tasks di mobile app  
**So that** I know what to clean today

**Acceptance Criteria:**
- [ ] Given I have logged in to Cleaning App
- [ ] When I open app
- [ ] Then I see task list for today
- [ ] And each task shows:
  - Title (e.g., "Clean Lobby Lt. 1")
  - Location
  - Priority (High/Medium/Low)
  - Checklist items
  - Due time
  - Status (Pending, In Progress, Completed)
- [ ] And I can filter by: All, Pending, Completed
- [ ] And tasks are sorted by priority (High first)
- [ ] And I can click task to view details

**Priority:** P2 (Medium)  
**Story Points:** 3  
**Technical Requirements:**
- Mobile API endpoint: GET /api/staff/tasks?date=today
- Authentication: Laravel Sanctum token
- Offline-first: cache tasks in SQLite database

---

#### Story 6.4: Facility Staff - Update Ticket Status

**As a** facility technician  
**I want to** update maintenance ticket status  
**So that** residents know progress

**Acceptance Criteria:**
- [ ] Given I am assigned a maintenance ticket
- [ ] When I view ticket details
- [ ] Then I see: Problem description, Location, Photos, Priority
- [ ] And I can update status: In Progress, Awaiting Parts, Resolved
- [ ] And I can add notes (e.g., "Menunggu spare part dari supplier")
- [ ] And I can upload photos of work in progress
- [ ] When I change status
- [ ] Then resident receives notification via WhatsApp
- [ ] And ticket history is updated

**Priority:** P2 (Medium)  
**Story Points:** 5  
**Technical Requirements:**
- Mobile API endpoint: PATCH /api/tickets/{id}/status
- Photo upload
- WhatsApp notification trigger
- Offline-first: cache status updates, sync when online

---

## 📊 Story Points Summary

| Epic | Total Story Points | Priority P0 | Priority P1 | Priority P2 |
|------|-------------------|-------------|-------------|-------------|
| Financial Management | 26 | 21 | 5 | 0 |
| Resident Portal | 29 | 18 | 11 | 0 |
| Access Control | 18 | 0 | 15 | 3 |
| Operations Management | 39 | 0 | 34 | 5 |
| Analytics & Reporting | 16 | 0 | 16 | 0 |
| Mobile Apps | 24 | 0 | 0 | 24 |
| **Total** | **152** | **39** | **81** | **32** |

**Estimated Velocity:** 20-30 story points per 2-week sprint  
**Total Sprints:** ~6-8 sprints (3-4 months) untuk complete MVP (Milestones 1-4)

---

**Last Updated:** 2026-01-06
**Version:** 1.0.0-concept
**Maintainer:** Product Team
