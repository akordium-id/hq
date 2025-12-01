# 🛠️ Anggarin Tech Stack

> Detailed technology stack and architecture documentation for Anggarin - Smart Financial Planning for Every Indonesian

## 🏗️ Architecture Overview

### System Architecture

**Architecture Type:** API-first architecture dengan decoupled frontend and backend, designed for scalability dan multi-platform support

**Design Patterns:**

- [ ] **Repository Pattern:** Clean separation antara business logic dan data access
- [ ] **Service Layer:** Centralized business logic implementation
- [ ] **Strategy Pattern:** Flexible budgeting rules dan investment strategies
- [ ] **Observer Pattern:** Event-driven architecture untuk financial transactions
- [ ] **Factory Pattern:** Dynamic goal creation dan financial advice generation

**Data Flow:**

```text
[Mobile/Web Client] → [Next.js Frontend] → [API Gateway] → [Laravel API] → [PostgreSQL]
                           ↓                    ↓                  ↓                  ↓
                    [CDN/Static Assets]   [Rate Limiter]    [Queue System]    [Backups/Replicas]
```

### Technology Rationale

**Why this stack:**

- **Frontend Choice:** Next.js provides optimal user experience untuk financial applications dengan strong SEO benefits
- **Backend Choice:** Laravel ecosystem excellent untuk complex financial calculations dan business logic
- **Database Choice:** PostgreSQL robust untuk financial data integrity dan complex queries
- **API-First:** Supports multiple client types (web, mobile, third-party integrations)
- **Scalability:** Decoupled architecture memungkinkan independent scaling

---

## 🖥️ Frontend Stack

### Framework & Libraries

**Primary Framework:** Next.js 14 with App Router

- **Version:** 14.0.3
- **Why chosen:** Excellent performance, automatic optimization, server-side rendering capabilities
- **Team Experience:** Strong React/Next.js expertise within Akordium Lab team

**Language:** TypeScript

- **Version:** 5.2+
- **Benefits:** Type safety untuk financial calculations, better IDE support, maintainable codebase
- **Implementation:** Strict TypeScript mode dengan comprehensive type definitions

**State Management:**

- **Primary:** Zustand untuk global state management
- **Secondary:** React Query (TanStack Query) untuk server state management
- **Why:** Lightweight, excellent TypeScript support, optimal performance
- **Patterns:** Component-based state dengan server state synchronization

**UI Components:**

- **Component Library:** Shadcn/UI + Tailwind CSS
- **Design System:** Custom design system untuk Anggarin branding
- **Custom Components:** Financial charts (Recharts), Form components, Data tables
- **Icon Library:** Lucide React icons

**Build Tools:**

- **Bundler:** Turbopack (Next.js 14 default)
- **Version:** Latest stable
- **CSS Framework:** Tailwind CSS 3.x dengan custom configuration
- **Optimization:** Automatic code splitting, image optimization, font optimization

### Frontend Architecture

**Component Structure:**

```text
src/
├── app/                  # Next.js App Router structure
│   ├── (auth)/           # Authentication routes
│   ├── dashboard/        # Main dashboard pages
│   ├── goals/           # Financial goals pages
│   ├── budget/          # Budgeting pages
│   ├── investments/     # Investment pages
│   └── settings/        # Settings and profile
├── components/          # Reusable UI components
│   ├── ui/              # Basic UI components (Button, Input, etc.)
│   ├── charts/          # Financial chart components
│   ├── forms/           # Financial form components
│   ├── layout/          # Layout components
│   └── features/        # Feature-specific components
├── lib/                 # Utility libraries
│   ├── api/             # API client functions
│   ├── utils/           # Utility functions
│   ├── hooks/           # Custom React hooks
│   └── stores/          # Zustand stores
├── styles/              # Global styles
└── types/               # TypeScript type definitions
```

**Code Splitting:**

- **Route-based:** Automatic code splitting per Next.js route
- **Component-based:** Lazy loading untuk heavy financial charts
- **Vendor Libraries:** Separate bundles untuk Chart.js, date libraries
- **Feature Splitting:** Dynamic imports untuk feature-specific code

**Performance Optimizations:**

