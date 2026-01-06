# 🗺️ Classnetic.com Roadmap

> Visi jangka panjang dan rencana pengembangan untuk Platform Manajemen Sekolah Digital

## 🎯 Product Vision

**Vision Statement:** Menjadi platform manajemen sekolah terdepan di Indonesia yang mentransformasi operasional sekolah tradisional menjadi sistem digital yang efisien, transparan, dan dapat diakses dari mana saja.

**Mission Statement:** Memberdayakan sekolah swasta Indonesia dengan teknologi modern untuk mengoptimalkan manajemen siswa, meningkatkan keterlibatan orang tua, dan mengurangi beban administrasi guru.

**North Star Metric:** Jumlah siswa yang dikelola melalui platform Classnetic (Student Under Management - SUM).

**Target Year 1:** 100,000 students across 100+ schools

---

## 📅 Development Timeline Overview

### Timeline Comparison

| Scenario | Timeline | Notes |
|----------|----------|-------|
| **Team of 3-4 devs** | 40 weeks | Parallel development (unrealistic for solo) |
| **Solo developer** | 72 weeks (17 months) | Sequential development, 20% buffer included |
| **With Flutter freelancer** | 48 weeks (11 months) | Recommended approach - saves 6-9 months |

`★ Insight ─────────────────────────────────────`
**Recommended Approach: Hire Flutter Freelancer**

**Cost-Benefit Analysis**:
- Freelancer cost: Rp 30-40M (6-9 months × Rp 5-8M/month)
- Earlier launch: 6 months faster
- Additional revenue: 10 schools × 300 students × Rp 10K × 6 months = Rp 180M
- **Net gain: Rp 140M**

**Recommendation**: Hire Flutter freelancer after Milestone 1. Focus on Go backend (your strength), outsource mobile apps.
`─────────────────────────────────────────────────`

---

## 🚀 Phase 1: Foundation & E-Learning MVP

**Timeline:** Week 1-24 (Solo) / Week 1-16 (With Freelancer)
**Status:** 🎯 Planning
**Goal:** Build core e-learning functionality (assignments, quizzes) with scalable backend

---

### Milestone 1: Foundation & Authentication

**Timeline:** Week 1-6 (Solo) / Week 1-4 (With Freelancer)
**Status:** 📝 Not Started

**Goals:**
- [ ] Basic infrastructure with user management
- [ ] Authentication & authorization working
- [ ] All three apps scaffolding complete (backend, web, mobile)

**Features:**

**Core Infrastructure:**
- [ ] **Go Backend Setup:** Gin framework, PostgreSQL, GORM, JWT auth
- [ ] **Database Schema:** users, schools, roles, permissions tables
- [ ] **Authentication System:** JWT tokens (15min access, 720h refresh)
- [ ] **Authorization:** RBAC with 7 roles (Super Admin, School Admin, Teacher, Student, Parent, Finance, Staff)
- [ ] **SvelteKit Web Dashboard:** Basic layout, auth flow, responsive design
- [ ] **Flutter Mobile Apps:** Teacher, Student, Parent apps scaffolding
- [ ] **School Onboarding:** Create school account, setup admin user

**Solo Dev Considerations:**
- Week 1-2: Go backend (your strength - fast)
- Week 3-4: SvelteKit web (TypeScript manageable)
- Week 5-6: Flutter mobile (new tech - slower learning curve)

**Technical Goals:**
- [ ] **Performance:** API response <500ms for auth endpoints
- [ ] **Security:** Passwords hashed with bcrypt (cost 12)
- [ ] **Scalability:** Architecture supports 1000+ users
- [ ] **Testing:** Basic auth tests passing

**Success Criteria:**
- [ ] Backend API running on localhost:8080
- [ ] Web dashboard accessible at localhost:5173
- [ ] Mobile apps buildable on Android & iOS
- [ ] User can sign up, login, create school profile
- [ ] Role-based access working (7 roles functional)

**Deliverables:**
- [ ] Git repo initialized with proper structure (cmd/, internal/, pkg/)
- [ ] Database migrations working (create/drop/rollback)
- [ ] API documentation (Swagger/OpenAPI) auto-generated
- [ ] Development guide for local setup

---

### Milestone 2: E-Learning MVP - Assignments

**Timeline:** Week 7-12 (Solo) / Week 5-8 (With Freelancer)
**Status:** 📝 Not Started
**Dependencies:** Milestone 1 complete

**Goals:**
- [ ] Teachers can create and publish assignments
- [ ] Students can view assignments and submit work
- [ ] File upload working (PDF, documents, images)
- [ ] Basic grading interface functional

**Features:**

**Teacher Dashboard (Web + Mobile):**
- [ ] **Assignment Creation:** Rich text editor, due dates, class selection
- [ ] **File Attachments:** Upload PDFs, documents, images (max 50MB per file)
- [ ] **Class Selection:** Assign to multiple classes at once
- [ ] **Draft vs Published:** Schedule future assignments
- [ ] **Grading Interface:** Input scores, add feedback comments

**Student Portal (Web + Mobile):**
- [ ] **Assignment Viewing:** Filter by subject, status (upcoming, overdue, completed)
- [ ] **File Upload:** Submit work with file attachments
- [ ] **Calendar View:** Monthly overview of deadlines
- [ ] **Grade Viewing:** See grades and teacher feedback after grading

**Simplified Offline Strategy:**
- [ ] **Online-First:** Creating assignments, submitting work requires internet
- [ ] **Offline Viewing:** Learning materials cached for reading (no editing)
- [ ] **No Offline Editing:** Eliminates complex sync logic (saves 2-3 weeks!)

**Notifications:**
- [ ] **Due Date Reminders:** 1 day before, 1 hour before deadlines
- [ ] **New Assignment Alerts:** Push notifications when assignments published
- [ ] **Grade Posted Notifications:** Alert students/parents when grades available

**Technical Specs:**
- [ ] **File Storage:** Cloudflare R2 with presigned URLs
- [ ] **Database Tables:** assignments, submissions, attachments
- [ ] **Rich Text Editor:** TinyMCE (web), Flutter HTML editor (mobile)
- [ ] **Virus Scanning:** ClamAV for uploaded files

**Solo Dev Considerations:**
- Week 7-9: Backend API (assignment CRUD, file upload to R2)
- Week 10-11: SvelteKit web UI (teacher dashboard, student portal)
- Week 12: Flutter mobile apps (teacher/student views, file handling)

**Success Criteria:**
- [ ] Teachers can create assignments in <5 minutes
- [ ] File uploads working 95% success rate
- [ ] Students can submit work from mobile devices
- [ ] Due date reminders sent within 1 hour of trigger
- [ ] Offline viewing working for learning materials

