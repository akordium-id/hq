# 💬 Katauser - User Stories & Personas

**Version:** 1.0.0
**Last Updated:** 2026-01-06
**Status:** Research Phase

---

## 👥 User Personas

### Persona 1: Budi Santoso - SaaS Founder

**Demographics:**
- **Nama:** Budi Santoso
- **Usia:** 32 tahun
- **Lokasi:** Jakarta Selatan
- **Pekerjaan:** Founder & CEO, "InvoiceKita" (SaaS invoicing untuk SMEs)
- **Penghasilan:** Rp 150-200 juta/bulan (company revenue)

**Tech Savviness:** ⭐⭐⭐⭐⭐ (Very High)
- Full-stack developer background
- Comfortable dengan command line, APIs, database
- Uses GitHub, Slack, Notion, Figma daily

**Goals:**
1. Build product yang users actually want (not what he thinks they want)
2. Prioritize feature development berdasarkan data, bukan intuition
3. Show users that their feedback matters (build trust dan loyalty)
4. Save time managing feedback (currently uses spreadsheet + email)

**Pain Points:**
- "Users email feature requests ke berbagai alamat (support@, ceo@, feedback@)"
- "Susah membedakan feature request yang penting vs nice-to-have"
- "Team saya (engineers, customer success) tidak tahu prioritas features"
- "Users tidak tahu status dari request mereka (apakah diterima? ditolak? pending?)"
- "UserJot terlalu mahal untuk startup kami yang baru 6 bulan"

**Current Workflow:**
1. Users send feedback via email, WhatsApp, atau Intercom chat
2. Customer support copy-paste ke Google Sheet
3. Budi reviews sheet weekly, decide mana yang masuk roadmap
4. Engineers build features based on Budi's intuition
5. Users tidak update tentang status (unless they follow up via email)

**Frustrations:**
- "Users complain kenapa feature X belum dibuat, padahal mereka tidak pernah request secara formal"
- "Team engineering sering rework karena requirement tidak clear"
- "Saya buang 2 jam/minggu hanya buat manage feedback di spreadsheet"

**Quote:**
> "Saya mau fokus ngembangin produk, bukan admin work. Tapi kalau saya nggak dengar feedback users, saya bisa salah build feature dan buang waktu 3 bulan development."

**What Katauser Solves:**
- ✅ Single place untuk semua feedback (public board)
- ✅ Voting system untuk prioritize features (data-driven, bukan intuition)
- ✅ Status transparency (users tahu feedback mereka: Open, Planned, In Progress, Completed)
- ✅ Roadmap sync otomatis (engineers tahu apa yang harus dikerjakan)
- ✅ Affordable (Rp 299k/bulan vs UserJot Rp 1.2 juta/bulan)

**Success Metrics untuk Budi:**
- Time spent managing feedback: 2 jam/minggu → 30 menit/minggu
- Feature accuracy: 60% features dipakai users → 85% features dipakai
- User satisfaction: NPS 30 → NPS 50

---

### Persona 2: Sarah Wijaya - Product Manager

**Demographics:**
- **Nama:** Sarah Wiyaya
- **Usia:** 28 tahun
- **Lokasi:** Bandung
- **Pekerjaan:** Product Manager, "ShopEase" (e-commerce platform)
- **Penghasilan:** Rp 12-15 juta/bulan

**Tech Savviness:** ⭐⭐⭐⭐ (High)
- Comfortable dengan SaaS tools (Jira, Notion, Miro)
- Basic SQL knowledge (bisa query database sendiri)
- Tidak bisa code, tapi mengerti technical concepts

**Goals:**
1. Gather feedback dari multiple sources (customers, sales team, support team)
2. Validate features sebelum masuk development backlog
3. Communicate product direction ke stakeholders (CEO, engineering, marketing)
4. Track impact dari features yang release (apakah users suka?)

**Pain Points:**
- "Feedback tersebar di mana-mana: email customer, Zoom call notes, Intercom conversations"
- "Susah membujukkan CEO bahwa feature A lebih penting dari feature B"
- "Engineering team complains kenapa requirements berubah terus"
- "Tidak ada sistem untuk track apakah feature yang release benar-benar dipakai users"

**Current Workflow:**
1. Collect feedback dari customer calls, support tickets, sales team
2. Write requirements di Notion (manual, unstructured)
3. Present ke CEO dan engineering team weekly meeting
4. CEO approve/reject berdasarkan gut feeling (bukan data)
5. Engineering team build, tapi sering rework karena requirement changes

