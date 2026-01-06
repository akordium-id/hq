# 🎓 Classnetic.com - Product Specification

## Vision & Mission

**Vision Statement:** Menjadi platform manajemen sekolah terdepan di Indonesia yang mentransformasi operasional sekolah tradisional menjadi sistem digital yang efisien, transparan, dan dapat diakses dari mana saja.

**Mission Statement:** Memberdayakan sekolah swasta Indonesia dengan teknologi modern untuk mengoptimalkan manajemen siswa, meningkatkan keterlibatan orang tua, dan mengurangi beban administrasi guru.

**North Star Metric:** Jumlah siswa yang dikelola melalui platform Classnetic (active enrolled students).

---

## Problem Statement

### Pain Points untuk Sekolah

1. **Administrasi Manual:** Pendaftaran siswa, absensi, penilaian masih manual (kertas/Excel) - inefficient dan error-prone
2. **Keterbatasan Akses:** Guru & admin hanya bisa bekerja dari kantor (no mobile access) - must be physically present
3. **Komunikasi Terputus:** Orang tua sulit memantau perkembangan anak secara real-time - only get report cards 2x per year
4. **Kesulitan Internet:** Banyak sekolah di daerah dengan koneksi internet tidak stabil - cannot rely on always-online systems
5. **Manajemen Keuangan:** Tracking SPP dan kas sekolah manual, rentan error - no automated reminders
6. **Data Terfragmentasi:** Informasi siswa tersebar di banyak tempat (buku, Excel, WhatsApp) - no single source of truth

### Pain Points untuk Guru

1. **Waktu Administrasi:** Menghabiskan waktu untuk input nilai, absensi manual - time taken away from teaching
2. **Duplikasi Kerja:** Data yang sama diinput di banyak tempat - inefficient workflows
3. **Kesulitan Remidial:** Sulit tracking siswa yang perlu bimbingan khusus - no early warning system
4. **Komunikasi dengan Orang Tua:** Tidak ada channel terstruktur - WhatsApp is chaotic and unstructured

### Pain Points untuk Orang Tua

1. **Kurang Transparansi:** Tidak tahu perkembangan akademik anak secara real-time - report cards too infrequent
2. **Kesulitan Memantau:** Tidak ada sistem notifikasi untuk absensi, nilai, tugas - miss important updates
3. **Pembayaran SPP:** Manual, lupa bayar, tidak ada reminder otomatis - late fees accumulate

### Pain Points untuk Siswa

1. **Akses Materi:** Sulit mengakses materi jika tidak ada di sekolah - no remote learning option
2. **Tugas & Penilaian:** Tidak tahu deadline tugas, nilai keluar lambat - lack of visibility
3. **Learning Offline:** Tidak bisa belajar jika tidak ada internet - disadvantage during connectivity issues

---

## Target Market

### Primary Market: Sekolah Swasta (SD, SMP, SMA)

**Segment Size:** ~148,000 private schools di Indonesia (Kemdikbud 2023 data)

**Characteristics:**
- Budget terbatas butuh solusi terjangkau (price sensitive)
- Negeri di kota kecamatan dan kabupaten (tier 2/3 cities)
- Mulai aware pentingnya digitalisasi (tech adoption growing)
- Staff IT terbatas (butuh solusi user-friendly)
- Internet connectivity bervariasi (butuh offline support)

**Pain Points:**
- Kompetisi dengan sekolah lain (butuh modern edge untuk differentiation)
- Orang tua minta transparency (growing parental expectations)
- Guru overworked dengan admin tasks (burnout risk)
- Manajemen SPP manual (cash flow issues)

**Buying Decision Maker:** Kepala Sekolah + Yayasan (foundation owners)

**Estimated Addressable Market:**
- 30% actively looking for digitalization = 44,400 schools
- 10% early adopters = 14,800 schools (Year 1-3 target)

---

### Secondary Market: Madrasah & Pesantren Modern

**Segment Size:** ~80,000 madrasah (Kemenag data)

**Characteristics:**
- Fokus pada nilai Islami + akademik (dual curriculum)
- Growing tech adoption (modernization trend)
- Budget sensitive (butuh affordable pricing)
- Unique needs: Kurikulum pesantren, tahfidz tracking

**Special Features Needed:**
- Kurikulum Kemenag integration (Islamic studies)
- Tahfidz (Al-Quran) tracking (memorization progress)
- Islamic studies assessment (religious subjects)
- Prayer times integration (jadwal sholat)

**Pricing Sensitivity:** Higher than private schools (need maximum affordability)

---

### Tertiary Market: Bimbel (Tutoring Centers)

**Segment Size:** ~250,000+ bimbel di Indonesia

**Characteristics:**
- High student turnover (short-term enrollments)
- Need simple attendance & payment tracking (core needs only)
- Focus on operational efficiency (time = money)
- Less complex academic assessment (no grades, just progress)

**Simplified Features Needed:**
- Student registration
- Attendance tracking
- SPP/payment management
- Basic parent portal (progress updates)

**Pricing:** Lower tiers (simpler needs, less value)

---

## Core Features (6)

### Feature 1: Pendaftaran Siswa Online + Payment Gateway

**User Flow:**

1. **School Setup:**
   - School admin creates custom registration form
   - Define fields: student name, DOB, address, previous school, parent info
   - Specify required vs optional fields
   - Upload document requirements (KK, akta, ijazah, photo)

2. **Parent/Student Registration:**
   - Access public registration form (classnetic.com/register/{school_slug})
   - Fill form fields (mobile-friendly)
   - Upload required documents (PDF, images)
   - Pay registration fee via payment gateway