- **Bundle Size:** Target < 2MB initial load
- **Image Optimization:** Next.js Image component dengan automatic optimization
- **Caching Strategy:** React Query caching untuk financial data
- **Lazy Loading:** Progressive loading untuk financial reports dan analytics
- **Database Optimization:** Eager loading dan efficient queries

---

## ⚙️ Backend Stack

### Primary Language & Framework

**Language:** PHP 8.2+

- **Version:** 8.2.15
- **Benefits:** Mature ecosystem, excellent financial libraries, strong community support
- **Financial Libraries:** MoneyPHP, Laravel Money, Custom financial calculation libraries

**Framework:** Laravel 10 (API Only)

- **Version:** 10.25+
- **Architecture Mode:** API-only configuration untuk RESTful backend
- **Key Features Used:**
  - Laravel Sanctum untuk API authentication
  - Laravel Queue System untuk background processing
  - Event system untuk financial transaction events
  - Validation system dengan custom financial rules
  - API Resource classes untuk consistent API responses

### Backend Architecture

**Application Structure:**

```text
app/
├── Http/
│   ├── Controllers/       # API controllers (versioned)
│   │   ├── V1/           # API Version 1 controllers
│   │   │   ├── Auth/      # Authentication controllers
│   │   │   ├── Budget/    # Budget management controllers
│   │   │   ├── Goals/     # Financial goals controllers
│   │   │   ├── Investments/ # Investment controllers
│   │   │   └── Users/     # User management controllers
│   ├── Middleware/       # API middleware
│   └── Requests/         # API request validation
├── Models/               # Eloquent models
│   ├── Auth/            # User dan authentication models
│   ├── Budget/          # Budget-related models
│   ├── Goals/           # Financial goals models
│   ├── Investment/      # Investment portfolio models
│   └── Transaction/     # Financial transaction models
├── Services/            # Business logic layer
│   ├── BudgetService/   # Budget calculation service
│   ├── GoalService/     # Goal tracking service
│   ├── InvestmentService/ # Investment calculation service
│   ├── AnalyticsService/ # Financial analytics service
│   ├── AIService/       # AI insights service
│   └── RecommendationService/ # Personalized recommendations
├── Repositories/        # Data access layer
├── Jobs/                # Background jobs
├── Listeners/           # Event listeners
├── Notifications/       # Email/SMS notifications
└── Providers/           # Service providers
```

**Design Patterns:**

- **Repository Pattern:** Abstraction layer untuk data access dengan caching
- **Service Layer:** Business logic encapsulation dengan comprehensive error handling
- **Factory Pattern:** Financial calculator creation dengan various strategies
- **Observer Pattern:** Event-driven architecture untuk financial transactions
- **Strategy Pattern:** Flexible budgeting rules dan investment strategies

**API Design:**

- **Style:** RESTful API dengan versioning (api/v1/)
- **Authentication:** Laravel Sanctum dengan JWT-like tokens
- **Rate Limiting:** Token bucket algorithm dengan different limits per endpoint
- **Documentation:** Scribe-generated API documentation
- **Response Format:** Consistent JSON response format dengan standardized error handling

---

## 🗄️ Database Layer

### Primary Database

**Database System:** PostgreSQL 15

- **Version:** 15.4
- **Why chosen:** Strong ACID compliance untuk financial data integrity, JSON support untuk flexible data structures, excellent query performance
- **Financial Features:** Decimal precision support untuk accurate calculations, advanced indexing strategies

**Database Design:**
**Schema Organization:**

```sql
-- Main schemas
-- public: Main application tables
-- financial: Financial data and calculations
-- analytics: Reporting dan analytics data
-- audit: Audit trails and compliance data
-- queue: Background job queues
```

**Key Tables:**

- **users:** User profiles dengan financial information
- **wallets:** Multiple financial accounts (banks, e-wallets, cash)
- **transactions:** All financial transactions dengan metadata
- **budgets:** Budget rules dan allocations
- **goals:** Financial goals dengan progress tracking
- **investments:** Investment portfolios dan performance data
- **categories:** Transaction categories dan rules
- **recommendations:** AI-generated financial advice

**Indexing Strategy:**

- **Primary Indexes:** All primary keys dengan appropriate constraints
- **Foreign Key Indexes:** Optimize untuk relationship queries
- **Query Indexes:** Optimized untuk financial reporting dan analytics queries
- **Composite Indexes:** Multi-column queries (user_date_range, category_month)
- **Partial Indexes:** Active data optimization (status-based indexes)
- **JSON Indexes:** GIN indexes untuk flexible financial metadata

