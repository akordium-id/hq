# ⚙️ Klustera.id - Technical Architecture

> Technical stack, architecture decisions, dan infrastructure untuk Klustera.id

## 🏗️ Architecture Overview

Klustera.id follows a **multi-tenant SaaS architecture** using the **TALL stack** (Tailwind, Alpine.js, Laravel, Livewire) dengan PostgreSQL database and Oracle Cloud infrastructure.

### Architectural Principles

1. **Multi-Tenancy First:** Data isolation between complexes (tenants) is critical
2. **Mobile-Ready:** Responsive web + native mobile apps untuk operational staff
3. **Offline-First:** Mobile apps work without internet, sync when connected
4. **Real-Time:** Livewire polling for real-time updates (dashboard, notifications)
5. **Security:** Role-based access control, encrypted data, audit trails
6. **Scalability:** Horizontal scaling via load balancer, database read replicas
7. **Observability:** Comprehensive logging, monitoring, error tracking

---

## 🎨 Frontend Architecture

### Web Application (Resident & Admin Portal)

**Framework:** Laravel Blade dengan Livewire 3

**Component Library:**
- **FluxUI** (Primary): Official Livewire component library
- **Custom Tailwind Components**: For complex UI patterns not in FluxUI

**Styling:**
- **Tailwind CSS 3**: Utility-first CSS framework
- **Alpine.js**: Lightweight JavaScript framework untuk interactive components
- **Custom CSS**: Minimal, only untuk specific needs

**State Management:**
- **Livewire**: Server-side state management (automatic)
- **Alpine.js**: Client-side state untuk small interactions (dropdowns, modals)
- **Database**: Single source of truth (no client-side state duplication)

**Key Libraries:**
- **Alpine.js**: @alpinejs/~3.x
- **Livewire**: Livewire v3
- **FluxUI**: Flux UI (latest)
- **Chart.js atau ApexCharts**: Data visualization

---

### Mobile Applications (Operational Staff)

**Framework:** Flutter (preferred) atau React Native (alternative)

**Decision Criteria:**
- **Flutter** if: Team prefers Dart, want single codebase iOS/Android, better performance
- **React Native** if: Team already knows JavaScript/React, want to reuse web code

**Architecture Pattern:**
- **BLoC (Business Logic Component)** if Flutter
- **Redux Toolkit** if React Native

**Key Features:**
- **Offline-First:** SQLite local database, sync when internet available
- **Background Sync:** Upload cached data when connection restored
- **Push Notifications:** Firebase Cloud Messaging (FCM)
- **Biometric Auth:** Fingerprint/Face ID login

**Libraries:**
- **HTTP:** Dio (Flutter) atau Axios (React Native)
- **Local DB:** SQLite (flutter_sqlite atau react-native-sqlite-storage)
- **State:** Provider/Riverpod (Flutter) atau Redux (React Native)
- **Maps:** Google Maps SDK
- **Camera:** Camera package (flutter_camera atau react-native-camera)

---

## 🖥️ Backend Architecture

### Framework: Laravel 10+

**Language:** PHP 8.2+

**Key Packages:**

1. **Multi-Tenancy:**
   - `stancl/tenancy` (recommended) atau `tenancy/tenancy`
   - Database-per-tenant strategy (best isolation)
   - Tenant identification via subdomain (klustera.id/complex-slug) atau custom domain

2. **Authentication & Authorization:**
   - `laravel/sanctum`: API tokens untuk mobile apps
   - `spatie/laravel-permission`: Role-based access control
   - Roles: Admin, Resident, Staff, Security, Cleaning, Facility

3. **Queues & Jobs:**
   - `laravel/horizon`: Queue monitoring (Redis)
   - Jobs: Invoice generation, WhatsApp notifications, PDF generation
   - Queues: billing, notifications, email, sms

4. **Media & File Storage:**
   - `spatie/laravel-medialibrary`: Media management (photos, documents)
   - Storage: Cloudflare R2 (S3-compatible) atau Oracle Object Storage

5. **PDF Generation:**
   - `barryvdh/laravel-dompdf`: PDF invoice generation
   - Templates: Blade views dengan custom styling

---

### Database Design

**Database:** PostgreSQL 15+

**Multi-Tenancy Strategy:** Database-per-tenant

