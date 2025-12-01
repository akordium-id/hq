# 📚 Glossary

Kumpulan istilah teknis dan bisnis yang sering digunakan di Akordium Lab. Untuk memudahkan komunikasi dan understanding antar team members.

## 🖥️ Technical Terms

### **Go (Golang)**

**Definition:** Programming language yang menjadi primary choice Akordium Lab untuk backend development.
**Usage:** "Kita akan implementasi user service menggunakan Go untuk performance yang lebih baik."
**Context:** Known untuk concurrency, performance, dan simplicity.

### **TALL Stack**

**Definition:** Laravel ecosystem dengan Tailwind CSS, Alpine.js, Laravel, dan Livewire.
**Usage:** "WaqfWise dibangun dengan TALL stack untuk rapid development."
**Context:** Modern Laravel development dengan minimal JavaScript.

### **Conventional Commits**

**Definition:** Standard format untuk commit messages yang memud automated versioning dan changelog generation.
**Usage:** "Ikuti conventional commits format: feat, fix, docs, etc."
**Example:** `feat(auth): add JWT token validation`

### **Single Source of Truth (SSOT)**

**Definition:** Prinsip bahwa informasi harus memiliki satu authoritative source.
**Usage:** "GitHub Issues adalah SSOT untuk project communication."
**Context:** Menghindari conflicting information dan documentation drift.

### **AI-Augmented Development**

**Definition:** Development approach yang menggunakan AI tools (Cursor, GitHub Copilot) sebagai pair programming partners.
**Usage:** "Kita gunakan AI-augmented development untuk productivity improvement."
**Context:** AI untuk assistance, bukan replacement.

### **Migration (PHP to Go)**

**Definition:** Proses gradual conversion dari PHP/Laravel codebase ke Go.
**Usage:** "Roadmap migration dari PHP ke Go akan memakan 6-12 bulan."
**Context:** Strategic technology transition.

### **Async-First**

**Definition:** Communication philosophy yang memprioritaskan asynchronous communication over synchronous meetings.
**Usage:** "Kita async-first, jadi tidak perlu immediate response."
**Context:** Support untuk deep work dan timezone flexibility.

## 🏗️ Architecture & Infrastructure

### **Microservices**

**Definition:** Architectural pattern yang membagi aplikasi menjadi small, independent services.
**Usage:** "Kita tidak perlu microservices untuk scale saat ini."
**Context:** Often overused; pragmatic approach preferred.

### **Clean Architecture**

**Definition:** Architectural pattern yang memisahkan business logic dari external dependencies.
**Usage:** "Implementasi menggunakan clean architecture untuk maintainability."
**Context:** Layered approach dengan dependency inversion.

### **Domain-Driven Design (DDD)**

**Definition:** Approach untuk software development berdasarkan business domain knowledge.
**Usage:** "Payment module bisa benefit dari DDD patterns."
**Context:** Useful untuk complex business logic.

### **Infrastructure as Code (IaC)**

**Definition:** Practice mengelola infrastructure melalui code dan automation.
**Usage:** "Coolify membantu kita dengan Infrastructure as Code."
**Context:** Reproducible dan version-controlled infrastructure.

### **Coolify**

**Definition:** PaaS platform yang digunakan Akordium Lab untuk deployment management.
**Usage:** "Deploy ke production melalui Coolify."
**Context:** Self-hosted alternative ke Vercel/Heroku.

## 📊 Business & Product Terms

### **Minimum Viable Product (MVP)**

**Definition:** Versi produk dengan features minimum yang bisa deliver value ke users.
**Usage:** "Kita fokus ke MVP untuk Q1 launch."
**Context:** Market validation dengan minimal investment.

### **SaaS (Software as a Service)**

**Definition:** Business model untuk software distribution dengan subscription model.
**Usage:** "Anggarin akan menjadi SaaS product."
**Context:** Recurring revenue model.

### **Product-Market Fit**

**Definition:** Stage dimana product meets strong market demand.
**Usage:** "WaqfWise sedang mencari product-market fit."
**Context:** Critical untuk sustainable growth.