**Deliverables:**
- [ ] Assignment CRUD API fully functional
- [ ] File upload pipeline with virus scanning
- [ ] Teacher dashboard with assignment management
- [ ] Student portal with submission interface
- [ ] Notification system (FCM + email + WhatsApp fallback)

---

### Milestone 3: Quiz Engine & Auto-Grading

**Timeline:** Week 13-18 (Solo) / Week 9-12 (With Freelancer)
**Status:** 📝 Not Started
**Dependencies:** Milestone 2 complete

**Goals:**
- [ ] Interactive quizzes with multiple question types
- [ ] Auto-grading for objective questions (multiple choice, T/F)
- [ ] Quiz taking interface with countdown timer
- [ ] Immediate score display

**Features:**

**Quiz Creation (Teacher Dashboard):**
- [ ] **Question Types:** Multiple choice, true/false, short answer, essay
- [ ] **Question Bank:** Reuse questions across quizzes
- [ ] **Time Limits:** Set countdown timers (auto-submit when expires)
- [ ] **Randomization:** Shuffle question order (prevent cheating)
- [ ] **Point Values:** Assign points per question
- [ ] **Correct Answers:** Specify answers for auto-grading

**Quiz Taking (Student App):**
- [ ] **Countdown Timer:** Visible timer with auto-submit
- [ ] **Auto-Save:** Answers saved every 30 seconds
- [ ] **Question Navigation:** Jump to any question
- [ ] **Flag Questions:** Mark for review
- [ ] **Immediate Results:** View score instantly (if auto-graded)

**Auto-Grading Engine:**
- [ ] **Multiple Choice:** Single correct, multiple correct
- [ ] **True/False:** Automatic grading
- [ ] **Short Answer:** Fuzzy matching (80% similarity threshold)
- [ ] **Essays:** Flag for manual grading (0 points initially)
- [ ] **Partial Credit:** Support for partial points

**Quiz State Management:**
- [ ] **Crash Recovery:** Restore quiz state if app crashes
- [ ] **Incomplete Quizzes:** Resume from last question
- [ ] **Time Tracking:** Track time spent per question

**Technical Specs:**

**Database Schema:**
```sql
CREATE TABLE quizzes (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    assignment_id UUID NOT NULL REFERENCES assignments(id) ON DELETE CASCADE,
    time_limit INT, -- minutes
    shuffle_questions BOOLEAN DEFAULT false,
    show_results BOOLEAN DEFAULT true,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE quiz_questions (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    quiz_id UUID NOT NULL REFERENCES quizzes(id) ON DELETE CASCADE,
    question_type VARCHAR(20) NOT NULL,
    question_text TEXT NOT NULL,
    points INT NOT NULL DEFAULT 1,
    order_index INT NOT NULL,
    correct_answer JSONB
);

CREATE TABLE quiz_attempts (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    quiz_id UUID NOT NULL REFERENCES quizzes(id) ON DELETE CASCADE,
    student_id UUID NOT NULL REFERENCES students(id) ON DELETE CASCADE,
    started_at TIMESTAMP DEFAULT NOW(),
    completed_at TIMESTAMP,
    score INT,
    answers JSONB
);
```

**Auto-Grading Logic:**
- Multiple choice: Exact match
- True/false: Exact match
- Short answer: Fuzzy ratio >80%
- Essays: Manual grading only

**Solo Dev Considerations:**
- Week 13-15: Backend quiz engine (database schema, auto-grading logic)
- Week 16-17: Frontend quiz UI (teacher creation, student taking)
- Week 18: Mobile quiz interface + testing

**Success Criteria:**
- [ ] Auto-grading accuracy >95%
- [ ] Quiz state restored after app crash (no data loss)
- [ ] Quiz submission works within 2 seconds
- [ ] Timer auto-submits correctly when expires
- [ ] Essays properly flagged for manual grading

**Deliverables:**
- [ ] Quiz creation API with question bank
- [ ] Quiz taking interface with timer
- [ ] Auto-grading engine with fuzzy matching
- [ ] Quiz attempt history for students
- [ ] Grade export (Excel, CSV)

`★ Insight ─────────────────────────────────────`
**Why Quizzes Before Attendance?**

Quizzes demonstrate Classnetic's unique value (offline-first learning) more effectively than attendance. Attendance is a commodity feature - every competitor has it. But offline quiz-taking with auto-grading? That's a "wow" feature that impresses during B2B demos. It shows technical sophistication and understanding of Indonesian schools' connectivity challenges.
`─────────────────────────────────────────────────`

---

### Milestone 4: Scalability Testing & Optimization

**Timeline:** Week 19-24 (Solo) / Week 13-16 (With Freelancer)
**Status:** 📝 Not Started
**Dependencies:** Milestone 3 complete
**Priority:** 🔴 CRITICAL (addresses top user concern)

**Goals:**
- [ ] Prove Go backend handles 500 concurrent users (medium school)
- [ ] Optimize database queries (<100ms average)
- [ ] Implement caching strategy (Redis)
- [ ] Setup monitoring & alerting

**Load Testing:**

**Test Scenarios:**
- [ ] **500 Concurrent Users:** 450 students + 50 teachers simultaneously active
- [ ] **API Stress Test:** 1000 req/min sustained load for 30 minutes
- [ ] **Database Load:** 10,000 quiz attempts created in 10 minutes
- [ ] **File Upload Stress:** 100 concurrent file uploads (50MB each)
- [ ] **WebSocket Load:** 500 concurrent WebSocket connections (real-time updates)

**Tools:**
- **k6:** Load testing framework (Go-based, lightweight)
- ** artillery.js:** Alternative load testing tool
- **pg_stat_statements:** PostgreSQL query performance monitoring
- **Redis Insight:** Redis monitoring and profiling

**Optimization Tasks:**

**Database Optimization:**
- [ ] **Indexing Strategy:** Add indexes to slow queries
- [ ] **Query Tuning:** Optimize N+1 queries, add joins where appropriate
- [ ] **Connection Pooling:** PgBouncer for PostgreSQL connection management
- [ ] **Database Partitioning:** Consider partitioning large tables (quiz_attempts, submissions)

**Caching Strategy:**
- [ ] **API Response Caching:** Cache assignment/quiz data in Redis (5-minute TTL)
- [ ] **Session Caching:** Store user sessions in Redis (vs JWT storage)
- [ ] **Query Result Caching:** Cache expensive queries (grade calculations, reports)
- [ ] **Static Asset Caching:** CDN via Cloudflare (images, PDFs, CSS, JS)

