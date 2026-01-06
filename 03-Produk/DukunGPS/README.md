# 📍 DukunGPS

> Platform GPS Tracker dengan Prediksi AI, Notifikasi Cerdas & Analisis Lengkap

## 🏷️ Product Identity

- **Nama Produk:** DukunGPS
- **Status:** 🚧 In Development
- **Repo Code:** `github.com/akordium/dukungps` (Private)
- **Live Site:** https://dukungps.com
- **Staging:** https://staging.dukungps.com
- **Project Management:** [Link ke GitHub Project Board]

## 📋 Quick Overview

**Tagline:** GPS Tracker dengan Kecerdasan Buatan untuk Prediksi Rute & Anti-Theft Protection

**Deskripsi Singkat:** Platform GPS tracking SaaS berbasis langganan dengan keunggulan AI prediction layer yang tidak hanya melacak posisi kendaraan secara real-time, tetapi juga memprediksi rute tercepat berdasarkan pola traffic, mendeteksi perilaku berkendara berbahaya, memberikan peringatan geofence, dan mengirimkan notifikasi maintenance. Fokus utama pada solusi anti-theft untuk pasar Indonesia dengan tingkat pencurian kendaraan yang tinggi.

**Target Market:**

- **Primary:** Perusahaan fleet management & logistik (manage 10-500+ kendaraan)
- **Secondary:** Jasa rental mobil & motor (prevent theft, track usage)
- **Tertiary:** Parenting/family safety (track anak, elderly care)
- **Quaternary:** Individual vehicle owners (anti-theft protection)

**5 Fitur Utama:**

1. **Real-time GPS Tracking dengan History Playback** - Live location tracking 5-10 detik interval, historical route replay hingga 90 hari
2. **Geofence Alerts** - Notifikasi otomatis saat kendaraan keluar/masuk zona tertentu (marking asal/tujuan, daerah berbahaya)
3. **Predictive Routing** - AI memprediksi rute tercepat berdasarkan pola traffic historis dan kondisi jalan real-time
4. **Driver Behavior Monitoring** - Deteksi kecepatan berlebih, hard braking, sharp cornering dengan notifikasi instan
5. **Maintenance Reminders** - Pengingat service otomatis berdasarkan mileage, engine hours, dan waktu

**Fitur Tambahan (Post-MVP):**

- **AI Route Optimization** - Rekomendasi rute optimal untuk multiple destinations (sales, delivery)
- **Fuel Consumption Analysis** - Estimasi konsumsi BBM berdasarkan driving pattern
- **Integration dengan Insurance** - Diskon premi asuransi kendaraan untuk pengguna DukunGPS
- **Multi-device Family Plan** - Satu dashboard untuk track mobil, motor, smartphone seluruh keluarga

**Problem yang Diselesaikan:**

- **Vehicle Theft:** Tingginya angka pencurian kendaraan di Indonesia (457,000 kasus/tahun menurut BPS 2023)
- **Fleet Inefficiency:** Tidak adanya visibilitas atas penggunaan kendaraan perusahaan, rute tidak optimal
- **Safety Concerns:** Tidak adanya monitoring perilaku berkendara berbahaya (speeding, harsh braking)
- **Maintenance Neglect:** Lupa jadwal service yang menyebabkan kerusakan prematur dan biaya mahal
- **Parenting Anxiety:** Khawatir orang tua track lokasi anak dan anggota keluarga lansia

## 🛠 Tech Stack

### Backend

- **Framework/Language:** Go 1.21+ dengan Fiber framework (high-performance HTTP framework)
- **Database:** PostgreSQL 15
- **Real-time Communication:** WebSocket (untuk live GPS updates)
- **AI/ML Layer:** TensorFlow Lite atau ONNX Runtime untuk route prediction models
- **Task Queue:** Asynq (Redis-based task queue untuk background jobs)

### Frontend

- **Framework:** SvelteKit (Svelte 5)
- **Component Library:** Skeleton UI (Svelte components) + shadcn-svelte
- **State Management:** Svelte stores dengan WebSockets untuk real-time updates
- **Map Integration:** Leaflet.js atau Mapbox GL JS dengan OpenStreetMap
- **Charting:** Chart.js atau Apache ECharts untuk analytics dashboard
- **Styling:** Tailwind CSS 3

### Infrastructure

- **Hosting:** Oracle Cloud Infrastructure
- **Deployment:** Coolify
- **CDN:** Cloudflare
- **Monitoring:** Prometheus + Grafana
- **WebSocket Server:** Native Fiber WebSocket handler

### Third-party Services

