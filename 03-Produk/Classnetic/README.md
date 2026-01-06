# 🎓 Classnetic.com

> Platform Manajemen Sekolah Digital untuk Pendidikan Indonesia

## 🏷️ Product Identity

- **Nama Produk:** Classnetic.com
- **Status:** 📝 Concept Phase
- **Repo Code:** `github.com/akordium/classnetic` (Future - Private)
- **Live Site:** https://classnetic.com (Future)
- **Staging:** https://staging.classnetic.com (Future)
- **Project Management:** [Link ke GitHub Project Board]

## 📋 Quick Overview

**Tagline:** Platform Manajemen Sekolah Digital

**Deskripsi Singkat:** Sistem manajemen sekolah lengkap mulai dari pendaftaran siswa, kegiatan belajar mengajar, penilaian, manajemen keuangan, hingga portal alumni. Dibangun dengan Go backend dan Flutter mobile app untuk offline-first access.

**Target Market:**

- **Primary:** Sekolah swasta (SD, SMP, SMA) - manage 100-1,000+ students
- **Secondary:** Madrasah & pesantren modern - integrate dengan kurikulum Kemenag
- **Tertiary:** Bimbel (tutoring centers) - simple attendance & payment tracking
- **Quaternary:** International schools needing multi-currency support

**6 Fitur Utama:**

1. **Pendaftaran Siswa Online** - Registration form dengan payment gateway (Midtrans)
2. **Jadwal & Absensi Digital** - QR/NFC attendance system dengan offline recording
3. **E-Learning Module** - Assignments, quizzes, learning materials, offline access
4. **Rapor Digital** - Automated report cards (PDF) dengan parent portal
5. **Alumni Management** - Networking directory, job board, career tracking
6. **Kas Sekolah & SPP** - Financial management, payment tracking, automated reminders

**Problem yang Diselesaikan:**
- Manual administrative work (Excel, kertas) - inefficient dan error-prone
- Limited parent visibility - orang tua sulit memantau perkembangan anak
- Internet connectivity challenges - banyak sekolah di daerah dengan koneksi tidak stabil
- Fragmented systems - data tersebar di WhatsApp, Excel, buku manual
- SPP payment tracking - manual, rentan error, lupa bayar
- Teacher workload - terlalu banyak waktu untuk admin tasks vs mengajar

**Keunggulan Kompetitif:**
- **Mobile App Offline-First** - Guru & admin bisa bekerja tanpa internet (critical untuk rural schools)
- **Multi-Role Access** - Admins, teachers, students, parents masing-masing dapat interface tailored
- **Go Backend** - High performance untuk 1,000+ concurrent users, scalability excellent
- **Harga Terjangkau** - Per-student pricing (Rp 5,000-15,000/siswa/bulan) - 60-90% lebih murah dari kompetitor
- **Indonesian Localization** - Kurikulum Merdeka/KTSP, Bahasa Indonesia, payment gateways lokal
- **All-in-One Platform** - Dari registration sampai alumni, tidak perlu multiple tools

## 🛠 Tech Stack

### Backend

- **Framework:** Go (Golang) dengan Gin framework
- **Language:** Go 1.21+
- **Database:** PostgreSQL 15
- **ORM:** GORM
- **API:** RESTful API + WebSocket untuk real-time updates
- **Authentication:** JWT (JSON Web Tokens)
- **Caching:** Redis

**Why Go?**
- Performance excellent untuk high concurrent loads (1,000+ students)
- Concurrency via goroutines (handle many simultaneous users)
- Single binary deployment (simple, fast startup)
- Type safety (compile-time error checking)
- Scalability proven (Google, Uber use Go)

### Frontend (Web)

- **Framework:** SvelteKit
- **Language:** TypeScript
- **Styling:** Tailwind CSS
- **State Management:** Svelte stores
- **Real-time:** WebSockets untuk live updates

**Why SvelteKit?**
- No virtual DOM overhead (compiled components, faster runtime)
- Smaller bundle sizes (better load times)
- Built-in SSR/SSG (server-side rendering, static generation)
- TypeScript first-class support
- Reactive by default (less boilerplate code)

