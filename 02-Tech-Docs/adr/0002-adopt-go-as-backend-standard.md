# 0002. Adopt Go as Backend Standard

## Status

ACCEPTED

## Context

### Problem Statement

Our current backend development primarily uses PHP (Laravel), which while serving us well, presents limitations for our future growth and performance requirements. We need a more performant, scalable, and maintainable backend technology stack that can support:

- Higher performance requirements for real-time features
- Better concurrency handling
- Simplified deployment and operations
- Attracting talent with modern backend skills
- Unified technology stack across products

### Current Situation

Our backend landscape includes:

- **WaqfWise:** Laravel 10 (PHP 8.2)
- **Anggarin:** Laravel 10 API (PHP 8.2)
- **Atribuo:** Planned Go backend (in development)
- **SnapKasir:** Planned Go backend (in planning)

We're experiencing challenges with:

- Performance bottlenecks in high-traffic scenarios
- Complex deployment and scaling procedures
- Difficulty finding PHP developers with required skills
- Inconsistent technology patterns across products
- Memory usage and resource efficiency issues

### Constraints

- Must maintain existing PHP applications during transition
- Gradual migration to minimize business disruption
- Team training and knowledge transfer requirements
- Budget constraints for training and tooling
- Timeline: Complete transition within 12 months

## Decision

We will adopt Go (Golang) as the standard backend development language for all new Akordium Lab products and gradually migrate existing PHP applications to Go. The migration will follow a product-by-product approach, starting with new products and then migrating existing ones.

### Implementation Details

1. **Phase 1: Foundation (Months 1-3)**
   - Complete Atribuo development in Go
   - Establish Go development standards and best practices
   - Set up Go-specific CI/CD pipelines
   - Begin team training program
   - Create reusable Go libraries and frameworks

2. **Phase 2: New Development (Months 4-6)**
   - Develop SnapKasir entirely in Go
   - Create Go-based microservices for new features
   - Establish Go as default for all new backend projects
   - Complete team certification and training

3. **Phase 3: Migration Planning (Months 7-9)**
   - Analyze existing PHP applications for migration strategy
   - Create migration roadmaps for WaqfWise and Anggarin
   - Develop migration tools and processes
   - Begin proof-of-concept migrations

4. **Phase 4: PHP Migration (Months 10-12)**
   - Begin migrating Anggarin to Go
   - Start planning WaqfWise migration
   - Phase out PHP development for new features

### Success Criteria

- [ ] All new backend products developed in Go
- [ ] Team successfully trained in Go development
- [ ] Performance improvements measured and validated
- [ ] Development velocity maintained or improved
- [ ] Deployment and operational processes simplified

## Consequences

### Positive Consequences

- **Performance:** Go's compiled nature and goroutines provide better performance
- **Concurrency:** Superior concurrency model for high-throughput applications
- **Deployment:** Single binary deployment simplifies operations
- **Memory Efficiency:** Lower memory usage and better garbage collection
- **Talent Attraction:** Modern, in-demand language for recruiting
- **Consistency:** Unified technology stack across products
- **Tooling:** Rich ecosystem of modern development tools

### Negative Consequences

- **Learning Curve:** Team needs to learn Go idioms and patterns
- **Migration Complexity:** Existing PHP applications need rewriting
- **Ecosystem Maturity:** Smaller ecosystem compared to PHP/Laravel
- **Development Speed:** Initial slower development while team learns Go
- **Tool Investment:** Need new Go-specific development and monitoring tools

### Risks

| Risk | Probability | Impact | Mitigation |
|------|-------------|--------|------------|
| Team productivity decrease | Medium | Medium | Gradual transition + extensive training |
| Migration bugs and issues | Medium | High | Comprehensive testing + gradual rollout |
| Feature parity issues | Medium | Medium | Detailed feature mapping + validation |
| Talent availability | Low | Medium | Training existing team + targeted hiring |
| Operational complexity | Low | Medium | Standardized deployment patterns |

## Alternatives Considered

### Alternative 1: Stick with PHP/Laravel

Continue using PHP/Laravel for all backend development.

**Pros:**

- No learning curve for existing team
- Rich ecosystem and mature frameworks
- Large talent pool of PHP developers
- Extensive documentation and community support

**Cons:**

- Performance limitations for high-concurrency scenarios
- Deployment complexity with dependency management
- Memory usage and resource inefficiency
- Less attractive for modern backend developers

### Alternative 2: Node.js/TypeScript

Adopt Node.js with TypeScript for backend development.

**Pros:**

- Unified JavaScript ecosystem with frontend
- Large ecosystem and community
- Good for real-time applications
- TypeScript provides type safety