3. **Payment Processing:**
   - Choose payment method: GoPay, OVO, bank transfer (VA), credit card
   - Redirect to Midtrans payment page
   - Payment status tracked in real-time
   - Receive confirmation via WhatsApp & email

4. **Admin Review:**
   - School admin reviews pending applications
   - View uploaded documents
   - Approve or reject dengan reason
   - Approved students automatically assigned student ID
   - Parents receive notification of approval/rejection

5. **Automated Enrollment:**
   - Approved students automatically added to student database
   - Parents receive login credentials
   - Students assigned to class based on grade level
   - SPP package automatically assigned (if applicable)

**Key Features:**
- Custom registration forms per school (dynamic form builder)
- Document upload & management (Cloudflare R2 storage)
- Payment gateway integration (Midtrans API)
- Approval workflow untuk admin (multi-stage approval)
- Auto-generate student ID (format: SCHOOL-YYYY-NNNN)
- Integration dengan student database (seamless enrollment)

**Technical Specs:**

**Form Builder:**
- Dynamic form fields: text, number, select, checkbox, file upload
- Field validation: required, min/max length, file type/size limits
- Field ordering & grouping (sections)
- Save as template untuk future use

**File Storage:**
- Cloudflare R2 untuk document storage (cheaper than OCI)
- File types: PDF, JPG, PNG (max 5MB per file)
- Automatic image compression & optimization
- Secure file access (authenticated URLs)
- Retention policy: 7 years (compliance)

**Payment Integration:**
- Midtrans API untuk payment processing
- Payment methods: GoPay, OVO, DANA, ShopeePay, bank transfer (VA), credit card
- Webhook handler untuk payment status updates
- Retry logic untuk failed payments
- Refund handling (if needed)

**Notification System:**
- WhatsApp Business API (Twilio/MessageBird)
- SendGrid untuk email notifications
- SMS fallback (for parents without WhatsApp)
- Templates: payment confirmation, approval notification, rejection notification

**Priority:** P0 (Critical - onboarding depends on this)

---

### Feature 2: Jadwal Pelajaran & Absensi Digital (QR/NFC)

**Teacher App (Mobile):**

**Daily Schedule View:**
- View today's classes dengan time slots
- Color-coded subjects (easy visual scanning)
- Quick actions: start attendance, view class list, open materials

**QR/NFC Attendance Recording:**
- Open camera (QR) or NFC reader
- Scan student QR code or tap NFC card
- Auto-mark student as "present"
- Manual override: mark absent/late/permission
- Add notes untuk absences (reason, follow-up needed)
- Batch processing: scan multiple students quickly
- Offline mode: record attendance locally, sync when online

**Substitute Teacher Features:**
- View substitute teacher assignments
- Access original teacher's lesson notes
- Take attendance on behalf of absent teacher

**Admin Dashboard (Web):**

**Master Schedule Management:**
- Create master schedule (teacher, class, subject, room, time)
- Conflict detection (teacher double-booked, room double-booked)
- Drag-and-drop schedule builder (visual interface)
- Copy schedule from previous semester/academic year
- Apply schedule to multiple classes at once

**Teacher Assignment:**
- Assign teachers to subjects & classes
- Track teacher workload (hours per week)
- Teacher availability management (leave, part-time)

**Room Allocation:**
- Manage room inventory
- Assign rooms to classes/subjects
- Track room utilization

**Attendance Reports:**
- Daily attendance summary (by class, by grade)
- Attendance trends (identify chronic absentees)
- Export reports (PDF, Excel)
- Parent notification logs (who was notified when)

**Student/Parent App (Mobile):**

**Schedule View:**
- View daily/weekly schedule
- See upcoming classes dengan time & room
- Add to personal calendar (Google Calendar integration)

**Attendance Status:**
- Check today's attendance status (present/absent/late)
- View attendance history (past 30 days, past semester)
- Receive real-time notifications when marked absent

**Key Features:**
- **QR Code Generation:**
  - Generate QR codes for all students (bulk operation)
  - Download QR codes as printable PDF (card format)
  - QR codes contain encrypted student ID (UUID based)
  - QR codes are scannable by any mobile phone camera

- **NFC Card Support:**
  - Alternative to QR codes (physical NFC cards)
  - Flutter `nfc_manager` package untuk NFC reading
  - Store encrypted student ID on NFC card
  - More durable than paper QR codes (long-term use)

- **Offline Attendance Recording:**
  - Local SQLite storage pada teacher phone
  - Queue attendance records when offline
  - Background sync when internet available
  - Conflict resolution: last-write-wins dengan timestamps

- **Real-Time Notifications:**
  - Parents receive push notification within 5 minutes
  - Notification includes: student name, class, date, status, time
  - Configurable notification preferences (enable/disable)

- **Attendance Analytics:**
  - Absenteeism patterns (identify at-risk students)
  - Attendance trends (by class, by grade, by day of week)
  - Teacher attendance tracking (substitute needs)

**Technical Specs:**

**QR Code:**
- Library: `qr_code_flutter` atau `mobile_scanner`
- QR code content: `{"student_id": "uuid", "timestamp": 1234567890}` (encrypted)
- Error correction level: H (highest, for damaged QR readability)
- Size: 300x300px (optimal untuk scanning)

**NFC Integration:**
- Package: `nfc_manager` (Flutter)
- NFC card type: MIFARE Classic 1K or NTAG213
- Write encrypted student ID to NFC card memory
- Read timeout: 3 seconds

**Offline Storage:**
- SQLite database pada teacher phone
- Table structure: mirrored from server schema (students, attendances)
- Sync strategy: background sync every 5 minutes when online
- Conflict resolution: compare timestamps, server wins if newer
- Delta sync: only upload changed records (minimize bandwidth)