- **Map Providers:**
  - **OpenStreetMap** - Primary map data (gratis & open source)
  - **Mapbox** - Alternative map tiles untuk enhanced visualization
  - **Google Maps API** - Optional premium routing & traffic data
- **SMS Gateway:**
  - **Nexmo** - Primary SMS gateway untuk alerts
  - **Twilio** - Alternative SMS gateway
- **Email:** SendGrid atau Resend
- **Storage:** Cloudflare R2 (untuk GPS data logs & route history)
- **Payment Gateways:**
  - **Midtrans** - Subscription billing, device purchase
  - **Xendit** - Alternative payment gateway
- **Push Notifications:** Firebase Cloud Messaging (FCM) untuk mobile apps

## 💻 Local Development Setup

### Prerequisites

- [ ] Go 1.21+
- [ ] PostgreSQL 15
- [ ] Node.js 20+ (untuk SvelteKit development)
- [ ] Redis 7+ (untuk task queue & caching)
- [ ] Docker & Docker Compose (optional)

### Installation Steps

1. **Clone repository**

   ```bash
   git clone https://github.com/akordium/dukungps.git
   cd dukungps
   ```

2. **Install backend dependencies**

   ```bash
   go mod download
   ```

3. **Install frontend dependencies**

   ```bash
   cd frontend
   npm install
   ```

4. **Environment setup**

   ```bash
   cp .env.example .env
   # Edit .env file dengan konfigurasi lokal
   ```

5. **Database setup**

   ```bash
   # Jalankan PostgreSQL & Redis (jika menggunakan Docker)
   docker-compose up -d postgres redis

   # Buat database
   createdb dukungps_dev

   # Run migrations
   go run cmd/migrate/main.go

   # Seed data
   go run cmd/seed/main.go
   ```

6. **Start development servers**

   Terminal 1 - Backend:
   ```bash
   go run cmd/server/main.go
   ```

   Terminal 2 - Frontend:
   ```bash
   cd frontend
   npm run dev
   ```

7. **Aplikasi berjalan di:**
   - Backend API: http://localhost:3000
   - Frontend: http://localhost:5173

### Development Commands

```bash
# Backend
go run cmd/server/main.go              # Start development server
go test ./...                           # Run all tests
go test -v ./internal/...              # Run tests with verbose output
go build cmd/server/main.go            # Build production binary

# Frontend
npm run dev                             # Start dev server
npm run build                           # Build for production
npm run preview                         # Preview production build
npm run test                            # Run tests

# Database
go run cmd/migrate/main.go up           # Run migrations
go run cmd/migrate/main.go down         # Rollback migrations
go run cmd/seed/main.go                 # Seed database

# Code Quality
gofmt -s -w .                          # Format Go code
go vet ./...                            # Run Go vet
staticcheck ./...                       # Run staticcheck (if installed)
```

## 🧪 Testing

### Test Suite

- **Backend:**
  - **Framework:** Go testing + testify
  - **Coverage Target:** 80%
  - **Test Types:**
    - Unit Tests: Service layer, business logic
    - Integration Tests: Database operations, API endpoints
    - Benchmark Tests: Performance critical paths

- **Frontend:**
  - **Framework:** Vitest + Testing Library
  - **Coverage Target:** 75%
  - **Test Types:**
    - Component Tests: Svelte components
    - E2E Tests: Playwright untuk critical user journeys

### Running Tests

```bash
# Backend tests
go test ./...                           # Run all tests
go test -v ./internal/tracking/...      # Run specific package tests
go test -race ./...                     # Run with race detection
go test -cover ./...                    # Run with coverage
go test -bench=. ./...                  # Run benchmarks

# Frontend tests
npm run test                            # Run all tests
npm run test:unit                       # Unit tests only
npm run test:e2e                        # E2E tests only
npm run test:coverage                   # Run with coverage
```

## 🚢 Deployment

### Environments

- **Development:** Local development dengan Docker Compose
- **Staging:** Oracle Cloud dengan staging database
- **Production:** Oracle Cloud dengan high-availability setup

### Deployment Process

1. **Automatic Deployment** (via Coolify)
   - Push ke branch `main` → deploy ke production
   - Push ke branch `develop` → deploy ke staging

2. **Manual Deployment** (jika perlu)

   Backend:
   ```bash
   # Pull latest code
   git pull origin main

   # Build binary
   go build -ldflags="-s -w" -o dukungps cmd/server/main.go

   # Run migrations
   ./dukungps migrate up

   # Restart service
   systemctl restart dukungps
   ```

   Frontend:
   ```bash
   # Pull latest code
   git pull origin main

   # Install dependencies
   npm ci

   # Build for production
   npm run build

   # Restart service (atau Coolify handles ini)
   ```

