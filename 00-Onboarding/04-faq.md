# ❓ FAQ New Hire

Kumpulan pertanyaan yang sering diajukan oleh new hires di Akordium Lab. Jika Anda tidak menemukan jawaban yang Anda cari, jangan ragu untuk bertanya di team channel!

## 🖥️ Technical & Development

### **Q: Stack teknologi apa yang digunakan di Akordium Lab?**
**A:** Kami menggunakan mixed stack dengan transisi ongoing:
- **Backend:** Go (primary), PHP/Laravel (legacy & migration)
- **Frontend:** Next.js, React (TypeScript)
- **Database:** PostgreSQL (migrating dari MySQL)
- **Infrastructure:** Oracle Cloud + Coolify
- **Tools:** Cursor IDE, GitHub Copilot, Docker

### **Q: Saya baru di Go, apa yang harus saya pelajari?**
**A:** Welcome! Go adoption adalah strategi kami. Mulai dengan:
- Go Tour (official tutorial)
- Understanding Go project structure (`cmd/`, `internal/`, `pkg/`)
- Error handling patterns di Go
- Context untuk concurrent operations
- Interface-based design

### **Q: Apakah masih perlu menguasai PHP/Laravel?**
**A:** Ya, untuk sementara. Kami masih maintain beberapa Laravel projects dan sedang dalam proses migrasi. PHP knowledge penting untuk:
- Understanding existing codebase
- Migration planning
- Legacy maintenance
- Gradual transition to Go

### **Q: Bagaimana dengan database development?**
**A:** Kami menggunakan PostgreSQL dengan conventions:
- Snake_case untuk table dan column names
- Proper foreign key constraints
- Strategic indexing
- Migration files untuk schema changes

## 🔄 Workflow & Process

### **Q: Bagaimana cara kerja async di sini?**
**A:** Async-first artinya:
- Tidak perlu immediate response
- Fokus pada well-documented communication
- Use GitHub Issues untuk tracking
- Written updates > verbal discussions
- Respect deep work time

### **Q: Kapan saya harus menggunakan meeting vs async?**
**A:** Gunakan async untuk:
- Updates dan progress reports
- Technical discussions yang documented
- Code review comments
- Planning documents

Gunakan meeting untuk:
- Complex problem solving
- Team bonding
- Client discussions
- Brainstorming sessions

### **Q: Bagaimana code review process di sini?**
**A:**
- Setiap PR memerlukan minimum 1 approval
- Gunakan PR template untuk consistency
- Focus pada code quality, security, dan maintainability
- Be constructive dalam feedback
- Squash and merge untuk clean history

### **Q: Apa itu "If it's not in the repo, it didn't happen"?**
**A:** Ini philosophy kami:
- Documentation adalah bagian dari pekerjaan
- Keputusan penting harus didokumentasikan
- GitHub Issues = single source of truth
- Email/chat untuk urgent matters only

## 🛠️ Tools & Access

### **Q: Tools apa saja yang saya butuhkan?**
**A:**
- **Editor:** Cursor IDE (with AI features)
- **Version Control:** Git + GitHub
- **Development:** Go, Node.js LTS, Docker
- **Database:** PostgreSQL client (DBeaver/Postico)
- **Communication:** Email, WhatsApp/Telegram

### **Q: Apa itu Cursor dan kenapa wajib digunakan?**
**A:** Cursor adalah VS Code fork dengan AI integration:
- Built-in AI pair programming
- Better code completion
- Natural language code generation
- Standardized development environment
- Disediakan license oleh perusahaan

### **Q: Bagaimana cara akses ke production?**
**A:** Production access terbatas dan controlled:
- Junior developers: staging only
- Senior developers: production dengan review
- Deploy melalui Coolify (no direct SSH)
- semua changes melalui pull request

### **Q: Apa saya mendapatkan akses ke semua repository?**
**A:** Tergantung role dan project:
- Core product repositories: yes
- Client projects: project-based access
- Admin/internal repositories: limited access
- Discuss dengan tech lead untuk specific needs

## 📊 Projects & Products

### **Q: Produk apa saja yang sedang dikerjakan?**
**A:**
- **WaqfWise:** Islamic endowment management (TALL stack)
- **Anggarin:** Personal finance planning (Laravel + Next.js)
- **Atribuo:** Real-life RPG skill visualization (Go + Next.js)
- **SnapKasir:** Point of sale system (Go + Next.js)