### Caching Layer

**Cache System:** Redis 7.2

- **Version:** 7.2.3
- **Usage Patterns:**
  - **Session Storage:** Laravel session storage dengan Redis
  - **Query Results:** Expensive financial calculation results
  - **API Responses:** Frequently accessed financial data
  - **Rate Limiting:** Token bucket implementation
  - **Background Jobs:** Laravel queue system storage

**Cache Strategy:**

- **Cache-Aside:** Financial calculation results dan user preferences
- **Write-Through:** User session data dan authentication tokens
- **Refresh-Ahead:** Scheduled financial reports dan analytics
- **Tag-based Cache:** Organized cache invalidation dengan smart tagging

---

## 🌐 Infrastructure & DevOps

### Hosting & Deployment

**Cloud Provider:** Oracle Cloud Infrastructure

- **Region:** Singapore (ap-singapore-1)
- **Instance Types:** Compute instances optimized untuk different workloads
- **Services Used:** Compute, Block Storage, Object Storage, Load Balancer

**Containerization:**

- **Container Runtime:** Docker 24.x
- **Orchestration:** Coolify PaaS platform
- **Multi-stage Builds:** Optimized production images dengan Alpine base
- **Health Checks:** Comprehensive health check endpoints

**Deployment Strategy:**

- **CI/CD Pipeline:** GitHub Actions → Build → Test → Deploy
- **Deployment Method:** Blue-green deployment dengan zero downtime
- **Environment Promotion:** develop → staging → production dengan manual gates
- **Rollback Strategy:** Immediate rollback capability dengan previous image retention

### Monitoring & Observability

**Application Monitoring:**

- **Error Tracking:** Sentry dengan financial data anonymization
- **Performance Monitoring:** Custom dashboard dengan response time tracking
- **Business Metrics:** Custom financial KPIs tracking
- **User Behavior Analytics:** Mixpanel integration dengan funnel analysis

**Infrastructure Monitoring:**

- **Server Monitoring:** Prometheus + Grafana stack
- **Database Monitoring:** PostgreSQL performance monitoring dengan custom queries
- **Network Monitoring:** CloudFlare analytics dan custom monitoring
- **Resource Monitoring:** CPU, Memory, Disk usage tracking

**Alerting:**

- **Alert Manager:** Custom alert system dengan multiple channels
- **Notification Channels:** Email, Slack, SMS untuk critical issues
- **Escalation Policy:** Tiered alert escalation based on severity
- **Runbooks:** Automated response procedures untuk common issues

---

## 🔐 Security Implementation

### Authentication & Authorization

**Authentication Method:** Laravel Sanctum (Token-based authentication)

- **Implementation Details:** API tokens dengan expiration dan refresh capabilities
- **Multi-factor Authentication:** Email-based 2FA untuk sensitive operations
- **Session Management:** Secure session management dengan automatic timeout
- **Device Management:** Device tracking dan management untuk account security

**Authorization Model:** Role-based Access Control (RBAC)

- **Permissions System:** Granular permissions dengan resource-based control
- **Role Definitions:** Free User, Premium User, Admin, Super Admin
- **Access Control:** Middleware-based permission checking dengan rate limiting

### Security Measures

**Data Protection:**

- **Encryption at Rest:** PostgreSQL Transparent Data Encryption (TDE)
- **Encryption in Transit:** TLS 1.3 enforcement dengan Cloudflare
- **Sensitive Data:** Financial data encrypted dengan AES-256
- **Key Management:** Hardware security modules (HSM) planning

**API Security:**

- **Rate Limiting:** Sophisticated rate limiting dengan user-based tiers
- **Input Validation:** Comprehensive validation rules untuk financial data
- **SQL Injection Prevention:** Parameterized queries dengan Laravel ORM
- **XSS Protection:** Laravel's built-in XSS protection dengan CSP headers
- **CSRF Protection:** Token-based CSRF protection untuk state-changing operations

**Compliance:**

- **OJK Compliance:** Indonesian Financial Services Authority compliance
- **Data Privacy:** Indonesian Personal Data Protection Act compliance
- **Anti-Money Laundering:** Transaction monitoring dan reporting
- **Financial Regulations:** Banking secrecy laws compliance