**Sync Strategy:**
```go
// Backend API endpoint
POST /api/v1/sync/attendance

// Request body (from teacher app)
{
  "device_id": "teacher-phone-uuid",
  "records": [
    {
      "local_id": 123,
      "student_id": "uuid",
      "schedule_id": "uuid",
      "status": "present",
      "recorded_at": "2026-01-06T08:00:00Z",
      "synced_at": null
    }
  ]
}

// Response
{
  "success": true,
  "uploaded": 15,
  "conflicts": [
    {
      "local_id": 123,
      "server_record": { ... },
      "resolution": "server_wins"
    }
  ]
}
```

**Notifications:**
- Firebase Cloud Messaging (FCM) untuk push notifications
- Message queue untuk reliable delivery
- Retry logic: 3 attempts dengan exponential backoff
- Fallback to SMS if FCM fails (Twilio)

**Priority:** P0 (Critical - daily operation depends on this)

---

### Feature 3: E-Learning Module (Assignments & Quizzes)

**Teacher Dashboard (Web):**

**Assignment Creation:**
- Create assignments dengan rich text description
- Set due dates & times (timezone-aware)
- Attach learning materials (PDF, documents, images, video links)
- Select which classes see the assignment
- Set max score (untuk grading)
- Optional: enable late submissions dengan penalty
- Draft vs published (schedule untuk future release)

**Quiz Creation:**
- Multiple question types: multiple choice, true/false, short answer, essay
- Set time limits (auto-submit when time expires)
- Randomize question order (prevent cheating)
- Specify correct answers untuk auto-grading
- Assign point values per question
- Create question bank (reuse questions across quizzes)

**Submission Management:**
- View all submissions in one place
- Filter by status (submitted, not submitted, late)
- Sort by submission time, student name, score
- Bulk actions: remind late students, extend deadline

**Grading Interface:**
- Grade submissions one-by-one or batch
- Auto-graded questions (multiple choice) auto-scored
- Manual grading untuk essays & short answers
- Add feedback comments (rich text)
- Rubric-based grading (optional)
- Release grades all at once or individually

**Analytics:**
- Grade distribution (histogram)
- Average score, median, standard deviation
- Identify struggling students (below threshold)
- Question difficulty analysis (which questions were hardest)

**Student App (Mobile/Web):**

**Assignments View:**
- View upcoming assignments (sorted by due date)
- See overdue assignments (highlighted in red)
- Filter by subject, status
- Calendar view (monthly overview)

**Assignment Details:**
- Read assignment description
- Download/view attachments (offline access)
- Upload submissions (files, photos, text responses)
- See submission history (resubmission allowed?)
- Check grade & feedback after grading

**Quiz Taking:**
- Start quiz (countdown timer displayed)
- Auto-save answers every 30 seconds
- Navigate between questions (jump to any question)
- Flag questions untuk review
- Submit quiz (auto-submit when time expires)
- View score immediately (if auto-graded)

**Learning Materials:**
- Access teacher-uploaded materials
- Offline cache untuk reading without internet
- Search materials by keyword, subject
- Bookmark pages untuk quick access

**Parent Dashboard (Web/Mobile):**

**Assignment Monitoring:**
- View child's upcoming assignments
- Check submission status (submitted, not submitted, late)
- See due dates (help child manage time)

**Grades & Feedback:**
- Monitor child's grades per subject
- Read teacher feedback (understand areas for improvement)
- Compare dengan class average (context)

**Notifications:**
- New assignment notifications
- Due date reminders (1 day before, 1 hour before)
- Grade posted notifications
- Missing submission alerts

**Key Features:**

**Rich Text Editor:**
- Library: TinyMCE atau Quill (web), Flutter HTML editor (mobile)
- Features: bold, italic, lists, links, images, tables, code blocks
- Paste dari Word (auto-format)
- LaTeX support untuk math equations (MathJax)

**File Upload Support:**
- File types: PDF, DOC, DOCX, XLS, XLSX, PPT, PPTX, JPG, PNG, MP4, MP3
- Max file size: 50MB per file
- Max files per submission: 10 files
- Virus scanning (ClamAV) pada upload
- Automatic image compression & optimization

**Quiz Engine:**
- Multiple choice: single correct, multiple correct
- True/false questions
- Short answer (text input)
- Essay questions (long text)
- Matching questions (drag & drop)
- Fill-in-the-blank
- Auto-grading untuk objective questions
- Partial credit support (e.g., 3/5 correct)

**Offline Access:**
- Learning materials cached locally (SQLite)
- Quiz auto-save (restore if app crashes)
- Submit assignments when online (queue uploads)
- Sync strategy: download materials when on WiFi, sync submissions when online

**Plagiarism Detection (Basic):**
- Text similarity check (cosine similarity)
- Check against internet sources (Google Search API)
- Flag suspicious submissions untuk teacher review
- Not as sophisticated as Turnitin, but catches obvious copying

**Discussion Forum (Optional - Phase 2):**
- Q&A thread per assignment
- Students can ask questions
- Teacher/TA answers
- Peer-to-peer learning
- Moderation tools (remove inappropriate content)

**Technical Specs:**

**File Storage:**
- Cloudflare R2 untuk assignment submissions
- Folder structure: `/schools/{school_id}/assignments/{assignment_id}/submissions/{student_id}/`
- Secure URLs: presigned URLs dengan expiration
- Auto-cleanup: Delete submissions 1 year after student graduates (GDPR compliance)