### Environment Variables

**Required variables:**

- `DB_HOST` - Database host
- `DB_PORT` - Database port
- `DB_NAME` - Database name
- `DB_USER` - Database username
- `DB_PASSWORD` - Database password
- `REDIS_HOST` - Redis host
- `REDIS_PORT` - Redis port
- `JWT_SECRET` - JWT signing secret
- `MIDTRANS_SERVER_KEY` - Midtrans server key
- `SENDGRID_API_KEY` - SendGrid API key

**Optional variables:**

- `ENVIRONMENT` - Environment (development/staging/production)
- `LOG_LEVEL` - Log level (debug/info/warn/error)
- `GPS_DATA_RETENTION_DAYS` - GPS data retention period (default: 90)
- `WEBSOCKET_PING_INTERVAL` - WebSocket ping interval in seconds

**Secret management:** Semua secrets disimpan di environment variables, tidak ada hardcoded secrets.

## 📊 Key Metrics & Monitoring

### Business Metrics

- [ ] **Active Devices:** Target 1,000+ active GPS devices (Year 1)
- [ ] **Monthly Active Users:** Target 80% monthly active users
- [ ] **Subscription Revenue:** Target Rp 500M ARR (Year 1)
- [ ] **Device Sales:** Target 500+ device units sold (Year 1)
- [ ] **Churn Rate:** < 5% monthly churn rate
- [ ] **Free-to-Paid Conversion:** Target 15-20% conversion rate
- [ ] **Customer Acquisition Cost (CAC):** Target < Rp 300k per customer
- [ ] **Lifetime Value (LTV):** Target Rp 1.5M+ per customer (12-month subscription)

### Technical Metrics

- [ ] **GPS Update Frequency:** 5-10 seconds real-time updates
- [ ] **WebSocket Latency:** < 100ms average
- [ ] **API Response Time:** < 200ms average
- [ ] **Uptime:** 99.5% uptime
- [ ] **Error Rate:** < 1% error rate
- [ ] **Database Performance:** < 50ms query time untuk GPS logs
- [ ] **Concurrent Connections:** Support 10,000+ concurrent WebSocket connections

### Monitoring Setup

- **Error Tracking:** Sentry untuk error tracking
- **Performance Monitoring:** Prometheus metrics + Grafana dashboards
- **Uptime Monitoring:** UptimeRobot + custom health checks
- **Business Metrics:** Custom analytics dashboard
- **Log Aggregation:** Loki + Grafana untuk log management

## 🔐 Security

### Security Measures

- [ ] **Authentication:** JWT-based authentication dengan refresh token rotation
- [ ] **Authorization:** Role-based access control (Admin, Fleet Manager, Driver, Parent)
- [ ] **Data Encryption:** Sensitive GPS data encrypted di rest & transit
- [ ] **API Security:** Rate limiting, CORS proper configuration, API key authentication
- [ ] **Input Validation:** Strict validation untuk semua inputs (Go struct tags)
- [ ] **WebSocket Security:** Token-based WebSocket authentication

### Security Checklist

- [x] HTTPS enabled (Cloudflare SSL)
- [x] Environment variables secured
- [x] Database connections encrypted (SSL/TLS)
- [x] User passwords properly hashed (bcrypt, cost 12)
- [x] API rate limiting implemented (Redis-based)
- [x] CORS properly configured
- [x] WebSocket authentication implemented
- [x] GPS data encrypted di database
- [ ] Regular security audits
- [ ] Penetration testing sebelum production launch

### Data Privacy

- **Location Data Privacy:** GPS history hanya accessible oleh authorized users
- **Data Retention:** Automatic cleanup GPS logs setelah 90 hari (configurable)
- **User Consent:** Explicit consent untuk location tracking & data processing
- **GDPR/ PDPA Compliance:** Right to deletion, data export functionality

## 🤝 Team & Roles

### Development Team

- **Tech Lead:** Najib (Backend & Architecture)
- **Frontend Developer:** [Nama] (SvelteKit & UI/UX Implementation)
- **DevOps Engineer:** [Nama] (Infrastructure & Deployment)
- **ML Engineer:** [Nama] (AI prediction models & route optimization)

### External Stakeholders

- **Product Owner:** [Nama] (Business Requirements & Market Strategy)
- **UI/UX Designer:** [Nama] (Design System & User Experience)
- **QA Engineer:** [Nama] (Testing & Quality Assurance)
- **Hardware Partner:** [Nama] (GPS device supplier & integration)