---

## ⚡ Performance Optimization

### Application Performance

**Backend Optimizations:**

- **Database Optimization:** Advanced indexing, query optimization, connection pooling
- **Caching Strategy:** Multi-level caching dengan Redis invalidation
- **Queue System:** Laravel Queue untuk background financial calculations
- **API Performance:** Efficient serialization dan response optimization

**Frontend Optimizations:**

- **Bundle Optimization:** Turbopack bundling dengan advanced code splitting
- **Image Optimization:** Next.js Image optimization dengan adaptive loading
- **Performance Budget:** Lighthouse performance budget enforcement
- **Progressive Enhancement:** Core functionality available without JavaScript

### Monitoring & Metrics

**Key Performance Indicators:**

- **Response Time:** P50 < 200ms, P95 < 500ms, P99 < 2s
- **Throughput:** 1000+ requests/minute
- **Error Rate:** < 0.5% error rate
- **Resource Utilization:** CPU < 70%, Memory < 80%

**Performance Testing:**

- **Load Testing:** 100,000 concurrent users simulation
- **Stress Testing:** Peak load testing untuk payday scenarios
- **Database Performance:** Query optimization dengan EXPLAIN ANALYZE
- **Frontend Performance:** Lighthouse scores (>90) dan Core Web Vitals

---

## 🔧 Development Tools & Workflow

### Development Environment

**Local Development:**

- **IDE/Editor:** VS Code dengan extensive extension ecosystem
- **Version Control:** Git dengan GitHub dan pre-commit hooks
- **Database Management:** TablePlus (PostgreSQL client)
- **API Testing:** Postman collections dengan environments

**Code Quality:**

- **PHP Standards:** Laravel Pint (PHP CS Fixer) dengan PSR-12 compliance
- **TypeScript Standards:** ESLint dengan Prettier untuk consistent formatting
- **Static Analysis:** Larastan dengan PHPStan level 8
- **Testing Framework:** Pest untuk PHP, Jest untuk TypeScript

### Development Workflow

**Git Workflow:**

- **Branch Strategy:** Git Flow dengan feature branches dan release branches
- **Commit Convention:** Conventional Commits untuk automated changelog generation
- **Pull Request Process:** Automated checks + comprehensive manual review
- **Code Review Guidelines:** Security, performance, code quality checklists

**Continuous Integration:**

- **Build Pipeline:** Automated testing, code quality checks, security scans
- **Test Pipeline:** Unit tests, feature tests, integration tests, E2E tests
- **Quality Gates:** Code coverage > 90%, zero critical issues
- **Deployment Pipeline:** Automated deployment dengan comprehensive rollback procedures

---

## 📊 Third-party Integrations

### Payment Processing

**Primary Provider:** Midtrans

- **API Version:** v2.4
- **Features Used:** Credit cards, bank transfer, e-wallets (GoPay, OVO, DANA)
- **Implementation:** Server-side integration dengan webhook handling untuk premium subscriptions
- **Security:** PCI DSS compliance considerations

### Financial Data APIs

**Bank Integration:** (Planned for Phase 2)

- **Providers:** Mandiri, BCA, BNI APIs
- **Features:** Account aggregation, transaction synchronization
- **Compliance:** OJK approval required, data privacy compliance
- **Implementation:** API-based dengan secure data transmission

**Investment Platforms:** (Planned for Phase 2)

- **Providers:** Bareksa, Bibit, Mirae Asset Management
- **Features:** Portfolio aggregation, performance data, automated investing
- **Compliance:** Investment advisor regulations compliance
- **Implementation:** Partnership agreements dengan API access

### Communication Services

**Email Service:** SendGrid

- **Templates:** Financial notifications, subscription receipts, educational content
- **Delivery Tracking:** Event webhooks untuk bounce dan delivery optimization
- **Compliance:** Email marketing regulations compliance

### Analytics & Monitoring

**Analytics Platform:** Google Analytics 4 + Mixpanel

- **Features:** User journey tracking, funnel analysis, behavioral insights
- **Privacy:** Data anonymization untuk sensitive financial information
- **Compliance:** Data privacy regulations compliance

---

## 🚀 Scaling Strategy