**Cons:**

- Single-threaded nature requires careful architecture
- Memory usage can be high
- Package management complexity
- Performance variability across Node versions

### Alternative 3: Java/Spring Boot

Adopt Java with Spring Boot framework.

**Pros:**

- Mature enterprise ecosystem
- Excellent performance and scalability
- Strong typing and tooling support
- Large talent pool

**Cons:**

- Higher memory usage
- More verbose code
- Longer development cycles
- Complex deployment patterns
- Steeper learning curve than Go

### Alternative 4: Python/FastAPI

Adopt Python with FastAPI framework.

**Pros:**

- Fast development cycles
- Excellent for APIs and data processing
- Rich ecosystem for data science
- Easy to learn and read

**Cons:**

- Performance limitations for CPU-bound tasks
- Global Interpreter Lock (GIL) limitations
- Deployment complexity with virtual environments
- Memory usage concerns

### Why We Chose Go

Go provides the optimal balance of our requirements:

- **Performance:** Compiled language with efficient garbage collection
- **Concurrency:** Goroutines and channels for easy concurrent programming
- **Simplicity:** Clean syntax and minimal language features
- **Deployment:** Single binary deployment eliminates dependency issues
- **Memory Efficiency:** Lower memory footprint compared to PHP/Java
- **Modern:** Attractive to modern backend developers
- **Growing Ecosystem:** Rapidly growing ecosystem with quality libraries

## Implementation Plan

### Tasks

| Task | Owner | Priority | Estimated Effort | Due Date |
|------|-------|----------|------------------|----------|
| Complete Atribuo Go development | Backend Team | Critical | 8 weeks | 2025-02-01 |
| Establish Go development standards | Tech Lead | High | 2 weeks | 2024-12-15 |
| Team Go training program | Engineering Manager | High | 12 weeks | 2025-03-01 |
| Create Go libraries and frameworks | Senior Developers | Medium | 6 weeks | 2025-01-15 |
| Set up Go CI/CD pipelines | DevOps | Medium | 2 weeks | 2024-12-22 |
| Begin SnapKasir Go development | Backend Team | High | 10 weeks | 2025-04-01 |

### Dependencies

- **External Dependencies:** Go training budget, development tools
- **Internal Dependencies:** Team availability for training
- **Blocking Issues:** None identified

### Rollback Plan

1. **During Transition:** Maintain PHP applications in parallel
2. **Development Issues:** Can fall back to PHP for critical features
3. **Performance Issues:** Optimize Go code or reconsider architecture
4. **Team Issues:** Provide additional training or reconsider timeline

## Monitoring & Metrics

### Key Metrics

- **Development Velocity:** Story points completed per sprint - Target: Maintain current velocity
- **Application Performance:** Response time improvement - Target: 30% improvement
- **Resource Usage:** Memory/CPU usage comparison - Target: 40% reduction
- **Team Productivity:** Features delivered per month - Target: No decrease
- **Bug Rate:** Bugs per feature - Target: ≤ current rate

### Monitoring Setup

- **Dashboard:** Go application metrics alongside PHP metrics
- **Performance Monitoring:** APM tools updated for Go applications
- **Team Metrics:** Development velocity and quality metrics
- **Resource Monitoring:** Infrastructure usage and cost tracking

## Documentation Updates

- [ ] Architecture Overview - Update technology stack section
- [ ] API Guidelines - Add Go-specific API development patterns
- [ ] Performance Guidelines - Include Go optimization techniques
- [ ] Development Standards - Go coding standards and best practices

## Review & Validation

### Review Process

- [ ] **Technical Review:** Go architecture and patterns review
- [ ] **Team Review:** Training program and skill assessment
- [ ] **Performance Review:** Go vs PHP performance comparison
- [ ] **Business Review:** Timeline and budget validation

### Validation

1. **Technical Validation:** Proof-of-concept development and performance testing
2. **Team Validation:** Training effectiveness and skill assessment
3. **Business Validation:** Feature development and delivery metrics
4. **Operational Validation:** Deployment and monitoring effectiveness

## History

| Date | Version | Author | Changes |
|------|---------|--------|---------|
| 2024-12-01 | 1.0 | Najib | Initial proposal for Go adoption |
| 2024-12-01 | 1.1 | Najib | Added detailed migration timeline |
| 2024-12-01 | 1.2 | Najib | Updated risk assessment and team training details |

---

**Date:** 2024-12-01
**Author:** Najib
**Reviewers:** Backend Team, Engineering Manager, Tech Lead
**Next Review Date:** 2025-06-01
