# 📊 Cara Tracking Budget Project

**Tanggal Efektif:** 1 Januari 2024
**Versi:** 1.2
**Status:** Aktif

---

## 🎯 Tujuan

Dokumen ini menjelaskan metodologi dan tools untuk tracking budget project di Akordium Lab, mulai dari perencanaan awal hingga monitoring real-time selama project berjalan.

---

## 📋 Project Budget Planning

### **1. Pre-Project Budget Estimation**

#### **Components of Project Cost:**

```
💰 Human Resources (60-70%)
├── Developer Salary
├── Project Manager
├── UI/UX Designer
└── QA Engineer

🔧 Technical Resources (20-25%)
├── Server/Cloud Infrastructure
├── Third-party Services
├── Software Licenses
└── Development Tools

🏢 Operational (10-15%)
├── Communication Tools
├── Project Management Software
├── Client Meeting Costs
└── Documentation & Training
```

#### **Budget Estimation Formula:**

```javascript
// Base calculation (per bulan)
totalBudget = (devRate × devHours × months) +
              (infrastructureCost × months) +
              thirdPartyCosts +
              bufferPercentage

// Example: 3-month web project
devRate = 150.000/hour
devHours = 160 hours/bulan
months = 3
infrastructureCost = 500.000/bulan
thirdPartyCosts = 2.000.000
bufferPercentage = 15% // buffer for risks

totalBudget = (150.000 × 160 × 3) + (500.000 × 3) + 2.000.000
            = 72.000.000 + 1.500.000 + 2.000.000
            = 75.500.000
withBuffer = 75.500.000 × 1.15 = 86.825.000
```

---

## 📊 Budget Tracking System

### **1. Project Setup Phase**

#### **Create Budget Sheet Template:**

```markdown
# PROJECT BUDGET TRACKER

**Project Name:** _________________________
**Client:** _________________________
**Project Duration:** _________________________
**Budget Manager:** _________________________

## Budget Allocation

| Category | Allocated % | Amount (IDR) | Status |
|----------|-------------|--------------|---------|
| Development | 65% | | |
| Infrastructure | 15% | | |
| Third-party | 10% | | |
| Contingency | 10% | | |
| **TOTAL** | **100%** | | |

## Monthly Burn Rate

| Month | Planned | Actual | Variance | % Complete |
|-------|---------|--------|----------|------------|
| Month 1 | | | | |
| Month 2 | | | | |
| Month 3 | | | | |
```

### **2. Real-Time Tracking Tools**

#### **Recommended Tools:**

1. **Spreadsheet (Google Sheets/Excel)**
   - Daily/weekly updates
   - Automated calculations
   - Sharing dengan client (jika perlu)

2. **Project Management Integration**
   - Jira + Tempo Timesheets
   - Asana + Harvest
   - Trello + Toggl Track

3. **Custom Dashboard**
   - Power BI / Google Data Studio
   - Real-time API integration
   - Automated reporting

---

## 📈 Monthly Reporting Process

### **1. Data Collection Schedule**

```
[ Setiap Hari ] Log jam kerja dan expenses
[ Setiap Jumat ] Weekly review dengan team
[ Hari 1 Bulanan ] Generate monthly report
[ Hari 2 Bulanan ] Review dengan Manager
[ Hari 3 Bulanan ] Client reporting (jika applicable)
```

### **2. Monthly Report Template**

```markdown
# PROJECT BUDGET REPORT - [BULAN] [TAHUN]

**Project:** [Nama Project]
**Reporting Period:** [Start Date] - [End Date]
**Prepared by:** [Nama Anda]

## 📊 Executive Summary
- **Total Budget:** Rp [Amount]
- **Spent to Date:** Rp [Amount] ([%])
- **Remaining Budget:** Rp [Amount] ([%])
- **Project Completion:** [%]
- **Budget Health:** 🟢 Good / 🟡 Warning / 🔴 Critical

## 💰 Financial Breakdown

### Development Costs
| Item | Planned | Actual | Variance | Notes |
|------|---------|--------|----------|-------|
| Backend Developer | | | | |
| Frontend Developer | | | | |
| UI/UX Designer | | | | |
| **Subtotal** | | | | |

### Infrastructure Costs
| Item | Planned | Actual | Variance | Notes |
|------|---------|--------|----------|-------|
| Cloud Server | | | | |
| Database | | | | |
| CDN | | | | |
| **Subtotal** | | | | |

## 📈 Trend Analysis
![Budget vs Actual Chart]

## ⚠️ Risk & Issues
- **Budget Overruns:** [Amount] - [Reason]
- **Upcoming Expenses:** [Amount] - [Description]
- **Resource Constraints:** [Description]

## 🎯 Recommendations
1. [Action item 1]
2. [Action item 2]
3. [Action item 3]

## 📋 Next Month Forecast
- **Planned Expenses:** Rp [Amount]
- **Expected Completion:** [%]
- **Resource Needs:** [Description]
```

