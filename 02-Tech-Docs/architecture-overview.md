# 🏗️ Architecture Overview

High-level architecture documentation untuk semua produk Akordium Lab. Mendefinisikan design patterns, technology choices, dan integration strategies yang konsisten across portfolio.

## 🎯 Architecture Principles

### **Guiding Principles**

- **Simplicity over Complexity:** Choose simplest solution that meets requirements
- **Pragmatic Innovation:** Adopt technology yang solves real problems, not just trends
- **Scalability by Design:** Systems designed untuk growth dari day one
- **Maintainability First:** Code yang mudah di-maintain > clever code
- **Security Built-in:** Security considerations di setiap layer

### **Technology Stack Philosophy**

- **Backend Evolution:** PHP/Laravel → Go (gradual migration)
- **Frontend Modernization:** Traditional → Next.js + TypeScript
- **Database Consolidation:** MySQL → PostgreSQL
- **Infrastructure Self-Reliance:** Oracle Cloud + Self-hosted PaaS

## 📊 Product Portfolio Architecture

### **WaqfWise - Islamic Endowment Management**

```text
┌─────────────────────────────────────────┐
│              Frontend                   │
│      Laravel Blade + Livewire 3         │
│     + Alpine.js + Tailwind CSS          │
└─────────────────┬───────────────────────┘
                  │
┌─────────────────▼───────────────────────┐
│              Backend                    │
│             Laravel 10                  │
│    + Service Classes + Actions          │
│          + Eloquent ORM                 │
└─────────────────┬───────────────────────┘
                  │
┌─────────────────▼───────────────────────┐
│              Database                   │
│           PostgreSQL 15                 │
│      + Redis untuk Caching              │
└─────────────────────────────────────────┘
```

**Architecture Style:**

- **Monolithic** dengan modular design
- **TALL Stack** (Tailwind, Alpine.js, Laravel, Livewire)
- **Service Layer Pattern** untuk business logic
- **Event-Driven** untuk background processing

### **Anggarin - Personal Finance Planning**

```text
┌─────────────────────────────────────────┐
│              Frontend                   │
│         Next.js 14 + TypeScript         │
│      + Tailwind CSS + Shadcn/UI         │
└─────────────────┬───────────────────────┘
                  │ (API Calls)
┌─────────────────▼───────────────────────┐
│              API Gateway                │
│            (Authentication)             │
└─────────────────┬───────────────────────┘
                  │
┌─────────────────▼───────────────────────┐
│              Backend                    │
│             Laravel 10 API              │
│      + JWT Authentication               │
│      + RESTful API Design               │
└─────────────────┬───────────────────────┘
                  │
┌─────────────────▼───────────────────────┐
│              Database                   │
│           PostgreSQL 15                 │
│     + Financial Data Models             │
└─────────────────────────────────────────┘
```

**Architecture Style:**

- **API-first** dengan decoupled frontend
- **Separate Frontend & Backend** repositories
- **JWT Authentication** untuk stateless API
- **Financial-grade Security** compliance

### **Atribuo - Real-Life RPG Skill Visualization**

```text
┌─────────────────────────────────────────┐
│              Frontend                   │
│         Next.js 14 + TypeScript         │
│     + Tailwind CSS + Gamification       │
└─────────────────┬───────────────────────┘
                  │ (WebSocket/API)
┌─────────────────▼───────────────────────┐
│              Backend                    │
│               Go 1.21                   │
│       + Chi Router + GORM               │
│         + WebSocket Support             │
└─────────────────┬───────────────────────┘
                  │
┌─────────────────▼───────────────────────┐
│              Database                   │
│           PostgreSQL 15                 │
│     + Game State Management             │
│     + User Progress Tracking            │
└─────────────────────────────────────────┘
```

**Architecture Style:**

- **Go-first** backend implementation
- **Real-time** communication via WebSockets
- **Game Architecture** patterns
- **Performance-optimized** untuk real-time updates

### **SnapKasir - Point of Sale System**