**Schema Design:**

```sql
-- Tenant Database (klustera_main)
CREATE TABLE tenants (
    id BIGINT PRIMARY KEY,
    name VARCHAR(255),
    slug VARCHAR(255) UNIQUE, -- URL subdomain
    database_name VARCHAR(255), -- Tenant database name
    plan ENUM('free', 'standard', 'enterprise'),
    max_units INT,
    status ENUM('active', 'suspended', 'cancelled'),
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

-- Tenant-Specific Database (klustera_tenant_{tenant_id})
CREATE TABLE units (
    id BIGINT PRIMARY KEY,
    unit_number VARCHAR(50),
    building VARCHAR(100),
    floor INT,
    type ENUM('studio', '1BR', '2BR', '3BR', 'house'),
    ownership_status ENUM('owned', 'rented'),
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE residents (
    id BIGINT PRIMARY KEY,
    unit_id BIGINT REFERENCES units(id),
    name VARCHAR(255),
    phone VARCHAR(20) UNIQUE,
    email VARCHAR(255),
    is_owner BOOLEAN DEFAULT TRUE,
    status ENUM('active', 'inactive', 'moved_out'),
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE invoices (
    id BIGINT PRIMARY KEY,
    resident_id BIGINT REFERENCES residents(id),
    invoice_number VARCHAR(50) UNIQUE,
    billing_cycle_start DATE,
    billing_cycle_end DATE,
    total_amount DECIMAL(12, 2),
    status ENUM('pending', 'paid', 'overdue', 'cancelled'),
    due_date DATE,
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE payments (
    id BIGINT PRIMARY KEY,
    invoice_id BIGINT REFERENCES invoices(id),
    payment_method VARCHAR(50), -- Xendit: QRIS, VA, EWALLET
    amount DECIMAL(12, 2),
    transaction_id VARCHAR(255),
    status ENUM('pending', 'completed', 'failed', 'refunded'),
    paid_at TIMESTAMP,
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE access_logs (
    id BIGINT PRIMARY KEY,
    resident_id BIGINT REFERENCES residents(id) NULL, -- NULL for guests
    type ENUM('resident_entry', 'guest_entry', 'staff_entry', 'exit'),
    entry_method ENUM('qr_code', 'guest_code', 'manual'),
    timestamp TIMESTAMP,
    guard_on_duty VARCHAR(255),
    created_at TIMESTAMP
);

-- Other tables: announcements, guests, complaints, facilities, bookings, tasks, etc.
```

**Key Design Decisions:**
- **Foreign Keys:** Enforced referential integrity
- **Indexes:** Strategic indexes pada frequently queried columns (tenant_id, resident_id, dates)
- **Soft Deletes:** Use deleted_at untuk audit trail, not hard deletes
- **Timestamps:** created_at, updated_at on all tables
- **UUIDs:** Consider UUIDs untuk sensitive data (invoices, payments) instead of auto-increment

---

### API Design

**RESTful API Standards:**

**Base URL:** `https://api.klustera.id/v1`

**Authentication:**
- Bearer token (Laravel Sanctum)
- Token refresh rotation
- Token expiration: 30 days (mobile apps)

**Rate Limiting:**
- 100 requests per minute per IP
- 1000 requests per hour per authenticated user
- Throttle:60,1 untuk public endpoints

**API Endpoints (Examples):**

```
# Authentication
POST   /api/v1/auth/register
POST   /api/v1/auth/login
POST   /api/v1/auth/logout
POST   /api/v1/auth/refresh

# Invoices (Resident)
GET    /api/v1/invoices
GET    /api/v1/invoices/{id}
POST   /api/v1/invoices/{id}/pay

# Invoices (Property Manager)
GET    /api/v1/admin/invoices
POST   /api/v1/admin/invoices
PUT    /api/v1/admin/invoices/{id}

# Announcements
GET    /api/v1/announcements
POST   /api/v1/admin/announcements

# Access Control
POST   /api/v1/access-codes/generate
POST   /api/v1/guests/register
POST   /api/v1/access/verify

# Complaints
GET    /api/v1/complaints
POST   /api/v1/complaints
PATCH  /api/v1/complaints/{id}/status

# Facilities
GET    /api/v1/facilities
POST   /api/v1/facilities/{id}/bookings

# Mobile Staff APIs
GET    /api/v1/staff/tasks
PATCH  /api/v1/staff/tasks/{id}/complete
POST   /api/v1/staff/patrol/checkpoints
```

