# CaptionMania - Technical Validation & Architecture

**Beads Task:** hq-17r.5 - Technical Validation - AI Model Selection
**Status:** 🔄 In Progress
**Last Updated:** 2026-01-07

---

## Executive Summary

**Tech Stack:**
- **Backend:** Go with Fiber framework
- **Frontend:** SvelteKit (TypeScript)
- **AI Model:** OpenAI GPT-4/GPT-4o API
- **Database:** PostgreSQL
- **Hosting:** Oracle Cloud + Coolify

**Validation Focus:** AI model selection, cost analysis, architecture design, caching strategy

---

## AI Model Evaluation

### Option 1: OpenAI GPT-4/GPT-4o (Selected for MVP) ✅

**Model Choice:** GPT-4o mini for captions, GPT-4o for complex descriptions

**Pros:**
- ✅ Fastest time-to-market (no training infrastructure)
- ✅ Excellent Indonesian language capability
- ✅ High-quality output from day one
- ✅ Continuous improvements by OpenAI
- ✅ Scalable (no infrastructure management)
- ✅ Simple integration (API-based)

**Cons:**
- ⚠️ Operational costs at scale
- ⚠️ Dependency on third-party
- ⚠️ No competitive moat (anyone can use OpenAI)
- ⚠️ API rate limits

**Cost Analysis (Estimates):**
- GPT-4o mini: ~Rp 30-50/caption (1000 tokens × 2 for prompt+completion)
- GPT-4o: ~Rp 150-300/caption for complex descriptions
- **Average: Rp 100/caption**

**Decision:** Start with OpenAI for speed, optimize costs later with caching/fine-tuning

---

### Option 2: Open Source Models (Future Optimization)

**Models:** Llama 3.1, Mistral 7B, etc.

**Pros:**
- ✅ Lower operational costs at scale
- ✅ Control over model hosting
- ✅ Potential fine-tuning on Indonesian marketplace data
- ✅ No API dependency

**Cons:**
- ❌ Requires ML infrastructure expertise
- ❌ Higher upfront development time
- ❌ Model quality may be lower than GPT-4
- ❌ Hosting costs (GPU servers)
- ❌ Maintenance overhead

**Deployment Options:**
- Self-hosted GPU servers (Oracle Cloud, AWS)
- Cloud provider ML services (Bedrock, SageMaker)
- Model API providers (Together AI, Anyscale)

**Deferred:** Post-MVP once we have training data and usage patterns

---

### Option 3: Hybrid Approach (Optimal Long-term)

**Strategy:**
- **GPT-4o** for complex/unique descriptions
- **Fine-tuned Llama/Mistral** for standard templates
- **Rule-based** for simple variations
- **Cache** for exact matches

**Benefits:**
- Optimize cost/quality trade-off
- Redundancy (multiple model providers)
- Progressive improvement with fine-tuning

**Implementation:** Phase 2 (after 6-12 months of data collection)

---

## Cost Analysis

### Per-Caption Cost Breakdown

| Component | Cost per Caption | Notes |
|-----------|------------------|-------|
| **OpenAI API** | Rp 100 | GPT-4o mini avg |
| **Server Overhead** | Rp 20 | Go backend, SvelteKit frontend |
| **Database** | Rp 5 | Storage & queries |
| **Support/Maintenance** | Rp 25 | 25% gross margin target |
| **Total Cost** | **Rp 150** | Per caption |

### Unit Economics at Scale

| Monthly Captions | OpenAI Cost | Server Cost | Total Cost | Revenue @ Rp 99k | Gross Margin |
|------------------|-------------|-------------|------------|------------------|--------------|
| 50 (light user) | Rp 5.000 | Rp 2.500 | Rp 7.500 | Rp 99.000 | **92%** |
| 200 (normal) | Rp 20.000 | Rp 10.000 | Rp 30.000 | Rp 99.000 | **70%** |
| 500 (power) | Rp 50.000 | Rp 25.000 | Rp 75.000 | Rp 99.000 | **24%** |
| 1000 (heavy) | Rp 100.000 | Rp 50.000 | Rp 150.000 | Rp 99.000 | **-52%** ❌ |