**Frustrations:**
- "Saya selalu kalah di debat sama CEO yang punya 'intuition' tapi tidak ada data"
- "Engineering team marah kalau saya ganti requirement mid-sprint"
- "Saya nggak tahu apakah feature yang release sebenarnya dipakai users atau tidak"

**Quote:**
> "Saya butuh data untuk membuktikan bahwa feature X penting. Kalau saya bisa bilang '500 users minta fitur ini', CEO pasti setuju."

**What Katauser Solves:**
- ✅ Single source of truth untuk semua feedback (public board + private internal notes)
- ✅ Voting data untuk membujukkan stakeholders (500 users voted = important)
- ✅ Roadmap sync ke Jira/Linear (engineers langsung kerjakan)
- ✅ Changelog untuk komunikasi ke users (marketing bisa share ke social media)

**Success Metrics untuk Sarah:**
- Stakeholder approval time: 2 hari → 1 hari (karena ada data voting)
- Engineering rework rate: 30% → 10% (requirements lebih clear)
- Feature adoption: Unknown → bisa track (feedback setelah release)

---

### Persona 3: Andi Pratama - Digital Agency Owner

**Demographics:**
- **Nama:** Andi Pratama
- **Usia:** 35 tahun
- **Lokasi:** Surabaya
- **Pekerjaan:** Owner, "CreativeDigital Agency" (10 employees)
- **Penghasilan:** Rp 300-500 juta/bulan (agency revenue)

**Tech Savviness:** ⭐⭐⭐ (Medium)
- Understands marketing, branding, UX
- Tidak comfortable dengan technical concepts (API, database)
- Uses tools: Figma, Slack, Trello, Asana

**Goals:**
1. Manage feedback untuk 5-10 client projects secara simultaneous
2. Show clients bahwa agency mengerti kebutuhan mereka
3. Professional appearance (agency terlihat organized dan reliable)
4. Scale business tanpa increase operational overhead

**Pain Points:**
- "Setiap client punya cara berbeda buat kirim feedback (email, WhatsApp, Google Form)"
- "Client complain kenapa feedback mereka tidak di-follow up"
- "Susah track progress feedback per client (ada di berbagai spreadsheets)"
- "Client mau feedback system dengan logo mereka sendiri (white-label)"

**Current Workflow:**
1. Client kirim feedback via email atau WhatsApp
2. Project manager copy ke client-specific spreadsheet
3. Design/dev team work berdasarkan spreadsheet
4. Update client via email (manual, lupa sering terjadi)

**Frustrations:**
- "Client marah kalau feedback mereka terlewat atau lupa di-follow up"
- "Saya tidak bisa kasih akses feedback system ke client karena logo-nya bukan logo agency saya"
- "Scaling business berarti scaling admin work, ini tidak sustainable"

**Quote:**
> "Saya mau fokus ke quality of work, bukan admin. Tapi kalau saya nggak follow up feedback client, mereka akan pindah ke agency lain."

**What Katauser Solves:**
- ✅ Multiple boards (1 board per client) dalam 1 account
- ✅ Custom branding untuk premium users (remove Katauser logo, ganti logo client)
- ✅ Client dapat akses langsung ke feedback board (transparansi)
- ✅ Email notifications (tidak ada feedback yang terlewat)

**Success Metrics untuk Andi:**
- Client satisfaction: 70% → 90% (feedback selalu di-follow up)
- Admin time: 5 jam/minggu → 1 jam/minggu (automated notifications)
- Client retention: 80% → 95% (better communication)
- New client onboarding time: 2 hari → 2 jam (tinggal create board)

---

### Persona 4: Dina Kusuma - E-commerce Seller

**Demographics:**
- **Nama:** Dina Kusuma
- **Usia:** 26 tahun
- **Lokasi:** Medan
- **Pekerjaan:** Tokopedia/Shopee Seller (skincare brand "GlowUp")
- **Penghasilan:** Rp 30-50 juta/bulan (online shop revenue)

**Tech Savviness:** ⭐⭐ (Low-Medium)
- Comfortable dengan Tokopedia/Shopee dashboard
- Uses WhatsApp Business, Instagram, TikTok
- Tidak familiar dengan SaaS tools (Jira, Notion, dll)

**Goals:**
1. Tahu produk mana yang disukai/didakuti customers
2. Collect product improvement requests (packaging, varian, dll)
3. Engage dengan customers (build community)
4. Increase sales lewat word-of-mouth

**Pain Points:**
- "Reviews tersebar di Tokopedia, Shopee, TikTok Shop, Instagram comments"
- "Tidak tahu apakah customer request new variant atau cuma complain"
- "Susah membedakan complaint (negatif) vs suggestion (positif)"
- "Tidak ada sistem untuk follow up ke customers bahwa request mereka sudah ditindaklanjuti"