### **Q: Saya tertarik dengan produk tertentu, bagaimana cara assigned?**
**A:**
- First month: exploration semua produk
- Based on skills dan interests
- Project requirements dan timeline
- Discuss dengan tech lead dalam weekly planning

### **Q: Apakah ada opportunity untuk membuat produk baru?**
**A:** Absolutely! Kami encourage innovation:
- Submit product ideas via `ide-produk.md` template
- Business case validation
- Technical feasibility assessment
- Team consensus dan timeline planning

## 🏢 Culture & Working Style

### **Q: Bagaimana working hours di sini?**
**A:** Flexible dengan async philosophy:
- No strict 9-5 requirements
- Focus pada deliverables dan deadlines
- Coordinate dengan team untuk overlap time
- Respect timezone differences
- Available untuk urgent matters

### **Q: Bagaimana dengan work-life balance?**
**A:** We prioritize sustainable work:
- No overtime culture
- Weekend generally offline (except emergencies)
- Take time off when needed
- Mental health matters
- Results over hours worked

### **Q: Saya stuck dengan problem, siapa yang harus saya tanya?**
**A:** Hierarki bantuan:
1. **Check documentation** di `akordium-hq` repo
2. **Search existing GitHub Issues**
3. **Ask in team channel** (async preferred)
4. **Tag specific person** jika domain-specific
5. **DM tech lead** untuk blocking issues
6. **Emergency call** untuk production issues

### **Q: Bagaimana cara memberikan feedback atau suggest improvement?**
**A:** Kami welcome feedback:
- Process improvements: GitHub Issues dengan label `improvement`
- Tool suggestions: Diskusi di tech meeting
- Culture feedback: 1-on-1 dengan team lead
- Anonymous feedback: [Mekanisme jika ada]

## 💼 Career & Growth

### **Q: Apa growth path di Akordium Lab?**
**A:** Multiple growth tracks:
- **Technical:** Junior → Mid → Senior → Tech Lead
- **Product:** Developer → Product Manager → Product Owner
- **Entrepreneurial:** Team member → Co-founder (long term)
- **Specialist:** Domain expert (AI, DevOps, etc.)

### **Q: Apakah ada budget untuk training dan conferences?**
**A:** Ya, kami invest dalam team development:
- Online courses dan certifications
- Technical conferences
- Books dan learning resources
- Internal knowledge sharing sessions
- Discuss dengan manager untuk approval

### **Q: Bagaimana performance evaluation di sini?**
**A:** Continuous feedback culture:
- Weekly 1-on-1 dengan manager
- Quarterly performance reviews
- Peer feedback sessions
- Self-assessment dan goal setting
- Focus pada growth dan impact

## 🚨 Troubleshooting

### **Q: Laptop saya rusak/bermasalah, apa yang harus saya lakukan?**
**A:**
1. **Immediate:** Report via WhatsApp/Telegram
2. **Backup:** Ask team untuk urgent tasks coverage
3. **Repair:** Use company-provided repair service
4. **Temporary:** Company laptop jika tersedia
5. **Prevention:** Regular backup ke cloud storage

### **Q: Internet connectivity issues?**
**A:**
- **Immediate:** Hotspot dari phone
- **Backup:** Nearby coworking space
- **Prevention:** Mobile data backup plan
- **Communication:** Update team ASAP

### **Q: Tidak bisa akses repository atau systems?**
**A:**
1. **Check:** VPN connection (if required)
2. **Verify:** GitHub organization access
3. **Refresh:** SSH keys dan credentials
4. **Contact:** Tech lead untuk access issues
5. **Document:** Issue untuk future reference

---

## 🆘 Still Need Help?

If you don't find your question here:

1. **Search GitHub Issues** - Mungkin sudah pernah ditanyakan
2. **Check Team Channel** - Public questions help everyone
3. **DM Your Mentor** - Direct help for specific issues
4. **Create New Issue** - Use `help-wanted` label
5. **Weekly Sync** - Bring questions to your 1-on-1

**Remember:** No question is too basic! We're all learning together. 🎓

---

*Terakhir update: Desember 2024*
*Jika Anda menemukan jawaban yang outdated, please help us update this FAQ!*