**Response Format:**

```json
{
    "success": true,
    "data": { ... },
    "message": "Operation successful",
    "meta": {
        "page": 1,
        "per_page": 20,
        "total": 150
    }
}
```

**Error Handling:**

```json
{
    "success": false,
    "error": {
        "code": "VALIDATION_ERROR",
        "message": "The given data was invalid.",
        "details": {
            "phone_number": ["The phone number field is required."]
        }
    }
}
```

---

## 🔒 Security Architecture

### Authentication & Authorization

**Authentication Methods:**
1. **Web (Admin/Resident):** Laravel session-based auth
2. **Mobile Apps:** Laravel Sanctum tokens (Bearer tokens)
3. **API Clients:** API keys dengan rate limiting

**Role-Based Access Control (RBAC):**

| Role | Permissions |
|------|-------------|
| **Super Admin** | Full access, tenant management |
| **Property Manager** | Manage single complex: invoices, residents, announcements, reports |
| **Resident** | View own invoices, submit complaints, book facilities, voting |
| **Security Staff** | Guard mode, access logs, patrol tracking, incident reports |
| **Cleaning Staff** | View assigned tasks, mark complete, upload photos |
| **Facility Staff** | View assigned tickets, update status, upload photos |

**Implementation:**
- `spatie/laravel-permission` package
- Middleware: `role:admin`, `role:resident`, etc.
- Policies: InvoicePolicy, ComplaintPolicy, etc.

---

### Multi-Tenant Data Isolation

**Strategy:** Database-per-tenant

**Implementation:**
- Each tenant gets dedicated PostgreSQL database
- Tenant identification via:
  - **Primary:** Subdomain (e.g., `graha-indah.klustera.id`)
  - **Secondary:** Custom domain (e.g., `graha-indah.co.id`)
  - **Fallback:** Path parameter (e.g., `klustera.id/complex/graha-indah`)

**Security Measures:**
- Tenant ID validated on every request
- Database connection switched based on tenant (middleware)
- Cross-tenant queries blocked (validation layer)
- Audit logs untuk all cross-tenant access attempts

---

### Data Encryption

**At Rest:**
- PostgreSQL transparent data encryption (TDE)
- Encrypted backups
- Sensitive fields encrypted using Laravel encryption:
  - `access_codes.code` (AES-256)
  - `confirmation_codes.code` (AES-256)

**In Transit:**
- TLS 1.3 for all connections (HTTPS)
- Certificate managed via Cloudflare SSL

**API Security:**
- Request signing untuk Xendit webhooks (HMAC signature)
- SQL injection prevention (Eloquent ORM)
- XSS prevention (Blade {{ }} escaping)
- CSRF protection (all POST/PUT/DELETE forms)

---

### Privacy & Compliance (PDPA)