---

## 🚨 Budget Variance Management

### **Variance Categories:**

1. **Minor Variance (±5%)**
   - Normal operational fluctuation
   - No immediate action required
   - Document reasons

2. **Moderate Variance (±5-15%)**
   - Requires investigation
   - Adjust future allocations
   - Inform stakeholders

3. **Major Variance (>15%)**
   - Immediate action required
   - Formal review meeting
   - Project scope/budget re-evaluation

### **Variance Analysis Process:**

```markdown
# VARIANCE ANALYSIS CHECKLIST

## 🔍 Investigation Points
- [ ] Scope changes approved?
- [ ] Resource productivity issues?
- [ ] Third-party cost increases?
- [ ] Exchange rate fluctuations?
- [ ] Unexpected technical challenges?

## 💡 Root Cause Analysis
**Primary Reason:** _________________________
**Secondary Factors:** _________________________
**Preventive Measures:** _________________________

## 🎯 Corrective Actions
1. **Short-term (This week):**
   - [ ] Action item
   - [ ] Action item

2. **Medium-term (This month):**
   - [ ] Action item
   - [ ] Action item

3. **Long-term (Next phase):**
   - [ ] Action item
   - [ ] Action item
```

---

## 📱 Automation & Integration

### **1. Time Tracking Integration**

```javascript
// Example: Jira + Custom Budget Script
const calculateProjectBurnRate = (projectId, timeframe) => {
  const timeLogged = jira.getTimeLogged(projectId, timeframe);
  const teamRates = getTeamRates();

  let totalCost = 0;
  timeLogged.forEach(entry => {
    totalCost += entry.hours * teamRates[entry.userRole];
  });

  return {
    burnRate: totalCost,
    efficiency: (budgetedHours / actualHours) * 100,
    projectedCompletion: calculateETA(totalCost, remainingBudget)
  };
};
```

### **2. Automated Alerts Setup**

```yaml
# budget-alerts.yml
alerts:
  budget_usage_80:
    condition: "spent_budget / total_budget >= 0.8"
    action: "email_pm"
    message: "Project has used 80% of budget"

  budget_usage_90:
    condition: "spent_budget / total_budget >= 0.9"
    action: "email_director"
    message: "URGENT: Project has used 90% of budget"

  weekly_burn_rate_high:
    condition: "weekly_spend > weekly_budget * 1.2"
    action: "slack_alert"
    message: "High burn rate detected this week"
```

---

## 🎓 Team Guidelines

### **Developer Responsibilities:**

1. **Daily time logging** (max 24-hour delay)
2. **Accurate task categorization**
3. **Report blockers immediately**
4. **Review weekly burn rates**

### **Project Manager Responsibilities:**

1. **Weekly budget reviews**
2. **Monthly variance analysis**
3. **Client budget communications**
4. **Forecast adjustments**

### **Finance Team Responsibilities:**

1. **Monthly report consolidation**
2. **Cross-project budget analysis**
3. **Resource optimization recommendations**
4. **Audit compliance**

---

## 📊 Performance Metrics

### **Key Budget KPIs:**

1. **Budget Variance:** (Actual - Budgeted) / Budgeted × 100%
2. **Cost Performance Index (CPI):** Earned Value / Actual Cost
3. **Schedule Performance Index (SPI):** Earned Value / Planned Value
4. **Estimate at Completion (EAC):** Current cost + remaining work

### **Benchmark Targets:**

- **Budget Variance:** ±10%
- **CPI:** > 0.9
- **SPI:** > 0.9
- **Estimate Accuracy:** ±15%

---

## 🛠 Useful Templates & Resources

### **Google Sheets Template:**

`[Link to company's budget tracking template]`

### **Excel Dashboard:**

`[Link to company's budget dashboard]`

### **Slack Commands:**

```
/budget-status [project-name] - Show current budget status
/burn-rate [project-name] - Show weekly burn rate
/forecast [project-name] - Show completion forecast
```

---

**Last Updated:** 15 Maret 2024
**Next Review:** 15 Juni 2024
**Maintained by:** Finance Department & PMO

> 💡 **Pro Tip:** Budget tracking adalah proactive tool, bukan reactive monitoring. Review harian lebih baik daripada surprise akhir bulan!
