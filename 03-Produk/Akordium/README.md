# 🔌 Akordium

> Dashboard Marketplace Terintegrasi untuk Ekosistem Produk Digital Akordium

## 🏷️ Product Identity

- **Nama Produk:** Akordium
- **Status:** 🚧 In Development
- **Repo Code:** `github.com/akordium/akordium` (Private)
- **Live Site:** https://akordium.id
- **Staging:** https://staging.akordium.id
- **Project Management:** [Link ke GitHub Project Board]
- **Product Type:** Internal Distribution Hub & SSO Platform

## 📋 Quick Overview

**Tagline:** Unified Dashboard untuk Semua Produk & Layanan Digital Akordium

**Deskripsi Singkat:** Platform marketplace internal Akordium yang mengintegrasikan semua produk digital (WaqfWise, Anggarin, Atribuo, SnapKasir, dll.) dengan sistem Single Sign-On (SSO), cross-selling engine, affiliate program, dan blockchain-based lifetime licensing melalui NFT. Berfungsi sebagai central hub untuk distribution, analytics, dan customer lifetime value maximization.

**Target Market:**

- **Primary:** Internal pengguna semua produk Akordium (cross-selling opportunity)
- **Secondary:** Affiliate promoters dan partners yang menjual produk Akordium
- **Tertiary:** Enterprise clients yang membutuhkan integrated solution multiple products
- **Quaternary:** Web3/crypto savvy users yang interested dengan NFT-based licensing

**7 Fitur Utama:**

1. **Unified Login (SSO)** - Single sign-on untuk semua produk Akordium dengan satu akun terintegrasi
2. **Cross-Selling Dashboard** - AI-powered product recommendations berdasarkan usage pattern (user Anggarin dapat rekomendasi Nanabung untuk habit tracking)
3. **Affiliate Program** - Commission system untuk promoters dan partners dengan multi-tier commissions
4. **Blockchain-Based Licensing** - NFT-based lifetime access untuk premium products (transferable, resellable)
5. **AI Recommendation Engine** - Smart product suggestions berdasarkan user behavior dan needs analysis
6. **Integrated Payment Gateway** - Support crypto (USDT, ETH, BTC) + fiat gateway (Midtrans, Xendit)
7. **Centralized Analytics** - Business intelligence dashboard untuk semua product metrics dalam satu view

**Fitur Tambahan (Post-MVP):**

- **Community Forum** - Integrated Q&A dan knowledge sharing antar users
- **Gamification System** - Points, badges, leaderboards untuk engagement
- **API Marketplace** - Third-party integrations dan extensions
- **White-Label Solution** - Custom branded dashboard untuk enterprise clients

**Problem yang Diselesaikan:**

- **Fragmented User Experience:** Users harus login ke multiple platforms dengan credentials berbeda
- **Missed Cross-Selling Opportunities:** Tidak ada mechanism untuk recommend produk relevan ke existing users
- **Low Customer LTV:** Users churn setelah menggunakan satu produk tanpa mengetahui produk lain
- **Manual Affiliate Management:** Tidak ada automated system untuk promoter commissions dan tracking
- **Scattered Analytics:** Business data tersebar di multiple platforms tanpa unified view
- **Traditional Licensing Limitations:** Subscription-based model tidak menawarkan ownership atau transferability

## 🛠 Tech Stack

### Backend

- **Framework/Language:** Hono (Edge Runtime on Cloudflare Workers)
- **Language:** TypeScript 5+
- **Database:** PostgreSQL 16 (Neon DB - Serverless)
- **ORM:** Drizzle ORM
- **API:** RESTful + GraphQL (optional)

### Frontend

- **Framework:** SvelteKit 2 (Server-Side Rendering + Client-Side Navigation)
- **Component Library:** shadcn-svelte + Skeleton UI
- **Styling:** Tailwind CSS 3
- **State Management:** Svelte Stores + SvelteKit Actions
- **Real-time:** Server-Sent Events (SSE) / WebSockets
- **Blockchain Integration:** Ethers.js v6 / viem untuk NFT interactions