**Current Workflow:**
1. Customers tulis review di Tokopedia/Shopee
2. Dina baca reviews manual (buang waktu 1-2 jam/hari)
3. Dina catat suggestions di notes HP (sering lupa)
4. Dina improve produk berdasarkan "feeling" (bukan data)

**Frustrations:**
- "Saya baca 100+ reviews/hari, capek, tapi saya juga tidak mau skip karena bisa ada info penting"
- "Customer complain kenapa new variant yang mereka minta 3 bulan lalu belum ada"
- "Saya tidak tahu produk mana yang best seller vs yang banyak di-complain"

**Quote:**
> "Saya mau dengar apa kata customers, tapi baca reviews satu per satu itu nggak efisien. Apa ada tool yang bisa summarize?"

**What Katauser Solves:**
- ✅ Public feedback board (customers bisa submit feedback langsung, bukan via review)
- ✅ Voting system (tahu mana request yang paling populer)
- ✅ Changelog (update customers bahwa request mereka sudah ditindaklanjuti)
- ✅ Simple interface (tidak perlu tech-savvy, seperti Google Forms tapi lebih powerful)

**Note:** Dina adalah **tertiary market** (e-commerce sellers). Fitur khusus untuk e-commerce integrasi (Tokopedia/Shopee auto-import reviews) akan datang di v2.0 (Milestone 8).

**Success Metrics untuk Dina:**
- Time spent reading reviews: 2 jam/hari → 30 menit/hari
- Customer engagement: 100 reviews/hari → 200 feedbacks/hari (lebih mudah submit ke board)
- Product improvement accuracy: 50% → 80% (berdasarkan voting data)

---

## 📝 User Stories

### Epic 1: Feedback Submission

**Story 1.1: Submit Public Feedback**
- **As a** user (Budi/Sarah/Andi/Dina)
- **I want to** submit feedback ke public board
- **So that** product owner knows what I want
- **Acceptance Criteria:**
  - [ ] Can access board via URL slug (katauser.com/feedback/company-name)
  - [ ] Can submit feedback dengan title (required) dan description (optional)
  - [ ] Can submit anonymously atau with email/name
  - [ ] See success message setelah submit
  - [ ] Receive email confirmation (if provide email)

**Story 1.2: Submit Feedback with Category**
- **As a** user
- **I want to** choose category saat submit feedback
- **So that** product owner tahu tipe feedback (Bug/Feature/Improvement)
- **Acceptance Criteria:**
  - [ ] Dropdown category selection
  - [ ] Default categories: Bug, Feature, Improvement, Question
  - [ ] Product owner can add custom categories
  - [ ] Category visible di feedback list

**Story 1.3: Upload Image/Screenshot**
- **As a** user
- **I want to** attach image/screenshot ke feedback
- **So that** saya bisa tunjukkan bug atau visual reference
- **Acceptance Criteria:**
  - [ ] Can upload 1-3 images per feedback
  - [ ] Image max size: 5MB
  - [ ] Supported formats: PNG, JPG, GIF
  - [ ] Images displayed di feedback detail page

---

### Epic 2: Voting System

**Story 2.1: Vote on Feedback**
- **As a** user
- **I want to** upvote feedback yang saya setujui
- **So that** product owner tahu feedback mana yang paling penting
- **Acceptance Criteria:**
  - [ ] Can click upvote button
  - [ ] See vote count increment real-time
  - [ ] Cannot vote same feedback twice (deduplication)
  - [ ] Can remove vote (click lagi untuk unvote)

**Story 2.2: Vote as Authenticated User**
- **As a** logged-in user
- **I want to** vote dengan akun saya
- **So that** product owner tahu siapa yang vote (transparansi)
- **Acceptance Criteria:**
  - [ ] Vote tercatat dengan user ID
  - [ ] Username displayed di list of voters
  - [ ] Can see voting history (feedbacks yang saya vote)

**Story 2.3: Vote as Anonymous User**
- **As a** anonymous user
- **I want to** vote tanpa login
- **So that** saya bisa dukung feedback tanpa friction
- **Acceptance Criteria:**
  - [ ] Can vote tanpa login (IP-based tracking)
  - [ ] System prevent double vote dari IP yang sama
  - [ ] Vote counted tapi user identity hidden

---

### Epic 3: Board Management (Product Owners)

**Story 3.1: Create Board**
- **As a** product owner (Budi/Sarah/Andi)
- **I want to** create feedback board
- **So that** users bisa submit feedback
- **Acceptance Criteria:**
  - [ ] Create board dengan name (required), description (optional)
  - [ ] Generate unique URL slug automatically
  - [ ] Choose visibility: Public atau Private (premium)
  - [ ] See confirmation setelah create
  - [ ] Board appears di my dashboard

