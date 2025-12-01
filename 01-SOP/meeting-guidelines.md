# 🤝 Meeting Guidelines (Async-First)

Di Akordium Lab, kita percaya bahwa "meetings are expensive" - mereka menghabiskan waktu productive dari semua peserta. Kita mengutamakan **async communication** dan hanya mengadakan meeting ketika absolutely necessary.

## 🎯 Golden Rules

### **1. No Agenda = No Meeting**
Setiap meeting WAJIB memiliki agenda yang jelas dikirim minimal 24 jam sebelumnya.
- ❌ "Meeting untuk discuss project X" (terlalu umum)
- ✅ "Meeting untuk finalize API specifications untuk payment module: 1) Review current draft, 2) Decide on error handling, 3) Set timeline"

### **2. Default adalah No Meeting**
Jika bisa diselesaikan lewat tulisan, maka lakukan itu. Meeting adalah last resort, bukan first option.

### **3. Respect Time**
- Start on time, end on time
- 5 menit sebelum mulai: test equipment, prepare materials
- Tidak ada "meeting after meeting" tanpa agenda

### **4. Required Participants Only**
Setiap participant harus punya peran yang jelas:
- **Required:** Tidak bisa start tanpa mereka
- **Optional:** Boleh join jika relevan
- **FYI:** Cukup dapat update setelah meeting

## 📋 Jenis Meeting & Standards

### **Daily Standup (Opsional)**
**Purpose:** Quick coordination, bukan status report
**When:** Hanya jika team butuh coordination (bukan daily routine)
**Format:**
- Max 15 menit total
- Standing position (jika offline)
- 3 questions per person:
  1. Apa yang kemarin dikerjakan?
  2. Apa yang akan dikerjakan hari ini?
  3. Ada blocking issues?

**Better Alternative:** Async update di GitHub Issues/Projects

### **Sprint Planning**
**Purpose:** Plan upcoming work priorities
**Frequency:** Setiap 2 minggu atau saat needed
**Requirements:**
- Backlog sudah prepared dan prioritized
- Capacity estimates available
- Dependencies identified
- Clear objectives untuk period

**Output:** Issues created, assigned, dan scheduled di GitHub Projects

### **Retrospective**
**Purpose:** Process improvement, not blame game
**Frequency:** Setiap major milestone atau monthly
**Structure:**
- What went well? (Keep doing)
- What didn't go well? (Stop doing)
- What can we improve? (Start doing)
- Action items dengan owners dan deadlines

**Format:** Async retrospective document jika team remote

### **Client Meetings**
**Purpose:** Alignment, updates, decisions
**Preparation:**
- Research client background dan goals
- Prepare agenda dan required materials
- Confirm meeting time dan platform
- Test technology setup

**During Meeting:**
- Take notes (designated note-taker)
- Repeat commitments untuk confirmation
- Define next steps dan timeline

**Follow-up:** Email summary dengan action items dalam 24 jam

### **Technical Design Review**
**Purpose:** Architecture decisions, complex problem solving
**Preparation:**
- Design document shared 2 days sebelumnya
- Key stakeholders identified
- Decision criteria defined
- Alternative options prepared

**Focus:** Technical discussion, bukan status update

### **Emergency/Incident Meeting**
**Purpose:** Critical incident resolution
**When:** Production issues affecting users
**Rules:**
- Immediately assemble key responders
- Focus on resolution, not blame
- Clear communication channels
- Post-mortem scheduled separately

## 🛠️ Meeting Management Tools

### **Scheduling**
- **Primary:** GitHub Issues dengan `meeting` label
- **Calendar:** shared calendar untuk availability
- **Coordination:** Comments dan @mentions untuk confirmation

### **Documentation**
- **Pre-meeting:** Agenda di Issue body atau linked document
- **During:** Designated note-taker updates live notes
- **Post-meeting:** Summary dengan action items dan owners

### **Follow-up Tracking**
- Convert decisions to GitHub Issues
- Assign owners dan deadlines
- Link back to original meeting notes
- Regular progress updates

## 📝 Meeting Template

### **Standard Issue Template:**
```markdown
## Meeting: [Judul Meeting]

**Date:** [Tanggal]
**Time:** [Waktu dengan timezone]
**Duration:** [Estimasi durasi]
**Platform:** [Meet/Zoom/Teams/etc]

### 🎯 Objectives
- [ ] Goal 1
- [ ] Goal 2

### 📋 Agenda
1. [15m] Topic 1 - Lead: [Name]
2. [20m] Topic 2 - Lead: [Name]
3. [10m] Discussion & Decisions

### 👥 Participants
- **Required:** @name1, @name2
- **Optional:** @name3

### 📚 Pre-reading
- [Link ke document]
- [Link ke relevant issues]

### 📝 Notes
[Live notes akan diupdate disini]

### ✅ Action Items
- [ ] [Task] - Owner: @name - Deadline: [date]
```

## 🚫 Meeting Anti-Patterns

### **Avoid These:**
- **Status Update Meetings:** Bisa async di GitHub
- **Information-Only Meetings:** Kirim document saja
- **Problem-Solving Without Preparation:** Wasting time
- **Large Decision-Making Groups:** Split ke smaller groups
- **Regular "Check-in" Meetings:** Tanpa clear purpose

### **Red Flags:**
- Tidak ada agenda terstruktur
- Participants tidak tahu kenapa mereka diundang
- Meeting berakhir tanpa clear action items
- Same topics discussed repeatedly
- People working on other things during meeting

## 🔄 Async Alternatives

### **Instead of Daily Standup:**
- GitHub Issues update dengan progress
- Slack/Telegram status updates
- Project board movement updates

### **Instead of Status Meetings:**
- Weekly written reports
- GitHub Project dashboard
- Automated progress notifications

### **Instead of Brainstorming:**
- Shared documents dengan comments
- GitHub Discussions untuk ide generation
- Voice notes atau Loom recordings

## 📊 Meeting Effectiveness Metrics

### **Good Meeting Indicators:**
- Clear objectives achieved
- Action items defined with owners
- All participants engaged and contributing
- Ends on time
- Follow-up actions tracked

### **Poor Meeting Indicators:**
- Participants confused about purpose
- No clear decisions made
- Side conversations dominate
- Runs over time
- Same topics repeat in future meetings

## 🎓 Continuous Improvement

### **Post-Meeting Review:**
- Rate meeting effectiveness (1-5)
- What could make it better?
- Was this meeting necessary?
- How could we achieve this differently?

### **Regular Process Review:**
- Monthly meeting effectiveness assessment
- Identify meeting-heavy periods
- Optimize scheduling and frequency
- Gather feedback dari team

---

**Remember:** Time is our most valuable resource. Every meeting should create value that couldn't be achieved through async communication. If you're unsure whether a meeting is needed, try async first and only schedule meeting if absolutely necessary.

*Related SOPs:* [Komunikasi Async](./komunikasi.md) | [Manajemen Tugas](./manajemen-tugas.md) | [Git Workflow](./workflow-git.md)