**Data Collection:**
- Explicit consent saat registration
- Minimal data collection (only what's necessary)
- Data retention policy: 5 years untuk financial records, 1 year untuk operational data

**User Rights:**
- Right to access: Download all personal data
- Right to correction: Update personal info
- Right to deletion: Account deletion dengan data anonymization
- Right to portability: Export data in standard format (JSON, CSV)

**Implementation:**
- `gdpr_consent` table (track consent versioning)
- Soft deletes (anonymize data, don't hard delete)
- Data export endpoint (ZIP file dengan JSON + documents)

---

## 🚀 Deployment Architecture

### Infrastructure: Oracle Cloud Infrastructure (OCI)

**Compute:**
- **App Servers:** Oracle Linux 8, 2 vCPU, 4GB RAM (VM.Standard.E2.1)
- **Worker Servers:** Oracle Linux 8, 2 vCPU, 4GB RAM (for queues)
- **Load Balancer:** OCI Load Balancer (public)

**Database:**
- **PostgreSQL:** OCI Managed PostgreSQL (Flex Architecture)
- **Redis:** OCI Redis (Cache & Queue)
- **Storage:** OCI Object Storage (S3-compatible)

**Network:**
- **VCN (Virtual Cloud Network):** 10.0.0.0/16
- **Subnets:** Public subnet (load balancer), Private subnet (app, db)
- **Security Lists:** Firewall rules (only allow 80, 443 from LB, SSH from bastion)

---

### Deployment Strategy: Coolify (PaaS)

**Environments:**
- **Development:** Local (Docker Compose)
- **Staging:** Coolify (auto-deploy dari branch `develop`)
- **Production:** Coolify (auto-deploy dari branch `main`)

**CI/CD Pipeline:**

```yaml
# .github/workflows/deploy.yml
name: Deploy to Production

on:
  push:
    branches: [main]

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3

      - name: Setup PHP
        uses: shivammathur/setup-php@v2
        with:
          php-version: '8.2'

      - name: Install Dependencies
        run: composer install --no-dev

      - name: Build Assets
        run: npm run build

      - name: Deploy to Coolify
        run: |
          curl -X POST $COOLIFY_WEBHOOK_URL
        env:
          COOLIFY_WEBHOOK_URL: ${{ secrets.COOLIFY_WEBHOOK }}
```

**Coolify Configuration:**
- **Repository:** GitHub private
- **Build Pack:** PHP (Laravel)
- **Environment:** Production variables (DB, Xendit, etc.)
- **Zero-Downtime:** Deploy dengan symlink switching

---

### Scalability Strategy

**Horizontal Scaling:**

1. **App Servers:**
   - Start: 1 server (handles 1000 concurrent users)
   - Scale: Add servers based on CPU > 70% (auto-scaling)
   - Load balancer: Round-robin algorithm

2. **Worker Servers:**
   - Start: 1 worker (processes queues)
   - Scale: Add workers based on queue length > 1000

3. **Database:**
   - Start: Single instance (2000 connections max)
   - Scale: Read replicas untuk reporting queries
   - Future: Sharding by tenant (if > 1000 tenants)

**Caching Strategy:**
- **Redis:** Cache frequently accessed data (dashboard metrics, announcements)
- **CDN:** Cloudflare untuk static assets (CSS, JS, images)
- **HTTP Cache:** Cache-Control headers untuk public pages

**Performance Optimization:**
- **Database Indexing:** Strategic indexes pada foreign keys, dates
- **Query Optimization:** Eager loading (avoid N+1 queries), select only needed columns
- **Lazy Loading:** Load large datasets di background (pagination, infinite scroll)
- **Queue Heavy Operations:** Invoice generation, PDF generation, notifications

---

## 📊 Monitoring & Observability

### Logging

**Application Logs:**
- **Channel:** Daily rotating log files (`storage/logs/laravel.log`)
- **Level:** Debug (dev), Info (staging), Warning (production)
- **Format:** JSON untuk structured logging

**Key Events to Log:**
- All financial transactions (invoices, payments, refunds)
- Access control events (guest entries, exits, failed attempts)
- Authentication events (logins, logouts, failed attempts)
- Admin actions (changes to critical data)
- API errors (5xx errors, validation failures)

**Log Retention:**
- Application logs: 30 days
- Audit logs: 5 years (for compliance)
- Financial logs: 7 years (for tax compliance)

---

### Monitoring

**Metrics to Track:**

1. **Business Metrics:**
   - Active tenants (complexes)
   - Total units managed
   - Monthly Recurring Revenue (MRR)
   - Collection rate
   - User engagement (DAU, MAU)

2. **Application Metrics:**
   - Response time (p50, p95, p99)
   - Request rate (requests per second)
   - Error rate (5xx errors)
   - Queue depth (jobs pending)
   - Database connection pool usage

3. **Infrastructure Metrics:**
   - CPU usage
   - Memory usage
   - Disk I/O
   - Network I/O
   - Database connections

**Monitoring Tools:**
- **Laravel Telescope:** Debugging toolbar untuk development
- **Custom Dashboard:** Build admin dashboard untuk metrics
- **Uptime Monitoring:** Cloudflare Uptime Checks (ping every 1 minute)
- **Error Tracking:** Custom error logging + Slack notifications

---

### Alerting

**Alert Rules:**

1. **Critical (PagerDuty-style immediate alert):**
   - Down time > 5 minutes (uptime check fails)
   - Error rate > 5% (5xx errors)
   - Payment webhook failures > 10% (Xendit integration down)

2. **Warning (Email within 15 minutes):**
   - Response time p95 > 2 seconds
   - Queue depth > 1000 jobs
   - Database CPU > 80%

3. **Info (Daily digest):**
   - New tenant signups
   - Churn (tenant cancellations)
   - Weekly summary report

**Alert Channels:**
- **Slack:** #klustera-alerts channel
- **Email:** on-call@akordium.id
- **SMS:** Untuk critical alerts (via Twilio)

---

## 🧪 Testing Strategy

### Test Pyramid

```
        /\
       /E2E\        5% - Critical user journeys
      /------\
     /Browser\      10% - Laravel Dusk tests
    /----------\
   /Integration\   25% - API tests, database tests
  /--------------\
 /   Unit Tests  \ 60% - Model, Service, Repository
/----------------\
```

### Test Coverage

**Target:** 85% code coverage

**Tools:**
- **PHPUnit/Pest:** Unit & feature tests
- **Laravel Dusk:** Browser tests (critical journeys)
- **Mocking:** Mock Xendit API, WhatsApp gateway

### Test Types

1. **Unit Tests:**
   - Models: Relationships, scopes, accessors
   - Services: Business logic (invoice calculation, fee allocation)
   - Helpers: Format functions, validation rules

2. **Feature Tests:**
   - Authentication flows (login, registration)
   - Invoice generation & payment
   - Complaint submission & resolution
   - Facility booking workflow
   - Multi-tenant data isolation

3. **Browser Tests (Laravel Dusk):**
   - Resident login → View invoice → Pay via Xendit
   - Property manager → Create announcement → Verify WhatsApp sent
   - Security guard → Verify guest code → Log entry

---

## 🔄 Backup & Disaster Recovery

### Backup Strategy

**Database Backups:**
- **Frequency:** Daily automated backups
- **Retention:** 7 daily, 4 weekly, 3 monthly
- **Location:** OCI Object Storage (separate region)
- **Encryption:** Encrypted at rest

**Application Backups:**
- **Frequency:** Before each deployment
- **Content:** Source code, environment files, SSL certificates
- **Location:** GitHub (code), OCI Vault (secrets)

**File Storage Backups:**
- **Frequency:** Continuous (Cross-region replication)
- **Content:** User uploads (photos, documents)
- **Location:** OCI Object Storage (secondary region)

---

### Disaster Recovery Plan

**RTO (Recovery Time Objective):** 4 hours
**RPO (Recovery Point Objective):** 24 hours

**Scenarios:**

1. **Server Failure:**
   - Auto-scale: Spin up new server (5 minutes)
   - Restore: Load backup database (30 minutes)
   - DNS update: Point to new server (5 minutes)

2. **Database Failure:**
   - Failover: Promote read replica to primary (10 minutes)
   - Restore: From latest backup (1 hour)
   - Replay: Transaction logs (1 hour)

3. **Region Failure:**
   - Activate: Secondary region (manual trigger)
   - DNS update: Point to secondary region (5 minutes)
   - Data: Restore from cross-region backup (2 hours)

---

## 📚 Development Workflow

### Git Workflow

**Branch Strategy:**
- `main` - Production code (protected)
- `develop` - Staging code
- `feature/*` - Feature branches
- `hotfix/*` - Emergency fixes

**Commit Conventions:**
- Follow Conventional Commits
- Types: `feat:`, `fix:`, `docs:`, `refactor:`, `test:`
- Example: `feat(billing): add Xendit QRIS payment integration`

**Pull Request Process:**
1. Create feature branch dari `develop`
2. Implement feature + tests
3. Create PR to `develop`
4. Code review by team lead
5. CI checks pass (tests, linting)
6. Squash & merge to `develop`

---

### Code Quality Standards

**PHP Standards:**
- **PSR-12:** Coding style
- **Type Hints:** Strict types untuk all functions
- **DocBlocks:** PHPDoc untuk all public methods

**JavaScript Standards:**
- **ESLint:** Linting rules
- **Prettier:** Code formatting

**Tools:**
- **Laravel Pint:** Auto-formatting PHP
- **PHPStan:** Static analysis (level 5)
- **Laravel IDE Helper:** Generate IDE helper files

---

**Last Updated:** 2026-01-06
**Version:** 1.0.0-concept
**Maintainer:** Development Team