### Infrastructure

- **Edge Runtime:** Cloudflare Workers (Hono deployment)
- **Hosting:** Cloudflare Pages (Frontend)
- **Database:** Neon DB (Serverless PostgreSQL)
- **Storage:** Cloudflare R2 (Decentralized storage)
- **CDN:** Cloudflare Global Network
- **Deployment:** Coolify + Cloudflare Pages CI/CD

### Third-party Services

- **Payment Gateways:**
  - **Midtrans** - Fiat payments (GoPay, OVO, DANA, Credit Cards)
  - **Xendit** - Alternative fiat gateway
  - **Crypto Payments:** MetaMask, WalletConnect (USDT, ETH, BTC)
- **Blockchain Services:**
  - **Polygon (MATIC)** - Layer-2 Ethereum untuk NFT licensing (ERC-721/ERC-1155)
  - **IPFS/Pinata** - Decentralized storage untuk NFT metadata
  - **Alchemy/Infura** - Blockchain node providers
- **AI/ML Services:**
  - **OpenAI API** - Recommendation engine dan natural language processing
  - **TensorFlow.js** - Client-side ML untuk real-time suggestions
- **Communication:**
  - **SendGrid** - Transactional emails
  - **Twilio** - SMS notifications (optional)
- **Analytics:**
  - **Google Analytics 4** - User behavior tracking
  - **PostHog** - Product analytics dan session recording
  - **Custom Analytics** - Business intelligence dashboard

### Integration Architecture

**SSO Implementation:**
- **Protocol:** OAuth 2.0 + OpenID Connect
- **Token Management:** JWT dengan refresh token rotation
- **Session Storage:** Cloudflare Workers KV
- **Security:** PKCE flow untuk public clients

**Cross-Product Communication:**
- **API Gateway:** Hono sebagai central API layer
- **Webhooks:** Real-time sync antar produk (user registration, subscription changes)
- **Event Bus:** Cloudflare Queues untuk async event processing
- **Data Sync:** Scheduled jobs untuk aggregate product metrics

## 💻 Local Development Setup

### Prerequisites

- [ ] Node.js 20+ (LTS)
- [ ] pnpm 8+ (recommended) atau npm 10+
- [ ] PostgreSQL 16 (atau Docker)
- [ ] Cloudflare Workers account (free tier OK)
- [ ] MetaMask / Wallet extension (untuk NFT testing)

### Installation Steps

1. **Clone repository**

   ```bash
   git clone https://github.com/akordium/akordium.git
   cd akordium
   ```

2. **Install dependencies**

   ```bash
   pnpm install
   # atau
   npm install
   ```

3. **Environment setup**

   ```bash
   cp .env.example .env
   # Edit .env file dengan konfigurasi lokal
   ```

   **Required environment variables:**

   ```env
   # Database
   DATABASE_URL="postgresql://user:password@localhost:5432/akordium_dev"

   # SSO Secrets
   SSO_JWT_SECRET="your-super-secret-jwt-key"
   SSO_REFRESH_SECRET="your-refresh-token-secret"

   # OAuth Providers (untuk social login)
   GOOGLE_CLIENT_ID="your-google-client-id"
   GOOGLE_CLIENT_SECRET="your-google-client-secret"

   # Payment Gateways
   MIDTRANS_SERVER_KEY="your-midtrans-server-key"
   MIDTRANS_CLIENT_KEY="your-midtrans-client-key"

   # Blockchain (Optional untuk development)
   NEXT_PUBLIC_POLYGON_TESTNET_RPC="https://rpc-mumbai.maticvigil.com"
   PRIVATE_KEY="your-wallet-private-key" # Hanya untuk development!

   # AI Services
   OPENAI_API_KEY="your-openai-api-key"

   # Cloudflare
   CLOUDFLARE_ACCOUNT_ID="your-account-id"
   CLOUDFLARE_API_TOKEN="your-api-token"
   ```