**Quiz Engine Architecture:**
```sql
CREATE TABLE quizzes (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    assignment_id UUID NOT NULL REFERENCES assignments(id) ON DELETE CASCADE,
    time_limit INT, -- minutes
    shuffle_questions BOOLEAN DEFAULT false,
    show_results BOOLEAN DEFAULT true, -- show results immediately after submit
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE quiz_questions (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    quiz_id UUID NOT NULL REFERENCES quizzes(id) ON DELETE CASCADE,
    question_type VARCHAR(20) NOT NULL, -- 'multiple_choice', 'true_false', 'short_answer', 'essay'
    question_text TEXT NOT NULL,
    points INT NOT NULL DEFAULT 1,
    order_index INT NOT NULL,
    correct_answer JSONB, -- {"option": "A"} or {"options": ["A", "C"]}
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE quiz_options (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    question_id UUID NOT NULL REFERENCES quiz_questions(id) ON DELETE CASCADE,
    option_label VARCHAR(5) NOT NULL, -- 'A', 'B', 'C', 'D'
    option_text TEXT NOT NULL,
    is_correct BOOLEAN DEFAULT false
);

CREATE TABLE quiz_attempts (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    quiz_id UUID NOT NULL REFERENCES quizzes(id) ON DELETE CASCADE,
    student_id UUID NOT NULL REFERENCES students(id) ON DELETE CASCADE,
    started_at TIMESTAMP DEFAULT NOW(),
    completed_at TIMESTAMP,
    score INT,
    answers JSONB, -- {"question_id": "answer"}
    auto_graded BOOLEAN DEFAULT false
);
```

**Auto-Grading Logic:**
```go
func (s *QuizService) AutoGrade(attempt *QuizAttempt) (score int, err error) {
    quiz, err := s.GetQuiz(attempt.QuizID)
    if err != nil {
        return 0, err
    }

    totalScore := 0
    for _, question := range quiz.Questions {
        studentAnswer := attempt.Answers[question.ID]
        correctAnswer := question.CorrectAnswer

        var earnedScore int
        switch question.Type {
        case "multiple_choice":
            if studentAnswer == correctAnswer["option"] {
                earnedScore = question.Points
            }
        case "true_false":
            if studentAnswer == correctAnswer["option"] {
                earnedScore = question.Points
            }
        case "multiple_correct":
            studentOptions := strings.Split(studentAnswer, ",")
            correctOptions := correctAnswer["options"].([]string)
            if slices.Equal(studentOptions, correctOptions) {
                earnedScore = question.Points
            }
        case "short_answer":
            // Fuzzy matching
            similarity := fuzzy.Ratio(studentAnswer, correctAnswer["text"])
            if similarity > 80 {
                earnedScore = question.Points
            }
        case "essay":
            // Requires manual grading
            earnedScore = 0
        }
        totalScore += earnedScore
    }

    return totalScore, nil
}
```

**Priority:** P1 (High - core learning function, but can start with basic assignments)

---

### Feature 4: Rapor Digital & Parent Portal

**Admin/Teacher Dashboard (Web):**

**Grade Input System:**
- Input grades per subject per student
- Batch grade input (entire class at once)
- Auto-save (prevent data loss)
- Import grades dari Excel (bulk upload)
- Grade validation (0-100 range check)
- Lock grades after submission (prevent changes)

**GPA Calculation:**
- Automatic GPA calculation (weighted average)
- Configurable grade scale (school-defined)
- Support untuk different curriculums:
  - Kurikulum Merdeka (0-100 scale)
  - KTSP (A-E scale)
  - International (GPA 4.0 scale)
- Semester vs yearly GPA
- Cumulative GPA calculation

**Report Card Generation:**
- PDF generation dengan school branding
- Customizable templates (different formats per school)
- Include: student info, grades per subject, GPA, class rank, teacher comments
- Add school logo, header, footer
- Digital signature (principal, homeroom teacher)
- Batch generation (generate untuk entire class/grade)

**Performance Tracking:**
- Historical performance (compare semesters)
- Grade trends (improving, declining, stable)
- Identify at-risk students (below threshold)
- Class rank & percentile
- Subject-wise performance breakdown

**Parent Portal (Mobile/Web):**

**Grade Viewing:**
- View current semester grades
- View historical grades (previous semesters)
- See teacher feedback per subject
- Check class average (comparison context)
- Download PDF report card
- Access any time (not just after exams)

**Academic Progress:**
- GPA trends over time (chart visualization)
- Subject-wise strengths & weaknesses
- Attendance summary (correlate attendance dengan grades)
- Teacher comments & recommendations

**Alerts & Notifications:**
- Grade posted notifications
- Low grade warnings (below passing threshold)
- Performance improvements (positive reinforcement)

**Student Portal (Mobile/Web):**

**Self-Monitoring:**
- View own grades & GPA
- Track academic progress over time
- See areas for improvement (teacher feedback)
- Compare dengan class average (healthy competition)
- Download report cards

**Goal Setting:**
- Set target grades untuk each subject
- Track progress towards goals
- Teacher can comment on goals

**Key Features:**

**Curriculum Support:**
- **Kurikulum Merdeka:**
  - Project-based learning assessments
  - Character development grades
  - Extracurricular activities tracking
  - Pancasila student profile assessment

- **KTSP (Kurikulum 2013):**
  - Knowledge & skills grades (pengetahuan & keterampilan)
  - Attitude grades (sikap spiritual & sosial)
  - Extracurricular grades
  - Predikat (A, B, C, D) conversion

- **International:**
  - GPA 4.0 scale
  - Letter grades (A, B, C, D, F)
  - AP/IB curriculum support

**PDF Generation:**
- Library: Puppeteer (Node.js) atau Go PDF library
- Templates: HTML template converted to PDF
- Customization: School logo, colors, fonts, layout
- Batch generation: Generate 100+ report cards in background job
- Email delivery: Send PDF to parents automatically

**Charts & Visualization:**
- Library: Chart.js atau Recharts (web), Flutter charts (mobile)
- Charts: Grade trends, subject comparison, GPA over time
- Interactive: Hover untuk see exact values
- Export charts as images

