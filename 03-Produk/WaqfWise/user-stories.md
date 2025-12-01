# 📖 WaqfWise User Stories & Requirements

> Kumpulan user stories, requirements, dan acceptance criteria untuk WaqfWise - Sistem Manajemen Wakaf Digital

## 🎯 Product Overview

**Target Users:** Lembaga Nazhir (pengelola wakaf), Administrator sistem, Staff keuangan, Donatur (Wakif), Auditor

**Core Problem:** Manajemen wakaf tradisional yang manual, tidak transparan, sulit dilaporkan, dan tidak compliance dengan standar akuntansi wakaf (PSAK 109).

**Solution Approach:** Platform digital yang menyediakan tools untuk registrasi aset wakaf, tracking donasi, pelaporan keuangan, dan compliance otomatis dengan standar regulator.

---

## 👥 User Personas

### Primary Persona: Ustadz Ahmad (Nazhir Institution Manager)

**Role:** Manager di yayasan wakaf medium dengan 5+ staff
**Demographics:** Usia 35-50, Pendidikan S1 Syariah/Ekonomi, lokasi urban
**Goals:**

- Memudahkan pelaporan kepada board dan donatur
- Meningkatkan transparansi untuk menarik lebih banyak donatur
- Compliance dengan PSAK 109 dan regulasi Kementerian Agama
- Menghemat waktu administrasi 50%+

**Pain Points:**

- Manual recording di Excel yang error-prone
- Sulit membuat laporan bulanan dan tahunan
- Tidak ada real-time visibility ke asset performance
- Tracking donasi manual yang membingungkan

**Technical Skills:** Medium - bisa gunakan software akuntansi dasar, familiar dengan internet banking
**Usage Context:** Office setting, daily usage untuk financial management, weekly reporting

---

**Quote:** *"Saya ingin fokus pada pengembangan program wakaf, bukan dihantui oleh paperwork yang menumpuk dan laporan yang terlambat."*

### Secondary Persona: Budi (Wakif/Donor)

**Role:** Individual donor yang berdonasi wakaf reguler
**Demographics:** Usia 25-45, Profesional dengan penghasilan menengah ke atas
**Goals:**

- Mendapatkan informasi transparan tentang penggunaan donasi wakaf
- Mudah berdonasi secara online
- Menerima laporan rutin tentang impact donasi
- Track history donasi dan tax deduction

**Pain Points:**

- Tidak tahu apakah donasi benar-benar digunakan sesuai tujuan
- Sulit mendapatkan receipt resmi untuk tax deduction
- Proses donasi yang ribet
- Tidak ada follow-up setelah donasi

**Technical Skills:** High - smartphone user, familiar dengan e-commerce dan mobile banking
**Usage Context:** Mobile-first, occasional usage saat ingin berdonasi atau cek status

---

### Tertiary Persona: Rina (Finance Staff)

**Role:** Staff keuangan di yayasan wakaf
**Demographics:** Usia 22-30, Fresh graduate akuntansi
**Goals:**

- Recording transaksi keuangan yang akurat
- Membuat laporan keuangan bulanan dengan cepat
- Reconciliation bank dan cash
- Tax reporting dan compliance

**Pain Points:**

- Manual journal entry yang rawan error
- Sulit reconciling antara berbagai payment sources
- Deadline reporting yang ketat
- Perlu mengikuti PSAK 109 compliance

**Technical Skills:** Medium - familiar dengan accounting software
**Usage Context:** Daily usage untuk data entry dan reporting

---

## 📋 User Stories by Epic

### Epic 1: User Registration & Authentication

#### User Story 1.1: Nazhir Account Registration

**As a** Ustadz Ahmad (Nazhir Manager),
**I want to** register my institution's account with legal documents,
**so that** I can start managing waqf assets digitally and comply with regulatory requirements.

**Acceptance Criteria:**

- [ ] User can register institution with legal information (name, NPWP, SIUP, address)
- [ ] System validates institution documents (surat izin operasional, akte notaris)
- [ ] Admin review and approval process for new registrations
- [ ] Email verification required for account activation
- [ ] Institution profile setup with bank account information
- [ ] Multiple user roles can be created within institution
- [ ] KYC process completed for account approval

**Technical Requirements:**

- File upload system untuk legal documents
- Validation rules untuk institution data
- Email service integration untuk verification
- Admin dashboard untuk approval workflow
- Multi-user role management system

**Priority:** High | **Estimated Effort:** 8 story points | **Sprint:** 1

#### User Story 1.2: Multi-user Role Management

**As a** Ustadz Ahmad (Nazhir Manager),
**I want to** create and manage user accounts for my staff with specific permissions,
**so that** I can delegate tasks while maintaining proper access control.