**Insight:** Power users (>500 captions/month) have negative margins with GPT-4o

**Solutions:**
1. Aggressive caching (reduce API calls by 60-80%)
2. Open source models for high-volume users
3. Tiered pricing for heavy users (post-MVP)
4. Usage limits in subscription (fair use policy)

---

## Caching Strategy

### Cache Architecture

**1. Exact Match Cache**
- Hash of (product_name + category + tone + keywords)
- Serve pre-generated captions instantly
- Cache hit rate target: 60-80%

**2. Semantic Cache**
- Embedding-based similarity search
- Find similar previous captions
- Cache hit rate target: 10-20%

**3. Template Cache**
- Pre-generated templates for popular categories
- Customize with product-specific details
- Cache hit rate target: 5-10%

**Total Cache Hit Target:** 75-90%

**Cost Reduction:**
- At 80% cache hit: Rp 150 × 20% = **Rp 30/caption** (80% savings!)
- At 90% cache hit: Rp 150 × 10% = **Rp 15/caption** (90% savings!)

### Cache Implementation

```go
// Pseudo-code for caching strategy
type CacheKey struct {
    ProductName    string
    Category       string
    Tone           string
    Keywords       []string
    Language       string
}

func GenerateCaption(product Product, tone string) (string, error) {
    cacheKey := generateCacheKey(product, tone)

    // Level 1: Exact match cache (Redis)
    if cached := redis.Get(cacheKey); cached != nil {
        return cached, nil
    }

    // Level 2: Semantic similarity (Pgvector)
    similar := findSimilarCaptions(product.Embedding)
    if similarity > 0.9 {
        return customizeCaption(similar.Caption, product), nil
    }

    // Level 3: Call OpenAI API
    caption := openai.Generate(product, tone)

    // Store in cache
    redis.Set(cacheKey, caption, TTL_30_DAYS)
    pgvector.Store(product.Embedding, caption)

    return caption, nil
}
```

---

## System Architecture

### High-Level Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                         Users                               │
└─────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────┐
│                    SvelteKit Frontend                        │
│  ┌──────────┐  ┌──────────┐  ┌──────────┐  ┌──────────┐  │
│  │Caption   │  │Bulk CSV  │  │History   │  │Settings  │  │
│  │Generator │  │Upload    │  │& Analytics│  │          │  │
│  └──────────┘  └──────────┘  └──────────┘  └──────────┘  │
└─────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────┐
│                   Go Backend (Fiber)                         │
│  ┌──────────┐  ┌──────────┐  ┌──────────┐  ┌──────────┐  │
│  │API Routes│  │Auth      │  │Rate Limit│  │Validation │  │
│  └──────────┘  └──────────┘  └──────────┘  └──────────┘  │
│  ┌──────────┐  ┌──────────┐  ┌──────────┐  ┌──────────┐  │
│  │Caption   │  │Cache     │  │Prompt    │  │Billing   │  │
│  │Service   │  │Manager   │  │Builder   │  │Logic     │  │
│  └──────────┘  └──────────┘  └──────────┘  └──────────┘  │
└─────────────────────────────────────────────────────────────┘
         │                │                │
         ▼                ▼                ▼
    ┌────────┐      ┌────────┐      ┌──────────────────┐
    │ Redis  │      │Postgres │      │  OpenAI API     │
    │ Cache  │      │Database │      │  (GPT-4o)       │
    └────────┘      │+Pgvector│      └──────────────────┘
                    └────────┘