**Data Export:**
- Excel export (detailed grade data)
- PDF export (formatted report card)
- CSV export (untuk further analysis)
- Email PDF directly to parents

**Priority:** P0 (Critical - mandatory reporting requirement, schools cannot function without this)

---

### Feature 5: Alumni Management & Networking

**Alumni Portal (Web/Mobile):**

**Profile Management:**
- Create alumni profile after graduation
- Update career information (company, position, industry)
- Upload profile photo
- Add LinkedIn profile
- Set visibility preferences (public/private)
- Verified automatically (matched dengan graduation records)

**Networking Directory:**
- Search alumni by name, graduation year, company, industry
- Filter by graduation year, location, industry
- View alumni profiles (public information only)
- Connect dengan alumni (send connection request)
- In-app messaging (once connected)

**Job Board:**
- View job postings dari alumni & companies
- Filter by industry, location, experience level
- Apply to jobs (send resume via portal)
- Post jobs (if alumni is hiring)
- Job expires after 60 days (auto-remove)

**Events:**
- View upcoming alumni events (reunions, networking nights)
- RSVP to events
- Create events (if approved by school)
- Event calendar (monthly view)
- Photo galleries dari past events

**Donations:**
- Donate to school (online payment via Midtrans)
- Choose donation purpose (scholarship fund, facility improvement, etc.)
- Recurring donations (monthly auto-debit)
- Donation history & tax receipts

**Mentorship Program:**
- Alumni can sign up as mentors
- Students can request mentorship
- Matching system (based on industry/interest)
- In-app video calls (Zoom integration - future)
- Progress tracking (mentorship sessions log)

**Newsletter:**
- Subscribe to alumni newsletter
- Monthly updates (school news, alumni achievements, job postings)
- Unsubscribe anytime

**School Admin Dashboard:**

**Alumni Database:**
- View all alumni records
- Filter by graduation year, location, industry
- Export alumni data (Excel, PDF)
- Update alumni information (admin edits)
- Deactivate alumni accounts (if requested)

**Career Tracking:**
- Track alumni career progression (companies, positions)
- Generate reports (employment rate, average salary, industry distribution)
- Success stories (feature top alumni on website)
- Integration dengan LinkedIn (auto-update - future)

**Event Management:**
- Create alumni events
- Manage RSVPs
- Send event invitations (email, WhatsApp)
- Track attendance
- Post-event photos & summaries

**Donation Management:**
- View all donations
- Generate donation reports (total amount, by purpose, by time)
- Send tax receipts (PDF)
- Thank donors (automated emails)
- Reconcile dengan accounting system

**Current Students:**

**Alumni Connections:**
- View alumni profiles (mentors, career advisors)
- Request mentorship
- Ask career questions (Q&A forum)
- Find internship opportunities
- Learn from alumni experiences (success stories)

**Career Guidance:**
- Explore career paths by industry
- See what alumni are doing
- Ask alumni questions about their careers
- Get advice on college applications

**Key Features:**

**Alumni Verification:**
- Automatic verification: Match student graduation records
- Verification criteria: Graduation year, student ID, name match
- Manual verification: Upload diploma/transcript (if automatic fails)
- Verification badge on profile (verified alumni)

**Job Board:**
- Post job dengan: Title, company, location, description, requirements, salary range
- Job categories: Full-time, part-time, internship, freelance
- Application tracking: See who applied, filter applications
- Message applicants: In-app messaging for interviews
- Job analytics: Views, applications, clicks

**Donation System:**
- Payment integration: Midtrans (same as SPP payments)
- Donation purposes: Scholarship fund, building fund, library, sports facilities, etc.
- Recurring donations: Monthly, quarterly, yearly options
- Tax-deductible receipts: Auto-generated PDF dengan donation details
- Public donor wall: Optional anonymous or public recognition

**Mentorship Matching:**
- Matching algorithm: Based on industry, interests, location
- Mentorship types: Career guidance, college applications, skill development
- Session tracking: Log mentorship hours, topics discussed
- Feedback system: Students rate mentors (quality control)

**Priority:** P2 (Medium - value-add feature, not core MVP, can launch after core features stable)

---

### Feature 6: Kas Sekolah & SPP Tracking

**School Admin Dashboard (Web):**

**SPP Package Management:**
- Create SPP packages (name, amount, due date)
- Set different amounts per grade level
- Create discounts (scholarships, sibling discounts)
- Assign packages ke students (bulk or individual)
- Active/inactive packages (start/stop billing)

**Invoice Generation:**
- Auto-generate monthly invoices
- Custom invoice templates (school branding)
- Send invoices via email & WhatsApp
- Invoice history & search
- Bulk invoice generation (entire school)

**Payment Tracking:**
- View all payments (pending, completed, failed)
- Filter by student, grade, payment status
- Payment reconciliation (match bank statements)
- Export payment reports (Excel, PDF)
- Aging reports (overdue payments)

**Financial Reports:**
- Cash flow reports (income vs expenses)
- Payment collection rate (% collected on time)
- Outstanding balances (who owes what)
- Revenue by grade level
- Payment method breakdown (GoPay vs bank transfer vs cash)

**Bank Integration (Future):**
- Auto-reconcile dengan bank statements (API integration)
- Check payments automatically (mark invoices as paid)
- Handle bank fees & charges
- Multi-bank account support

**Cash Management:**
- Record cash expenses
- Expense categories (salary, utilities, supplies, etc.)
- Upload receipts (proof of payment)
- Expense approval workflow (if multi-user finance team)
- Cash balance tracking

**Parent/Student Portal (Mobile/Web):**

