# Repository Guidelines

**Repository:** Akordium Lab HQ (akordium-id/hq)  
**Type:** Documentation Repository (Single Source of Truth)  
**Last Updated:** 2025-03-05

---

## Project Overview

Akordium Lab HQ is the central documentation repository for Akordium Lab, an Indonesian web & app development services company. This repository serves as the **Single Source of Truth (SSOT)** for all operational, managerial, and technical standards.

**Business Focus:** Web & app development services and consulting  
**Core Strategy:** PHP-to-Go migration and MySQL-to-PostgreSQL conversion  
**Team Structure:** Backend-focused with Go as primary language, PHP experience required for legacy systems

**Active Products (4):**
- **WaqfWise** - Islamic endowment management (TALL stack: Tailwind, Alpine.js, Laravel, Livewire)
- **Anggarin** - Personal finance planning (Laravel API + Next.js)
- **Atribuo** - Real-life RPG skill visualization (Go + Next.js)
- **SnapKasir** - Point of sale system (Go + Next.js)

**Additional Products (16):** Neurova, Klustera, Katauser, Guestron, Sesarra, Nanabung, Namerics, KoalaMail, BibiDiskon, DukunGPS, Classnetic, CaptionMania, LayanganLegacy, ExcelCircle, AkarKita (all in ideation phase)

---

## Architecture & Data Flow

### Repository Structure

The repository follows a **flat numbered hierarchy** (00-11) representing major functional areas:

```
hq/
├── 00-Onboarding/          # New hire documentation and setup
├── 01-SOP/                 # Standard Operating Procedures
├── 02-Tech-Docs/           # Technical documentation and coding standards
├── 03-Produk/              # Product specifications and requirements
├── 04-Marketing-Brand/     # Marketing assets and brand guidelines
├── 05-Finance-Admin/       # Legal and administrative templates
├── 06-Legal-Compliance/    # Template kontrak, kebijakan privasi
├── 07-HR-People/           # Proses rekrutmen, interview questions
├── 08-Project-Management/  # Template kick-off project, estimasi
├── 09-Knowledge-Base/      # Teknologi radar, learning resources
├── 10-Automation/          # GitHub Actions library, CI/CD pipeline
├── 11-Content-Strategy/    # Framework untuk membuat 100+ konten
├── .github/                # GitHub templates (Issues, PRs)
├── .serena/                # AI code assistant configuration
├── .beads/                 # AI-native issue tracking
├── README.md               # Main repository overview
├── CLAUDE.md               # AI assistant guidance
├── CONTRIBUTING.md         # Contribution guidelines
├── CHANGELOG.md            # Version history
└── AGENTS.md               # This file
```

### Documentation Flow

1. **Standards Defined** → `/02-Tech-Docs/` (coding standards, architecture patterns)
2. **Procedures Established** → `/01-SOP/` (workflows, code review, deployment)
3. **Products Specified** → `/03-Produk/` (product specs, design systems)
4. **Automation Implemented** → `/10-Automation/` (GitHub Actions, CI/CD templates)
5. **Knowledge Captured** → `/09-Knowledge-Base/` (learning resources, research)

---

## Key Directories

### `/00-Onboarding/`
New hire documentation and developer setup instructions  
**Key Files:**
- `02-setup-akses.md` - Developer setup instructions
- Onboarding checklists and team introduction materials

### `/01-SOP/`
Standard Operating Procedures for all operational workflows  
**Key Files:**
- `workflow-git.md` - Git workflow with feature branch strategy
- `code-review.md` - Code review process with checklists
- `manajemen-tugas.md` - Project management using GitHub Projects
- `komunikasi.md` - Async-first communication ethics
- `client-communication.md` - Client communication standards and templates
- `meeting-guidelines.md` - Meeting best practices (async-first)
- `security-practices.md` - Comprehensive security practices
- `deployment-checklist.md` - Deployment procedures and rollback
- `incident-response.md` - Incident response SOP
- `time-off-request.md` - Leave management procedures
- `workflow-beads-cross-device.md` - Cross-device task synchronization

