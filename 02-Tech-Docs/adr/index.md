# Architecture Decision Records Index

This index provides an organized view of all Architecture Decision Records (ADRs) for Akordium Lab.

## 📋 All ADRs

| Number | Title | Status | Date | Category |
|--------|-------|---------|------|----------|
| [0000](./0000-use-architecture-decision-records.md) | Use Architecture Decision Records | ACCEPTED | 2024-12-01 | Process |
| [0001](./0001-migrate-from-mysql-to-postgresql.md) | Migrate from MySQL to PostgreSQL | ACCEPTED | 2024-12-01 | Technology Stack |
| [0002](./0002-adopt-go-as-backend-standard.md) | Adopt Go as Backend Standard | ACCEPTED | 2024-12-01 | Technology Stack |

## 🏷️ By Category

### Technology Stack

Decisions about programming languages, databases, frameworks, and infrastructure choices.

| ADR | Decision | Impact | Status |
|-----|----------|---------|---------|
| [0001](./0001-migrate-from-mysql-to-postgresql.md) | Migrate all databases from MySQL to PostgreSQL 15 | High | ACCEPTED |
| [0002](./0002-adopt-go-as-backend-standard.md) | Adopt Go as standard backend language, migrate from PHP | High | ACCEPTED |

### Architecture Patterns

Decisions about service architecture, data flow, integration patterns, and security architecture.

*No ADRs in this category yet.*

### Development Process

Decisions about testing strategies, deployment patterns, code organization, and documentation standards.

| ADR | Decision | Impact | Status |
|-----|----------|---------|---------|
| [0000](./0000-use-architecture-decision-records.md) | Implement ADR process for documenting architectural decisions | Medium | ACCEPTED |

### Performance & Scalability

Decisions about caching strategies, database optimization, load balancing, and resource management.

*No ADRs in this category yet.*

## 📊 By Status

### Accepted

Decisions that have been reviewed, approved, and are currently in effect or have been implemented.

| ADR | Title | Date |
|-----|-------|------|
| [0000](./0000-use-architecture-decision-records.md) | Use Architecture Decision Records | 2024-12-01 |
| [0001](./0001-migrate-from-mysql-to-postgresql.md) | Migrate from MySQL to PostgreSQL | 2024-12-01 |
| [0002](./0002-adopt-go-as-backend-standard.md) | Adopt Go as Backend Standard | 2024-12-01 |

### Proposed

Decisions that are currently being drafted or are under review.

*No proposed ADRs at this time.*

### Deprecated

Decisions that are no longer recommended but may still be in effect.

*No deprecated ADRs at this time.*

### Superseded

Decisions that have been replaced by newer decisions.

*No superseded ADRs at this time.*

## 📅 By Date

### 2024

#### December

- **2024-12-01:** [0000](./0000-use-architecture-decision-records.md) - Use Architecture Decision Records
- **2024-12-01:** [0001](./0001-migrate-from-mysql-to-postgresql.md) - Migrate from MySQL to PostgreSQL
- **2024-12-01:** [0002](./0002-adopt-go-as-backend-standard.md) - Adopt Go as Backend Standard

## 🎯 By Impact

### High Impact

Decisions that significantly affect the technology stack, architecture, or major business processes.

| ADR | Title | Date |
|-----|-------|------|
| [0001](./0001-migrate-from-mysql-to-postgresql.md) | Migrate from MySQL to PostgreSQL | 2024-12-01 |
| [0002](./0002-adopt-go-as-backend-standard.md) | Adopt Go as Backend Standard | 2024-12-01 |

### Medium Impact

Decisions that affect processes, tools, or specific aspects of the system.

| ADR | Title | Date |
|-----|-------|------|
| [0000](./0000-use-architecture-decision-records.md) | Use Architecture Decision Records | 2024-12-01 |

### Low Impact

Decisions that have minimal impact on the overall system.

*No low impact ADRs at this time.*

## 🔍 Finding ADRs

### By Product

ADRs that specifically affect certain products:

- **All Products:** [0001](./0001-migrate-from-mysql-to-postgresql.md), [0002](./0002-adopt-go-as-backend-standard.md)
- **WaqfWise:** [0001](./0001-migrate-from-mysql-to-postgresql.md), [0002](./0002-adopt-go-as-backend-standard.md)
- **Anggarin:** [0001](./0001-migrate-from-mysql-to-postgresql.md), [0002](./0002-adopt-go-as-backend-standard.md)
- **Atribuo:** [0002](./0002-adopt-go-as-backend-standard.md)
- **SnapKasir:** [0002](./0002-adopt-go-as-backend-standard.md)

### By Technology

ADRs related to specific technologies:

- **Database:** [0001](./0001-migrate-from-mysql-to-postgresql.md)
- **Backend:** [0002](./0002-adopt-go-as-backend-standard.md)
- **Process:** [0000](./0000-use-architecture-decision-records.md)

## 📈 Trends

### Recent Decisions (Last 30 Days)

- [0000](./0000-use-architecture-decision-records.md) - Use Architecture Decision Records
- [0001](./0001-migrate-from-mysql-to-postgresql.md) - Migrate from MySQL to PostgreSQL
- [0002](./0002-adopt-go-as-backend-standard.md) - Adopt Go as Backend Standard

### Technology Evolution

Our architectural decisions show a clear trend toward:

- **Modern Technology Stack:** PostgreSQL, Go
- **Better Performance:** Compiled languages, advanced database features
- **Process Improvement:** Formal decision documentation
- **Scalability Focus:** Technologies that support growth

## 🔗 Related Documentation

- [Architecture Overview](../architecture-overview.md) - High-level system architecture
- [Database Conventions](../database-conventions.md) - Database design standards
- [API Guidelines](../api-design-guidelines.md) - API development standards
- [Performance Guidelines](../performance-guidelines.md) - Performance optimization
- [Development Process](../development-process.md) - Development workflow and standards

---

**Last Updated:** 2024-12-01
**Total ADRs:** 3
**Next Review Date:** 2025-01-01
