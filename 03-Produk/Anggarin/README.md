# 💰 Anggarin

> Perencanaan Keuangan Pribadi yang Manusiawi - Smart Financial Planning for Every Indonesian

## 🏷️ Product Identity

- **Nama Produk:** Anggarin
- **Status:** 🚧 In Development
- **Repo Code:** `github.com/akordium/anggarin` (Private)
- **Live Site:** https://anggarin.com
- **Staging:** https://staging.anggarin.com
- **Project Management:** [Link ke GitHub Project Board]

## 📋 Quick Overview

**Tagline:** Perencanaan Keuangan Pribadi yang Manusiawi

**Deskripsi Singkat:** Platform financial planning yang membantu individu Indonesia mengelola keuangan bukan hanya mencatat pengeluaran, tapi merencanakan masa depan dengan metode budgeting yang sesuai dengan konteks lokal dan aspirasi finansial.

**Target Market:**

- Individual professionals (25-45 tahun) dengan penghasilan menengah ke atas
- Fresh graduates yang ingin memulai kebiasaan finansial sehat
- Families yang merencanakan keuangan jangka panjang (pendidikan, rumah, pensiun)
- Freelancers dan entrepreneurs dengan income yang tidak teratur

**Problem yang Diselesaikan:** Traditional expense trackers yang tidak kontekstual dengan kondisi finansial Indonesia, kurangnya goal setting yang realistic, dan tidak adanya financial planning tools yang sesuai dengan kultur dan regulasi lokal.

## 🛠 Tech Stack

### Backend

- **Framework/Language:** Laravel 10 (PHP 8.2) - API Only
- **Database:** PostgreSQL 15
- **API:** RESTful API dengan JWT authentication

### Frontend

- **Framework:** Next.js 14 with TypeScript
- **Styling:** Tailwind CSS + Shadcn/UI
- **State Management:** Zustand + React Query
- **Charts:** Recharts.js

### Infrastructure

- **Hosting:** Oracle Cloud Infrastructure
- **Deployment:** Coolify
- **CDN:** Cloudflare
- **Monitoring:** Sentry + Custom Dashboard

### Third-party Services

- **Payment:** Midtrans (untuk premium subscription)
- **Email:** SendGrid
- **Storage:** Cloudflare R2
- **Analytics:** Google Analytics + Mixpanel

## 💻 Local Development Setup

### Prerequisites

- [ ] PHP 8.2+
- [ ] PostgreSQL 15
- [ ] Composer 2.0+
- [ ] Node.js 18+
- [ ] Docker & Docker Compose (optional)

### Installation Steps

1. **Clone repository**

   ```bash
   git clone https://github.com/akordium/anggarin.git
   cd anggarin
   ```

2. **Backend Setup**

   ```bash
   cd backend
   composer install
   cp .env.example .env
   php artisan key:generate
   php artisan migrate
   php artisan db:seed
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
   DB_CONNECTION=pgsql
   DB_HOST=127.0.0.1
   DB_PORT=5432
   DB_DATABASE=anggarin_dev
   DB_USERNAME=postgres
   DB_PASSWORD=password

   # Frontend .env.local
   NEXT_PUBLIC_API_URL=http://localhost:8000
   ```

5. **Start Development Servers**

   ```bash
   # Terminal 1: Backend
   cd backend && php artisan serve

   # Terminal 2: Frontend
   cd frontend && npm run dev
   ```

6. **Aplikasi berjalan di:**
   - Frontend: http://localhost:3000
   - Backend API: http://localhost:8000

### Development Commands

```bash
# Backend Testing
cd backend && php artisan test

# Frontend Testing
cd frontend && npm run test

# Linting (Frontend)
npm run lint

# Code Formatting (Backend)
php artisan pint

# Database Migrations
php artisan migrate:fresh --seed
```

## 🧪 Testing

### Test Suite

- **Framework:** Pest (PHP) + Jest (JavaScript/TypeScript)
- **Coverage Target:** 90%
- **Test Types:**
  - Unit Tests: Models, Services, Utilities
  - Feature Tests: API endpoints dan workflows
  - Integration Tests: Frontend + Backend integration
  - E2E Tests: Critical user journeys dengan Playwright

### Running Tests

```bash
# Backend Tests
php artisan test --coverage

# Frontend Tests
npm run test -- --coverage

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
   composer install --no-dev --optimize-autoloader
   php artisan migrate --force
   php artisan cache:clear
   ```

### Environment Variables

**Required Backend Variables:**

- `DB_CONNECTION`, `DB_HOST`, `DB_PORT`, `DB_DATABASE`, `DB_USERNAME`, `DB_PASSWORD`
- `JWT_SECRET`, `MIDTRANS_SERVER_KEY`, `SENDGRID_API_KEY`

**Required Frontend Variables:**