4. **Database setup**

   ```bash
   # Jalankan PostgreSQL (jika menggunakan Docker)
   docker-compose up -d postgres

   # Run migrations
   pnpm db:migrate

   # Seed data
   pnpm db:seed
   ```

5. **Start development server**

   ```bash
   # Terminal 1 - Backend (Hono on Cloudflare Workers)
   pnpm dev:backend

   # Terminal 2 - Frontend (SvelteKit)
   pnpm dev:frontend
   ```

6. **Aplikasi berjalan di:** http://localhost:5173

### Development Commands

```bash
# Install dependencies
pnpm install

# Run development servers
pnpm dev              # Both frontend + backend
pnpm dev:frontend     # SvelteKit only
pnpm dev:backend      # Hono workers only

# Database operations
pnpm db:migrate       # Run migrations
pnpm db:generate      # Generate migrations
pnpm db:push          # Push schema changes
pnpm db:studio        # Open Drizzle Studio

# Testing
pnpm test             # Run all tests
pnpm test:unit        # Unit tests only
pnpm test:e2e         # End-to-end tests
pnpm test:coverage    # Coverage report

# Type checking
pnpm type-check       # TypeScript type checking

# Linting & Formatting
pnpm lint             # ESLint
pnpm format           # Prettier

# Build for production
pnpm build            # Build both frontend + backend
pnpm build:frontend   # SvelteKit build only
pnpm build:backend    # Hono workers build only

# Deployment
pnpm deploy:staging   # Deploy to staging
pnpm deploy:prod      # Deploy to production
```

### Project Structure

```
akordium/
├── apps/
│   ├── web/                  # SvelteKit frontend
│   │   ├── src/
│   │   │   ├── routes/       # SvelteKit file-based routing
│   │   │   ├── lib/          # Shared utilities
│   │   │   └── components/   # Svelte components
│   │   └── package.json
│   └── api/                  # Hono backend
│       ├── src/
│       │   ├── routes/       # API routes
│       │   ├── services/     # Business logic
│       │   └── middleware/   # Auth, CORS, etc.
│       └── package.json
├── packages/
│   ├── database/             # Drizzle schema & migrations
│   ├── ui/                   # Shared UI components
│   ├── config/               # Shared configuration (TSConfig, ESLint)
│   └── types/                # Shared TypeScript types
├── docker-compose.yml        # Local development services
├── turbo.json                # Turborepo configuration
└── package.json              # Root package.json
```

## 🧪 Testing

### Test Suite

- **Framework:** Vitest (Unit), Playwright (E2E)
- **Coverage Target:** 85%
- **Test Types:**
  - Unit Tests: Services, utilities, helpers
  - Integration Tests: API endpoints, database operations
  - E2E Tests: Critical user journeys (login, purchase, affiliate signup)
  - Contract Tests: SSO integration dengan external products

### Running Tests

```bash
# Run semua tests
pnpm test

# Run unit tests
pnpm test:unit

# Run e2e tests
pnpm test:e2e

# Run dengan coverage
pnpm test:coverage

# Run tests di watch mode
pnpm test:watch

# Run specific test file
pnpm test tests/services/auth.test.ts
```

### Testing Strategy

**SSO Testing:**
- Mock OAuth providers untuk local testing
- Test JWT generation, validation, refresh token rotation
- Test cross-product authentication flow

**NFT Testing:**
- Local blockchain testing dengan Hardhat network
- Mock NFT contracts untuk development
- Test minting, transferring, burning NFT licenses

**Payment Testing:**
- Midtrans Sandbox environment
- Mock payment gateway untuk unit tests
- Test success, failure, refund scenarios

## 🚢 Deployment

### Environments

- **Development:** Local dengan Docker Compose
- **Staging:** Cloudflare Workers + Pages (auto-deploy dari branch `develop`)
- **Production:** Cloudflare Workers + Pages (auto-deploy dari branch `main`)