### `/02-Tech-Docs/`
Technical documentation and coding standards  
**Key Files:**
- `stack-conventions.md` - Core coding standards (Go, PHP, TypeScript)
- `database-conventions.md` - PostgreSQL standards and migration strategy
- `testing-strategy.md` - Testing methodology (unit, integration, E2E)
- `architecture-overview.md` - High-level architecture patterns
- `api-design-guidelines.md` - RESTful API standards
- `coolify-deployment.md` - Coolify PaaS deployment procedures
- `environments.md` - Environment management (dev, staging, prod)
- `monitoring-logging.md` - Monitoring stack (Prometheus/Grafana)
- `backup-recovery.md` - Backup strategies and disaster recovery
- `performance-guidelines.md` - Performance optimization guidelines
- `server-oracle-setup.md` - Oracle Cloud Infrastructure setup
- `third-party-services.md` - Third-party service integrations
- `adr/` - Architecture Decision Records

### `/03-Produk/`
Product specifications and design systems  
**Structure:**
- `index.md` - Product portfolio overview (4 active products)
- `README.md` - All 19 product ideas with prioritization
- `_templates/` - Master design system templates
- `[Product-Name]/` - Individual product directories
  - `design-system.md` - Product-specific design system
  - `product-spec.md` - Technical specifications

**Active Products:**
- `WaqfWise/` - Islamic endowment management (TALL stack)
- `Anggarin/` - Personal finance planning (Laravel + Next.js)
- `Atribuo/` - Real-life RPG skill visualization (Go + Next.js)
- `SnapKasir/` - Point of sale system (Go + Next.js)

### `/10-Automation/`
CI/CD automation templates and documentation  
**Key Files:**
- `CI-CD-setup.md` - Comprehensive CI/CD pipeline documentation
- `github-actions-library/README.md` - Reusable GitHub Actions documentation
- `github-actions-library/setup-go-env/action.yml` - Go environment setup action
- `scripts/health-check.sh` - Health monitoring script
- `scripts/setup-go-env.sh` - Go development environment setup

---

## Development Commands

### Git Workflow

```bash
# Sync dengan main terlebih dahulu
git checkout main
git pull upstream main

# Buat branch baru (menggunakan format tipe/deskripsi)
git checkout -b feat/login-page
git checkout -b fix/header-mobile
git checkout -b docs/update-sop
git checkout -b refactor/clean-code

# Commit dengan Conventional Commits format
git add .
git commit -m "feat: add whatsapp floating button on homepage"
git commit -m "fix: resolve login error on safari browser"
git commit -m "docs: update onboarding guide for new staff"

# Push dan buat Pull Request
git push origin feat/login-page
```

### Branch Naming Convention

- `feat/` - Fitur baru atau improvement
- `fix/` - Bug fix atau perbaikan
- `docs/` - Perubahan dokumentasi
- `refactor/` - Refactoring kode atau dokumentasi
- `chore/` - Maintenance, update minor

### Commit Message Format

```bash
# Format: type: deskripsi singkat apa yang dilakukan
feat: add whatsapp floating button on homepage
fix: resolve login error on safari browser
docs: update onboarding guide for new staff
```

**Conventional Commit Types:**
- `feat` - Fitur atau improvement baru
- `fix` - Bug fix atau koreksi
- `docs` - Perubahan dokumentasi
- `style` - Formatting, whitespace, semicolon changes
- `refactor` - Refactoring kode atau dokumentasi
- `chore` - Maintenance tasks, dependency updates

---

## Code Conventions & Common Patterns

### Language Requirements

**English for:**
- Variable names
- Function names
- Code comments
- Technical documentation

**Indonesian for:**
- User-facing documentation
- UI text and labels
- Internal company communications

### Go Standards

**Project Structure:**
```
project/
├── cmd/
│   └── app/
│       └── main.go
├── internal/
│   ├── handler/
│   ├── service/
│   ├── repository/
│   └── model/
├── pkg/
│   └── utils/
├── go.mod
├── go.sum
├── Makefile
├── .env.example
└── README.md
```

**Naming Conventions:**
- **Package names:** `lowercase`, single word when possible
- **Constants:** `UPPER_SNAKE_CASE` or `CamelCase` if exported
- **Variables:** `camelCase` for local, `PascalCase` if exported
- **Interfaces:** `PascalCase` with `-er` suffix when possible (e.g., `Reader`, `Writer`)
- **Functions:** `PascalCase` if exported, `camelCase` if private