```text
┌─────────────────────────────────────────┐
│              Frontend                   │
│         Next.js 14 + TypeScript         │
│          + PWA Capabilities             │
└─────────────────┬───────────────────────┘
                  │ (API Calls)
┌─────────────────▼───────────────────────┐
│              Backend                    │
│               Go 1.21                   │
│     + Gin Framework + GORM              │
│        + Receipt Generation             │
└─────────────────┬───────────────────────┘
                  │
┌─────────────────▼───────────────────────┐
│              Database                   │
│           PostgreSQL 15                 │
│     + Transaction Management            │
│     + Inventory Tracking                │
└─────────────────────────────────────────┘
```

**Architecture Style:**

- **Offline-First** PWA frontend
- **High-Performance** Go backend
- **Transaction-safe** database operations
- **Retail-specific** optimizations

## 🔧 Infrastructure Architecture

### **Cloud Infrastructure (Oracle Cloud)**

```text
┌─────────────────────────────────────────┐
│              Load Balancer              │
│        (Oracle Cloud LB)                │
└─────────────────┬───────────────────────┘
                  │
┌─────────────────▼───────────────────────┐
│         Coolify PaaS Layer              │
│    ┌─────────┬─────────┬─────────┐      │
│    │ WaqfWise│ Anggarin │ SnapKasir│    │
│    └─────────┴─────────┴─────────┘      │
└─────────────────┬───────────────────────┘
                  │
┌─────────────────▼───────────────────────┐
│          Database Cluster               │
│    ┌─────────┬─────────┬─────────┐      │
│    │  PG1    │  PG2    │  Redis  │      │
│    └─────────┴─────────┴─────────┘      │
└─────────────────┬───────────────────────┘
                  │
┌─────────────────▼───────────────────────┐
│            Storage Layer                │
│    ┌─────────┬─────────┬─────────┐      │
│    │  S3     │Backups  │Static   │      │
│    └─────────┴─────────┴─────────┘      │
└─────────────────────────────────────────┘
```

### **Infrastructure Components**

- **Oracle Cloud VM:** Standard.A2.Flex (ARM-based, cost-effective)
- **Coolify PaaS:** Self-hosted deployment automation
- **PostgreSQL Cluster:** Primary + replica setup
- **Redis Cluster:** Caching dan session storage
- **Object Storage:** Oracle Cloud Object Storage (S3-compatible)

### **Network Architecture**

```text
Internet → Cloudflare → Oracle Cloud VM
                 ↓
        ┌─────────────────────┐
        │   Load Balancer     │
        └─────────┬───────────┘
                  │
    ┌─────────────┼─────────────┐
    │             │             │
┌───▼───┐   ┌───▼───┐   ┌───▼───┐
│ App 1 │   │ App 2 │   │ App 3 │
└───┬───┘   └───┬───┘   └───┬───┘
    │           │           │
    └───────────┼───────────┘
                │
        ┌───────▼───────┐
        │   Database    │
        │    Cluster    │
        └───────────────┘
```

## 🔄 Integration Patterns

### **Database Integration**

- **Shared Database per Product:** Each product has dedicated database
- **Connection Pooling:** Managed oleh application layer
- **Migration Scripts:** Version-controlled schema changes
- **Backup Strategies:** Automated daily backups

### **API Integration**

- **RESTful Standards:** Consistent API design across products
- **Authentication:** JWT tokens dengan proper expiration
- **Rate Limiting:** Prevent abuse dan ensure fairness
- **Versioning:** API versioning strategy (`/api/v1/`)

### **External Service Integration**

- **Payment Gateways:** Midtrans, Xendit integration
- **Communication:** Email (SendGrid), SMS (WhatsApp API)
- **Storage:** Cloudflare R2/S3 untuk file storage
- **Analytics:** Custom analytics dashboard integration

## 🔐 Security Architecture

### **Security Layers**

```text
┌─────────────────────────────────────────┐
│           Application Layer             │
│    ┌─────────┬─────────┬─────────┐       │
│    │Input Val │AuthN/Z  │ CORS    │       │
│    └─────────┴─────────┴─────────┘       │
└─────────────────┬───────────────────────┘
                  │
┌─────────────────▼───────────────────────┐
│           Network Layer                 │
│    ┌─────────┬─────────┬─────────┐       │
│    │ Firewall │  HTTPS  │ WAF     │       │
│    └─────────┴─────────┴─────────┘       │
└─────────────────┬───────────────────────┘
                  │
┌─────────────────▼───────────────────────┐
│          Infrastructure Layer           │
│    ┌─────────┬─────────┬─────────┐       │
│    │ VM Isol │Secret M │Audit Lg │       │
│    └─────────┴─────────┴─────────┘       │
└─────────────────────────────────────────┘
```