### Deployment Process

**1. Automatic Deployment** (via Coolify + Cloudflare Pages)

```yaml
# Pada push ke branch:
develop → Staging environment (auto-deploy)
main    → Production environment (auto-deploy)
```

**2. Manual Deployment** (jika perlu)

```bash
# Build untuk production
pnpm build

# Deploy ke Cloudflare Pages
pnpm deploy:prod

# Deploy ke Cloudflare Workers
pnpm deploy:backend
```

**3. Environment-Specific Configuration**

```bash
# Staging
pnpm deploy:staging

# Production
pnpm deploy:prod
```

### Database Migration Strategy

**Development:**
```bash
pnpm db:migrate    # Apply migrations
pnpm db:generate   # Create new migration
```

**Production:**
- Migrations run automatically pada deployment via Cloudflare Workers Cron
- Rollback capability dengan migration versioning
- Backup sebelum major migrations

### Environment Variables

**Production Required Variables:**

- `DATABASE_URL` - PostgreSQL connection string (Neon DB)
- `SSO_JWT_SECRET` - JWT signing secret (use strong random string)
- `SSO_REFRESH_SECRET` - Refresh token secret
- `CLOUDFLARE_ACCOUNT_ID` - Cloudflare account ID
- `CLOUDFLARE_API_TOKEN` - Cloudflare API token
- `MIDTRANS_SERVER_KEY` - Midtrans production key
- `OPENAI_API_KEY` - OpenAI API key untuk recommendations
- `NEXT_PUBLIC_POLYGON_MAINNET_RPC` - Polygon mainnet RPC
- `PRIVATE_KEY` - Wallet private key (use environment-specific wallet)

**Staging Variables:**
- Gunakan sandbox/testnet versions untuk payment dan blockchain
- Separate database instance
- Test JWT secrets

**Secret Management:**
- Semua secrets disimpan di Cloudflare Workers Secrets
- Tidak ada hardcoded secrets di codebase
- Rotate secrets setiap 90 hari
- Use Cloudflare WorkersKV untuk sensitive runtime data

### CI/CD Pipeline

```yaml
# .github/workflows/deploy.yml
name: Deploy

on:
  push:
    branches: [main, develop]

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - Checkout code
      - Setup Node.js
      - Install dependencies (pnpm install)
      - Run tests (pnpm test)
      - Build apps (pnpm build)
      - Deploy to Cloudflare (wrangler deploy)
```

## 📊 Key Metrics & Monitoring

### Business Metrics

- [ ] **Total Registered Users:** Target 1,000+ users (Month 3)
- [ ] **Active Users (MAU):** Target 60% monthly active users
- [ ] **Cross-Sell Conversion Rate:** Target 15% dari existing users purchase produk kedua
- [ ] **Average Revenue Per User (ARPU):** Target Rp 150,000/user/month
- [ ] **Customer Lifetime Value (LTV):** Target 3x increase dari single-product users
- [ ] **Affiliate Active Promoters:** Target 100+ active affiliates (Month 6)
- [ ] **NFT Licenses Sold:** Target 50+ lifetime licenses sold (Month 6)
- [ ] **Crypto Payment Adoption:** Target 10% dari total transactions via crypto (Year 1)

### Technical Metrics

- [ ] **Response Time:** < 200ms average (Edge runtime advantage)
- [ ] **Uptime:** 99.9% uptime (Cloudflare SLA)
- [ ] **Error Rate:** < 0.5% error rate
- [ ] **Time to Interactive (TTI):** < 3 seconds on 4G
- [ ] **Database Performance:** < 50ms query time (Neon serverless)
- [ ] **SSO Login Time:** < 1 second dari click ke authenticated session
- [ ] **NFT Minting Time:** < 30 seconds dari payment ke NFT di wallet

### Monitoring Setup