### **Technical Debt**

**Definition:** Concept dari additional rework caused by choosing easy solution now instead of better approach.
**Usage:** "Kita perlu address technical debt di legacy code."
**Context:** Balance antara speed dan quality.

### **Scalability**

**Definition:** Ability sistem untuk handle growing amount of work.
**Usage:** "Architecture ini harus support scalability."
**Context:** Both technical dan business scaling.

### **User Story**

**Definition:** Informal description software feature dari perspective end user.
**Usage:** "Write user stories untuk next sprint."
**Example:** "As a user, I want to reset my password via email."

## 🔄 Process & Workflow

### **Pull Request (PR)**

**Definition:** Mechanism untuk developer menginformasikan team tentang changes yang sudah siap untuk review.
**Usage:** "Buka PR untuk code review sebelum merge."
**Context:** Code quality dan knowledge sharing.

### **Code Review**

**Definition:** Systematic examination source code oleh peers.
**Usage:** "Code review fokus pada security dan maintainability."
**Context:** Quality assurance dan knowledge transfer.

### **Sprint**

**Definition:** Timeboxed period (biasanya 1-2 minggu) untuk completing development work.
**Usage:** "Kita ada 3 items di sprint ini."
**Context:** Agile development methodology.

### **Backlog**

**Definition:** List dari features, requirements, dan tasks yang perlu dikerjakan.
**Usage:** "Add ini ke product backlog."
**Context:** Prioritization dan planning.

### **Stakeholder**

**Definition:** Person atau organization dengan interest dalam project outcome.
**Usage:** "Meeting dengan stakeholders besok."
**Context:** Business alignment dan expectation management.

### **Deliverable**

**Definition:** Tangible outcome atau result dari project activities.
**Usage:** "Deliverables untuk Q4 sudah finalized."
**Context:** Project management dan expectation setting.

## 🌐 DevOps & Deployment

### **Continuous Integration (CI)**

**Definition:** Practice automatically build dan test code setiap commit.
**Usage:** "GitHub Actions handles CI untuk kita."
**Context:** Automated testing dan validation.

### **Continuous Deployment (CD)**

**Definition:** Practice automatically deploy code ke production setelah passing tests.
**Usage:** "CD pipeline otomatis deploy ke staging."
**Context:** Automated release process.

### **Blue-Green Deployment**

**Definition:** Strategy dengan dua identical production environments.
**Usage:** "Kita gunakan blue-green deployment untuk zero downtime."
**Context:** Risk mitigation dalam production releases.

### **Rollback**

**Definition:** Process mengembalikan sistem ke previous version.
**Usage:** "Rollback plan documented di deployment guide."
**Context:** Disaster recovery dan risk management.

### **Monitoring**

**Definition:** Process observing system health dan performance.
**Usage:** "Set up monitoring untuk production services."
**Context:** System reliability dan incident response.

## 🔧 Database & Storage

### **Migration (Database)**

**Definition:** Controlled way to modify database schema over time.
**Usage:** "Run database migration sebelum deploy."
**Context:** Schema versioning dan consistency.

### **Foreign Key**

**Definition:** Constraint yang links two tables bersama.
**Usage:** "Add foreign key constraint untuk data integrity."
**Context:** Data consistency dan relationships.

### **Indexing**

**Definition:** Data structure yang improves speed of data retrieval operations.
**Usage:** "Add indexing untuk query optimization."
**Context:** Database performance tuning.

### **ORM (Object-Relational Mapping)**

**Definition:** Programming technique untuk converting data between incompatible systems.
**Usage:** "GORM sebagai Go ORM choice kita."
**Context:** Database abstraction dan productivity.

## 🛡️ Security & Performance

### **Authentication vs Authorization**

- **Authentication:** Verifikasi user identity ("siapa Anda")
- **Authorization:** Verifikasi user permissions ("apa yang boleh Anda lakukan")
**Usage:** "Implement authentication dan authorization properly."

