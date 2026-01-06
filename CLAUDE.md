# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is **Akordium Lab HQ** - the central documentation repository for Akordium Lab (akordium.id), an Indonesian web & app development services company. This serves as the "Single Source of Truth" (SSOT) for all operational, managerial, and technical standards.

**Note:** This is a documentation-only repository, not a code project. When working here, focus on documentation maintenance and improvement rather than code development.

## Company Context

- **Name:** Akordium Lab
- **Business:** Web & app development services and consulting
- **Focus:** Modern digital solutions with PHP-to-Go migration and MySQL-to-PostgreSQL conversion
- **Team:** Backend-focused with Go as primary language, PHP experience required for legacy systems

## Technology Stack

**Current Projects:**

1. **WaqfWise** - Islamic endowment management (TALL stack: Tailwind, Alpine.js, Laravel, Livewire)
2. **Anggarin** - Personal finance planning (Laravel API + Next.js)
3. **Atribuo** - Real-life RPG skill visualization (Go + Next.js)
4. **SnapKasir** - Point of sale system (Go + Next.js)

**Core Technologies:**

- **Backend:** Go (primary), Laravel/PHP (legacy/migration)
- **Frontend:** Next.js, React (TypeScript)
- **Database:** PostgreSQL (migrating from MySQL)
- **Infrastructure:** Oracle Cloud + Coolify (PaaS)
- **Development Tools:** Cursor + GitHub Copilot

## Key Documentation Sections

- `/00-Onboarding/` - New hire documentation and setup
- `/01-SOP/` - Standard Operating Procedures
- `/02-Tech-Docs/` - Technical documentation and coding standards
- `/03-Produk/` - Product specifications and requirements
- `/04-Marketing-Brand/` - Marketing assets and brand guidelines
- `/05-Legal-Admin/` - Legal and administrative templates

## Development Standards

**Language Requirements:**

- English for variable names, functions, and comments
- Indonesian for documentation and user-facing text
- Mandatory type hinting in PHP
- Strict TypeScript mode (avoid `any` type)

**Git Workflow:**

- Branch naming: `type/descriptive-name` (feat/, fix/, docs/, chore/)
- Commit messages: Conventional Commits format
- Never push directly to main branch
- Use squash and merge for PRs

**Coding Standards:**

- Go: Standard project layout (`cmd/`, `internal/`, `pkg/`)
- PHP: Service Classes/Actions for business logic
- Database: Snake_case naming, proper foreign keys, strategic indexing

## Important Files

- `/README.md` - Main project overview
- `/02-Tech-Docs/stack-conventions.md` - Technical standards
- `/01-SOP/workflow-git.md` - Git workflow procedures
- `/02-Tech-Docs/coolify-deployment.md` - Deployment guide
- `/00-Onboarding/02-setup-akses.md` - Developer setup instructions
- `/CONTRIBUTING.md` - Comprehensive contribution guide
- `/CHANGELOG.md` - Version history and changes

## GitHub Templates & Workflows

### Issue Templates (`.github/ISSUE_TEMPLATE/`)

**🚨 Emergency & Priority:**
- **`emergency-support.md`** - For critical production issues requiring immediate attention
- **`akses-request.md`** - For system/access requests (servers, databases, tools)

**🐛 Development & Features:**
- **`bug-report.md`** - For reporting bugs with reproduction steps
- **`feature-request.md`** - For proposing new features

**💼 Business & Administration:**
- **`ide-produk.md`** - For new product/service ideas
- **`request_admin.md`** - For administrative requests (equipment, purchases)

### Emergency Contacts
- **🚨 Critical Issues**: WhatsApp +62 815-9988-995 (via config.yml contact link)
- **📧 Non-urgent**: support@akordium.id
- **💬 General Discussion**: GitHub Discussions

### Template Usage Guidelines
1. **🚨 Emergency Support**: Use for production down, security breaches, data loss
2. **🔑 Akses Request**: Use for new access needs, follow approval workflow
3. **🐛 Bug Report**: Use for reproducible issues with clear steps
4. **💡 Feature Request**: Use for enhancement ideas with business justification
5. **📦 Admin Request**: Use for equipment, software licenses, office needs

### Pull Request Process

- Use `.github/PULL_REQUEST_TEMPLATE.md` for all PRs
- Requires comprehensive testing and review checklists
- Follows conventional commit standards
- CHANGELOG.md updates required for significant changes

### Git Workflow Standards

- Branch naming: `type/description` (feat/, fix/, docs/, chore/)
- Conventional commits format
- Squash and merge for clean history
- Main branch always deployable

## Company Specific Context

**Primary Developer:** Najib - Backend developer specializing in PHP-to-Go conversion and MySQL-to-PostgreSQL migration.

When providing assistance, prioritize Go-based solutions while acknowledging PHP/Laravel expertise for legacy systems. Focus on modern development practices that align with the company's migration strategy.

## Documentation Updates

When making changes:

1. Update relevant sections in `/01-SOP/` for procedural changes
2. Update `/02-Tech-Docs/` for technical standards changes
3. Add new product documentation to `/03-Produk/`
4. Update CHANGELOG.md for significant documentation changes
5. Follow the established Git workflow for all changes