## 🆘 Support & Troubleshooting

### Common Issues

1. **WebSocket connection failed**
   - Solution: Check Redis connection, verify JWT token validity, ensure firewall allows WebSocket connections

2. **GPS data not updating**
   - Solution: Verify device is online, check WebSocket connection, review GPS data ingestion pipeline

3. **Geofence alerts not triggering**
   - Solution: Check geofence coordinates, verify alert settings, ensure device is sending accurate location data

4. **Map tiles not loading**
   - Solution: Verify map provider API key, check Cloudflare settings, ensure map service is accessible

5. **High memory usage**
   - Solution: Check GPS data retention settings, implement data archiving, review database query performance

### Getting Help

- **Slack Channel:** #dukungps-development
- **Emergency Contact:** [contact info]
- **Documentation:** [link ke troubleshooting guide]
- **Hardware Support:** [GPS device supplier contact]

## 📈 Roadmap

Lihat [roadmap.md](./roadmap.md) untuk detail perkembangan produk DukunGPS.

## 🔄 Changelog

Lihat [changelog.md](./changelog.md) untuk riwayat perubahan DukunGPS.

## 🐛 Known Issues

Lihat [known-issues.md](./known-issues.md) untuk daftar bug dan limitation yang diketahui.

## 🔗 AI & Analytics Layer

### Predictive Routing (Core Feature)

**Status:** MVP Feature (M1-M5) - Critical Differentiator

**How It Works:**
1. **Data Collection:** GPS device mengirim location data setiap 5-10 detik
2. **Traffic Pattern Analysis:** System mengumpulkan historical traffic data per jam/hari
3. **Route Prediction:** ML model memprediksi rute tercepat berdasarkan:
   - Historical traffic patterns (hari & jam)
   - Real-time traffic conditions (dari map API)
   - Road conditions (construction, accidents)
   - Weather data (jika available)
4. **Recommendation:** Driver menerima notifikasi rute optimal ke destination

**Benefits:**
- **Time Savings:** 10-25% reduction in travel time
- **Fuel Efficiency:** 15-30% reduction in fuel consumption
- **Fleet Optimization:** Better resource allocation untuk delivery companies
- **Safety:** Avoid high-accident areas

**Technology Stack:**
- **ML Framework:** TensorFlow Lite atau ONNX Runtime
- **Model Training:** Historical GPS data + traffic API data
- **Inference:** Real-time prediction di Go backend
- **Data Storage:** Time-series database (TimescaleDB extension untuk PostgreSQL)

**Future Enhancements:**
- **Multi-stop Optimization:** Sales & delivery route optimization (Traveling Salesman Problem)
- **Dynamic ETA:** Predictive arrival time berdasarkan real-time conditions
- **Weather Integration:** Route adjustment berdasarkan weather forecasts

---

**Last Updated:** 2026-01-06
**Version:** 0.5.0-alpha (MVP Scope: M1-M5 - 5 months)
**Maintainer:** Najib Zain (Lead Developer)

**MVP Timeline:**
- **M3 (12 weeks):** MVP Complete - Core GPS tracking + geofence + alerts
- **M5 (20 weeks):** Premium MVP - AI routing, analytics, mobile apps
- **M6-M10:** Post-MVP enhancements - Advanced AI, integrations, multi-device

## 💰 Pricing & Licensing

### Subscription + Hardware Model

**Hardware GPS Device:**

- **Device Price:** Rp 500,000 per unit (one-time purchase)
- **Device Types:**
  - **OBD-II Scanner** - Untuk mobil (plug & play, installation mudah)
  - **Hardwired GPS Tracker** - Untuk mobil & motor (professional installation)
  - **Portable GPS Tracker** - Battery-powered, magnetic (temporary tracking)
  - **Mobile App Tracker** - Software-only (untuk smartphone, free app)

**Subscription Plans:**

**Basic Plan:**
- **Price:** Rp 49,000/month per device
- **Billing:** Monthly, quarterly, atau annual (17% discount untuk annual)
- **Features:**
  - Real-time GPS tracking (10-second updates)
  - 30-day history playback
  - Basic geofence (5 zones max)
  - Speed alerts & harsh braking detection
  - Email notifications only
  - 1 month GPS data retention
- **Support:** Email only