### **API Rate Limiting**

**Definition:** Controlling number of API requests dalam time window.
**Usage:** "Add rate limiting untuk API protection."
**Context:** Performance dan security.

### **SQL Injection**

**Definition:** Security vulnerability yang memungkinkan SQL manipulation.
**Usage:** "Prevent SQL injection dengan parameterized queries."
**Context:** Web application security.

### **Cross-Site Scripting (XSS)**

**Definition:** Security vulnerability yang memungkinkan code injection ke websites.
**Usage:** "Sanitize input untuk prevent XSS."
**Context:** Frontend security considerations.

## 📱 Product-Specific Terms

### **WaqfWise**

**Definition:** Islamic endowment management system.
**Usage:** "WaqfWise target market adalah Islamic institutions."
**Context:** Product portfolio dalam fintech sector.

### **Anggarin**

**Definition:** Personal finance planning application.
**Usage:** "Anggarin helps users track expenses dan plan savings."
**Context:** Product portfolio dalam personal finance.

### **Atribuo**

**Definition:** Real-life RPG skill visualization platform.
**Usage:** "Atribuo gamifies personal development."
**Context:** Product portfolio dalam edutainment.

### **SnapKasir**

**Definition:** Point of sale system untuk small businesses.
**Usage:** "SnapKasir focuses pada Indonesian SME market."
**Context:** Product portfolio dalam retail tech.

## 🤝 Team & Culture

### **Pair Programming**

**Definition:** Two programmers working together pada satu computer.
**Usage:** "AI pair programming dengan Cursor."
**Context:** Collaborative development dan knowledge sharing.

### **Knowledge Sharing**

**Definition:** Practice distributing information dan expertise dalam team.
**Usage:** "Weekly knowledge sharing sessions."
**Context:** Team development dan innovation.

### **Onboarding**

**Definition:** Process integrating new employee ke organization.
**Usage:** "Onboarding process takes 1 minggu."
**Context:** Employee experience dan productivity ramp-up.

### **Retrospective**

**Definition:** Meeting untuk reflect pada completed work process.
**Usage:** "Sprint retrospective membahas what went well."
**Context:** Continuous improvement dan team learning.

## 📝 Documentation Terms

### **README**

**Definition:** Documentation file yang explains project purpose dan usage.
**Usage:** "Update README dengan latest setup instructions."
**Context:** Project documentation standard.

### **API Documentation**

**Definition:** Technical documentation yang explains API usage.
**Usage:** "API documentation must be kept up-to-date."
**Context:** Developer experience dan integration.

### **Change Log**

**Definition:** File yang records all notable changes ke project.
**Usage:** "Add entry ke CHANGELOG.md untuk setiap release."
**Context:** Version tracking dan communication.

### **Wiki**

**Definition:** Collaborative knowledge base untuk team information.
**Usage:** "GitHub Wiki sebagai team knowledge base."
**Context:** Centralized information storage.

---

## 🔍 Usage Guidelines

### **Acronyms in Communication**

- Use full terms saat first introduction
- Use acronyms setelah established understanding
- Ask clarification jika unsure

### **Context-Dependent Terms**

- Be aware technical terms mungkin berbeda artinya di domain lain
- Confirm understanding dalam cross-functional discussions
- Provide examples untuk complex concepts

### **Language Preferences**

- **Bahasa Indonesia:** User-facing communication, internal team discussions
- **Bahasa Inggris:** Technical documentation, code comments, API terms
- **Mixed:** Natural flow dengan industry-standard terms

---

## 🆘 Getting Help

If Anda encounter istilah yang tidak familiar:

1. **Check this glossary** - Might already defined
2. **Search GitHub Issues** - Mungkin pernah dibahas
3. **Ask in team channel** - Others might have similar questions
4. **Suggest additions** - Help us improve this resource

**Remember:** No stupid questions! Learning terminology adalah bagian dari onboarding process. 🎓

---

*Glossary ini akan terus diupdate seiring perkembangan technology dan business needs.*