```

### Component Details

**Frontend (SvelteKit):**
- TypeScript for type safety
- TailwindCSS for styling
- Vite for fast development
- SSR for SEO optimization

**Backend (Go with Fiber):**
- Fiber v2 (fast HTTP framework)
- GORM for database ORM
- jwt-go for authentication
- go-redis for caching
- openai-go library for API calls

**Database (PostgreSQL):**
- Users table (auth, profile, subscription)
- Captions table (history, analytics)
- Templates table (popular templates)
- Embeddings table (pgvector for semantic search)

**Cache (Redis):**
- Exact match cache (1-day TTL)
- Rate limiting per user
- Session storage
- Queue management for bulk operations

---

## Prompt Engineering

### Caption Generation Prompt Template

```go
type CaptionPrompt struct {
    ProductName    string
    Category       string
    Features       []string
    TargetAudience string
    Tone           string
    Platform       string // "tokopedia", "shopee", "tiktok"
    Language       string // "id", "en"
}

func BuildPrompt(p CaptionPrompt) string {
    return fmt.Sprintf(`
Kamu adalah expert copywriter untuk marketplace Indonesia (Tokopedia/Shopee).

Tugas: Generate caption SEO-optimized untuk produk.

PRODUK:
- Nama: %s
- Kategori: %s
- Fitur: %s
- Target Audience: %s

REQUIREMENTS:
- Platform: %s (optimalkan untuk algoritma platform ini)
- Bahasa: %s (gunakan bahasa gaul/slang yang tepat)
- Tone: %s
- Panjang: 100-200 kata
- SEO: Include 5-10 keywords yang relevan

OUTPUT FORMAT:
1. Headline yang catchy (max 15 kata)
2. Body copy dengan benefit-driven copy
3. Call-to-action yang jelas
4. 5-8 hashtags yang trending dan relevan

TIPS:
- Gunakan emotional words (murah, promo, terbatas, gratis ongkir)
- Include social proof (testimoni, rating)
- Highlight keunggulan vs kompetitor
- Gunakan bullet points untuk fitur
`, p.ProductName, p.Category, strings.Join(p.Features, ", "),
       p.TargetAudience, p.Platform, p.Language, p.Tone)
}
```

---

## MVP Feature Scope

### Phase 1 Features (10-12 weeks)

**Core Features:**
- [ ] Single caption generation (photo upload + keywords)
- [ ] Multi-tone generation (formal, casual, humorous, luxury)
- [ ] Platform optimization (Tokopedia, Shopee, TikTok Shop)
- [ ] Caption history & regeneration
- [ ] Basic analytics (usage, popular templates)

**User Management:**
- [ ] Email/password authentication
- [ ] Subscription management (Midtrans/Xendit)
- [ ] User profile & settings
- [ ] 7-day free trial tracking

**Bulk Operations:**
- [ ] CSV upload (max 100 products)
- [ ] Queue management
- [ ] Bulk download (CSV/JSON)
- [ ] Progress tracking

**Admin Features:**
- [ ] User dashboard
- [ ] Usage analytics
- [ ] Cost monitoring (OpenAI API)
- [ ] Template library management

### Out of Scope (Post-MVP)

- [ ] Marketplace API integrations
- [ ] Browser extension
- [ ] Mobile app
- [ ] Team collaboration features
- [ ] Custom fine-tuned models
- [ ] White-label options

---

## Performance Requirements

### Response Time Targets

| Operation | Target | Acceptable |
|-----------|--------|------------|
| Single caption (cache hit) | <500ms | <1s |
| Single caption (cache miss) | <3s | <5s |
| Bulk 50 products | <2 min | <5 min |
| Bulk 100 products | <5 min | <10 min |

### Scalability Targets

| Metric | MVP (Year 1) | Year 2 | Year 3 |
|--------|--------------|--------|--------|
| Users | 5,000 | 20,000 | 50,000 |
| Captions/month | 500,000 | 3,000,000 | 10,000,000 |
| API calls/day | 17,000 | 100,000 | 330,000 |
| Server capacity | 2 servers | 5 servers | 15 servers |

---

## Security & Privacy

### Data Protection

- **User Data:** Encrypted at rest (PostgreSQL) and in transit (TLS 1.3)
- **API Keys:** Environment variables, never in code
- **Payment:** Midtrans/Xendit tokenization (we never see card details)
- **Session:** JWT with httpOnly cookies

### Rate Limiting

| User Tier | Rate Limit |
|-----------|------------|
| Free Trial | 50 captions/day |
| Paid Subscription | 500 captions/day |
| Fair Use | 1000 captions/day (soft limit) |

### Input Validation

- Sanitize all user inputs (SQL injection prevention)
- Limit product image size (max 5MB)
- Rate limit per user (prevent abuse)
- Content moderation (inappropriate content filtering)

---

## Monitoring & Observability

### Metrics to Track

**Technical Metrics:**
- API response times (p50, p95, p99)
- Cache hit rate
- Error rates (4xx, 5xx)
- OpenAI API costs per user
- Server CPU/memory usage

**Business Metrics:**
- Caption generation success rate
- User caption regeneration rate
- Average captions per user
- Bulk vs single generation ratio

**Tools:**
- Application monitoring: Sentry (errors), DataDog/APM
- Logging: Structured JSON logs
- Uptime monitoring: UptimeRobot
- Cost tracking: Custom dashboard

---

## Development Roadmap

### Phase 1: MVP Development (10-12 weeks)

| Week | Milestone | Deliverables |
|------|-----------|--------------|
| 1-2 | Setup | Go + SvelteKit scaffolding, DB schema |
| 3-4 | Auth | User registration, login, subscription |
| 5-6 | Core Features | Single caption generation, basic UI |
| 7-8 | Bulk Features | CSV upload, queue management |
| 9-10 | Polish | Analytics, history, UI/UX improvements |
| 11-12 | Testing & Launch | QA, beta testing, launch preparation |

### Phase 2: Optimization (3-6 months post-launch)

- Semantic caching implementation
- OpenAI cost optimization
- Performance improvements
- User feedback iterations

### Phase 3: Advanced Features (6-12 months)

- Marketplace API integrations
- Browser extension
- Mobile responsive app
- Custom model fine-tuning

---

## Technical Risks & Mitigations

| Risk | Impact | Probability | Mitigation |
|------|--------|-------------|------------|
| OpenAI API downtime | High | Low | Cache redundancy, fallback models |
| Cost overruns | High | Medium | Aggressive caching, usage limits |
| Poor caption quality | High | Low | Prompt tuning, user feedback loop |
| Slow response times | Medium | Medium | Caching, queue management, scaling |
| Security breach | High | Low | Security audits, penetration testing |
| Dependency lock-in | Medium | High | Modular architecture, model abstraction |

---

## Validation Checklist

- [ ] **OpenAI API prototype built and tested**
- [ ] **Cost analysis validated with real usage data**
- [ ] **Caching PoC shows 70%+ hit rate**
- [ ] **Tech stack compatibility verified**
- [ ] **Performance benchmarks meet targets**
- [ ] **Security review completed**
- [ ] **Monitoring setup implemented**
- [ ] **Deployment pipeline tested (Coolify)**

---

## Key Decisions Log

| Decision | Date | Rationale |
|----------|------|-----------|
| OpenAI GPT-4o for MVP | 2026-01-06 | Fastest time-to-market, excellent quality |
| Go + SvelteKit stack | 2026-01-06 | Team expertise, production-ready |
| PostgreSQL + Redis | 2026-01-06 | Proven stack, good for SaaS |
| Aggressive caching strategy | 2026-01-06 | Reduce costs by 70-90% |
| Oracle Cloud + Coolify | 2026-01-06 | Cost-effective, good experience |

---

## Next Steps

1. ✅ Create technical validation framework
2. ⏳ Build OpenAI API prototype
3. �<arg_value>[Content truncated]