- **Error Tracking:** Sentry (Cloudflare Workers integration)
- **Performance Monitoring:** Cloudflare Analytics + Web Vitals
- **Uptime Monitoring:** UptimeRobot + custom health checks
- **Business Metrics Dashboard:** Custom Grafana dashboard dengan Postgres data source
- **Real-time Analytics:** PostHog untuk user behavior tracking
- **Blockchain Monitoring:** Alchemy Notify untuk NFT transfer events

### Key Health Checks

```typescript
// /api/health endpoint
{
  "status": "healthy",
  "timestamp": "2026-01-06T10:00:00Z",
  "services": {
    "database": "healthy",
    "redis": "healthy", // Cloudflare KV
    "blockchain": "healthy", // Polygon RPC
    "payment_gateway": "healthy"
  },
  "metrics": {
    "response_time_ms": 45,
    "memory_usage_mb": 128,
    "cpu_usage_percent": 12
  }
}
```

## 🔐 Security

### Security Architecture

**SSO Security:**
- [ ] **OAuth 2.0 + OpenID Connect** - Standard protocol untuk SSO
- [ ] **JWT dengan RS256** - Asymmetric encryption untuk token signing
- [ ] **Refresh Token Rotation** - Prevent token reuse attacks
- [ ] **PKCE Flow** - Untuk public clients (mobile, SPA)
- [ ] **Token Expiration** - Access token: 15 min, Refresh token: 7 days

**Data Protection:**
- [ ] **Encryption at Rest** - Neon DB encryption, Cloudflare R2 encryption
- [ ] **Encryption in Transit** - HTTPS enforced, TLS 1.3
- [ ] **PII Data Hashing** - User passwords, sensitive data hashed dengan bcrypt
- [ ] **API Key Management** - Rotate API keys setiap 90 hari

**Application Security:**
- [ ] **Rate Limiting** - Cloudflare Workers rate limiting (100 req/min per IP)
- [ ] **CORS Configuration** - Whitelist allowed origins
- [ ] **Input Validation** - Zod schema validation untuk semua API inputs
- [ ] **SQL Injection Prevention** - Drizzle ORM parameterized queries
- [ ] **XSS Prevention** - SvelteKit automatic escaping, CSP headers

**Blockchain Security:**
- [ ] **Wallet Key Management** - Private keys di Cloudflare Workers Secrets, never di codebase
- [ ] **NFT Contract Security** - Audited OpenZeppelin contracts
- [ ] **Reentrancy Protection** - ReentrancyGuard pada semua payable functions
- [ ] **Access Control** - OnlyAdmin modifier untuk sensitive functions

### Security Checklist

- [x] HTTPS enforced (Cloudflare SSL)
- [x] Environment variables secured (Cloudflare Workers Secrets)
- [x] Database connections encrypted (Neon DB TLS)
- [x] User passwords hashed (bcrypt, cost factor 12)
- [x] API rate limiting implemented (Cloudflare Workers)
- [x] CORS properly configured (whitelist only)
- [x] CSP headers set (prevent XSS)
- [x] JWT tokens signed dengan RS256
- [x] Refresh token rotation enabled
- [x] Webhook signature verification (Midtrans, payment gateways)
- [ ] Security audit scheduled (Quarterly)
- [ ] Penetration testing (Bi-annual)

### Compliance

**Data Privacy:**
- **PDPA Compliance** - Personal data protection sesuai Indonesian law
- **Data Retention** - User data retained selama 3 years setelah account closure
- **Right to Deletion** - GDPR-style data deletion requests

**Financial Compliance:**
- **Payment Card Industry (PCI)** - Midtrans/Xendit handled PCI compliance
- **Anti-Money Laundering (AML)** - KYC requirements untuk large transactions
- **Tax Reporting** - Generate NPWP compliant invoices

**Blockchain Compliance:**
- **SEC Regulations** - NFT classified sebagai digital goods, bukan securities
- **Smart Contract Audits** - Third-party audit sebelum mainnet deployment

