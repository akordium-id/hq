# 💬 Katauser - Changelog

All notable changes to Katauser will be documented in this file.

**Format:** Based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
**Versioning:** Following [Semantic Versioning](https://semver.org/spec/v2.0.0.html)

---

## [Unreleased]

### Planned
- MVP development (Phase 1-4, 12 weeks)
- Public launch on Product Hunt
- Beta testing dengan 10 Indonesian SaaS founders

---

## Version History

### Planned Releases

#### [1.0.0] - Target: March 2026 (MVP Launch)

**MVP Features:**
- Public feedback boards dengan voting system
- Automatic roadmap synchronization
- Changelog generator otomatis
- User authentication (JWT-based)
- Admin dashboard untuk board owners

**Release Notes:**
> "Initial launch of Katauser - Feedback Management Platform untuk SaaS Indonesia. Kami excited untu melihat bagaimana startup Indonesia menggunakan platform ini untuk mendengar suara users mereka!"

---

#### [1.1.0] - Target: April-May 2026

**Added:**
- Email notifications (new feedback, status change, weekly digest)
- Dark mode support
- Advanced filtering (by status, category, date range, vote count)
- Export feedback to CSV
- User mentions in comments (@username)

**Improved:**
- Onboarding flow walkthrough
- Mobile responsiveness improvements
- Accessibility enhancements (WCAG 2.1 AA compliance)

**Fixed:**
- Bug where vote count tidak update real-time
- Issue dengan special characters di feedback titles

---

#### [1.2.0] - Target: June-July 2026

**Added:**
- **Telegram Bot Integration** ⭐
  - Submit feedback via Telegram
  - Vote via Telegram
  - Receive notifications di Telegram channel
- Search functionality (full-text search)
- Feedback categorization (custom categories per board)
- API access untuk premium users (RESTful API)

**Improved:**
- Performance optimizations (database query caching)
- UI/UX improvements untuk roadmap drag-and-drop

---

#### [2.0.0] - Target: August-September 2026

**Added:**
- **AI-Powered Duplicate Detection**
  - ML model untuk detect similar feedbacks
  - Auto-merge suggestions
- **Automatic Feedback Categorization**
  - AI classify feedbacks: Bug, Feature, Improvement, Question
- **In-App Widget**
  - Embeddable feedback widget
  - Floating feedback button
- **Private Boards** (Premium)
  - Password-protected boards
  - Invite-only access
- **Single Sign-On (SSO)** (Premium)
  - Google Workspace integration
  - Microsoft Entra ID integration

**Improved:**
- Dashboard redesign (focus on analytics)
- Roadmap view improvements (timeline view option)

---

#### [2.1.0] - Target: October-November 2026

**Added:**
- **E-commerce Integrations**
  - Tokopedia review import
  - Shopee review import
  - TikTok Shop review import
- **Team Management** (Premium)
  - Invite team members via email
  - Role-based access control (Owner, Admin, Member, Viewer)
- **Advanced Analytics** (Premium)
  - Feedback submission trends
  - Category distribution
  - User engagement metrics

---

#### [3.0.0] - Target: 2027 (Future)

**Added:**
- **Mobile Apps**
  - iOS native app
  - Android native app
- **Developer Platform**
  - Public API documentation
  - Webhook marketplace
  - Plugin system
- **Integrations Marketplace**
  - Slack integration
  - Discord integration
  - Notion integration
  - Linear integration
  - Jira integration
  - Zapier integration
- **White-Label Solution**
  - Reseller program
  - White-label licensing
  - Custom deployment options

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

---

## Migration Guides

### Upgrading from 1.x to 2.0

**Breaking Changes:**
- API authentication changed dari Basic Auth ke Bearer Token
- Database schema changes (requires migration)

**Migration Steps:**
1. Backup database
2. Run database migrations
3. Update API clients ke use Bearer Token
4. Test thoroughly sebelum production deployment

**Note:** Detailed migration guides akan dibuat saat release.

---

## Known Issues

Untuk daftar known issues dan limitations, lihat [known-issues.md](./known-issues.md).

---

## Reporting Bugs

Found a bug? Report it:
- **GitHub Issues:** https://github.com/akordium/katauser/issues
- **Email:** support@katauser.com
- **Telegram:** @KatauserSupport

When reporting, please include:
- Version number
- Steps to reproduce
- Expected behavior
- Actual behavior
- Screenshots (if applicable)

---

## Feature Requests

Want a new feature? Request it:
- **GitHub Issues:** https://github.com/akordium/katauser/issues (label: "enhancement")
- **Public Board:** https://katauser.com/feedback (vote untuk existing requests)

---

**Last Updated:** 2026-01-06
**Changelog Version:** 1.0.0
**Maintainer:** Najib - Akordium Lab