**Alternative:** Next.js 14 (if SvelteKit proves immature)

### Frontend (Mobile)

- **Framework:** Flutter
- **Language:** Dart
- **Offline Storage:** SQLite (sqflite package)
- **Platform:** iOS & Android (single codebase)
- **State Management:** Provider/Riverpod

**Why Flutter?**
- Excellent offline-first support (SQLite local storage)
- Cross-platform (single codebase untuk iOS + Android)
- Beautiful UI widgets out-of-the-box (Material, Cupertino)
- Performance excellent (compiled to native ARM code)
- Large community and package ecosystem

**Alternative:** React Native (if team prefers React ecosystem)

### Infrastructure

- **Hosting:** Oracle Cloud Infrastructure (OCI)
- **Deployment:** Coolify (PaaS) - zero-downtime deployments
- **CDN:** Cloudflare (global distribution, DDoS protection)
- **File Storage:** Cloudflare R2 (S3-compatible, cheaper than OCI)
- **Monitoring:** Custom dashboard + Sentry (error tracking)
- **Database:** PostgreSQL 15 pada OCI with auto-failover

### Third-party Services

- **Payment Gateways:**
  - **Midtrans** - Online payments (GoPay, OVO, DANA, credit cards)
  - **Bank Syaria Indonesia (BSI)** - Sharia-compliant payments (optional)
  - **BNI Syariah** - Alternative sharia payment (optional)
- **Communication:**
  - **SendGrid** - Email notifications
  - **Twilio/MessageBird** - WhatsApp Business API
  - **Firebase Cloud Messaging** - Push notifications
- **Monitoring:**
  - **Sentry** - Error tracking & aggregation
  - **UptimeRobot** - External uptime monitoring

## 💻 Local Development Setup

### Prerequisites

- [ ] Go 1.21+ (backend)
- [ ] Node.js 20+ (SvelteKit web)
- [ ] Flutter 3.16+ (mobile development)
- [ ] PostgreSQL 15
- [ ] Redis 7+ (caching & sessions)
- [ ] Git
- [ ] Docker & Docker Compose (optional, untuk containerized development)

### Installation Steps

1. **Clone repository**

   ```bash
   git clone https://github.com/akordium/classnetic.git
   cd classnetic
   ```

2. **Install Go dependencies**

   ```bash
   cd backend
   go mod download
   ```

3. **Install Node.js dependencies (untuk SvelteKit web)**

   ```bash
   cd web
   npm install
   ```

4. **Install Flutter dependencies (untuk mobile)**

   ```bash
   cd mobile
   flutter pub get
   ```

5. **Environment setup**

   ```bash
   # Copy environment example files
   cp backend/.env.example backend/.env
   cp web/.env.example web/.env

   # Edit environment variables
   # Backend: Database connection, JWT secret, Redis, etc.
   # Web: API endpoint, environment (dev/staging/prod)
   ```

6. **Database setup**

   ```bash
   # Make sure PostgreSQL is running
   sudo systemctl start postgresql

   # Create database
   createdb classnetic_dev

   # Run migrations (Go backend)
   cd backend
   go run cmd/migrate/main.go
   ```

7. **Start Redis (untuk caching & sessions)**

   ```bash
   sudo systemctl start redis
   # atau with Docker:
   docker-compose up -d redis
   ```

8. **Start Go backend server**

   ```bash
   cd backend
   go run cmd/server/main.go
   # Server runs at http://localhost:8080
   ```

9. **Start SvelteKit web dev server**

   ```bash
   cd web
   npm run dev
   # Web app runs at http://localhost:5173
   ```

10. **Run Flutter mobile app (optional)**

    ```bash
    cd mobile
    # Check connected devices
    flutter devices

    # Run on specific device
    flutter run -d <device_id>

    # atau run on Chrome (for web testing)
    flutter run -d chrome
    ```

11. **Access aplikasi:**
    - **Web Dashboard:** http://localhost:5173
    - **Backend API:** http://localhost:8080
    - **API Documentation:** http://localhost:8080/docs (Swagger/OpenAPI)