**Invoice Viewing:**
- View outstanding invoices
- See payment history
- Download invoice PDF
- Check payment due dates

**Online Payment:**
- Pay SPP online via Midtrans
- Payment methods: GoPay, OVO, bank transfer (VA), credit card
- Instant payment confirmation
- Receive payment receipt via WhatsApp & email

**Payment History:**
- View all past payments
- Filter by academic year, semester
- Download receipts
- Print receipts

**Auto-Debit Setup:**
- Set up recurring payments (monthly auto-debit)
- Link bank account or e-wallet
- Cancel anytime
- Notification before payment (3 days before due date)

**Payment Reminders:**
- Receive reminders via WhatsApp, email, SMS
- Reminder schedule: 3 days before, on due date, overdue
- Customize reminder preferences (frequency, channel)

**Finance Team:**

**Reconciliation Dashboard:**
- Match payments dengan invoices
- Handle partial payments
- Process refunds (if needed)
- Adjust invoice amounts (write-offs)

**Bank Integration:**
- View bank transactions
- Auto-match payments ke invoices
- Handle bank fees & charges
- Export bank statements

**Expense Management:**
- Record expenses (categories, amounts, dates)
- Upload receipts
- Expense reports (by category, by time period)
- Budget tracking (actual vs budget)

**Financial Reports:**
- Profit & loss statement
- Cash flow statement
- Balance sheet (if school has assets/liabilities)
- Export reports (Excel, PDF) untuk accounting

**Key Features:**

**Flexible SPP Packages:**
- Per-grade pricing (Grade 1: Rp 500k, Grade 10: Rp 1M)
- Scholarship discounts (percentage or fixed amount)
- Sibling discounts (2nd child: 10%, 3rd child: 20%)
- Special discounts (early bird, full payment discount)
- Custom packages per student (manual override)

**Payment Gateway Integration:**
- **Midtrans:**
  - Payment methods: GoPay, OVO, DANA, ShopeePay, bank transfer (VA), credit card
  - Transaction fees: 2.9% dari payment amount (borne by school or passed to parent)
  - Webhook handler: Receive payment status updates
  - Retry logic: Auto-retry failed payments 3 times
  - Expire time: Invoices expire after 24 hours (auto-refresh if needed)

- **Bank Transfer (Manual):**
  - Virtual account numbers (VA) per student
  - Unique VA: Static VA per student (reusable)
  - Bank partners: BCA, Mandiri, BNI, BRI
  - Auto-check: Scheduled job checks bank transfers every hour
  - Payment matching: Match VA payments ke invoices automatically

**Automated Reminders:**
- **Reminder Schedule:**
  - 3 days before due date
  - On due date
  - 1 day overdue
  - 7 days overdue
  - 14 days overdue (escalation)

- **Channels:**
  - WhatsApp Business API (primary)
  - Email (secondary)
  - SMS (fallback for parents without WhatsApp)

- **Templates:**
  - Customizable reminder message templates
  - Include: Student name, invoice number, amount, due date, payment link
  - Personalization: Use parent name, student name

**Financial Reporting:**
- **Reports:**
  - Monthly revenue summary
  - Payment collection rate (% paid on time)
  - Aging report (0-30 days, 31-60 days, 61+ days overdue)
  - Revenue by grade level
  - Payment method breakdown
  - Outstanding balance summary

- **Export:**
  - Excel export (detailed data)
  - PDF export (formatted reports)
  - Scheduled reports (auto-email monthly reports to finance team)

**Security & Compliance:**
- Financial data encrypted at rest & in transit
- Audit logging untuk all financial transactions (who did what, when)
- Role-based access control (only finance team can access sensitive data)
- Payment reconciliation (double-check semua payments)
- Tax reporting (PPN/PPh if applicable)

**Priority:** P1 (High - core business function, but can start with manual tracking and add automation later)

---

## Future Features (Post-MVP)

### Phase 2 Features (Month 7+)

**1. Library Management:**
- Book catalog & management system
- Borrowing & returning process
- QR code checkout (scan book barcode)
- Due date reminders (via app notifications)
- Overdue fines calculation
- Digital library integration (e-books)
- Reading history & recommendations

**2. Transportation Management:**
- School bus tracking (GPS tracking)
- Route optimization (find most efficient routes)
- Driver app (mark stops, track attendance)
- Parent notifications (bus arrival time)
- Bus fee management
- Maintenance scheduling

**3. Inventory Management:**
- School asset tracking (computers, projectors, furniture)
- Consumable supplies management (paper, markers, cleaning supplies)
- Maintenance scheduling
- Purchase request workflow
- Asset depreciation tracking

**4. Advanced Analytics:**
- Student performance prediction (machine learning)
- Attendance pattern analysis (identify at-risk students)
- Financial forecasting (predict cash flow)
- Teacher workload analysis (optimize teaching assignments)
- Capacity planning (predict enrollment growth)

### Phase 3 Features (Month 10+)

**1. AI-Powered Insights:**
- Personalized learning recommendations (suggest topics to review)
- Early warning system (identify students at risk of failing)
- Automated essay grading (NLP-based)
- Chatbot untuk parent inquiries (reduce support burden)
- Smart scheduling (optimize teacher assignments automatically)

**2. Integration Hub:**
- Kemenag database integration (untuk madrasah accreditation)
- Dapodik integration (data pokok pendidikan - Kemdikbud system)
- Third-party app integrations:
  - Zoom (online classes)
  - Google Meet (video conferences)
  - Google Classroom (sync assignments)
  - Microsoft Teams (alternative to Zoom)

**3. Communication Suite:**
- In-app messaging (teacher-parent, teacher-student)
- Video conference integration (built-in Zoom/Meet)
- Announcement broadcasting (push notifications ke all parents)
- Parent-teacher meeting scheduler (book appointments online)
- Group chat (class WhatsApp group replacement)