### Current Scalability

**Vertical Scaling:**

- **Current Capacity:** 1,000 concurrent users, 2 CPU cores, 8GB RAM
- **Scaling Triggers:** CPU > 80%, Memory > 85%, Response time > 2s
- **Auto-scaling:** Planned horizontal scaling dengan Kubernetes

**Database Performance:**

- **Connection Pooling:** 20 max connections, 5 idle connections
- **Query Optimization:** Advanced indexing dan query optimization
- **Read Replicas:** Planned untuk reporting dan analytics queries

### Future Scaling Plans

**Short-term (6 months):**

- [ ] **Database Optimization:** Read replica setup untuk reporting queries
- [ ] **Caching Enhancement:** Redis clustering implementation
- [ ] **API Optimization:** GraphQL implementation untuk efficient data fetching

**Medium-term (1+ year):**

- [ ] **Microservices Migration:** Financial calculation services sebagai separate service
- [ ] **Database Sharding:** Multi-tenant data separation
- [ ] **Event Streaming:** Apache Kafka untuk real-time financial processing

---

## 📝 Maintenance & Operations

### Regular Maintenance

**Database Maintenance:**

- **Backup Schedule:** Daily automated backups dengan encrypted storage
- **Index Rebuilding:** Monthly maintenance window untuk performance optimization
- **Vacuum/Analyze:** Automated PostgreSQL maintenance procedures
- **Performance Tuning:** Monthly performance reviews dan optimizations

**Application Maintenance:**

- **Dependency Updates:** Weekly security patch updates
- **Security Audits:** Quarterly security assessments
- **Performance Monitoring:** Daily monitoring dengan alerting
- **Compliance Reviews:** Monthly regulatory compliance checks

### Operational Procedures

**Incident Response:**

- **Severity Levels:** P1 (Critical), P2 (High), P3 (Medium), P4 (Low)
- **Response Team:** On-call engineers dengan specialized roles
- **Communication Plan:** Stakeholder notifications dengan predefined templates
- **Post-mortem Process:** Root cause analysis dengan preventive measures

---

## 🔮 Technology Roadmap

### Planned Upgrades

**Next 3 Months:**

- [ ] **PHP 8.3:** Latest features dengan performance improvements
- [ ] **Laravel 11:** Latest framework features dengan compatibility testing
- [ ] **Next.js 15:** Latest features dengan improved performance
- [ ] **PostgreSQL 16:** Latest database features dan improvements

**Next 6 Months:**

- [ ] **GraphQL Implementation:** API efficiency dan flexible data fetching
- [ ] **Redis Cluster:** Enhanced caching system untuk scalability
- [ ] **Kubernetes Migration:** Container orchestration untuk auto-scaling

### Technology Debt

**Current Technical Debt:**

- **High Priority:** Legacy financial calculation algorithms
- **Medium Priority:** API response optimization
- **Low Priority:** UI component library standardization

**Refactoring Plans:**

- **Service Layer Enhancement:** Better abstraction untuk financial logic
- **API Versioning:** Proper versioning strategy untuk backward compatibility
- **Testing Enhancement:** E2E test coverage untuk critical user journeys

---

## 🏛️ Compliance & Regulatory

### Financial Services Compliance

**OJK (Otoritas Jasa Keuangan) Compliance:**

- **Financial Advisory Regulations:** Proper licensing dan qualification requirements
- **Data Security:** Financial data protection dan security standards
- **Reporting Requirements:** Regulatory reporting automation
- **Risk Management:** Risk assessment dan mitigation procedures

### Data Privacy

**Indonesian PDPA Compliance:**

- **Data Minimization:** Collect hanya necessary financial information
- **Consent Management:** Explicit consent untuk data processing dan analytics
- **Data Portability:** Export functionality untuk user financial data
- **Right to Deletion:** GDPR-style deletion capabilities dengan data retention policies

### Security Standards

**Financial Industry Security:**

- **ISO 27001:** Information security management system
- **PCI DSS:** Payment Card Industry Data Security Standard
- **SOC 2:** System and Organization Controls for service organizations
- **Banking Secrecy:** Indonesian banking secrecy law compliance

---

**Last Updated:** 2024-12-01
**Tech Lead:** Anggarin Development Team
**Review Date:** 2025-01-01