### Development Commands

**Backend (Go):**
```bash
# Run server
go run cmd/server/main.go

# Run tests
go test ./...

# Run tests dengan coverage
go test -cover ./...

# Run tests dengan coverage report
go test -coverprofile=coverage.out ./...
go tool cover -html=coverage.out

# Build binary
go build -o bin/classnetic cmd/server/main.go

# Run linter
golangci-lint run

# Format code
go fmt ./...

# Generate wire dependency injection (if using wire)
wire gen ./internal/...
```

**Frontend Web (SvelteKit):**
```bash
# Run dev server
npm run dev

# Run tests
npm run test

# Run tests dengan coverage
npm run test:coverage

# Build for production
npm run build

# Preview production build
npm run preview

# Type check
npm run check
```

**Mobile (Flutter):**
```bash
# Run on connected device/emulator
flutter run

# Run tests
flutter test

# Build APK (Android)
flutter build apk

# Build IPA (iOS)
flutter build ios

# Analyze code
flutter analyze

# Format code
flutter format .
```

## 🧪 Testing

### Test Suite

**Backend (Go):**
- **Framework:** testing package + testify
- **Coverage Target:** 85%
- **Test Types:**
  - Unit Tests: Business logic, services, repositories
  - Integration Tests: API endpoints, database operations
  - Benchmark Tests: Performance critical paths

**Frontend Web (SvelteKit):**
- **Framework:** Vitest + Testing Library
- **Coverage Target:** 80%
- **Test Types:**
  - Unit Tests: Component logic, utilities
  - Integration Tests: User flows, form submissions
  - E2E Tests: Playwright untuk critical journeys

**Mobile (Flutter):**
- **Framework:** Flutter test + widget tests
- **Coverage Target:** 75%
- **Test Types:**
  - Unit Tests: Business logic, providers
  - Widget Tests: UI components
  - Integration Tests: User flows (offline sync, etc.)

### Running Tests

```bash
# Backend tests
cd backend
go test ./...
go test -v -race ./...  # dengan race detection

# Frontend web tests
cd web
npm run test
npm run test:ui  # Watch mode dengan UI

# Mobile tests
cd mobile
flutter test
flutter test --coverage  # Generate coverage
```

## 🚢 Deployment

### Environments

- **Development:** Local development dengan PostgreSQL & Redis local
- **Staging:** Oracle Cloud dengan staging database (staging.classnetic.com)
- **Production:** Oracle Cloud dengan high-availability setup (classnetic.com)

### Deployment Process

**1. Backend Deployment (via Coolify):**

Coolify handles automatic deployment dari GitHub:
- Push ke branch `main` → deploy ke production
- Push ke branch `develop` → deploy ke staging

**Manual Deployment (if needed):**

```bash
# SSH into server
ssh user@classnetic.com

# Pull latest code
cd /var/www/classnetic/backend
git pull origin main

# Install dependencies
go mod download

# Run migrations
go run cmd/migrate/main.go

# Build binary
go build -o bin/classnetic cmd/server/main.go

# Restart service
sudo systemctl restart classnetic

# Check logs
sudo journalctl -u classnetic -f
```

**2. Frontend Web Deployment:**

```bash
# Build for production
cd web
npm run build

# Upload build artifacts
rsync -avz build/ user@classnetic.com:/var/www/classnetic/web/

# Or use Coolify automatic deployment
```

**3. Mobile App Deployment:**

- **Android:** Upload APK ke Google Play Console
- **iOS:** Upload IPA ke App Store Connect
- **Beta Testing:** TestFlight (iOS) & Firebase App Distribution (Android)

### Environment Variables

**Backend (.env):**

