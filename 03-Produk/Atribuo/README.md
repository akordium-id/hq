# ⚔️ Atribuo

> Visualisasikan Statistik Karakter & Skillmu - Real-Life RPG Skill Visualization Platform

## 🏷️ Product Identity

- **Nama Produk:** Atribuo
- **Status:** 🥚 Concept / Prototyping
- **Repo Code:** `github.com/akordium/atribuo` (Private)
- **Live Site:** https://atribuo.com
- **Staging:** https://staging.atribuo.com
- **Project Management:** [Link ke GitHub Project Board]

## 📋 Quick Overview

**Tagline:** Visualisasikan Statistik Karakter & Skillmu

**Deskripsi Singkat:** Platform gamification untuk kehidupan nyata yang memungkinkan pengguna untuk membuat profil karakter, menilai skill mereka, dan menampilkannya dalam bentuk diagram radar/chart yang interaktif dan shareable.

**Target Market:**

- Gamers dan gaming enthusiasts
- Students dan young adults yang ingin track progress
- Job seekers yang ingin visualize skills dan achievements
- Community builders yang ingin track collective skills
- Hobbyists untuk personal development tracking

**Problem yang Diselesaikan:** Difficulty dalam visualizing personal growth dan skill development secara engaging dan mudah dibagikan ke orang lain. Traditional resume/profile tools tidak interaktif dan kurang menarik untuk milenial.

## 🛠️ Tech Stack

### Backend

- **Framework/Language:** Go 1.21 (Golang)
- **Database:** PostgreSQL 15
- **API:** RESTful API + WebSocket (real-time features)

### Frontend

- **Framework:** Next.js 14 with TypeScript
- **Styling:** Tailwind CSS + Custom Components
- **State Management:** Zustand
- **Charts:** Recharts.js

### Infrastructure

- **Hosting:** Oracle Cloud Infrastructure
- **Deployment:** Coolify
- **CDN:** Cloudflare
- **Monitoring:** Sentry

### Third-party Services

- **Data Storage:** Cloudflare R2
- **Analytics:** Google Analytics
- **Email:** SendGrid

## 💻 Local Development Setup

### Prerequisites

- [ ] Go 1.21+
- [ ] PostgreSQL 15
- [ ] Node.js 18+
- [ ] Docker & Docker Compose (optional)

### Installation Steps

1. **Clone repository**

   ```bash
   git clone https://github.com/akordium/atribuo.git
   cd atribuo
   ```

2. **Backend Setup**

   ```bash
   cd backend
   go mod download
   cp .env.example .env
   go run cmd/migrate/main.go
   go run cmd/seed/main.go
   ```

3. **Frontend Setup**

   ```bash
   cd frontend
   npm install
   cp .env.example .env.local
   ```

4. **Environment Configuration**

   ```bash
   # Backend .env
   DB_HOST=localhost
   DB_PORT=5432
   DB_DATABASE=atribuo_dev
   DB_USER=postgres
   DB_PASSWORD=password

   # Frontend .env.local
   NEXT_PUBLIC_API_URL=http://localhost:8080
   ```

5. **Start Development Servers**

   ```bash
   # Terminal 1: Backend
   cd backend && go run cmd/server/main.go

   # Terminal 2: Frontend
   cd frontend && npm run dev
   ```

6. **Atribuo berjalan di:**
   - Frontend: http://localhost:3000
   - Backend API: http://localhost:8080

### Development Commands

```bash
# Backend Testing
cd backend && go test ./...

# Frontend Testing
npm run test

# Go Build
cd backend && go build -o main ./cmd/server

# Run Production Build
./main
```

## 🧪 Testing

### Test Suite

- **Framework:** Go testing (native) + Jest (JavaScript/TypeScript)
- **Coverage Target:** 85%
- **Test Types:**
  - Unit Tests: API handlers, business logic, utilities
  - Integration Tests: API endpoints, WebSocket connections
  - E2E Tests: Critical user journeys dengan Playwright

### Running Tests

```bash
# Backend Tests
cd backend && go test ./...

# Frontend Tests
npm run test

# E2E Tests
npm run test:e2e

# All Tests (Backend + Frontend)
npm run test:all
```

## 🚢 Deployment

### Environments

- **Development:** Local development dengan PostgreSQL
- **Staging:** Oracle Cloud dengan staging database
- **Production:** Oracle Cloud dengan high-availability setup

### Deployment Process

1. **Automatic Deployment** (via Coolify)
   - Frontend: Push ke `main` → deploy ke production
   - Backend: Push ke `main` → deploy ke production
   - Staging: Push ke `develop` → deploy ke staging

2. **Manual Deployment** (jika perlu)

   ```bash
   # Frontend
   npm run build
   npm run deploy

   # Backend
   go build -o main ./cmd/server
   ./main
   ```