**Acceptance Criteria:**

- [ ] Create staff accounts with email and password
- [ ] Assign roles: Admin, Finance Staff, Reporter, Viewer
- [ ] Define granular permissions for each role
- [ ] Ability to deactivate or delete user accounts
- [ ] Activity logging untuk semua user actions
- [ ] Password reset functionality via email
- [ ] Session management dengan automatic timeout

**Technical Requirements:**

- Role-based access control (RBAC) system
- Permission matrix implementation
- Audit trail untuk user management
- Secure session management
- Password hashing with bcrypt

**Priority:** High | **Estimated Effort:** 5 story points | **Sprint:** 1

---

### Epic 2: Waqf Asset Management

#### User Story 2.1: Waqf Asset Registration

**As a** Ustadz Ahmad (Nazhir Manager),
**I want to** register all types of waqf assets in the system,
**so that** I have complete digital inventory and can track asset performance.

**Acceptance Criteria:**

- [ ] Register tanah wakaf dengan alamat, luas, nilai, dokumen kepemilikan
- [ ] Register bangunan wakaf dengan type, kondisi, nilai asuransi
- [ ] Register wakaf uang dengan bank details, interest rate, maturity
- [ ] Register saham wakaf dengan company name, jumlah shares, current value
- [ ] Upload supporting documents (Sertifikat, Akta, Bukti Kepemilikan)
- [ ] Categorize assets berdasarkan jenis dan status
- [ ] Automatic calculation dari asset appreciation/depreciation

**Technical Requirements:**

- Flexible asset data model untuk berbagai asset types
- File upload system dengan size dan type validation
- Asset categorization system
- Financial calculation engine
- Search dan filter capabilities

**Priority:** High | **Estimated Effort:** 13 story points | **Sprint:** 2

#### User Story 2.2: Asset Status Tracking

**As a** Rina (Finance Staff),
**I want to** update and track the current status of each waqf asset,
**so that** management always has up-to-date information.

**Acceptance Criteria:**

- [ ] Update asset status: Active, Under Development, Dispute, Inactive
- [ ] Record asset maintenance activities dan costs
- [ ] Upload photos/videos untuk asset condition documentation
- [ ] Track asset utilization (occupancy rates untuk properti)
- [ ] Set reminders untuk asset-related activities (insurance renewal, etc.)
- [ ] Generate asset performance reports
- [ ] Historical tracking dari semua asset changes

**Technical Requirements:**

- Asset status workflow system
- Maintenance scheduling system
- Image/video storage dengan Cloudflare R2
- Performance calculation algorithms
- Report generation system

**Priority:** Medium | **Estimated Effort:** 8 story points | **Sprint:** 3

---

### Epic 3: Donor Management & Donations

#### User Story 3.1: Donor Profile Management

**As a** Ustadz Ahmad (Nazhir Manager),
**I want to** create and maintain donor profiles with complete information,
**so that** I can track donation history and communicate effectively with donors.

**Acceptance Criteria:**

- [ ] Create donor profiles dengan personal information (name, email, phone)
- [ ] Record donor preferences dan communication preferences
- [ ] Categorize donors (individual, corporate, recurring, one-time)
- [ ] Track donor communication history (emails, calls, meetings)
- [ ] Add notes dan tags untuk donor segmentation
- [ ] Search dan filter donors berdasarkan various criteria
- [ ] Export donor lists untuk offline communication

**Technical Requirements:**

- Donor data model dengan flexible attributes
- Search and filter system dengan indexing
- Communication logging system
- Export functionality (CSV, Excel)
- Data privacy compliance implementation

**Priority:** High | **Estimated Effort:** 8 story points | **Sprint:** 2

#### User Story 3.2: Donation Recording & Tracking

**As a** Rina (Finance Staff),
**I want to** record all donations from various channels and link them to donors,
**so that** I have complete financial records and can provide receipts.

**Acceptance Criteria:**

- [ ] Record manual donations (cash, bank transfer)
- [ ] Integration dengan online payment gateway (Midtrans)
- [ ] Link each donation ke donor profile
- [ ] Categorize donations berdasarkan type (zakat, wakaf, infak)
- [ ] Upload bukti transfer untuk offline donations
- [ ] Generate otomatis donation receipts
- [ ] Match donations dengan specific waqf projects
- [ ] Recurring donation setup untuk regular donors

**Technical Requirements:**

- Payment gateway integration (Midtrans API)
- Transaction matching system
- Receipt generation engine (PDF)
- Recurring payment setup
- Transaction categorization system

**Priority:** High | **Estimated Effort:** 13 story points | **Sprint:** 3

---

### Epic 4: Financial Reporting & Compliance

#### User Story 4.1: Double-Entry Bookkeeping