**Key Patterns:**
- Always use dependency injection for services
- Use context.Context for all operations that may timeout or cancel
- Use structured logging (e.g., `slog`, `zap`)
- Handle errors explicitly; never ignore them
- Use `go fmt` for formatting

### PHP/Laravel Standards

**Service Classes/Actions:**
- Business logic belongs in Service Classes or Action classes
- Controllers should be thin - delegate to Services
- Use Type Hints mandatory
- Follow PSR-12 coding standards

**Naming Conventions:**
- **Classes:** `PascalCase`
- **Methods:** `camelCase`
- **Variables:** `snake_case` or `camelCase` (be consistent)
- **Constants:** `UPPER_SNAKE_CASE`

### TypeScript/Next.js Standards

**Strict Mode:**
- Always use strict TypeScript mode
- Avoid `any` type - use `unknown` if truly unknown
- Use interfaces for public APIs, types for internal
- Enable `noUncheckedIndexedAccess` for safer array/object access

**Naming Conventions:**
- **Components:** `PascalCase`
- **Functions:** `camelCase`
- **Types/Interfaces:** `PascalCase`
- **Constants:** `UPPER_SNAKE_CASE` for global constants

**Key Patterns:**
- Use functional components with hooks
- Prefer composition over inheritance
- Use server components by default (Next.js 13+)
- Co-locate related code (components, hooks, types)

### Database Conventions

**Naming Standards:**
- **Tables:** `snake_case`, plural (e.g., `users`, `order_items`)
- **Columns:** `snake_case` (e.g., `created_at`, `user_id`)
- **Primary Keys:** `id` (integer/bigint) or `uuid`
- **Foreign Keys:** `{table}_id` (e.g., `user_id`, `order_id`)
- **Indexes:** `idx_{table}_{columns}` (e.g., `idx_users_email`)
- **Unique constraints:** `uq_{table}_{columns}` (e.g., `uq_users_email`)
- **Foreign key constraints:** `fk_{table}_{referenced_table}` (e.g., `fk_orders_users`)

**Migration Strategy:**
- PostgreSQL is the standard (migrating from MySQL)
- Use migration files for all schema changes
- Never modify existing migrations - create new ones
- Always include rollback in migrations
- Test migrations in staging before production

---

## Important Files

### Root Level

- **`README.md`** - Main repository overview with navigation and contacts
- **`CLAUDE.md`** - AI assistant guidance for working with this repository
- **`CONTRIBUTING.md`** - Comprehensive contribution guidelines (web and Git workflows)
- **`CHANGELOG.md`** - Version history tracking major documentation changes
- **`AGENTS.md`** - This file - repository guidelines for AI assistants

### Configuration Files

- **`.serena/project.yml`** - Serena AI code assistant configuration
- **`.beads/README.md`** - Beads AI-native issue tracking documentation
- **`.github/`** - GitHub templates (Issues, PRs, Workflows)

### Technical Documentation

- **`02-Tech-Docs/stack-conventions.md`** - Core coding standards and technology conventions
- **`02-Tech-Docs/database-conventions.md`** - PostgreSQL standards and migration strategy
- **`02-Tech-Docs/testing-strategy.md`** - Testing methodology
- **`02-Tech-Docs/architecture-overview.md`** - High-level architecture patterns
- **`02-Tech-Docs/api-design-guidelines.md`** - RESTful API standards
- **`02-Tech-Docs/coolify-deployment.md`** - Coolify PaaS deployment procedures

### SOP Documentation

- **`01-SOP/workflow-git.md`** - Git workflow and branching strategy
- **`01-SOP/code-review.md`** - Code review process and checklists
- **`01-SOP/manajemen-tugas.md`** - Project management using GitHub Projects
- **`01-SOP/komunikasi.md`** - Async-first communication ethics
- **`01-SOP/deployment-checklist.md`** - Deployment procedures and rollback

---

## Runtime/Tooling Preferences

### Core Technologies

**Backend:**
- **Go 1.21+** (primary, standard for all new projects)
- **Laravel/PHP 8+** (legacy systems, migration target)