## 💰 Pricing & Licensing

### Business Model

**Indirect Monetization:**
- Akordium platform tidak menghasilkan revenue langsung
- Berfungsi sebagai distribution hub untuk semua produk Akordium
- Revenue generated dari individual product subscriptions
- Strategic value: Increase LTV, cross-selling, data centralization

### Product Pricing (via Akordium Platform)

**Subscription-Based Products (Traditional):**
- **WaqfWise:** Rp 500,000 - Rp 5,000,000/month
- **Anggarin:** Rp 50,000 - Rp 200,000/month
- **SnapKasir:** Rp 300,000 - Rp 1,500,000/month
- **Atribuo:** Rp 75,000 - Rp 300,000/month

**NFT-Based Lifetime Licenses (NEW):**
- **WaqfWise Lifetime:** Rp 15,000,000 (one-time, transferable NFT)
- **Anggarin Lifetime:** Rp 2,500,000 (one-time, transferable NFT)
- **SnapKasir Lifetime:** Rp 10,000,000 (one-time, transferable NFT)
- **Atribuo Lifetime:** Rp 3,000,000 (one-time, transferable NFT)

**Benefits of NFT Licensing:**
- **Transferability** - Users dapat resell licenses di secondary market
- **Ownership** - True ownership berbasis blockchain, bukan subscription
- **Resale Royalties** - Akordium receives 5% royalty setiap secondary sale
- **Appreciation** - NFT dapat increase in value jika product demand tinggi
- **No Vendor Lock-in** - Users dapat exit dengan reselling license

### Affiliate Program

**Commission Structure:**
- **Tier 1 (Direct Referral):** 30% commission pada first sale
- **Tier 2 (Sub-affiliate):** 10% commission pada sub-affiliate sales
- **Lifetime Recurring:** 10% recurring commission untuk subscription products
- **NFT License Bonus:** 5% extra commission untuk NFT license sales

**Payout Methods:**
- Bank Transfer (BCA, Mandiri, BNI)
- Crypto (USDT on Polygon)
- Wallet Credit (untuk purchase produk Akordium)

**Affiliate Tiers:**
- **Bronze:** Rp 0 - Rp 5,000,000 total sales (30% commission)
- **Silver:** Rp 5,000,000 - Rp 25,000,000 total sales (35% commission)
- **Gold:** Rp 25,000,000+ total sales (40% commission + exclusive perks)

### Marketplace Fees

**Third-Party Sellers (Future):**
- **Listing Fee:** Rp 500,000/product (one-time)
- **Transaction Fee:** 15% per sale
- **Payment Processing:** 2.9% + Rp 2,000 (Midtrans fee)
- **Payout:** Weekly ke bank account

## 📚 Documentation

### Internal Documentation

- **Technical Specs:** [link ke technical documentation]
- **API Documentation:** [link ke API docs - Postman/Insomnia]
- **Database Schema:** [link ke database ERD]
- **Deployment Guide:** [link ke deployment SOP]
- **SSO Integration Guide:** [link ke SSO setup docs]

### User Documentation

- **User Guide:** [link ke user guide]
- **Product Documentation:** [link ke individual product docs]
- **FAQ:** [link ke FAQ]
- **Video Tutorials:** [link ke video tutorials]
- **Blockchain Guide:** [link ke NFT wallet setup guide]

### Developer Documentation

- **Integration Guide:** Cara integrate produk Akordium dengan SSO
- **Webhook Documentation:** Event-based communication spec
- **API Examples:** Code samples untuk common integrations
- **Smart Contract Docs:** NFT contract architecture dan functions

## 🤝 Team & Roles

### Development Team

- **Tech Lead:** Najib (Backend, Architecture, Smart Contracts)
- **Frontend Developer:** [Nama] (SvelteKit, UI/UX Implementation)
- **Blockchain Developer:** [Nama] (Smart Contracts, NFT Integration)
- **DevOps Engineer:** [Nama] (Cloudflare Infrastructure, CI/CD)