---

## Competitive Analysis

### Direct Competitors

| Competitor | Strengths | Weaknesses | Classnetic Advantage |
|------------|-----------|------------|---------------------|
| **SekolahKu** | Established player, Indonesian curriculum, good brand recognition | Expensive (Rp 50k/siswa/bulan), no offline mode, limited mobile features | Offline-first mobile (critical untuk rural), 70% cheaper, superior mobile app |
| **Edsby** | Comprehensive features, enterprise-grade, proven scale | Very expensive (Rp 75k/siswa/bulan), not localized, English-only, complex setup | Indonesian localization, affordable pricing, simple setup |
| **PowerSchool** | Industry standard, global brand, extensive features | Extremely expensive, complex, requires IT team, not localized for Indonesia | Simple, affordable, focused on Indonesian market needs |
| **Zenius** | Strong content library, popular brand, good funding | Focus on learning content (not school management), no attendance/SPP features | Complete school management (not just learning), all-in-one platform |
| **Ruangguru** | Popular, extensive tutor network, strong brand | Tutoring platform (not school management), no admin features | Full school operations management, not just learning |

### Indirect Competitors

**Manual Systems:**
- **Tools:** Excel spreadsheets, paper-based record keeping
- **Advantages:** Free (but time-intensive), familiar, flexible
- **Disadvantages:** Error-prone, no parent visibility, labor-intensive, poor data quality
- **Classnetic Advantage:** Automation saves time, accuracy, transparency, better data quality

**Fragmented Tools:**
- **Tools:** WhatsApp groups + Tally app + Google Sheets + separate learning platforms
- **Advantages:** Each tool good at specific task
- **Disadvantages:** Disconnected, data silos, manual reconciliation, poor UX
- **Classnetic Advantage:** All-in-one platform, unified data, seamless integration

**Open Source Solutions:**
- **Tools:** Moodle, Fedena, Open-School
- **Advantages:** Free (if self-hosted), customizable
- **Disadvantages:** Complex setup, require IT expertise, not localized, poor mobile support
- **Classnetic Advantage:** Managed service (no IT burden), Indonesian localization, excellent mobile apps

---

## Classnetic Competitive Moat

**1. Offline-First Mobile Architecture**
- **Why Critical:** Many Indonesian schools have poor internet connectivity
- **Uniqueness:** No major competitor has robust offline sync
- **Technical Challenge:** Complex (conflict resolution, sync strategies)
- **Advantage:** Hard to replicate, requires deep technical expertise

**2. Deep Indonesian Localization**
- **Curriculum Integration:** Kurikulum Merdeka, KTSP, Kemenag requirements
- **Language:** Bahasa Indonesia throughout UI, documentation, support
- **Payment Gateways:** Midtrans, BSI, BNI Syariah (local payment methods)
- **Cultural Understanding:** Teacher-student-parent relationships, local context
- **Advantage:** Foreign competitors lack this local knowledge

**3. Affordable Pricing Model**
- **Per-Student Pricing:** Scales dengan school size (fair for all)
- **60-90% Cheaper:** Significantly lower than competitors
- **Alignment:** School success = Classnetic success (aligned incentives)
- **Advantage:** Hard for competitors to match (they have higher cost structures)

**4. All-in-One Platform**
- **Comprehensive:** Registration → Alumni (complete student lifecycle)
- **No Fragmentation:** Single platform vs 5-6 separate tools
- **Data Unity:** Single source of truth for all student data
- **Advantage:** Competitors focus on specific niches (learning only, admin only)

**5. Go Backend Scalability**
- **Performance:** Handle 1,000+ concurrent users easily
- **Cost Efficiency:** Lower infrastructure costs than PHP/Java/Ruby
- **Technical Edge:** Fewer education tech companies use Go (technical differentiation)
- **Advantage:** As schools grow, Classnetic scales without performance degradation

---

## Success Metrics & KPIs

### Product Metrics

- **School Acquisition:** New schools per month (target: 5-10/month di Year 1)
- **User Engagement:**
  - Daily Active Users (DAU): Teachers & admins logging in daily
  - Monthly Active Users (MAU): Total active users (teachers, students, parents)
  - Engagement Rate: DAU/MAU (target: >40%)
- **Retention Rate:**
  - School churn rate (target: <10% annually)
  - 30-day retention: % schools still active after 30 days
  - 90-day retention: % schools still active after 90 days
- **Feature Adoption:**
  - Attendance tracking: % schools using daily (target: >90%)
  - Grading: % teachers using online grading (target: >80%)
  - SPP payments: % payments processed online (target: >70%)
  - Parent portal: % parents logging in monthly (target: >60%)

### Business Metrics

- **Student Under Management (SUM):** Total active enrolled students
  - Year 1 target: 100,000 students
  - Year 2 target: 500,000 students
  - Year 3 target: 2,000,000 students
- **MRR (Monthly Recurring Revenue):** Subscription income
  - Year 1 target: Rp 50-100M/month
  - Year 2 target: Rp 300-500M/month
  - Year 3 target: Rp 1.5-2.5B/month
- **ARPU (Average Revenue Per User):** Revenue per student (target: Rp 8,000-10,000)
- **CAC (Customer Acquisition Cost):** Marketing & sales spend per new school (target: <Rp 500k)
- **LTV (Lifetime Value):** Average revenue per school over lifetime (target: >Rp 10M)
- **LTV:CAC Ratio:** Target >3:1 (healthy SaaS benchmark)

### Operational Metrics