**Frontend:**
- **Next.js 13+** (App Router preferred)
- **React 18+** (TypeScript required)
- **TailwindCSS** (utility-first CSS)

**Database:**
- **PostgreSQL 14+** (primary, migrating from MySQL)
- **MySQL 8** (legacy, migration target)

**Infrastructure:**
- **Oracle Cloud** (cloud provider)
- **Coolify** (PaaS for deployment)
- **Docker** (containerization)

### Development Tools

**Editor/IDE:**
- **Cursor** (primary AI-powered editor)
- **VS Code** (secondary, web-based for non-developers)
- **GitHub Copilot** (AI assistant)

**Version Control:**
- **Git** (version control)
- **GitHub** (code hosting, collaboration)

**Project Management:**
- **GitHub Projects** (Kanban board)
- **Beads** (AI-native issue tracking)
- **Serena** (AI code assistant configuration)

**Communication:**
- **Async-first** (default communication mode)
- **Slack** (team communication)
- **GitHub Discussions** (public discussions)

### Package Managers

- **Go Modules** (Go dependencies)
- **Composer** (PHP dependencies)
- **npm/pnpm** (Node.js dependencies)

---

## Testing & QA

### Testing Frameworks

**Go:**
- `testing` package (standard library)
- `testify/assert` (assertions)
- `testify/mock` (mocking)

**PHP/Laravel:**
- **PHPUnit** (unit testing)
- **Pest** (alternative testing framework)

**TypeScript/Next.js:**
- **Vitest** (unit testing)
- **Playwright** (E2E testing)
- **React Testing Library** (component testing)

### Testing Strategy

**Test Pyramid:**
1. **Unit Tests** (70%) - Test individual functions/components in isolation
2. **Integration Tests** (20%) - Test interactions between modules
3. **E2E Tests** (10%) - Test critical user journeys

**Coverage Expectations:**
- **Unit tests:** 80%+ coverage for business logic
- **Integration tests:** Critical paths must be covered
- **E2E tests:** Main user flows (authentication, checkout, etc.)

### Running Tests

```bash
# Go
go test ./...
go test -v -race ./...
go test -cover ./...

# PHP/Laravel
./vendor/bin/phpunit
./vendor/bin/pest

# TypeScript/Next.js
npm test
npm run test:e2e
```

### Quality Assurance

**Pre-commit Hooks:**
- Go: `go fmt`, `go vet`, `go test`
- PHP: `composer lint`, `composer test`
- TypeScript: `eslint`, `prettier`, `vitest`

**Code Review Requirements:**
- Minimum 1 approval from team member
- All automated checks must pass
- Documentation review for technical changes
- Business review for process changes

---

## GitHub Templates & Workflows

### Issue Templates (`.github/ISSUE_TEMPLATE/`)

**🚨 Emergency & Priority:**
- **`emergency-support.md`** - Critical production issues requiring immediate attention
- **`akses-request.md`** - System/access requests (servers, databases, tools)

**🐛 Development & Features:**
- **`bug-report.md`** - Bug reports with reproduction steps
- **`feature-request.md`** - New feature proposals

**💼 Business & Administration:**
- **`ide-produk.md`** - New product/service ideas
- **`request_admin.md`** - Administrative requests (equipment, purchases)

### Pull Request Template

All PRs must use `.github/PULL_REQUEST_TEMPLATE.md` which includes:
- Comprehensive testing checklist
- Review checklist
- Breaking changes documentation
- CHANGELOG.md update requirements

### Emergency Contacts

- **🚨 Critical Issues:** WhatsApp +62 815-9988-995
- **📧 Non-urgent:** support@akordium.id
- **💬 General Discussion:** GitHub Discussions

---

## Company Context & Preferences

### Migration Strategy

**PHP-to-Go Migration:**
- Go is the standard for all new backend projects
- PHP/Laravel expertise still required for legacy systems
- Migration is gradual - maintain PHP systems until fully migrated

**MySQL-to-PostgreSQL Migration:**
- PostgreSQL is the standard database
- MySQL systems are being migrated gradually
- Use migration tools and thorough testing

### Development Philosophy