**Required:**
```env
DB_HOST=localhost
DB_PORT=5432
DB_NAME=classnetic_dev
DB_USER=postgres
DB_PASSWORD=your_password

REDIS_HOST=localhost
REDIS_PORT=6379

JWT_SECRET=your_jwt_secret_min_32_chars
JWT_ACCESS_TOKEN_EXPIRY=15m
JWT_REFRESH_TOKEN_EXPIRY=720h

MIDTRANS_SERVER_KEY=your_midtrans_server_key
MIDTRANS_CLIENT_KEY=your_midtrans_client_key

SENDGRID_API_KEY=your_sendgrid_api_key
```

**Optional:**
```env
ENVIRONMENT=development
LOG_LEVEL=debug
HTTP_PORT=8080
CORS_ORIGINS=http://localhost:5173
```

**Frontend Web (.env):**
```env
VITE_API_BASE_URL=http://localhost:8080
VITE_ENVIRONMENT=development
```

**Secret management:** Semua secrets disimpan di environment variables, tidak ada hardcoded secrets. Gunakan Coolify environment variables management untuk production.

## 📊 Key Metrics & Monitoring

### Business Metrics

- [ ] **Active Schools:** Target 100+ active school accounts (Year 1)
- [ ] **Total Students Managed:** Target 100,000+ students (Year 1)
- [ ] **Monthly Active Users (MAU):** Teachers, students, parents combined
- [ ] **Student Under Management (SUM):** Total active enrolled students
- [ ] **Feature Adoption:** Attendance tracking, grading, SPP payment usage
- [ ] **Offline Sync Success Rate:** Target >95% successful sync
- [ ] **Mobile App Downloads:** iOS + Android installs

### Technical Metrics

- [ ] **Response Time:** API <500ms average, web app <2s load time
- [ ] **Uptime:** 99.5% uptime SLA
- [ ] **Error Rate:** <1% error rate
- [ ] **Database Performance:** <100ms average query time
- [ ] **Mobile App Crash Rate:** <1% crash-free users
- [ ] **WebSocket Connection Stability:** >98% successful connections

### Monitoring Setup

- **Error Tracking:** Sentry untuk error aggregation & alerting
- **Performance Monitoring:** Custom dashboard dengan response time tracking
- **Uptime Monitoring:** UptimeRobot + Cloudflare monitoring
- **Business Metrics:** Custom analytics dashboard (Google Analytics + own tracking)

## 🔐 Security

### Security Measures

- [ ] **Authentication:** JWT tokens dengan short expiry (15 minutes access token)
- [ ] **Authorization:** Role-based access control (RBAC) dengan 7 roles
- [ ] **Data Encryption:**
  - At rest: PostgreSQL Transparent Data Encryption
  - In transit: TLS 1.3 untuk semua connections
- [ ] **API Security:**
  - Rate limiting (100 req/min authenticated, 10 req/min guests)
  - CORS proper configuration
  - Request signing untuk webhooks (Midtrans)
- [ ] **Input Validation:** Validasi semua inputs di backend & frontend
- [ ] **SQL Injection Prevention:** Parameterized queries via GORM
- [ ] **XSS Prevention:** Content sanitization di frontend

### Security Checklist

- [x] HTTPS enabled (Cloudflare SSL)
- [x] Environment variables secured (not in git)
- [x] Database connections encrypted
- [x] User passwords hashed dengan bcrypt (cost 12)
- [x] API rate limiting implemented
- [x] CORS properly configured
- [ ] Regular security audits (quarterly)
- [ ] Penetration testing (before launch)
- [ ] Dependency vulnerability scanning ( automated)

## 📚 Documentation

### Internal Documentation

- **Technical Specs:** [tech-stack.md](./tech-stack.md) - Architecture, database schema, API design
- **Product Specification:** [product-spec.md](./product-spec.md) - Features, user stories, roadmap
- **User Stories:** [user-stories.md](./user-stories.md) - Personas & acceptance criteria
- **Pricing Model:** [pricing-model.md](./pricing-model.md) - Monetization strategy & revenue projections
- **API Documentation:** OpenAPI/Swagger spec (generated from code)
- **Database Schema:** ER diagrams & migration history

### User Documentation