- **Offline Sync Success Rate:** >95% successful sync (no data loss)
- **Mobile App Crash Rate:** <1% crash-free users
- **Payment Success Rate:** >98% payment processing success
- **Support Response Time:** <4 hours during business hours
- **Onboarding Time:** <1 week from sign-up to go-live (for new schools)

### Quality Metrics

- **Parent Satisfaction:** Survey scores (target: 4.5/5)
- **Teacher Satisfaction:** Survey scores (target: 4.5/5)
- **Admin Satisfaction:** Survey scores (target: 4.5/5)
- **NPS (Net Promoter Score):** >50 (indicates strong advocates)
- **Feature Request Rate:** Track what features users want most

---

## Risk Assessment

### Business Risks

| Risk | Probability | Impact | Mitigation |
|------|-------------|--------|------------|
| **Slow adoption** | Medium | High | Free trial (3 months), strong onboarding, proof of concept, showcase testimonials |
| **Price sensitivity** | High | High | Flexible pricing (tiered, flat fee), value demonstration (ROI calculator), anchor pricing comparison |
| **Competition response** | Medium | Medium | Focus on underserved market (rural schools), double-down on offline-first differentiation |
| **Payment failures** | Low | Medium | Multiple payment gateways (Midtrans + manual bank transfer), retry logic, manual fallback |
| **School budget cuts** | Medium | Medium | Tiered pricing (affordable tiers), highlight cost savings vs manual admin staff |

### Technical Risks

| Risk | Probability | Impact | Mitigation |
|------|-------------|--------|------------|
| **Offline sync complexity** | Medium | High | Thorough testing, robust conflict resolution, extensive logging & monitoring |
| **Mobile app performance** | Medium | Medium | Performance monitoring, optimization, regular testing on low-end devices |
| **Data security breach** | Low | Critical | Encryption, security audits, penetration testing, compliance checks (PDPA) |
| **Scalability issues** | Low | High | Go backend designed for scale, load testing, cloud infrastructure (OCI auto-scaling) |
| **Flutter adoption** | Low | Low | Cross-platform expertise training, consider React Native fallback if needed |

### Operational Risks

| Risk | Probability | Impact | Mitigation |
|------|-------------|--------|------------|
| **Team availability** | Low | Medium | Clear documentation, code reviews, backup developers, avoid bus factor (key person risk) |
| **School support burden** | Medium | Medium | Self-service resources (help center, video tutorials), community forum, priority support untuk paid tiers |
| **Payment gateway issues** | Low | High | Multiple gateway options (Midtrans + bank transfer), manual reconciliation processes |
| **Customer onboarding time** | Medium | Medium | Streamlined onboarding flow, video tutorials, setup wizard, remote training sessions |

---

## Success Criteria (Launch Readiness)

### Product Readiness

✅ **Core Features Functional:**
- [ ] All 6 core features implemented & tested
- [ ] Offline sync working >95% success rate
- [ ] Mobile apps (teacher, parent, student) stable
- [ ] Payment processing working >98% success
- [ ] PDF report cards generating correctly
- [ ] QR/NFC attendance reliable

✅ **Performance Benchmarks:**
- [ ] API response time <500ms average
- [ ] Web app load time <2 seconds
- [ ] Mobile app load time <3 seconds
- [ ] Database query time <100ms average
- [ ] 99.5% uptime achieved

✅ **Quality Assurance:**
- [ ] Security audit passed (penetration testing)
- [ ] Code coverage >80% (backend & frontend)
- [ ] Zero critical bugs remaining
- [ ] User acceptance testing (UAT) passed dengan 5 beta schools
- [ ] Accessibility compliance (WCAG 2.1 AA)

### Business Readiness

✅ **Pricing & Monetization:**
- [ ] Pricing finalized & tested dengan early adopters
- [ ] Payment gateway testing completed (Midtrans live transactions)
- [ ] Subscription management system working
- [ ] Invoicing system functional

✅ **Onboarding & Support:**
- [ ] Onboarding process streamlined (<1 week sign-up to go-live)
- [ ] Support documentation complete (user guides, video tutorials)
- [ ] Help center launched (FAQs, troubleshooting guides)
- [ ] Support team trained & ready

✅ **Marketing & Sales:**
- [ ] Sales materials ready (pitch decks, brochures, one-pagers)
- [ ] Website launched (classnetic.com live)
- [ ] Case studies collected (5 pilot school testimonials)
- [ ] Demo videos recorded (feature walkthroughs)

✅ **Legal & Compliance:**
- [ ] Terms of Service drafted
- [ ] Privacy Policy compliant dengan PDPA
- [ ] Data processing agreements ready
- [ ] School agreements template prepared

### Technical Readiness

✅ **Infrastructure:**
- [ ] Production environment configured (OCI, Coolify)
- [ ] CI/CD pipeline automated (GitHub → Coolify)
- [ ] Monitoring & alerting setup (Sentry, custom dashboard)
- [ ] Backup & disaster recovery tested (restore from backup verified)
- [ ] SSL certificates configured (Cloudflare SSL)

✅ **Scalability:**
- [ ] Load testing completed (handle 1,000+ concurrent users)
- [ ] Database optimization (indexing, query optimization)
- [ ] Caching strategy implemented (Redis)
- [ ] CDN configured (Cloudflare)
- [ ] Auto-scaling configured (OCI auto-scaling groups)

✅ **Documentation:**
- [ ] API documentation complete (OpenAPI/Swagger)
- [ ] Technical documentation complete (architecture, database schema)
- [ ] Admin manuals complete (school admin guide)
- [ ] Developer documentation complete (onboarding, contribution guide)

**Last Updated:** 2026-01-06
**Version:** 0.1.0-concept
**Owner:** Product Team (Classnetic)
**Reviewers:** Development Team, Education Consultants, School Administrators