**Async-First Communication:**
- Default to written, asynchronous communication
- Use GitHub Issues, Discord/Slack for discussions
- Meetings should be rare, well-prepared, and documented

**Single Source of Truth (SSOT):**
- If it's not documented in this repository, it's not official
- All processes, standards, and decisions must be documented
- Update documentation before or immediately after changes

**Quality Standards:**
- Code review is mandatory for all changes
- Tests are required for business logic
- Security and performance are non-negotiable
- Documentation must be clear and actionable

### Primary Developer

**Najib** - Backend developer specializing in:
- PHP-to-Go conversion
- MySQL-to-PostgreSQL migration
- Modern development practices

When providing assistance:
- Prioritize Go-based solutions
- Acknowledge PHP/Laravel expertise for legacy systems
- Focus on modern development practices aligned with migration strategy

---

## Documentation Updates

When making changes to this repository:

1. **Procedural changes** → Update relevant sections in `/01-SOP/`
2. **Technical standards changes** → Update `/02-Tech-Docs/`
3. **New product documentation** → Add to `/03-Produk/`
4. **Significant changes** → Update `CHANGELOG.md`
5. **All changes** → Follow established Git workflow

### Review Process

- **Simple changes** (< 100 lines): 1 approver
- **SOP changes**: 2 approvers mandatory
- **New guides**: 2 reviews
- **Typo fixes**: Direct merge to main

---

## Quick Start for AI Assistants

### When Asked About Code Standards

1. Check `/02-Tech-Docs/stack-conventions.md` for language-specific standards
2. Review relevant product's design system in `/03-Produk/`
3. Follow naming conventions and patterns documented above

### When Asked About Workflows

1. Check `/01-SOP/` for the specific procedure
2. Follow Git workflow and branch naming conventions
3. Use Conventional Commits format for commit messages

### When Asked About Products

1. Check `/03-Produk/index.md` for active products
2. Review product-specific design system and specs
3. Consider the unified neurodesign system principles

### When Asked About Deployment

1. Check `/02-Tech-Docs/coolify-deployment.md`
2. Review `/01-SOP/deployment-checklist.md`
3. Follow environment-specific procedures in `/02-Tech-Docs/environments.md`

---

## Common Scenarios

### Scenario: Adding a New Feature

1. Check product-specific documentation in `/03-Produk/`
2. Review coding standards in `/02-Tech-Docs/stack-conventions.md`
3. Follow Git workflow in `/01-SOP/workflow-git.md`
4. Create feature branch: `git checkout -b feat/feature-name`
5. Implement following code conventions
6. Test according to `/02-Tech-Docs/testing-strategy.md`
7. Create PR using template
8. Update CHANGELOG.md if significant

### Scenario: Fixing a Bug

1. Reproduce the bug
2. Create issue using `bug-report.md` template
3. Create fix branch: `git checkout -b fix/bug-description`
4. Implement fix following code conventions
5. Add test to prevent regression
6. Create PR with reproduction steps
7. Update CHANGELOG.md if significant

### Scenario: Updating Documentation

1. For small changes (< 100 lines): 1 approver needed
2. For SOP changes: 2 approvers mandatory
3. Use web editor (press `.` in GitHub) for quick edits
4. Follow commit message format: `docs: description`
5. Update CHANGELOG.md if significant

### Scenario: Requesting Access

1. Create issue using `akses-request.md` template
2. Provide justification and required access level
3. Wait for approval
4. Follow setup instructions in `/00-Onboarding/02-setup-akses.md`

---

## Getting Help

### Documentation Owner

- **Najib** (Backend Lead)
- **Review Timeline:** 1-2 business days
- **Urgent Changes:** Tag in issues

### Resources

- **Emergency:** WhatsApp +62-815-9988-995
- **General:** [GitHub Discussions](https://github.com/akordium-id/hq/discussions)
- **Issues:** [Create New Issue](https://github.com/akordium-id/hq/issues/new)
- **Tech Lead:** support@akordium.id

---

**Remember:** This is a **documentation-only repository**. When working here, focus on documentation maintenance and improvement rather than code development. All code-related work should be done in the respective product repositories.

---

*"In order to do more, you must have the discipline to do less."* - Plain Text Philosophy