### Environment Variables

**Required Backend Variables:**

- `DB_HOST`, `DB_PORT`, `DB_DATABASE`, `DB_USERNAME`, `DB_PASSWORD`
- `JWT_SECRET`, `SENTRY_DSN`

**Required Frontend Variables:**

- `NEXT_PUBLIC_API_URL`, `NEXT_PUBLIC_ENV`

**Secret Management:** Semua secrets stored di environment variables.

## 📊 Key Metrics & Monitoring

### Business Metrics

- [ ] **Active Users:** Target 50,000+ monthly active users
- [ ] **Profiles Created:** Target 100,000+ profiles
- [] **Shared Profiles:** Target 20,000+ shared profile links
- [ ] **Embed Widgets:** Target 10,000+ embedded widgets

### Technical Metrics

- [ ] **Response Time:** < 200ms average API response
- [ ] **Uptime:** 99.9% uptime SLA
- [ ] **Page Load Speed:** < 2 seconds LCP
- [ ] **Real-time Performance:** WebSocket latency < 100ms

### Monitoring Setup

- **Error Tracking:** Sentry dengan performance monitoring
- **Analytics:** Google Analytics 4
- **Uptime Monitoring:** Cloudflare + custom health checks
- **Business Metrics:** Custom dashboard dengan engagement metrics

## 🔐 Security

### Security Measures

- [ ] **Authentication:** JWT tokens dengan refresh mechanism
- [ ] **Authorization:** Role-based access (Admin, User)
- [ ] **Data Encryption:** User data encrypted at rest
- [ ] **API Security:** Rate limiting, CORS, input validation

### Security Checklist

- [x] HTTPS enabled dengan Cloudflare SSL
- [x] Environment variables secured
- [x] Database connections encrypted
- [x] User passwords hashed dengan bcrypt
- [x] API rate limiting implemented
- [ ] Input validation untuk semua API endpoints

## 📚 Documentation

### Internal Documentation

- **Technical Specs:** [link ke technical documentation]
- **API Documentation:** [link ke API docs]
- **Database Schema:** [link ke database docs]
- **Deployment Guide:** [link ke deployment guide]

### User Documentation

- **User Guide:** [link ke user guide]
- **FAQ:** [link ke FAQ]
- **Video Tutorials:** [link ke video tutorials]
- **Community Guidelines:** [link ke community standards]

## 🤝 Team & Roles

### Development Team

- **Tech Lead:** [Nama] (Go Architecture & API Design)
- **Frontend Developer:** [Nama] (Next.js & User Experience)
- **Backend Developer:** [Nama] (Go API & WebSocket)
- **DevOps Engineer:** [Nama] (Infrastructure & Deployment)

### External Stakeholders

- **Product Owner:** [Nama] (Product Strategy & User Experience)
- **UI/UX Designer:** [Nama] (Design System & Gamification)
- **QA Engineer:** [Nama] (Testing & Quality Assurance)
- **Gaming Consultant:** [Nama] (Gamification Design)

## 🆘 Support & Troubleshooting

### Common Issues

1. **WebSocket connection failed**
   - Solution: Check WebSocket proxy configuration, refresh browser

2. **Chart rendering issues**
   - Solution: Check browser compatibility, try different browser

3. **Profile sharing not working**
   - Solution: Check public profile settings, regenerate share link

4. **Data sync issues**
   - Solution: Check API connection, manual sync available

### Getting Help

- **Slack Channel:** #atribuo-development
- **Emergency Contact:** [contact info]
- **Documentation:** [link ke troubleshooting guide]

## 📈 Roadmap

Lihat [roadmap.md](./roadmap.md) untuk detail perkembangan produk Atribuo.

## 🔄 Changelog

Lihat [changelog.md](./changelog.md) untuk riwayat perubahan Atribuo.

## 🐛 Known Issues

Lihat [known-issues.md](./known-issues.md) untuk daftar bug dan limitation yang diketahui.

## 🎯 Business Model

### Freemium Model

**Free Features:**

- Profile creation dengan 5 skills
- Basic hexagon chart visualization
- 3 template designs
- Profile sharing (basic)
- Community features

**Premium Features (IDR 29,000/bulan):**

- Unlimited skills dan categories
- Advanced chart types (custom templates)
- Profile analytics dan insights
- Private profiles
- Advanced sharing options
- Priority customer support
- Embed widget unlimited

### Revenue Streams

- **Subscription Revenue:** 90% dari total revenue
- **Custom Templates:** Additional premium templates
- **White-label Solutions:** Custom branding untuk communities
- **Enterprise:** Team management dan analytics

---

**Last Updated:** 2024-12-01
**Version:** 0.1.0-alpha
**Maintainer:** Atribuo Development Team