**As a** Rina (Finance Staff),
**I want to** record financial transactions using proper double-entry accounting,
**so that** I can generate accurate financial reports compliant with PSAK 109.

**Acceptance Criteria:**

- [ ] Create chart of accounts specifically untuk waqf accounting
- [ ] Record journal entries dengan debit/credit transactions
- [ ] Automatic journal entry generation untuk common transactions
- [ ] Bank reconciliation system
- [ ] Trial balance generation
- [ ] Period closing procedures
- [ ] Audit trail untuk semua financial transactions

**Technical Requirements:**

- PSAK 109 compliant chart of accounts
- Double-entry accounting engine
- Bank reconciliation algorithms
- Audit logging untuk financial data
- Period closing procedures

**Priority:** High | **Estimated Effort:** 21 story points | **Sprint:** 4

#### User Story 4.2: Financial Report Generation

**As a** Ustadz Ahmad (Nazhir Manager),
**I want to** generate comprehensive financial reports automatically,
**so that** I can provide transparent reports to stakeholders and regulators.

**Acceptance Criteria:**

- [ ] Generate monthly balance sheet (Neraca)
- [ ] Generate income statement (Laporan Rugi Laba)
- [ ] Generate cash flow statement (Arus Kas)
- [ ] Generate waqf asset report (Laporan Aset Wakaf)
- [ ] Generate donor impact reports
- [ ] Export reports ke PDF dan Excel
- [ ] Schedule automatic report generation
- [ ] Compare reports dengan previous periods

**Technical Requirements:**

- Report generation engine dengan templates
- PDF generation library
- Excel export functionality
- Financial calculation algorithms
- Scheduling system untuk automatic reports

**Priority:** High | **Estimated Effort:** 13 story points | **Sprint:** 4

---

### Epic 5: Donor Experience & Transparency

#### User Story 5.1: Donor Portal Access

**As a** Budi (Wakif/Donor),
**I want to** access a portal to view my donation history and impact,
**so that** I can track how my contributions are being used and feel confident about transparency.

**Acceptance Criteria:**

- [ ] Secure login with email and password
- [ ] View personal donation history
- [ ] Download donation receipts untuk tax purposes
- [ ] See impact reports dari projects supported
- [ ] Update personal information dan communication preferences
- [ ] Set up recurring donations
- [ ] Receive email notifications untuk donation confirmations

**Technical Requirements:**

- Secure donor authentication system
- Donor dashboard dengan personalized views
- PDF receipt generation
- Email notification system
- Data privacy controls

**Priority:** Medium | **Estimated Effort:** 8 story points | **Sprint:** 5

#### User Story 5.2: Impact Reporting

**As a** Budi (Wakif/Donor),
**I want to** receive regular updates about the impact of my donations,
**so that** I feel connected to the cause and motivated to continue donating.

**Acceptance Criteria:**

- [ ] Monthly impact summaries via email
- [ ] Visual representations dari project progress
- [ ] Stories dari beneficiaries (if applicable)
- [ ] Annual comprehensive impact reports
- [ ] Comparison dengan previous period impact
- [ ] Option to increase donation based on impact shown
- [ ] Share impact stories ke social media

**Technical Requirements:**

- Email template system dengan dynamic content
- Data visualization components
- Story management system
- Social sharing integration
- Impact calculation algorithms

**Priority:** Medium | **Estimated Effort:** 5 story points | **Sprint:** 5

---

## 📊 Functional Requirements

### User Management (FR-100)

- **FR-101:** Multi-tenant institution management
- **FR-102:** Role-based access control (Admin, Finance, Reporter, Viewer)
- **FR-103:** User registration dengan KYC process
- **FR-104:** Password management dan recovery
- **FR-105:** Audit trail untuk semua user actions

### Waqf Asset Management (FR-200)

- **FR-201:** Asset registration untuk various types (tanah, bangunan, uang, saham)
- **FR-202:** Asset categorization dan classification
- **FR-203:** Document management system
- **FR-204:** Asset valuation tracking
- **FR-205:** Asset status management dan workflow
- **FR-206:** Asset performance monitoring

### Donor Management (FR-300)

- **FR-301:** Donor profile creation dan management
- **FR-302:** Donor segmentation dan categorization
- **FR-303:** Communication history tracking
- **FR-304:** Donor preferences management
- **FR-305:** Donor retention analytics

### Financial Management (FR-400)

- **FR-401:** PSAK 109 compliant chart of accounts
- **FR-402:** Double-entry bookkeeping system
- **FR-403:** Payment processing integration (Midtrans)
- **FR-404:** Bank reconciliation system
- **FR-405:** Tax deduction calculation dan reporting
- **FR-406:** Multi-currency support untuk financial reporting