**Story 3.2: Customize Board Branding (Premium)**
- **As a** premium user (Andi - agency owner)
- **I want to** customize board branding
- **So that** clients melihat logo mereka, bukan Katauser
- **Acceptance Criteria:**
  - [ ] Upload custom logo
  - [ ] Choose brand colors (primary, secondary)
  - [ ] Remove "Powered by Katauser" footer
  - [ ] Preview branding sebelum publish

**Story 3.3: Manage Feedbacks**
- **As a** product owner
- **I want to** manage feedbacks di board saya
- **So that** saya bisa update status, respond, dan delete
- **Acceptance Criteria:**
  - [ ] Change feedback status: Open → Planned → In Progress → Completed
  - [ ] Add official response (comment dari product owner)
  - [ ] Delete inappropriate feedback
  - [ ] Bulk update status (pilih multiple feedbacks)

---

### Epic 4: Roadmap Synchronization

**Story 4.1: Add Feedback to Roadmap**
- **As a** product owner
- **I want to** add feedback ke roadmap
- **So that** users tahu feedback mereka sedang dikerjakan
- **Acceptance Criteria:**
  - [ ] Click "Add to Roadmap" button pada feedback
  - [ ] Feedback muncul di roadmap view
  - [ ] Status sync: feedback status ↔ roadmap status
  - [ ] Set target date untuk roadmap item

**Story 4.2: Create Manual Roadmap Item**
- **As a** product owner
- **I want to** create roadmap item tanpa dari feedback
- **So that** saya bisa tambahkan internal initiatives
- **Acceptance Criteria:**
  - [ ] Create roadmap item dengan title, description
  - [ ] Set status: Backlog, Planned, In Progress, Completed
  - [ ] Set priority: Low, Medium, High, Critical
  - [ ] Set target date

**Story 4.3: Drag-and-Drop Roadmap**
- **As a** product owner
- **I want to** drag-and-drop roadmap items antar columns
- **So that** saya bisa visual manage progress
- **Acceptance Criteria:**
  - [ ] Kanban board view: Backlog | Planned | In Progress | Completed
  - [ ] Drag item dari satu column ke column lain
  - [ ] Status updates automatically setelah drop
  - [ ] Visual feedback saat dragging (highlight target column)

---

### Epic 5: Changelog Generator

**Story 5.1: Auto-Generate Changelog**
- **As a** product owner
- **I want to** changelog otomatis dibuat dari completed roadmap items
- **So that** saya tidak perlu tulis manual
- **Acceptance Criteria:**
  - [ ] System detects roadmap items dengan status "Completed"
  - [ ] Auto-create changelog entry
  - [ ] Category: Feature, Improvement, Bugfix (auto-detected)
  - [ ] Publish date: hari ini

**Story 5.2: Edit Changelog Entry**
- **As a** product owner
- **I want to** edit changelog entry sebelum publish
- **So that** saya bisa customize pesan ke users
- **Acceptance Criteria:**
  - [ ] Edit title, description, category
  - [ ] Add gambar/gif (optional)
  - [ ] Preview sebelum publish
  - [ ] Publish/Unpublish toggle

**Story 5.3: Public Changelog Page**
- **As a** user
- **I want to** lihat changelog publik
- **So that** saya tahu fitur baru apa yang release
- **Acceptance Criteria:**
  - [ ] Access changelog via URL (katauser.com/feedback/company-name/changelog)
  - [ ] See changelog entries terbaru di top
  - [ ] Filter by category (Feature, Improvement, Bugfix)
  - [ ] Subscribe to RSS feed

---

### Epic 6: Notifications (v1.1)

**Story 6.1: Email Notification - New Feedback**
- **As a** product owner
- **I want to** receive email ketika ada feedback baru
- **So that** saya bisa respon cepat
- **Acceptance Criteria:**
  - [ ] Email sent ke product owner email
  - [ ] Email contains: feedback title, description, author, link ke board
  - [ ] Frequency: Immediate atau Daily digest
  - [ ] Unsubscribe link di email footer

**Story 6.2: Email Notification - Status Change**
- **As a** user
- **I want to** menerima email ketika feedback saya status-nya berubah
- **So that** saya tahu progress feedback saya
- **Acceptance Criteria:**
  - [ ] Email sent ke user yang submit feedback
  - [ ] Email contains: feedback title, old status, new status, link ke feedback
  - [ ] Only untuk authenticated users (bukan anonymous)

---