**Premium Plan:**
- **Price:** Rp 99,000/month per device
- **Billing:** Monthly, quarterly, atau annual (17% discount untuk annual)
- **Features:**
  - Real-time GPS tracking (5-second updates)
  - 90-day history playback
  - Unlimited geofence zones
  - AI predictive routing (core differentiator)
  - Driver behavior score & analytics
  - Maintenance reminders (mileage & time-based)
  - SMS + push notifications
  - 3 months GPS data retention
  - Advanced analytics dashboard
  - API access untuk integrasi
- **Support:** Email & WhatsApp

**Enterprise Plan:**
- **Price:** Custom pricing (Rp 5-50M/month)
- **Purpose:** Fleet management companies, rental businesses
- **Features:**
  - Everything in Premium
  - Unlimited devices
  - White-label mobile apps
  - Custom integrations (ERP, CRM)
  - Dedicated account manager
  - SLA guarantee (99.9% uptime)
  - On-premise deployment option
  - Custom reports & analytics
- **Support:** Dedicated support team 24/7

**Family Plan:**
- **Price:** Rp 199,000/month untuk 5 devices
- **Purpose:** Parenting & family safety
- **Features:**
  - Real-time tracking untuk 5 family members (mobil, motor, smartphone)
  - Geofence untuk home, school, work
  - SOS button dengan location sharing
  - Speed alerts untuk teen drivers
  - Battery status monitoring
  - Mobile apps (iOS & Android)

**Free Trial:**
- **Duration:** 14 days free trial
- **Limit:** 1 device per account
- **Features:** Premium plan features
- **No credit card required**

**Referral Program:**
- **Reward:** Rp 50,000 credit untuk setiap referral yang berlangganan
- **Referee Discount:** Rp 49,000 discount untuk first month

📖 **Detailed Pricing:** [pricing-model.md](./pricing-model.md) untuk complete pricing breakdown

## 🏢 Business Model & Go-to-Market

### Revenue Streams

1. **Hardware Sales:** GPS device markup (20-30% margin)
2. **Subscription Revenue:** Recurring monthly revenue (primary revenue driver)
3. **Installation Service:** Rp 100,000 per installation (optional)
4. **Enterprise Customization:** Custom integrations, white-label solutions

### Customer Acquisition Strategy

**Primary Channels:**

1. **Direct Sales (B2B):**
   - Fleet management companies (logistics, delivery)
   - Rental companies (mobil & motor)
   - Corporate fleets (sales, service vehicles)

2. **Digital Marketing (B2C):**
   - Google Ads: "GPS tracker Indonesia", "anti-theft mobil"
   - Facebook/Instagram Ads: Target parents, car owners
   - TikTok: Product demonstrations, use case videos

3. **Partnerships:**
   - **Insurance Companies:** Offer DukunGPS dengan diskon premi (10-15%)
   - **Car Dealerships:** Bundle GPS device dengan new car purchase
   - **Motorcycle Dealers:** Anti-theft package untuk motor
   - **Workshops:** Cross-sell saat service kendaraan

4. **Referral Program:**
   - Customer referral rewards
   - Affiliate commissions untuk influencers & automotive content creators

### Competitive Advantage

**vs. Traditional GPS Trackers (TrackSolid, Lifetrack):**
- **AI Prediction Layer:** Predictive routing, bukan sekadar tracking
- **Better UX:** Modern, user-friendly interface (bukan enterprise clunky UI)
- **Affordable Pricing:** More competitive pricing dengan better features
- **Local Market Focus:** Indonesia-specific features (anti-theft alerts, traffic patterns)

**vs. International Solutions (GPSWOX, Navixy):**
- **Localization:** Full Indonesian language & support
- **Local Maps:** Better coverage untuk Indonesia roads
- **Payment:** Local payment methods (GoPay, OVO, DANA, bank transfer)
- **Price:** More affordable untuk Indonesian market
- **Support:** Local support team, bukan offshore

### Key Partnerships

**Insurance Partners:**
- **Value Proposition:** Reduce risk of theft → lower insurance premiums
- **Partnership Model:** Discount 10-15% untuk policyholders dengan DukunGPS
- **Target Companies:** Asuransi Kendaraan (Adira, Sinarmas, ACA, etc.)

**Automotive Partners:**
- **Car Dealerships:** Toyota, Honda, Daihatsu dealerships
- **Motorcycle Dealers:** Honda, Yamaha dealerships
- **Aftermarket Shops:** Automotive accessory stores

**Logistics Partners:**
- **Fleet Management Companies:** Target existing fleets untuk upgrade
- **Delivery Companies:** Gojek, Grab, JNE, J&T (driver tracking)

---

**Last Updated:** 2026-01-06
**Version:** 0.1.0-alpha
**Maintainer:** Najib Zain (Lead Developer)
