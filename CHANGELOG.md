# Changelog

Repository documentation untuk Akordium Lab HQ.

## Versioning

- **Major Version (X.0.0)** - Perubahan struktur dokumentasi besar
- **Minor Version (0.Y.0)** - Penambahan kategori atau proses baru
- **Patch Version (0.0.Z)** - Perbaikan kecil, typo, update minor

## [Unreleased]

### Added
- **CaptionMania Product Validation** (`hq-17r`)
  - Created comprehensive validation framework for AI caption generator for Indonesian marketplaces
  - 8 child validation items established covering:
    - Problem Statement & User Personas (`hq-17r.1`)
    - Competitive Landscape Analysis (`hq-17r.2`)
    - Target Market Sizing (`hq-17r.3`)
    - Monetization Strategy Validation (`hq-17r.4`)
    - Technical Validation - AI Model Selection (`hq-17r.5`)
    - Customer Discovery Interviews (`hq-17r.6`)
    - Unit Economics & Business Model (`hq-17r.7`)
    - Go-to-Market Strategy (`hq-17r.8`)
  - Key strategic decisions validated:
    - Target: Tokopedia/Shopee power sellers (100+ products, SEO-focused)
    - Pricing: Subscription Rp 99k/bulan unlimited (no credit system in MVP)
    - Tech Stack: Go (Fiber) + SvelteKit + OpenAI GPT-4
    - MVP Scope: Full-featured (10-12 weeks, bulk upload, tones, hashtags, templates)
    - First-Year Target: 1,000-5,000 users (bootstrap, conservative)
  - Documentation created:
    - `validation-summary.md`: Complete validation framework overview and status tracker
    - `user-personas.md`: 5 persona templates with power sellers as primary
    - `competitive-analysis.md`: Competitor matrix and SWOT analysis
    - `market-sizing.md`: TAM/SAM/SOM framework with 1K-5K user target
    - `pricing-validation.md`: Subscription model validation at Rp 99k/mo
    - `technical-architecture.md`: OpenAI GPT-4 strategy with caching for cost optimization
    - `customer-discovery.md`: Interview framework for 10-20 power seller interviews
    - `unit-economics.md`: LTV:CAC analysis targeting 7:1 ratio, breakeven at 234 users
    - `gtm-strategy.md`: Community-driven growth, target 100 users in 3 months
  - Task dependencies configured for sequential validation flow
  - Beads sync verified for cross-device compatibility

- **SnapKasir Product Validation** (`hq-bun`)
  - Validated product direction: F&B-focused POS platform (warung, cafe, restoran)
  - Tech stack migration: Next.js → Flutter for cross-platform efficiency (iOS + Android + Web from 1 codebase)
  - Pricing model: Freemium → Usage-based paid tiers (Rp 49k-299k/bulan)
  - 18 child items created for comprehensive product validation across:
    - Product Identity & Market Fit (3 items)
    - Technical Validation (3 items)
    - Features & Roadmap (3 items)
    - Business Model (3 items)
    - Go-to-Market Strategy (3 items)
    - Documentation Updates (3 items)
  - Updated SnapKasir documentation:
    - `README.md`: Product status, F&B focus, Flutter stack, usage-based pricing
    - `tech-stack.md`: Complete Flutter architecture with offline-first design, hardware integration
    - `roadmap.md`: M1-M10 milestone breakdown (Geo-constrained beta → national scale)
  - Competitive differentiation: Simple UX (ibu-ibu friendly), reliable offline-first, Flutter cost efficiency

- GitHub issue templates: `bug-report.md`, `feature-request.md`, `akses-request.md`, `ide-produk.md`
- Pull Request template dengan comprehensive checklist
- Enhanced `CONTRIBUTING.md` dengan detailed contribution guidelines
- `CLAUDE.md` untuk AI assistant guidance

### Changed
- **SnapKasir Strategic Pivot**
  - Target market: All UMKM → F&B segment only (warung, cafe, restoran)
  - Tech stack: Go + Next.js → Go + Flutter (60% dev cost reduction)
  - Monetization: Freemium → Usage-based paid model
  - Launch strategy: Broad launch → Geo-constrained beta (1 kecamatan pilot)

- Improved documentation structure organization
- Updated Git workflow standards

### Fixed
- N/A

---

## [0.1.0] - 2024-12-01

### Added
- Initial repository structure with 5 main categories:
  - `/00-Onboarding/` - New hire documentation
  - `/01-SOP/` - Standard Operating Procedures
  - `/02-Tech-Docs/` - Technical documentation
  - `/03-Produk/` - Product specifications
  - `/04-Marketing-Brand/` - Marketing assets and guidelines
  - `/05-Legal-Admin/` - Legal and administrative templates
- Company overview and team culture documentation
- Technical stack conventions and development standards
- Product portfolio documentation (WaqfWise, Anggarin, Atribuo, SnapKasir)
- Infrastructure and deployment guidelines
- Basic GitHub configuration and issue template

### Initial Documentation Structure

#### Onboarding (`/00-Onboarding/`)
- New hire welcome guide
- Developer setup instructions
- Team introduction materials

#### SOP (`/01-SOP/`)
- Git workflow procedures
- Code review process
- Communication guidelines
- Quality assurance standards

#### Tech Docs (`/02-Tech-Docs/`)
- Coding standards and conventions
- Architecture patterns
- Database design principles
- API documentation standards
- Deployment procedures

#### Products (`/03-Produk/`)
- Product specifications
- Technical requirements
- User stories and acceptance criteria
- Development roadmaps

#### Marketing & Brand (`/04-Marketing-Brand/`)
- Brand guidelines
- Marketing materials
- Social media templates

#### Legal & Admin (`/05-Legal-Admin/`)
- Legal templates
- Administrative procedures
- Compliance guidelines

---

## Change Log Guidelines

### What to Include
- **Major structural changes** - New categories, reorganization
- **Process changes** - New SOPs, workflow updates
- **Technical standards** - New coding standards, architecture changes
- **Product updates** - New product specs, major changes
- **Tooling changes** - New development tools, GitHub configurations

### What NOT to Include
- **Minor typo fixes**
- **Grammar corrections**
- **Minor formatting adjustments**
- **Draft content additions** (unless significant)

### Format
```markdown
## [Version] - YYYY-MM-DD

### Added
- New features, content, capabilities
- New templates, procedures, standards

### Changed
- Modifications to existing content
- Process improvements
- Updated standards

### Deprecated
- Features being phased out
- Processes being replaced

### Removed
- Deleted content or sections
- Obsolete procedures

### Fixed
- Bug fixes in documentation
- Corrections to procedures
- Updated wrong information

### Security
- Security-related updates
- Vulnerability disclosures
- Access control changes
```

---

**Note:** This changelog only tracks significant changes to the documentation repository structure and standards. For individual document updates, refer to the Git commit history.
