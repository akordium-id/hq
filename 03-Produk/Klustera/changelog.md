# 🗓️ Klustera.id - Changelog

All notable changes to Klustera.id will be documented in this file.

**Format:** Based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
**Versioning:** Following [Semantic Versioning](https://semver.org/spec/v2.0.0.html)

---

## [Unreleased]

### Planned
- MVP development (Phase 1-4, 13 weeks)
- Beta testing dengan 3-5 housing complexes
- Public launch on Product Hunt dan Indonesian tech media
- Integration dengan Midtrans payment gateway

---

## Version History

### Planned Releases

#### [1.0.0] - Target: March 2026 (MVP Launch)

**MVP Features:**
- Financial Management System
  - Automatic monthly billing generation
  - Online payment via Midtrans (Bank Transfer, GoPay, OVO, Dana)
  - Payment reminder automation (email/SMS)
  - Financial dashboard (collection metrics, overdue tracking)
- Resident Portal
  - Announcement creation & delivery system
  - Voting system untuk complex decisions
  - Document repository (peraturan, laporan keuangan)
- Complaint Tracking
  - Complaint submission form (residents)
  - Complaint assignment & SLA tracking (pengelola)
  - Status updates & communication thread
- Facility Booking
  - Facility availability calendar
  - Online booking system
  - Booking management (view, cancel)

**Release Notes:**
> "Initial launch of Klustera.id - All-in-One Housing Management Platform untuk Kompleks Perumahan Indonesia. Kami excited untu membantu pengelola kompleks menghemat waktu dan meningkatkan collection rate iuran dengan sistem yang modern dan terjangkau!"

**Technical Highlights:**
- Laravel 10 + Livewire 3 (TALL Stack)
- PostgreSQL 15 database
- Midtrans payment integration
- Multi-tenant architecture (subdomain per complex)
- Role-based access control (Admin, Pengelola, Resident)

---

#### [1.1.0] - Target: May 2026

**Added:**
- Email notification system (SendGrid integration)
  - Bill delivery notifications (PDF invoice attachment)
  - Payment reminders (7 days, 3 days, 1 day before due)
  - Overdue payment reminders (3 days, 7 days, 14 days after due)
  - Complaint status updates
  - Announcement delivery notifications
- Dark mode support untuk admin dashboard
- Advanced filtering (billing status, complaint category, date range, vote count)
- Export reports ke Excel/CSV (billing history, complaint analytics)
- Resident mentions di announcement comments (@username)

**Improved:**
- Onboarding flow walkthrough (interactive guide untuk pengelola baru)
- Mobile responsiveness improvements (tablet & mobile view)
- Accessibility enhancements (WCAG 2.1 AA compliance)
- Performance optimizations (database query caching dengan Redis)

**Fixed:**
- Bug where vote count tidak update real-time
- Issue dengan special characters di resident names (Indonesian characters)
- Invoice PDF generation error untuk certain billing configurations

---

#### [1.2.0] - Target: July-August 2026

**Added:**
- **SMS Notifications** (Nexmo/Twilio integration)
  - Payment reminders via SMS (fallback jika email failed)
  - High-priority announcements (urgent notice)
- Search functionality (full-text search untuk complaints, announcements)
- Feedback categorization (custom categories per complex: Kebersihan, Keamanan, Facility, Lainnya)
- API access untuk premium users (RESTful API)
  - Developer documentation (Scribe)
  - API key management
  - Rate limiting (1000 requests/minute)

**Improved:**
- Dashboard UI redesign (focus on analytics dan visualizations)
- Roadmap view improvements (timeline view option untuk facility bookings)
- Financial report export (PDF format untuk board meetings)

---

#### [2.0.0] - Target: October-November 2026

**Added:**
- **Guest Management System** ⭐
  - Guest pre-registration (resident portal)
  - QR code/barcode generation untuk guests
  - Guest check-in/check-out system (satpam app)
  - Guest arrival notifications (WhatsApp/SMS/push notification)
  - Guest history & frequent guest list
- **Mobile Apps (React Native)**
  - Resident app (iOS & Android)
    - Bill payment via Midtrans Deep Link
    - Complaint submission dengan photo capture
    - Facility booking & QR code confirmation
    - Real-time notifications (push notifications)
  - Satpam app (Android-only)
    - Guest QR scanner
    - Patrol checkpoint system
    - Incident reporting
- **Single Sign-On (SSO)** (Premium)
  - Google Workspace integration
  - Microsoft Entra ID integration (optional untuk enterprise complexes)

**Improved:**
- Dashboard redesign (focus on analytics & insights)
- Roadmap view improvements (timeline view option untuk facility bookings)
- Multi-tenant performance optimization (database query caching)

**Changed:**
- API authentication upgraded dari API tokens ke OAuth2 (breaking change untuk API users)

---

#### [2.1.0] - Target: January-February 2027

**Added:**
- **Team Management** (Premium)
  - Invite team members via email
  - Role-based access control (Owner, Admin, Staff, Viewer)
  - Activity audit log (team actions tracking)
- **Advanced Analytics** (Premium)
  - Financial analytics dashboard
  - Resident engagement metrics
  - Complaint volume trends
  - Facility usage statistics
- **WhatsApp Business Integration**
  - Payment reminders via WhatsApp
  - Complaint status updates via WhatsApp
  - Announcement delivery via WhatsApp
  - Two-way chat (residents can reply ke WhatsApp)

**Improved:**
- Notification delivery rate (98%+ dengan WhatsApp)
- Resident engagement (higher response rate vs email)

---

#### [2.2.0] - Target: April-May 2027

**Added:**
- **IoT Integration** ⭐
  - Smart lock integration (Yale, August, Tuya)
  - Temporary access codes untuk guests
  - Smart meter integration (water & electricity)
  - Environmental sensors (air quality, temperature)
  - Facility automation (lighting, HVAC, irrigation)
- **Parking Management**
  - Parking slot sensors (occupied/vacant)
  - License plate recognition (camera integration)
  - Real-time parking availability
  - Reserved parking management
- **MQTT Broker**
  - Real-time IoT data streaming
  - Device management dashboard
  - Automation rules (if-then triggers)

---

#### [3.0.0] - Target: Late 2027 (Future)

**Added:**
- **Advanced Analytics & AI**
  - Predictive analytics (payment prediction, churn prediction)
  - Demand forecasting (facility booking demand)
  - Maintenance prediction (equipment failure prediction)
  - Machine learning models (payment risk scoring)
- **Developer Platform**
  - Public API documentation (OpenAPI/Swagger)
  - Webhook marketplace
  - Plugin system (third-party integrations)
  - SDK (PHP, JavaScript)
- **Integrations Marketplace**
  - Slack integration (team notifications)
  - Notion integration (documentation sync)
  - Jira integration (complaint syncing)
  - Zapier integration (automation)
- **White-Label Solution**
  - Reseller program
  - White-label licensing (untuk property management companies)
  - Custom deployment options (on-premise, private cloud)

**Improved:**
- Data warehousing (PostgreSQL + TimescaleDB untuk time-series data)
- Business intelligence tools (custom report builder)
- Enterprise features (SSO, audit logs, compliance reports)

---

## Categories Legend

- **Added:** New features
- **Changed:** Changes to existing functionality
- **Deprecated:** Soon-to-be removed features
- **Removed:** Removed features
- **Fixed:** Bug fixes
- **Security:** Security vulnerability fixes

---

## Version Numbering

**Format:** MAJOR.MINOR.PATCH

- **MAJOR:** Incompatible API changes, major feature additions
- **MINOR:** Backwards-compatible functionality, new features
- **PATCH:** Backwards-compatible bug fixes

**Examples:**
- `1.0.0` → `1.1.0` (New features, backwards compatible)
- `1.1.0` → `2.0.0` (Major features, breaking changes)
- `1.1.0` → `1.1.1` (Bug fixes only)

---

## Release Schedule

**Regular Releases:**
- **Minor Releases:** Every 2 months (new features)
- **Patch Releases:** As needed (bug fixes)
- **Major Releases:** Every 6-12 months (significant features)

**Hotfixes:**
- Released as needed untuk critical bugs
- No fixed schedule
- Priority: P0 (critical) dan P1 (high) bugs only

---

## Migration Guides

### Upgrading from 1.x to 2.0

**Breaking Changes:**
- API authentication changed dari API Tokens ke OAuth2
- Database schema changes (requires migration)
- Guest management features require mobile app installation

**Migration Steps:**
1. Backup database (`pg_dump`)
2. Run database migrations (`php artisan migrate`)
3. Update API clients ke use OAuth2 flow
4. Install mobile apps (iOS, Android)
5. Train satpam staff untuk guest management system
6. Test thoroughly sebelum production deployment

**Note:** Detailed migration guides akan dibuat saat release.

### Upgrading from 2.x to 3.0

**Breaking Changes:**
- IoT integration requires MQTT broker setup
- Advanced analytics requires data warehouse setup

**Migration Steps:**
1. Deploy MQTT broker (Mosquitto)
2. Set up data warehouse (TimescaleDB)
3. Configure IoT device connections
4. Migrate historical data ke data warehouse
5. Update analytics dashboards
6. Train staff untuk IoT management

---

## Known Issues

Untuk daftar known issues dan limitations, lihat [known-issues.md](./known-issues.md).

---

## Reporting Bugs

Found a bug? Report it:
- **GitHub Issues:** https://github.com/akordium/klustera/issues
- **Email:** support@klustera.id
- **WhatsApp:** +62 815-9988-995

When reporting, please include:
- Version number
- Steps to reproduce
- Expected behavior
- Actual behavior
- Screenshots (if applicable)

---

## Feature Requests

Want a new feature? Request it:
- **GitHub Issues:** https://github.com/akordium/klustera/issues (label: "enhancement")
- **Public Board:** https://klustera.id/feedback (vote untuk existing requests)
- **Email:** hello@klustera.id

---

## Stay Updated

**Changelog RSS Feed:** https://klustera.id/changelog/feed
**Release Notes Email:** Subscribe di https://klustera.id/updates
**GitHub Releases:** https://github.com/akordium/klustera/releases

---

**Last Updated:** 2026-01-06
**Changelog Version:** 1.0.0
**Maintainer:** Najib - Akordium Lab