### External Stakeholders

- **Product Owner:** [Nama] (Business Requirements, Roadmap)
- **UI/UX Designer:** [Nama] (Design System, User Experience)
- **QA Engineer:** [Nama] (Testing, Quality Assurance)
- **Compliance Officer:** [Nama] (Legal, Security, Financial Regulations)

## 🆘 Support & Troubleshooting

### Common Issues

1. **SSO Login Failed**
   - Solution: Check JWT configuration, verify OAuth provider credentials, check token expiration

2. **NFT Tidak Muncul di Wallet**
   - Solution: Verify Polygon RPC URL, check wallet network (testnet vs mainnet), confirm transaction status

3. **Payment Gateway Timeout**
   - Solution: Check Midtrans/Xendit API status, verify webhook endpoint is accessible, check timeout configuration

4. **Database Connection Error**
   - Solution: Verify Neon DB connection string, check IP whitelist, ensure database is active

5. **Deployment Failed pada Cloudflare**
   - Solution: Check Cloudflare Workers logs, verify environment variables, ensure build is successful

### Getting Help

- **Slack Channel:** #akordium-development
- **Emergency Contact:** +62 815-9988-995 (WhatsApp)
- **Documentation:** [link ke troubleshooting guide]
- **Issue Tracker:** GitHub Issues

## 📈 Roadmap & Milestones

Lihat [roadmap.md](./roadmap.md) untuk detail perkembangan produk Akordium.

### High-Level Timeline

**Phase 1: Foundation (M1-M3)**
- M1: SSO implementation + basic authentication
- M2: Product catalog + basic dashboard
- M3: Payment integration (Midtrans)

**Phase 2: Integration (M4-M6)**
- M4: Cross-selling engine + affiliate program
- M5: NFT licensing system (testnet)
- M6: AI recommendation engine

**Phase 3: Advanced Features (M7-M10)**
- M7: Analytics dashboard + business intelligence
- M8: NFT marketplace + secondary trading
- M9: Community features + gamification
- M10: Enterprise features + white-label solution

## 🔄 Changelog

Lihat [changelog.md](./changelog.md) untuk riwayat perubahan Akordium.

## 🐛 Known Issues

Lihat [known-issues.md](./known-issues.md) untuk daftar bug dan limitation yang diketahui.

## 🔗 Blockchain Integration

### NFT-Based Lifetime Licensing

**Why NFT for Licensing:**
- **True Ownership:** Users memiliki real ownership, bukan subscription rental
- **Transferability:** License dapat dijual ke user lain (secondary market)
- **Resale Royalties:** Akordium receives 5% royalty setiap secondary sale (passive income)
- **Appreciation Potential:** NFT dapat increase in value
- **No Vendor Lock-in:** Users dapat exit dan recover value dari license
- **Transparency:** Blockchain provides proof of ownership dan transfer history

**How It Works:**

1. **Purchase Flow:**
   - User selects lifetime license di Akordium dashboard
   - Payment via crypto (USDT) atau fiat (Midtrans → auto-convert ke crypto)
   - System mints NFT on Polygon blockchain (ERC-721 standard)
   - NFT transferred ke user wallet (MetaMask, WalletConnect)

2. **License Verification:**
   - User connects wallet ke Akordium dashboard
   - System verifies NFT ownership via blockchain query
   - If NFT detected → unlock lifetime access ke product
   - Verification cached untuk 24 hours (reduce RPC calls)

3. **Resale Process:**
   - User lists NFT di integrated marketplace (OpenSea, Rarible, atau internal marketplace)
   - Buyer purchases NFT → NFT transferred ke buyer wallet
   - Smart contract sends 5% royalty ke Akordium wallet
   - Buyer connects wallet → automatic lifetime access
   - Seller's access revoked setelah NFT transfer