### Epic 7: Telegram Bot Integration (v1.2)

**Story 7.1: Connect Telegram Account**
- **As a** product owner
- **I want to** connect Telegram account ke Katauser
- **So that** saya bisa manage feedback via Telegram
- **Acceptance Criteria:**
  - [ ] Click "Connect Telegram" button
  - [ ] Open Telegram bot (@KatauserBot)
  - [ ] Press /start command
  - [ ] Confirm connection di Katauser dashboard

**Story 7.2: Submit Feedback via Telegram**
- **As a** user
- **I want to** submit feedback via Telegram bot
- **So that** saya lebih mudah give feedback (sudah di Telegram tiap hari)
- **Acceptance Criteria:**
  - [ ] /feedback command buka form
  - [ ] Bot minta title (required)
  - [ ] Bot minta description (optional)
  - [ ] Bot minta board ID/URL (optional, default ke favorite board)
  - [ ] Feedback submitted dan muncul di board

**Story 7.3: Vote via Telegram**
- **As a** user
- **I want to** vote feedback via Telegram bot
- **So that** saya tidak perlu buka website
- **Acceptance Criteria:**
  - [ ] /vote command menampilkan list top feedbacks
  - [ ] Reply dengan nomor feedback untuk vote
  - [ ] Bot konfirmasi vote berhasil
  - [ ] Vote count increment real-time

---

## 🎯 Acceptance Criteria Summary

### MVP (v1.0) - Must Have

**Board Management:**
- [x] Create board dengan name, description, slug
- [x] Public visibility (private untuk premium v2.0)
- [x] Board owner authentication (JWT)

**Feedback Submission:**
- [x] Public feedback form (title, description, email)
- [x] Anonymous submission support
- [x] Spam prevention (rate limiting, honeypot)

**Voting:**
- [x] Upvote system
- [x] Deduplication (authenticated users: user ID, anonymous: IP)
- [x] Real-time vote count update

**Roadmap:**
- [x] Add feedback ke roadmap (1-click)
- [x] Roadmap kanban view (4 columns)
- [x] Drag-and-drop status change
- [x] Target date setting

**Changelog:**
- [x] Auto-generate dari completed roadmap items
- [x] Public changelog page
- [x] Edit before publish

### v1.1 - Should Have (Month 2-3)

- [ ] Email notifications (new feedback, status change)
- [ ] Dark mode support
- [ ] Advanced filtering (status, category, date range, vote count)
- [ ] Export to CSV
- [ ] User mentions (@username)

### v1.2 - Nice to Have (Month 4-5)

- [ ] Telegram Bot integration (submit, vote, comment)
- [ ] Search functionality
- [ ] Feedback categorization (custom categories)
- [ ] API access (RESTful, documentation)

### v2.0 - Future Features (Month 6+)

- [ ] AI duplicate detection
- [ ] AI auto-categorization
- [ ] In-app widget (embeddable)
- [ ] Private boards (password-protected)
- [ ] SSO (Google Workspace, Microsoft)
- [ ] E-commerce integrations (Tokopedia, Shopee, TikTok Shop)

---

## 📊 Prioritization Framework

### RICE Scoring untuk Features

**RICE = (Reach × Impact × Confidence) / Effort**

| Feature | Reach (Users) | Impact (0-3) | Confidence (%) | Effort (Person-Months) | RICE Score | Priority |
|---------|---------------|--------------|----------------|------------------------|------------|----------|
| Public Feedback Board | 1000 | 3 | 90% | 2 | 1350 | P0 (MVP) |
| Voting System | 1000 | 3 | 90% | 1.5 | 1800 | P0 (MVP) |
| Roadmap Sync | 500 | 3 | 80% | 2 | 600 | P0 (MVP) |
| Changelog Generator | 500 | 2 | 80% | 1 | 800 | P0 (MVP) |
| Email Notifications | 500 | 2 | 70% | 1 | 700 | P1 (v1.1) |
| Telegram Bot | 300 | 3 | 60% | 2 | 270 | P1 (v1.2) |
| Dark Mode | 500 | 1 | 90% | 0.5 | 900 | P1 (v1.1) |
| AI Duplicate Detection | 200 | 2 | 50% | 3 | 67 | P2 (v2.0) |
| In-App Widget | 300 | 2 | 60% | 2 | 180 | P2 (v2.0) |

**Conclusion:**
- P0 (MVP): 4 core features - high reach, high impact, high confidence
- P1 (v1.1-v1.2): 4 features - medium-high priority
- P2 (v2.0): 2 features - lower confidence, higher effort

---

**Document Status:** ✅ Ready for Development
**Next Step:** Technical implementation planning