- **User Guide:** [Link ke user guide] (Future)
- **Admin Manual:** School admin documentation (Future)
- **Teacher Guide:** Mobile app usage guide (Future)
- **Parent Guide:** Portal monitoring guide (Future)
- **FAQ:** Frequently asked questions (Future)
- **Video Tutorials:** Setup & feature walkthroughs (Future)

## 🤝 Team & Roles

### Development Team

- **Tech Lead:** Najib (Backend & Architecture - Go)
- **Frontend Developer (Web):** [Nama] (SvelteKit implementation)
- **Mobile Developer:** [Nama] (Flutter mobile apps)
- **DevOps Engineer:** [Nama] (Infrastructure & deployment)
- **QA Engineer:** [Nama] (Testing & quality assurance)

### External Stakeholders

- **Product Owner:** [Nama] (Business requirements, roadmap)
- **UI/UX Designer:** [Nama] (Design system, user flows)
- **Domain Expert:** [Nama] (Education system consultant, former teacher/principal)
- **Islamic Education Consultant:** [Nama] (Untuk madrasah/pesantren features)

## 🆘 Support & Troubleshooting

### Common Issues

1. **Database connection failed**
   - Solution: Check .env database configuration, ensure PostgreSQL service is running
   - `sudo systemctl status postgresql`

2. **Redis connection failed**
   - Solution: Check Redis is running, verify REDIS_HOST & REDIS_PORT in .env
   - `redis-cli ping` (should return PONG)

3. **Go modules error**
   - Solution: Run `go mod tidy` to clean up dependencies
   - Delete `go.sum` and run `go mod download` if needed

4. **Flutter device not found**
   - Solution: Run `flutter devices` to check connected devices
   - Enable USB debugging on Android device
   - Make sure Xcode is installed (for iOS development)

5. **SvelteKit build failed**
   - Solution: Run `npm install` to ensure dependencies are installed
   - Check Node.js version (`node -v` should be 20+)

### Getting Help

- **Slack Channel:** #classnetic-development
- **Emergency Contact:** [contact info]
- **Documentation:** [link ke troubleshooting guide]
- **Issue Tracking:** GitHub Issues

## 📈 Roadmap

Lihat [roadmap.md](./roadmap.md) untuk 10 development milestones dari concept sampai launch.

**Development Timeline:**
- **Phase 1 (Milestone 1-3):** Foundation & Core Features (Month 1-4)
- **Phase 2 (Milestone 4-6):** Learning & Assessment (Month 4-7)
- **Phase 3 (Milestone 7-9):** Portals & Analytics (Month 7-10)
- **Phase 4 (Milestone 10):** Polish & Launch (Month 10-12)

## 🔄 Changelog

Lihat [changelog.md](./changelog.md) untuk riwayat perubahan Classnetic.com.

## 🐛 Known Issues

Lihat [known-issues.md](./known-issues.md) untuk daftar bug dan limitation yang diketahui.

## 💰 Pricing

See [pricing-model.md](./pricing-model.md) untuk complete pricing breakdown.

**Quick Summary:**
- **Tier 1 (Small <200 students):** Rp 5,000/siswa/bulan
- **Tier 2 (Medium 200-500):** Rp 10,000/siswa/bulan
- **Tier 3 (Large 500+):** Rp 15,000/siswa/bulan
- **Annual Discount:** 2 months free (17% discount)
- **Free Trial:** 3 months untuk 50 students max

**Example:** School dengan 300 students (Tier 2)
- Monthly: 300 × Rp 10,000 = Rp 3,000,000
- Annual (prepaid): Rp 30,000,000 (17% discount dari Rp 36M)

---

**Last Updated:** 2026-01-06
**Version:** 0.1.0-concept
**Maintainer:** Najib Zain (Lead Developer)

**Next Steps:**
1. Review [product-spec.md](./product-spec.md) untuk complete feature details
2. Check [tech-stack.md](./tech-stack.md) untuk architecture decisions
3. Read [user-stories.md](./user-stories.md) untuk personas & requirements
4. Study [pricing-model.md](./pricing-model.md) untuk monetization strategy
5. Review [roadmap.md](./roadmap.md) untuk development milestones