**Smart Contract Features:**

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract AkordiumLicense is ERC721, Ownable {
    // 5% royalty untuk secondary sales
    uint256 public royaltyPercentage = 500; // 5% in basis points

    struct License {
        uint256 id;
        string product;  // e.g., "WaqfWise", "Anggarin"
        uint256 pricePaid; // Original purchase price (in USDT)
        uint256 purchaseDate;
        address originalBuyer;
    }

    mapping(uint256 => License) public licenses;

    function mintLicense(
        address to,
        uint256 tokenId,
        string memory product
    ) external onlyOwner {
        _mint(to, tokenId);
        licenses[tokenId] = License({
            id: tokenId,
            product: product,
            pricePaid: 0, // Set oleh frontend
            purchaseDate: block.timestamp,
            originalBuyer: to
        });
    }

    function getLicense(uint256 tokenId)
        external
        view
        returns (License memory)
    {
        require(_exists(tokenId), "License does not exist");
        return licenses[tokenId];
    }
}
```

**Cost Analysis (Polygon Mainnet):**

- **Gas Fee Minting:** ~$0.10 - $0.50 per NFT
- **Gas Fee Transfer:** ~$0.05 - $0.20 per transaction
- **Total Cost per License:** < $1 (vs $15,000,000 revenue)
- **ROI:** Excellent (99.99%+ profit margin)

**Environmental Impact:**
- Polygon uses Proof-of-Stake (PoS)
- 99.9% more energy-efficient than Ethereum PoW
- Carbon-neutral commitment dari Polygon Foundation

---

**Last Updated:** 2026-01-06
**Version:** 0.1.0-alpha (MVP Scope: M1-M6 - 6 months)
**Maintainer:** Najib Zain (Lead Developer)

**MVP Timeline:**
- **M3 (12 weeks):** MVP Foundation - SSO, product catalog, payments
- **M6 (24 weeks):** Complete MVP - Affiliate, NFT licensing, AI recommendations
- **M7-M10:** Advanced Features - Marketplace, analytics, community, enterprise

---

## 🎯 Strategic Value

### Why Build Akordium?

**1. Increase Customer Lifetime Value (LTV)**
- Single user membeli multiple products (cross-selling)
- NFT licensing creates asset ownership (users less likely untuk churn)
- Average LTV increase: 3x dari single-product users

**2. Centralized Business Intelligence**
- Unified analytics dari semua produk
- Cross-product user behavior insights
- Better decision making dengan comprehensive data

**3. Reduce Customer Acquisition Cost (CAC)**
- Cross-selling ke existing users (zero CAC)
- Affiliate program leverages community marketing
- NFT secondary market provides organic distribution

**4. Competitive Advantage**
- No competitors offering unified dashboard untuk multiple products
- NFT licensing is innovative di Indonesian SaaS market
- AI-powered recommendations provide superior UX

**5. Future-Proof Business Model**
- Web3 integration positions Akordium sebagai tech leader
- Resale royalties provide passive income stream
- Platform-independent dari single-product success

### Success Metrics

**Year 1 Targets:**
- 1,000+ registered users
- Rp 150,000,000+ revenue (via product sales)
- 15% cross-sell conversion rate
- 100+ active affiliates
- 50+ NFT licenses sold
- 3x LTV increase vs single-product users

**Year 3 Targets:**
- 10,000+ registered users
- Rp 2,000,000,000+ cumulative revenue
- 1,000+ active affiliates
- 1,000+ NFT licenses in circulation
- Secondary market volume: Rp 500,000,000+

---

## 📞 Contact & Support

**For Users:**
- Email: support@akordium.id
- WhatsApp: +62 815-9988-995
- Documentation: https://docs.akordium.id

**For Partners & Affiliates:**
- Email: partners@akordium.id
- Program: https://akordium.id/affiliates

**For Developers:**
- GitHub: https://github.com/akordium/akordium
- API Docs: https://api.akordium.id/docs
- Status Page: https://status.akordium.id

---

**Built with ❤️ by Akordium Lab**