- `NEXT_PUBLIC_API_URL`, `NEXT_PUBLIC_MIDTRANS_CLIENT_KEY`, `NEXT_PUBLIC_GA_ID`

**Secret Management:** Semua secrets stored di environment variables, tidak ada hardcoded secrets.

## 📊 Key Metrics & Monitoring

### Business Metrics

- [ ] **Active Users:** Target 10,000+ monthly active users
- [ ] **Premium Subscribers:** Target 1,000+ paid users
- [ ] **Financial Goals Created:** Target 50,000+ goals tracked
- [ ] **User Engagement:** 60% monthly active retention
- [ ] **Average Session Duration:** Target 5+ minutes

### Technical Metrics

- [ ] **Response Time:** < 300ms average API response
- [ ] **Uptime:** 99.9% uptime SLA
- [ ] **Error Rate:** < 0.5% error rate
- [ ] **Page Load Speed:** < 2 seconds LCP
- [ ] **Mobile Performance:** 85+ Lighthouse score

### Monitoring Setup

- **Error Tracking:** Sentry dengan performance monitoring
- **Analytics:** Google Analytics 4 + Mixpanel
- **Uptime Monitoring:** Cloudflare + custom health checks
- **Business Metrics:** Custom dashboard dengan financial KPIs

## 🔐 Security

### Security Measures

- [ ] **Authentication:** JWT tokens dengan refresh mechanism
- [ ] **Authorization:** Role-based access (Free vs Premium users)
- [ ] **Data Encryption:** Sensitive financial data encrypted
- [ ] **API Security:** Rate limiting, CORS, input validation
- [ ] **Privacy Compliance:** Indonesian PDPA compliance

### Security Checklist

- [x] HTTPS enabled dengan Cloudflare SSL
- [x] Environment variables secured
- [x] Database connections encrypted
- [x] User passwords hashed dengan bcrypt
- [x] API rate limiting implemented (100 requests/minute)
- [x] CORS properly configured untuk frontend domain
- [ ] Input validation untuk semua API endpoints
- [ ] SQL injection prevention dengan parameterized queries

## 📚 Documentation

### Internal Documentation

- **Technical Specs:** [link ke technical documentation]
- **API Documentation:** [link ke API docs]
- **Database Schema:** [link ke database docs]
- **Deployment Guide:** [link ke deployment guide]

### User Documentation

- **User Guide:** [link ke user guide]
- **FAQ:** [link ke FAQ]
- **Financial Education:** [link ke financial literacy content]
- **Video Tutorials:** [link ke video tutorials]

## 🤝 Team & Roles

### Development Team

- **Tech Lead:** [Nama] (Backend Architecture & API Design)
- **Frontend Developer:** [Nama] (Next.js & User Experience)
- **Backend Developer:** [Nama] (Laravel API & Financial Logic)
- **DevOps Engineer:** [Nama] (Infrastructure & Deployment)

### External Stakeholders

- **Product Owner:** [Nama] (Product Strategy & User Experience)
- **UI/UX Designer:** [Nama] (Design System & User Journey)
- **QA Engineer:** [Nama] (Testing & Quality Assurance)
- **Financial Advisor:** [Nama] (Domain Expertise & Compliance)

## 🆘 Support & Troubleshooting

### Common Issues

1. **Backend API connection failed**
   - Solution: Check API URL di frontend .env.local, ensure backend running

2. **JWT Token expired**
   - Solution: Automatic token refresh implemented, user should re-login jika terus error

3. **Database migration failed**
   - Solution: Check PostgreSQL connection, ensure database exists

4. **Financial calculation errors**
   - Solution: Check decimal precision settings, review calculation logic

### Getting Help

- **Slack Channel:** #anggarin-development
- **Emergency Contact:** [contact info]
- **Documentation:** [link ke troubleshooting guide]

## 📈 Roadmap

Lihat [roadmap.md](./roadmap.md) untuk detail perkembangan produk Anggarin.

## 🔄 Changelog

Lihat [changelog.md](./changelog.md) untuk riwayat perubahan Anggarin.

## 🐛 Known Issues

Lihat [known-issues.md](./known-issues.md) untuk daftar bug dan limitation yang diketahui.

## 🎯 Business Model

### Freemium Model

**Free Features:**

- Basic expense tracking
- Simple budgeting rules
- 5 financial goals
- Basic reporting
- Mobile app access

**Premium Features (IDR 50,000/bulan):**

- Unlimited financial goals
- Advanced analytics & insights
- AI-powered financial advice
- Custom budget categories
- Export functionality
- Priority customer support
- Advanced reporting

### Target Revenue Streams

- **Subscription Revenue:** 80% dari total revenue
- **Financial Products:** Partnership dengan banks/investment products
- **Educational Content:** Premium financial literacy content
- **Enterprise:** Corporate financial wellness programs

---

**Last Updated:** 2024-12-01
**Version:** 0.2.0-alpha
**Maintainer:** Anggarin Development Team