### Reporting (FR-500)

- **FR-501:** Standard financial reports (Balance Sheet, Income Statement, Cash Flow)
- **FR-502:** Waqf-specific reports (Asset Report, Donor Report, Impact Report)
- **FR-503:** Custom report builder
- **FR-504:** Report scheduling dan automation
- **FR-505:** Export functionality (PDF, Excel, CSV)
- **FR-506:** Comparative reporting (period-over-period)

### Compliance (FR-600)

- **FR-601:** PSAK 109 compliance reporting
- **FR-602:** Kementerian Agama reporting formats
- **FR-603:** Audit trail management
- **FR-604:** Document retention policies
- **FR-605:** Regulatory change management

---

## 🔧 Non-Functional Requirements

### Performance Requirements

- **NFR-P001:** Page load time < 3 seconds untuk dashboard
- **NFR-P002:** API response time < 500ms untuk financial transactions
- **NFR-P003:** Support 500+ concurrent users
- **NFR-P004:** Database query time < 200ms untuk reports

### Security Requirements

- **NFR-S001:** All data transmission encrypted (HTTPS/TLS 1.3)
- **NFR-S002:** Financial data encrypted at rest
- **NFR-S003:** SQL injection prevention dengan parameterized queries
- **NFR-S004:** XSS protection dengan input sanitization
- **NFR-S005:** CSRF protection untuk state-changing operations
- **NFR-S006:** Rate limiting untuk API endpoints (100 requests/minute)

### Availability Requirements

- **NFR-A001:** 99.5% uptime target
- **NFR-A002:** Maximum downtime 3.6 hours/month
- **NFR-A003:** Daily automated backup dengan 30-day retention
- **NFR-A004:** Disaster recovery plan dengan 4-hour RTO

### Scalability Requirements

- **NFR-SC001:** Horizontal scaling support untuk application servers
- **NFR-SC002:** Database read replicas untuk reporting queries
- **NFR-SC003:** Caching layer implementation (Redis)
- **NFR-SC004:** CDN integration untuk static assets

### Compliance Requirements

- **NFR-C001:** PSAK 109 compliance untuk financial reporting
- **NFR-C002:** Personal Data Protection Act compliance untuk donor data
- **NFR-C003:** Electronic transaction compliance untuk online payments
- **NFR-C004:** Audit logging untuk semua financial transactions

### Usability Requirements

- **NFR-U001:** Responsive design untuk mobile dan desktop
- **NFR-U002:** Accessibility compliance (WCAG 2.1 AA)
- **NFR-U003:** Browser compatibility (Chrome, Firefox, Safari, Edge latest versions)
- **NFR-U004:** Loading states dan error messages yang clear
- **NFR-U005:** Intuitive navigation dengan maximum 3 clicks untuk common tasks

---

## 🧪 Testing Requirements

### Test Coverage

- **Unit Tests:** Minimum 85% code coverage
- **Feature Tests:** All critical business workflows covered
- **E2E Tests:** All user journeys covered
- **Performance Tests:** Load testing untuk 1000+ concurrent users

### Test Types

- **Functional Testing:** All requirements validation
- **Security Testing:** Vulnerability assessment dan penetration testing
- **Usability Testing:** User testing dengan actual nazhir institutions
- **Compliance Testing:** PSAK 109 compliance validation
- **Performance Testing:** Load testing dan stress testing

### Test Environments

- **Development:** Local development dengan SQLite database
- **Staging:** Production-like environment dengan real payment gateway
- **Production:** Live application dengan comprehensive monitoring

---

## 📈 Success Metrics

### User Engagement

- **Nazhir Registration Rate:** Target 50 new institutions per month
- **User Retention (30/60/90 days):** Target 85%/75%/65%
- **Feature Adoption Rate:** Target 70% users menggunakan core features
- **User Satisfaction Score:** Target 4.5/5 dari user surveys

### Business Metrics

- **Asset Under Management:** Target IDR 10 Milyar dalam 6 months
- **Monthly Recurring Revenue:** Target IDR 50 Juta/bulan dari 100+ subscribers
- **Customer Lifetime Value:** Target IDR 10 Juta per institution
- **Customer Acquisition Cost:** Target IDR 2 Juta per institution

### Technical Metrics

- **Application Performance:** Average response time < 2 seconds
- **System Reliability:** 99.5% uptime SLA
- **Bug Resolution Time:** Average 48 hours for critical bugs
- **Deployment Frequency:** Weekly production deployments

---

**Last Updated:** 2024-12-01
**Next Review Date:** 2025-01-01
**Product Owner:** Product Team (WaqfWise)
**Development Team:** Backend Team, Frontend Team, QA Team