### **Security Implementation**

- **HTTPS Everywhere:** All traffic encrypted with TLS
- **Input Validation:** Comprehensive input sanitization
- **Database Security:** Encrypted connections, access control
- **Secret Management:** Environment variables, no hardcoded secrets
- **Regular Audits:** Security scanning dan penetration testing

## 📈 Scalability Architecture

### **Horizontal Scaling Strategy**

```text
┌─────────────────────────────────────────┐
│             Application                 │
│    ┌─────────┬─────────┬─────────┐       │
│    │  App 1  │  App 2  │  App 3  │       │
│    └─────────┴─────────┴─────────┘       │
└─────────────────┬───────────────────────┘
                  │ (Load Balancer)
┌─────────────────▼───────────────────────┐
│           Database Cluster               │
│    ┌─────────┬─────────┬─────────┐       │
│    │ Primary │ Replica │ Replica │       │
│    └─────────┴─────────┴─────────┘       │
└─────────────────────────────────────────┘
```

### **Scaling Approaches**

- **Application Scaling:** Add more instances behind load balancer
- **Database Scaling:** Read replicas untuk read-heavy operations
- **Caching Strategy:** Redis untuk frequently accessed data
- **CDN Integration:** Static assets served via CDN

### **Performance Optimizations**

- **Database Indexing:** Strategic indexing untuk query performance
- **Caching Layers:** Application, database, dan edge caching
- **Async Processing:** Background jobs untuk long-running tasks
- **Resource Optimization:** Efficient resource utilization

## 🚀 Technology Migration Path

### **Current State → Target State**

```text
Phase 1 (Current):                Phase 2 (In Progress):           Phase 3 (Target):
┌─────────────────┐           ┌─────────────────┐                ┌─────────────────┐
│ PHP/Laravel     │   →       │ Mixed Stack     │       →        │ Go-First        │
│ MySQL           │           │ PHP + Go        │                │ PostgreSQL     │
│ Traditional     │           │ PostgreSQL      │                │ Modern Stack    │
│ Monolithic      │           │ API + Web       │                │ Microservices   │
└─────────────────┘           └─────────────────┘                └─────────────────┘
```

### **Migration Strategy**

1. **Database Migration:** MySQL → PostgreSQL (ongoing)
2. **Backend Migration:** PHP → Go (gradual, product-by-product)
3. **Architecture Evolution:** Monolithic → Microservices (when needed)
4. **Infrastructure Modernization:** Manual → Automated deployment

### **Technology Roadmap**

- **2024 Q4:** Complete PostgreSQL migration
- **2025 Q1:** Launch first Go-based product (Atribuo)
- **2025 Q2:** Begin API-first architecture transition
- **2025 Q3:** Microservices architecture untuk scalability
- **2025 Q4:** Complete Go migration for all products

## 📋 Architecture Decision Framework

### **Decision Criteria**

- **Business Value:** Solves real business problems
- **Technical Excellence:** Follows best practices
- **Maintainability:** Easy untuk maintain dan extend
- **Scalability:** Can handle growth requirements
- **Security:** Meets security requirements
- **Cost Efficiency:** Cost-effective solution

### **Architecture Review Process**

1. **Proposal:** New architecture proposal dengan justification
2. **Review:** Technical review oleh senior team members
3. **Documentation:** Architecture decisions documented
4. **Implementation:** Proof of concept development
5. **Evaluation:** Performance dan scalability testing
6. **Deployment:** Gradual rollout dengan monitoring

---

**Key Architecture Principles:**

- **Start Simple:** Begin dengan simple architecture, evolve when needed
- **Measure Everything:** Monitor performance dan identify bottlenecks
- **Automate Deployment:** Use Coolify untuk consistent deployments
- **Document Decisions:** Track architecture decisions untuk future reference
- **Stay Current:** Evaluate new technologies dengan pragmatic approach

*Related Documentation:* [Database Conventions](./database-conventions.md) | [API Guidelines](./api-design-guidelines.md) | [Deployment Guide](./coolify-deployment.md) | [Performance Guidelines](./performance-guidelines.md)