**Background Jobs:**
- [ ] **Notification Queue:** Email/WhatsApp notifications via job queue
- [ ] **PDF Generation:** Report cards generated in background
- [ ] **File Processing:** Virus scanning, compression in background
- [ ] **Data Cleanup:** Old data archival/deletion jobs

**Performance Targets:**
- [ ] **API Response Time:** <500ms average (p95 <1s)
- [ ] **Database Query Time:** <100ms average
- [ ] **Uptime:** 99.5% SLA (downtime <3.6 hours/month)
- [ ] **Memory Usage:** Stable (no memory leaks)
- [ ] **Error Rate:** <1% error rate

**Solo Dev Considerations:**
- Week 19-20: Load testing setup, identify bottlenecks
- Week 21-22: Database optimization (indexing, query tuning)
- Week 23-24: Caching implementation (Redis), monitoring setup

**Success Criteria:**
- [ ] Load test report: 500 concurrent users, <500ms API response
- [ ] Database queries all <100ms average
- [ ] Redis caching hit rate >70%
- [ ] Background jobs processing without failures
- [ ] Monitoring dashboard showing real-time metrics

**Deliverables:**
- [ ] Load test report with metrics (response times, error rates)
- [ ] Database optimization documentation (before/after query times)
- [ ] Caching strategy documentation (what's cached, TTL values)
- [ ] Performance monitoring dashboard (Grafana or custom)
- [ ] Runbook for common performance issues

**Why This Milestone Now?**
Before adding more features, prove the architecture scales. This prevents technical debt and gives confidence during B2B sales ("Yes, we handle 500-student schools easily with room to grow").

---

## 📚 Phase 2: Content & Assessment

**Timeline:** Week 25-36 (Solo) / Week 17-24 (With Freelancer)
**Status:** 📝 Not Started
**Goal:** Complete learning platform with materials and grading

---

### Milestone 5: Learning Materials & Offline Content

**Timeline:** Week 25-30 (Solo) / Week 17-20 (With Freelancer)
**Status:** 📝 Not Started
**Dependencies:** Milestone 4 complete

**Goals:**
- [ ] Teachers can upload learning materials
- [ ] Students can browse and download materials
- [ ] Materials cached for offline viewing
- [ ] Search functionality working

**Features:**

**Teacher Dashboard:**
- [ ] **Material Upload:** PDF documents, presentations, images
- [ ] **Video Links:** Embed YouTube/Vimeo links (don't host videos directly)
- [ ] **Material Organization:** Organize by subject, grade, topic
- [ ] **Version Control:** Track material versions, update history
- [ ] **Access Control:** Choose which classes see which materials

**Student Portal:**
- [ ] **Material Browser:** Browse by subject, grade, topic
- [ ] **Search:** Full-text search by keyword, subject, grade
- [ ] **Offline Download:** Download materials for offline viewing
- [ ] **Reading Progress:** Track pages read, videos watched
- [ ] **Bookmarks:** Save materials for quick access

**Offline Strategy:**
- [ ] **Auto-Download:** Download materials when on WiFi
- [ ] **Offline Cache:** Materials stored in local SQLite + file system
- [ ] **Sync Progress:** Reading progress synced when online
- [ ] **Storage Management:** Clear cache when storage full

**Technical Specs:**
- [ ] **File Storage:** Cloudflare R2 with folder structure `/schools/{id}/materials/`
- [ ] **Metadata Storage:** PostgreSQL table for material metadata
- [ ] **Mobile Cache:** SQLite metadata + local file storage
- [ ] **Video Embed:** YouTube/Vimeo iframe embeds (not hosted)

**Solo Dev Considerations:**
- Week 25-27: Backend API (material CRUD, search, file upload)
- Week 28-29: Frontend UI (teacher upload, student browser)
- Week 30: Mobile offline caching + testing

**Success Criteria:**
- [ ] Materials load <3 seconds on 4G connection
- [ ] Offline viewing working for PDFs and documents
- [ ] Download progress indicators visible to users
- [ ] Search returns relevant results in <1 second
- [ ] Storage management prevents device from filling up

**Deliverables:**
- [ ] Material upload and management API
- [ ] Student material browser with search
- [ ] Offline caching system with progress tracking
- [ ] Teacher analytics (which materials are most viewed)
- [ ] Storage cleanup automation

---

### Milestone 6: Rapor Digital & Parent Portal

**Timeline:** Week 31-36 (Solo) / Week 21-24 (With Freelancer)
**Status:** 📝 Not Started
**Dependencies:** Milestone 5 complete

**Goals:**
- [ ] Automated report card generation (PDF)
- [ ] Parent portal for grade monitoring
- [ ] Support for Kurikulum Merdeka & KTSP
- [ ] Grade trends visualization

**Features:**

**Grade Input System (Teacher Dashboard):**
- [ ] **Grade Entry:** Per subject per student, batch input (entire class)
- [ ] **Auto-Save:** Prevent data loss during entry
- [ ] **Excel Import:** Bulk grade upload from Excel files
- [ ] **Grade Validation:** 0-100 range check, data type validation
- [ ] **Grade Locking:** Prevent changes after submission

**GPA Calculation:**
- [ ] **Automatic GPA:** Weighted average calculation
- [ ] **Configurable Scales:** Custom grade scales per school
- [ ] **Kurikulum Merdeka:** Project-based assessments, character grades
- [ ] **KTSP:** Knowledge & skills grades (pengetahuan & keterampilan)
- [ ] **International:** GPA 4.0 scale support (for future expansion)

**Report Card Generation:**
- [ ] **PDF Generation:** Puppeteer (HTML template → PDF)
- [ ] **Custom Templates:** Different formats per school
- [ ] **School Branding:** Logo, colors, fonts, header/footer
- [ ] **Digital Signature:** Principal and homeroom teacher signatures
- [ ] **Batch Generation:** Generate 100+ report cards in background job

**Parent Portal:**
- [ ] **Grade Viewing:** Current semester + historical grades
- [ ] **GPA Trends:** Chart visualization over time
- [ ] **Subject Breakdown:** Grades per subject with teacher feedback
- [ ] **Class Ranking:** Compare with class average (context)
- [ ] **PDF Download:** Download official report cards

**Notifications:**
- [ ] **Grade Posted Alerts:** Notify parents when grades available
- [ ] **Low Grade Warnings:** Alert if grades below passing threshold
- [ ] **Improvement Alerts:** Notify when grades improve significantly

**Technical Specs:**
- [ ] **PDF Library:** Puppeteer (Node.js service) or Go PDF library
- [ ] **Chart Library:** Chart.js (web), Flutter charts (mobile)
- [ ] **Template Engine:** HTML templates with Go template syntax
- [ ] **Export Formats:** PDF (official), Excel (detailed), CSV (analysis)

**Solo Dev Considerations:**
- Week 31-33: Backend grade system (input, calculation, locking)
- Week 34-35: PDF generation, parent portal
- Week 36: Chart visualization, testing

**Success Criteria:**
- [ ] PDF generation <10 seconds for 100 report cards (batch)
- [ ] Parents can view grades within 5 minutes of posting
- [ ] Grade scales match Kurikulum Merdeka & KTSP requirements
- [ ] GPA calculations accurate (tested against real school data)
- [ ] Charts render correctly on mobile devices

**Deliverables:**
- [ ] Grade input system with validation
- [ ] GPA calculation engine (multiple curriculum support)
- [ ] PDF report card generation with custom templates
- [ ] Parent portal with grade trends visualization
- [ ] Grade notification system

---

## 🎓 Phase 3: School Operations

**Timeline:** Week 37-48 (Solo) / Week 25-32 (With Freelancer)
**Status:** 📝 Not Started
**Goal**: Complete school management features (attendance, SPP, registration)

---

### Milestone 7: Attendance & Scheduling

**Timeline:** Week 37-42 (Solo) / Week 25-28 (With Freelancer)
**Status:** 📝 Not Started
**Dependencies:** Milestone 6 complete

**Goals:**
- [ ] QR/NFC attendance system working
- [ ] Master schedule management
- [ ] Real-time absence notifications to parents
- [ ] Attendance reports

**Features:**

**Teacher Mobile App:**
- [ ] **Daily Schedule View:** Today's classes with time slots
- [ ] **QR Code Scanning:** Scan student QR codes for attendance
- [ ] **NFC Tap:** Alternative NFC card support
- [ ] **Manual Override:** Mark absent/late/permission manually
- [ ] **Batch Processing:** Scan multiple students quickly
- [ ] **Offline Recording:** Record attendance locally, sync when online

**Admin Dashboard (Web):**
- [ ] **Master Schedule Builder:** Create schedule with drag-and-drop
- [ ] **Conflict Detection:** Teacher/room double-booking prevention
- [ ] **Teacher Assignment:** Assign teachers to subjects & classes
- [ ] **Room Allocation:** Manage room inventory, track utilization
- [ ] **Schedule Templates:** Copy schedule from previous semester

**QR Code Generation:**
- [ ] **Bulk QR Generation:** Generate QR codes for all students
- [ ] **Printable PDF:** Download QR cards (card format for printing)
- [ ] **Encrypted Data:** QR codes contain encrypted student ID (UUID)
- [ ] **Error Correction:** High error correction level (H) for damaged QR readability

**NFC Support (Optional):**
- [ ] **NFC Card Writing:** Write student ID to NFC cards
- [ ] **NFC Reading:** Tap cards for attendance
- [ ] **Card Management:** Replace lost/damaged cards

**Parent/Student Portal:**
- [ ] **Schedule View:** View daily/weekly schedule
- [ ] **Attendance Status:** Check today's attendance (present/absent/late)
- [ ] **Attendance History:** View past 30 days, past semester
- [ ] **Real-Time Alerts:** Receive notifications when marked absent

**Attendance Reports:**
- [ ] **Daily Summary:** Attendance by class, by grade
- [ ] **Trends Analysis:** Identify chronic absentees
- [ ] **Teacher Attendance:** Track substitute teacher needs
- [ ] **Export Reports:** PDF, Excel formats

**Technical Specs:**
- [ ] **QR Library:** `mobile_scanner` (Flutter), 300x300px, error correction H
- [ ] **NFC Library:** `nfc_manager` (Flutter), MIFARE Classic 1K cards
- [ ] **Sync Strategy:** Background sync every 5 minutes when online
- [ ] **Push Notifications:** Firebase Cloud Messaging (FCM)
- [ ] **Conflict Resolution:** Last-write-wins with timestamps

**Solo Dev Considerations:**
- Week 37-39: Backend attendance API, master schedule management
- Week 40-41: Mobile QR scanning, NFC integration
- Week 42: Real-time notifications, attendance reports

**Success Criteria:**
- [ ] QR scan <2 seconds per student
- [ ] Offline sync success rate >95%
- [ ] Parents notified within 5 minutes of absence marking
- [ ] Master schedule conflict detection working
- [ ] Schedule copy from previous semester working

**Deliverables:**
- [ ] Attendance recording system (QR/NFC)
- [ ] Master schedule management with conflict detection
- [ ] Real-time absence notifications (FCM + WhatsApp)
- [ ] Attendance reports and analytics
- [ ] QR card generation and printing

---

### Milestone 8: SPP Management & Payment Gateway

**Timeline:** Week 43-48 (Solo) / Week 29-32 (With Freelancer)
**Status:** 📝 Not Started
**Dependencies:** Milestone 7 complete

**Goals:**
- [ ] Automated SPP invoicing
- [ ] Payment gateway integration (Midtrans)
- [ ] Payment reminders via WhatsApp/email
- [ ] Financial reports

**Features:**

**SPP Package Management (Admin Dashboard):**
- [ ] **Package Creation:** Create packages per grade, set amounts
- [ ] **Discount Management:** Scholarships, sibling discounts (2nd child: 10%, 3rd: 20%)
- [ ] **Student Assignment:** Assign packages to students (bulk or individual)
- [ ] **Active/Inactive:** Start/stop billing for students

**Invoice Generation:**
- [ ] **Auto-Generate:** Monthly invoices created automatically
- [ ] **Custom Templates:** School branding, invoice numbering
- [ ] **Delivery:** Send via email & WhatsApp
- [ ] **Invoice History:** Search and view past invoices

**Payment Gateway Integration (Midtrans):**
- [ ] **Payment Methods:** GoPay, OVO, DANA, ShopeePay, bank transfer (VA), credit card
- [ ] **Payment Processing:** Midtrans API integration
- [ ] **Webhook Handler:** Receive payment status updates
- [ ] **Retry Logic:** Auto-retry failed payments 3 times
- [ ] **Refund Handling:** Process refunds if needed

**Payment Tracking (Finance Dashboard):**
- [ ] **Payment Status:** View pending, completed, failed payments
- [ ] **Filtering:** By student, grade, payment status, date range
- [ ] **Payment Reconciliation:** Match payments with invoices
- [ ] **Aging Reports:** 0-30, 31-60, 61+ days overdue
- [ ] **Export:** Excel, PDF reports

**Parent Portal:**
- [ ] **Invoice Viewing:** View outstanding invoices
- [ ] **Online Payment:** Pay SPP via Midtrans
- [ ] **Payment History:** View all past payments
- [ ] **Payment Methods:** Save payment methods for future use
- [ ] **Auto-Debit:** Setup recurring payments (optional)

**Automated Reminders:**
- [ ] **Reminder Schedule:** 3 days before, on due date, 1/7/14 days overdue
- [ ] **Channels:** WhatsApp (primary), email (secondary), SMS (fallback)
- [ ] **Custom Templates:** Personalized reminder messages
- [ ] **Frequency Control:** Prevent spam (max 1 reminder per day)

**Financial Reports:**
- [ ] **Cash Flow:** Income vs expenses
- [ ] **Collection Rate:** % payments collected on time
- [ ] **Revenue by Grade:** Breakdown by grade level
- [ ] **Payment Methods:** Breakdown (GoPay vs bank transfer vs cash)
- [ ] **Outstanding Balances:** Who owes what

**Technical Specs:**
- [ ] **Midtrans API:** Payment processing, webhook handling
- [ ] **Invoice Templates:** HTML templates converted to PDF
- [ ] **Notification System:** WhatsApp Business API, SendGrid email
- [ ] **Background Jobs:** Invoice generation, reminder sending

**Solo Dev Considerations:**
- Week 43-45: Backend SPP system, Midtrans integration
- Week 46-47: Payment tracking, financial reports
- Week 48: Automated reminders, testing

**Success Criteria:**
- [ ] Payment success rate >98%
- [ ] Reminders sent within 1 hour of trigger time
- [ ] Invoices generated <30 seconds for 500 students
- [ ] Payment reconciliation working (manual matching for bank transfers)
- [ ] Financial reports accurate (tested against real school data)

**Deliverables:**
- [ ] SPP package management system
- [ ] Midtrans payment integration
- [ ] Automated invoice generation
- [ ] Payment reminder system (WhatsApp/email)
- [ ] Financial reports and analytics

---

## 🚀 Phase 4: Launch Preparation

**Timeline:** Week 49-60 (Solo) / Week 33-40 (With Freelancer)
**Status:** 📝 Not Started
**Goal**: Complete registration system and prepare for production launch

---

### Milestone 9: Student Registration & Onboarding

**Timeline:** Week 49-54 (Solo) / Week 33-36 (With Freelancer)
**Status:** 📝 Not Started
**Dependencies:** Milestone 8 complete

**Goals:**
- [ ] Online PPDB (new student enrollment)
- [ ] Custom registration forms per school
- [ ] Document upload and management
- [ ] Admin approval workflow

**Features:**

**Custom Registration Forms:**
- [ ] **Form Builder:** Dynamic form fields (text, number, select, checkbox, file upload)
- [ ] **Field Validation:** Required fields, min/max length, file type/size limits
- [ ] **Field Ordering:** Drag-and-drop field ordering
- [ ] **Save as Template:** Reuse forms for future enrollments
- [ ] **School Branding:** Add school logo, colors to public registration page

**Public Registration Page:**
- [ ] **School-Specific URL:** classnetic.com/register/{school_slug}
- [ ] **Mobile-Friendly:** Responsive design for mobile devices
- [ ] **Progress Indicator:** Show registration progress (step 1/5, 2/5, etc.)
- [ ] **Auto-Save:** Save progress as user moves through form
- [ ] **Document Upload:** Upload KK, akta, ijazah, photo

**Document Upload:**
- [ ] **File Types:** PDF, JPG, PNG (max 5MB per file)
- [ ] **Virus Scanning:** ClamAV automatic scanning
- [ ] **Compression:** Automatic image compression & optimization
- [ ] **Storage:** Cloudflare R2 with secure URLs
- [ ] **Retention:** 7-year retention policy (compliance)

**Payment Integration:**
- [ ] **Registration Fee:** Integrate with Midtrans for registration fee payment
- [ ] **Payment Methods:** Same as SPP (GoPay, OVO, bank transfer, credit card)
- [ ] **Payment Status Tracking:** Show payment status to parents
- [ ] **Payment Confirmation:** WhatsApp + email confirmation

**Admin Approval Workflow:**
- [ ] **Application Queue:** View pending applications
- [ ] **Document Review:** View uploaded documents (PDF viewer, image viewer)
- [ ] **Approve/Reject:** One-click approve/reject with reason
- [ ] **Auto-Enrollment:** Approved students auto-assigned student ID, class, SPP package
- [ ] **Parent Notifications:** Send approval/rejection notifications

**Parent Notifications:**
- [ ] **Payment Confirmation:** WhatsApp + email after payment
- [ ] **Approval Notification:** Login credentials sent when approved
- [ ] **Rejection Notification:** Reason for rejection provided
- [ ] **Next Steps:** Instructions for what to do next

**Technical Specs:**
- [ ] **Form Builder:** Custom JavaScript library or Svelte component
- [ ] **File Storage:** Cloudflare R2, folder structure `/schools/{id}/registrations/`
- [ ] **Virus Scanning:** ClamAV via background job
- [ ] **Midtrans Integration:** Same as SPP payments

**Solo Dev Considerations:**
- Week 49-51: Backend registration API, form builder
- Week 52-53: Public registration page, document upload
- Week 54: Admin approval workflow, testing

**Success Criteria:**
- [ ] Registration form <5 minutes to complete
- [ ] Document uploads 95% success rate
- [ ] Payment processing success rate >98%
- [ ] Admin approval workflow <2 minutes per application
- [ ] Auto-enrollment working (student ID generation)

**Deliverables:**
- [ ] Custom registration form builder
- [ ] Public registration page (mobile-friendly)
- [ ] Document upload with virus scanning
- [ ] Midtrans integration for registration fees
- [ ] Admin approval workflow with auto-enrollment

---

### Milestone 10: Polish, Testing & Launch

**Timeline:** Week 55-60 (Solo) / Week 37-40 (With Freelancer)
**Status:** 📝 Not Started
**Dependencies:** All previous milestones complete
**Priority:** 🔴 CRITICAL (launch readiness)

**Goals:**
- [ ] Beta testing with 2-3 schools completed
- [ ] All critical bugs fixed
- [ ] Security audit passed
- [ ] Production environment deployed
- [ ] Ready for B2B sales

**Polish Tasks:**

**UI/UX Improvements:**
- [ ] **Beta Feedback:** Implement improvements based on beta school feedback
- [ ] **Accessibility:** WCAG 2.1 AA compliance
- [ ] **Mobile Optimization:** Test on low-end Android devices
- [ ] **Performance:** Final optimizations, load testing
- [ ] **Error Handling:** Friendly error messages, proper error pages

**Security Hardening:**
- [ ] **Penetration Testing:** Hire security firm or self-test using OWASP ZAP
- [ ] **Vulnerability Scan:** Automated vulnerability scanning (Snyk, Dependabot)
- [ ] **Security Checklist:** Complete security checklist from README.md
- [ ] **Data Encryption:** Verify all data encrypted at rest & in transit
- [ ] **Rate Limiting:** API rate limiting properly configured

**Documentation:**
- [ ] **User Guides:** Teacher, student, parent, admin manuals
- [ ] **Video Tutorials:** Feature walkthroughs (5-10 minute videos)
- [ ] **API Documentation:** Complete OpenAPI/Swagger specs
- [ ] **Admin Manuals:** School admin setup and configuration
- [ ] **Troubleshooting Guide:** Common issues and solutions

**Testing:**

**Beta Testing:**
- [ ] **Beta Schools:** 2-3 medium-sized schools (200-500 students each)
- [ ] **UAT (User Acceptance Testing):** All features verified by real users
- [ ] **Feedback Collection:** Surveys, interviews, usage analytics
- [ ] **Bug Fixing:** Prioritize and fix all critical bugs
- [ ] **Case Studies:** Collect testimonials from beta schools

**Load Testing:**
- [ ] **Stress Test:** 1000 concurrent users (simulate peak usage)
- [ ] **Database Load:** 50,000 quiz attempts created in 30 minutes
- [ ] **File Upload Stress:** 500 concurrent file uploads
- [ ] **WebSocket Load:** 1000 concurrent WebSocket connections
- [ ] **Endurance Test:** 24-hour sustained load test

**Security Testing:**
- [ ] **OWASP Top 10:** Check for OWASP Top 10 vulnerabilities
- [ ] **SQL Injection:** Verify parameterized queries used everywhere
- [ ] **XSS Prevention:** Test for XSS vulnerabilities
- [ ] **CSRF Protection:** Verify CSRF tokens implemented
- [ ] **Authentication Test:** Test JWT token expiration, refresh logic

**Mobile Testing:**
- [ ] **Device Matrix:** Test on 5+ Android devices, 3+ iOS devices
- [ ] **Low-End Devices:** Test on Android devices with 2GB RAM
- [ ] **Network Conditions:** Test on 3G, 4G, WiFi
- [ ] **Battery Usage:** Verify apps don't drain battery excessively
- [ ] **Crash Reporting:** <1% crash-free users target

**Launch Preparation:**

**Sales Materials:**
- [ ] **Pitch Deck:** 10-15 slide deck for B2B sales presentations
- [ ] **Brochures:** One-page product overview
- [ ] **Demo Videos:** 5-10 minute feature walkthrough videos
- [ ] **Case Studies:** Testimonials from beta schools
- [ ] **ROI Calculator:** Show cost savings vs manual systems

**Website:**
- [ ] **classnetic.com Live:** Marketing website with product information
- [ ] **Pricing Calculator:** Interactive calculator for school costs
- [ ] **Demo Request Form:** Capture leads for sales follow-up
- [ ] **Blog:** SEO content for organic traffic
- [ ] **FAQ:** Common questions from beta testing

**Support Setup:**
- [ ] **Help Center:** Zendesk or self-hosted help center
- [ ] **Email Support:** support@classnetic.com
- [ ] **WhatsApp Support:** Business WhatsApp for quick questions
- [ ] **Video Tutorials:** Embed on help center
- [ ] **Community Forum:** (Optional) for peer-to-peer support

**Legal:**
- [ ] **Terms of Service:** Legal terms for using Classnetic
- [ ] **Privacy Policy:** PDPA-compliant privacy policy
- [ **Data Processing Agreement:** DPA for school data
- [ ] **School Agreement Template:** Contract template for schools
- [ ] **Cookie Policy:** GDPR/PDPA-compliant cookie policy

**Infrastructure:**
- [ ] **Production Environment:** Oracle Cloud Infrastructure (OCI)
- [ ] **CI/CD Pipeline:** Coolify automatic deployment from GitHub
- [ ] **Monitoring:** Sentry error tracking, custom performance dashboard
- [ ] **Backup & Recovery:** Automated daily backups, tested restore
- [ ] **SSL Certificates:** Cloudflare SSL configured
- [ ] **Auto-Scaling:** OCI auto-scaling groups configured
- [ ] **CDN:** Cloudflare CDN for global content delivery

**Deliverables:**
- [ ] All 6 core features working & tested
- [ ] Beta schools completed UAT successfully
- [ ] Security audit passed (zero critical vulnerabilities)
- [ ] Documentation complete (user guides, admin manuals, video tutorials)
- [ ] Sales materials ready (pitch decks, brochures, demo videos)
- [ ] Website live (classnetic.com) with pricing calculator
- [ ] Support team trained & ready
- [ ] Production environment deployed (99.5% uptime target)
- [ ] 2-3 case studies from beta schools

**Success Criteria:**
- [ ] Zero critical bugs remaining
- [ ] Mobile app crash rate <1%
- [ ] API response time <500ms average
- [ ] Web app load time <2 seconds
- [ ] 99.5% uptime achieved
- [ ] 2-3 beta schools provide positive testimonials
- [ ] Penetration testing passed with zero critical vulnerabilities
- [ ] Load testing passed (1000 concurrent users)
- [ ] Ready for B2B sales outreach

**Solo Dev Considerations:**
- Week 55-57: Beta testing, bug fixing, feedback collection
- Week 58-59: Documentation, sales materials, website
- Week 60: Infrastructure setup, final testing, launch

**Launch Checklist:**
- [ ] All features tested and working
- [ ] Security audit passed
- [ ] Load testing passed
- [ ] Mobile apps approved for App Store & Google Play
- [ ] Production infrastructure deployed
- [ ] Monitoring & alerting configured
- [ ] Backup & recovery tested
- [ ] Support team trained
- [ ] Sales materials ready
- [ ] Legal documents reviewed by lawyer
- [ ] Beta schools provide testimonials
- [ ] Pricing finalized and tested
- [ ] Payment gateway live (Midtrans production)
- [ ] Domain configured (classnetic.com)
- [ ] SSL certificates valid
- [ ] DNS configured correctly
- [ ] Email service configured (SendGrid)
- [ ] WhatsApp Business API configured
- [ ] Error tracking configured (Sentry)
- [ ] Analytics configured (Google Analytics + custom)
- [ ] Help center live
- [ ] Demo videos recorded and uploaded

---

## 📊 Prioritization Framework

### Priority Levels

- **P0 - Critical:** Core functionality, blocking launch, security vulnerabilities
- **P1 - High:** Important features, user-impacting issues, scalability concerns
- **P2 - Medium:** Nice to have, planned improvements, minor bugs
- **P3 - Low:** Future considerations, exploratory features, cosmetic issues

### Decision Criteria

Features are prioritized based on:

1. **User Impact:** How many users will benefit? (Is this blocking 100+ students or just 1?)
2. **Business Value:** Does this drive sales or retention? (B2B demo impact vs internal efficiency)
3. **Technical Debt:** Does this reduce complexity or improve stability? (Scalability, performance)
4. **Dependencies:** Is this required for other features? (Foundation vs nice-to-have)
5. **Effort:** Development time and complexity? (Quick wins vs major projects)

### Example Prioritization

**P0 Examples:**
- Authentication system (blocks everything)
- Payment processing (blocks revenue)
- Data security breach (critical for trust)
- API downtime (blocks all users)

**P1 Examples:**
- Quiz auto-grading (core feature, demo impact)
- Attendance recording (daily operation)
- Report card generation (monthly critical task)
- Performance optimization >1s response times

**P2 Examples:**
- Dark mode UI (nice to have)
- Export to CSV (can use Excel export)
- Multi-language support (future expansion)
- Advanced analytics dashboards

**P3 Examples:**
- Custom themes/colors (cosmetic)
- Gamification features (engagement, not core)
- Social media sharing (marketing, not functionality)
- AI-powered recommendations (future innovation)

---

## 📈 Success Metrics & KPIs

### Product Metrics

**School Acquisition:**
- New schools per month: Target 5-10/month (Year 1)
- Beta school conversion rate: 100% (2-3 schools convert to paying)
- Sales cycle length: Target <3 months from first contact to signed contract

**User Engagement:**
- **Daily Active Users (DAU):** Teachers & admins logging in daily
- **Monthly Active Users (MAU):** Total active users (teachers, students, parents)
- **Engagement Rate:** DAU/MAU ratio, target >40%
- **Session Duration:** Average time spent per session

**Retention Rate:**
- **School Churn:** % schools canceling subscription, target <10% annually
- **30-Day Retention:** % schools still active after 30 days, target >80%
- **90-Day Retention:** % schools still active after 90 days, target >70%

**Feature Adoption:**
- **Attendance Tracking:** % schools using daily, target >90%
- **Online Grading:** % teachers using online grading, target >80%
- **SPP Online Payments:** % payments processed online, target >70%
- **Parent Portal:** % parents logging in monthly, target >60%

### Business Metrics

**Student Under Management (SUM) - North Star Metric:**
- Year 1 target: 100,000 students
- Year 2 target: 500,000 students
- Year 3 target: 2,000,000 students

**Monthly Recurring Revenue (MRR):**
- Year 1 target: Rp 50-100M/month
- Year 2 target: Rp 300-500M/month
- Year 3 target: Rp 1.5-2.5B/month

**Average Revenue Per User (ARPU):**
- Target: Rp 8,000-10,000 per student per month
- Tracks pricing effectiveness and discount management

**Customer Acquisition Cost (CAC):**
- Target: <Rp 500K per new school
- Includes: Sales visits, marketing materials, commissions
- Calculation: Total sales & marketing costs / New schools acquired

**Lifetime Value (LTV):**
- Target: >Rp 10M per school over lifetime
- Calculation: ARPU × students × average months (36 months)
- Based on: 300 students × Rp 10K × 36 months = Rp 108M

**LTV:CAC Ratio:**
- Target: >3:1 (healthy SaaS benchmark)
- Calculation: LTV / CAC
- Example: Rp 108M / Rp 500K = 216:1 (very healthy!)

### Operational Metrics

**Offline Sync Success Rate:**
- Target: >95% successful sync (no data loss)
- Critical for user trust in offline-first architecture

**Mobile App Performance:**
- **Crash Rate:** <1% crash-free users (Android & iOS)
- **Load Time:** <3 seconds app open time
- **Battery Usage:** Not in top 10 battery draining apps

**Payment Processing:**
- **Success Rate:** >98% payment processing success
- **Speed:** Payment confirmation <5 seconds

**Support Response Time:**
- <4 hours during business hours (9 AM - 5 PM WIB)
- <24 hours for all inquiries
- <1 hour for critical issues (system down)

**Onboarding Time:**
- <1 week from sign-up to go-live (for new schools)
- Includes: Account setup, teacher training, data migration

### Quality Metrics

**User Satisfaction:**
- **Parent Satisfaction:** Survey scores, target 4.5/5
- **Teacher Satisfaction:** Survey scores, target 4.5/5
- **Admin Satisfaction:** Survey scores, target 4.5/5
- **NPS (Net Promoter Score):** >50 (indicates strong advocates)

**Feature Request Rate:**
- Track what features users want most
- Prioritize based on request frequency + business impact

**Bug Report Rate:**
- <10 bugs per week post-launch (P0 + P1 bugs only)
- Zero critical bugs in production

---

## 🚨 Risks & Mitigation

### Technical Risks

| Risk | Probability | Impact | Mitigation |
|------|-------------|--------|------------|
| **Offline Sync Complexity** | Medium | High | Simplified MVP (online-first) reduces complexity. Thorough testing of sync logic. Extensive logging & monitoring. |
| **Flutter Learning Curve** | Low | Medium | Hire freelancer for mobile apps. Focus on Go backend (strength). Consider React Native fallback if needed. |
| **Scalability Issues** | Low | High | Load testing in Milestone 4. Go backend designed for scale. OCI auto-scaling. Redis caching. |
| **Data Security Breach** | Low | Critical | Encryption at rest & in transit. Security audits before launch. Penetration testing. Compliance with PDPA. |
| **SvelteKit Maturity** | Low | Low | Less mature than Next.js, but growing rapidly. Can migrate to Next.js if issues arise. |
| **Payment Gateway Failures** | Low | Medium | Multiple gateways (Midtrans + manual bank transfer). Retry logic. Manual reconciliation processes. |

### Business Risks

| Risk | Probability | Impact | Mitigation |
|------|-------------|--------|------------|
| **Slow Adoption** | Medium | High | Free trial (3 months). Strong onboarding. Proof of concept with beta schools. Showcase testimonials. |
| **Price Sensitivity** | High | High | Flexible pricing (tiered, flat fee). Value demonstration (ROI calculator). Anchor pricing vs competitors (70% cheaper). |
| **Competition Response** | Medium | Medium | Focus on underserved market (rural schools). Double-down on offline-first differentiation. Build strong relationships with early adopters. |
| **School Budget Cuts** | Medium | Medium | Tiered pricing (affordable tiers). Highlight cost savings vs manual admin staff (1 admin salary vs Classnetic subscription). |
| **Sales Cycle Length** | High | Medium | B2B sales to schools can take 6-12 months. Start with schools you have relationships with. Offer free trial to reduce risk. |

### Operational Risks

| Risk | Probability | Impact | Mitigation |
|------|-------------|--------|------------|
| **Solo Developer Bottleneck** | High | High | Hire Flutter freelancer (accelerates by 6-9 months). Document everything. Avoid bus factor (key person risk). |
| **Beta School Availability** | Medium | Medium | Only 2-3 schools available. Focus on quality over quantity. Reach out to education consultants for more. |
| **Customer Support Burden** | Medium | Medium | Self-service resources (help center, video tutorials). Community forum (peer-to-peer support). Priority support for paid tiers. |
| **Midtrans Dependency** | Low | High | Payment gateway critical for SPP & registration fees. Add manual bank transfer as fallback. Multiple payment options (GoPay, OVO, bank transfer). |

---

## 🔄 Iteration Process

### Review Cadence

**Weekly:**
- Team standup (solo dev: self-review)
- Progress review against milestones
- Bug triage (P0/P1 bugs addressed immediately)

**Bi-Weekly:**
- Sprint planning (2-week sprints)
- Sprint retrospective (what went well, what to improve)
- Milestone progress check

**Monthly:**
- Roadmap review and adjustment
- KPI tracking (are we hitting targets?)
- Feedback review from beta schools

**Quarterly:**
- Strategic planning and goal setting
- Major roadmap updates
- Budget review (freelancer costs, infrastructure costs)

### Feedback Loops

**User Feedback:**
- **Surveys:** Quarterly surveys for teachers, parents, admins
- **Interviews:** Monthly calls with beta schools
- **Usage Analytics:** Track feature adoption, identify pain points
- **Support Tickets:** Analyze common issues, prioritize fixes

**Stakeholder Review:**
- Weekly updates (if funded/investors involved)
- Demo sessions after each milestone
- Transparent progress sharing

**Technical Review:**
- **Code Reviews:** Self-review (solo) or peer review (if team grows)
- **Architecture Reviews:** After Milestone 4, before Milestone 10
- **Performance Reviews:** Monthly performance benchmarking
- **Security Reviews:** Quarterly security audits

**Market Analysis:**
- **Competitor Monitoring:** Track SekolahKu, Zenius, Ruangguru features & pricing
- **Market Trends:** Education technology adoption in Indonesia
- **Customer Development:** Talk to 5-10 schools per month

---

## 📝 Change Management

### Roadmap Updates

**Frequency:** Reviewed monthly, updated quarterly

**Process:**
1. Monthly review of progress against milestones
2. Identify blockers, risks, or new opportunities
3. Team discussion (solo dev: self-reflection, mentor consultation)
4. Stakeholder approval (if applicable)
5. Update roadmap.md with rationale for changes

**Communication:**
- Update all stakeholders of roadmap changes
- Explain reasons for changes (technical, business, market)
- Provide updated timelines and deliverables

### Priority Changes

**Triggers:**
- Market changes (competitor launches, new regulations)
- Technical constraints (unforeseen complexity, security issues)
- User feedback (beta schools requesting different features)
- Resource changes (freelancer availability, budget changes)

**Process:**
1. Impact analysis (what changes, why, what's the effect?)
2. Team discussion (solo dev: consult with mentors, advisors)
3. Decision (re-prioritize based on user impact + business value)
4. Communication (explain changes to stakeholders, beta schools)
5. Documentation (update roadmap with rationale)

**Documentation:**
- All roadmap changes documented in this file
- Include rationale for changes (why we made this decision)
- Date-stamp all changes
- Archive old versions for reference

---

## 🎯 Post-Launch Roadmap (Future)

### Phase 5: Feature Expansion (Months 12-18)

**Potential Features:**
- [ ] **Library Management:** Book catalog, borrowing, QR checkout, due date reminders
- [ ] **Transportation Management:** School bus tracking, route optimization, GPS
- [ ] **Inventory Management:** School asset tracking, maintenance scheduling
- [ ] **Advanced Analytics:** Student performance prediction, attendance pattern analysis

### Phase 6: Ecosystem Growth (Months 18-24)

**Potential Features:**
- [ ] **AI-Powered Insights:** Personalized learning recommendations, early warning system
- [ ] **Integration Hub:** Kemenag database, Dapodik integration, Zoom/Meet integration
- [ ] **Communication Suite:** In-app messaging, video conferencing, announcements
- [ ] **Marketplace:** Third-party integrations, education content marketplace

---

**Last Updated:** 2026-01-06
**Next Review Date:** 2026-02-06 (1 month)
**Owner:** Najib Zain (Lead Developer & Product Owner)
**Version:** 1.0.0 - Initial Roadmap

**Approved By:** [Product Owner / Investor Name - if applicable]
**Reviewers:** Development Team, Beta Schools, Education Consultants

---

## Appendix: Recommended Resources

### Flutter Developer Hiring

**Platforms:**
- LinkedIn: "Flutter developer Indonesia"
- GitHub: Flutter Indonesia community
- Upwork/Fiverr: Global talent, prioritize GMT+7 timezone
- Universities: Final-year IT students (for QA/testing)

**Required Skills:**
1. Flutter 3.16+ experience (must see portfolio apps)
2. Dart programming language
3. Firebase integration (FCM, Analytics)
4. Offline storage (SQLite, sqflite)
5. REST API integration
6. QR code scanning (`mobile_scanner`)
7. NFC integration (`nfc_manager`)

**Test Assignment** (Paid, 1-2 days):
"Build a simple Flutter app that:
- Displays a list of assignments (fetch from dummy API)
- Caches assignments locally in SQLite
- Shows cached data when offline
- Syncs when internet returns"

### Load Testing Tools

- **k6:** https://k6.io/ (Go-based, recommended)
- **Artillery:** https://artillery.io/ (Node.js-based, alternative)
- **JMeter:** https://jmeter.apache.org/ (Java-based, more complex)

### Security Testing

- **OWASP ZAP:** https://www.zaproxy.org/ (free penetration testing)
- **Snyk:** https://snyk.io/ (dependency vulnerability scanning)
- **Dependabot:** GitHub's built-in vulnerability scanner

### Monitoring & Analytics

- **Sentry:** https://sentry.io/ (error tracking)
- **Grafana:** https://grafana.com/ (metrics dashboards)
- **Google Analytics:** https://analytics.google.com/ (user analytics)

---

**End of Roadmap**

This roadmap is a living document. As we learn from beta schools, market feedback, and technical discoveries, we'll adapt and evolve. The core vision remains constant: transform Indonesian school management with technology that's accessible, affordable, and built for local needs.
