# 📊 Estimation Guidelines

**Software Development Effort Estimation Methodology**

**Document Version:** 1.0
**Effective Date:** 1 Januari 2024
**Review Cycle:** Semi-annually

---

## 🎯 Overview

### **Purpose of Estimation:**

- Provide realistic project timelines and budgets
- Enable effective resource planning and allocation
- Set proper stakeholder expectations
- Support project risk management
- Facilitate project tracking and progress measurement

### **Core Principles:**

1. **Transparency:** Estimation assumptions and methodologies should be clear
2. **Collaboration:** Involve the entire development team in estimation
3. **Iterative:** Refine estimates as more information becomes available
4. **Range-based:** Provide ranges rather than single numbers
5. **Historical:** Use data from previous projects when available

---

## 🏗️ Estimation Approaches

### **1. Story Point Estimation (Agile)**

#### **Fibonacci Sequence:**

```text
1, 2, 3, 5, 8, 13, 21, 34, 55, 89
```

**Reference Points:**

- **1 Point:** Simple task, clear requirements, minimal testing
- **3 Points:** Moderate complexity, some research needed
- **5 Points:** Significant complexity, multiple components
- **8 Points:** Complex feature, significant integration work
- **13 Points:** Very complex, multiple unknowns
- **21+ Points:** Epic, needs to be broken down

#### **Example Story Points:**

| Task Type | Example | Story Points | Duration (Hours) |
|-----------|---------|--------------|------------------|
| **Database Schema** | Add new user table | 3 | 4-6 hours |
| **API Endpoint** | Create GET /users endpoint | 5 | 6-10 hours |
| **Frontend Component** | User profile page | 8 | 10-16 hours |
| **Integration** | Payment gateway integration | 13 | 16-25 hours |
| **Authentication** | OAuth 2.0 implementation | 21 | 25-40 hours |

### **2. Time-Based Estimation**

#### **Hour-Based Estimation:**

- **Small Tasks:** 1-8 hours
- **Medium Tasks:** 8-24 hours
- **Large Tasks:** 24-80 hours
- **Very Large:** Break down into smaller tasks

#### **Man-Day Calculations:**

```text
1 Man-Day = 8 productive hours
Productive Hours = 8 - (meetings + breaks + context switching)
Realistic Daily Capacity = 6-7 hours
```

#### **Example Estimation Table:**

| Task | Optimistic | Likely | Pessimistic | Expected |
|------|------------|---------|--------------|----------|
| Database Migration | 2 hours | 4 hours | 8 hours | 4.5 hours |
| API Development | 4 hours | 8 hours | 16 hours | 9 hours |
| Frontend Development | 8 hours | 16 hours | 32 hours | 18 hours |
| Testing & QA | 2 hours | 4 hours | 8 hours | 4.5 hours |
| **Total** | **16 hours** | **32 hours** | **64 hours** | **36 hours** |

### **3. Function Point Analysis**

#### **Complexity Weights:**

| Function Type | Simple | Average | Complex |
|---------------|--------|---------|---------|
| **External Input** | 3 | 4 | 6 |
| **External Output** | 4 | 5 | 7 |
| **External Inquiry** | 3 | 4 | 6 |
| **Internal Logical File** | 7 | 10 | 15 |
| **External Interface File** | 5 | 7 | 10 |

#### **Calculation Example:**

```
External Inputs: 10 × 4 (average) = 40 points
External Outputs: 5 × 5 (average) = 25 points
External Inquiries: 8 × 3 (simple) = 24 points
Internal Files: 6 × 10 (average) = 60 points
External Files: 3 × 7 (average) = 21 points

Total Function Points = 170 points
```

---

## 📋 Task Complexity Matrix

### **Complexity Factors**

| Factor | Level 1 (Low) | Level 2 (Medium) | Level 3 (High) |
|--------|---------------|------------------|----------------|
| **Technical Complexity** | Standard patterns | Custom logic | New architecture |
| **Integration** | None | 1-2 systems | 3+ systems |
| **Data Processing** | Simple CRUD | Complex queries | Big data/ML |
| **UI/UX** | Templates | Custom design | Interactive/AI |
| **Uncertainty** | Clear requirements | Some unknowns | Many unknowns |
| **Dependencies** | None | 1-2 dependencies | 3+ dependencies |

### **Estimation Multipliers**

| Complexity Level | Base Multiplier | Risk Buffer |
|------------------|-----------------|-------------|
| **Simple (1-2 factors at Low)** | 1.0x | 10% |
| **Moderate (3-4 factors at Low/Medium)** | 1.5x | 20% |
| **Complex (2+ factors at High)** | 2.5x | 30% |
| **Very Complex (3+ factors at High)** | 4.0x | 40% |

---

## ⚡ Estimation by Project Type

### **Web Application Development**

#### **Core Features Estimation:**

| Feature | Story Points | Time (Days) | Notes |
|---------|--------------|-------------|-------|
| **User Authentication** | 13 | 6-10 | Login, register, password reset |
| **Dashboard** | 21 | 10-16 | Main interface, widgets |
| **CRUD Operations** | 8 per entity | 4-6 per entity | Create, Read, Update, Delete |
| **Search & Filter** | 13 | 6-10 | Advanced filtering |
| **File Upload** | 8 | 4-6 | Multiple formats, validation |
| **Reporting** | 21 | 10-16 | Charts, exports, analytics |
| **Admin Panel** | 34 | 16-25 | User management, settings |
| **API Integration** | 13 per API | 6-10 per API | Third-party services |

#### **Example Project Estimate:**

**Project:** Inventory Management System

```
1. User Authentication: 13 points
2. Product Management (CRUD): 8 × 2 = 16 points
3. Inventory Tracking: 21 points
4. Reporting Dashboard: 21 points
5. Barcode Scanner Integration: 13 points
6. Mobile Responsive: 13 points

Total Points: 97 points
```

**Team Velocity:** 20 points/sprint (2-week sprint)
**Sprints Needed:** 97 ÷ 20 = 5 sprints
**Timeline:** 10 weeks

### **Mobile Application Development**

#### **Platform-Specific Factors:**

| Platform | Development Time | Testing Time | App Store Review |
|----------|------------------|--------------|------------------|
| **iOS (Native)** | 1.0x | 1.2x | 2-7 days |
| **Android (Native)** | 1.1x | 1.3x | 1-3 days |
| **React Native** | 0.7x | 0.9x | 2-7 days |
| **Flutter** | 0.8x | 0.9x | 2-7 days |

#### **Mobile Feature Estimates:**

| Feature | iOS | Android | Cross-Platform |
|---------|-----|---------|----------------|
| **Login/Registration** | 13 | 15 | 13 |
| **Push Notifications** | 21 | 21 | 13 |
| **Offline Mode** | 34 | 34 | 21 |
| **Camera Integration** | 13 | 15 | 8 |
| **GPS/Maps** | 21 | 21 | 13 |
| **Social Login** | 13 | 13 | 8 |
| **In-App Purchases** | 34 | 34 | 21 |

### **API Development**

#### **REST API Endpoints:**

| Endpoint Type | Story Points | Time (Hours) |
|---------------|--------------|--------------|
| **Simple GET** | 2-3 | 2-4 |
| **Complex GET (joins, filters)** | 5-8 | 6-10 |
| **POST with validation** | 5-8 | 6-10 |
| **PUT with validation** | 5-8 | 6-10 |
| **DELETE with cascade** | 3-5 | 4-6 |
| **File Upload/Download** | 8-13 | 10-16 |
| **Batch Operations** | 13-21 | 16-25 |

#### **GraphQL Estimates:**

| Feature | Story Points | Notes |
|---------|--------------|-------|
| **Schema Design** | 13-21 | Type definitions, relationships |
| **Query Resolvers** | 5-8 per resolver | Database integration |
| **Mutation Resolvers** | 8-13 per resolver | Validation, business logic |
| **Subscriptions** | 21-34 | WebSocket integration |
| **Authentication Middleware** | 8-13 | JWT validation |

---

## 🔍 Estimation Process

### **Phase 1: Initial High-Level Estimate**

#### **Quick Sizing Matrix:**

| Project Size | Team Size | Duration | Typical Budget |
|--------------|-----------|----------|----------------|
| **Small** | 2-3 developers | 1-3 months | Rp 50-150 Juta |
| **Medium** | 4-6 developers | 3-6 months | Rp 150-400 Juta |
| **Large** | 6-10 developers | 6-12 months | Rp 400-1 Miliar |
| **Enterprise** | 10+ developers | 12+ months | Rp 1+ Miliar |

### **Phase 2: Detailed Estimation**

#### **Step-by-Step Process:**

1. **Break Down Features:**

   ```
   User Management
   ├── Authentication (5 days)
   ├── User Profile (3 days)
   ├── Role Management (4 days)
   └── User Settings (2 days)

   Product Management
   ├── Product Catalog (8 days)
   ├── Categories (3 days)
   ├── Search (5 days)
   └── Inventory (6 days)
   ```

2. **Apply Complexity Factors:**
   - **Base Estimate:** 36 days
   - **Complexity Multiplier:** 1.3x (moderate complexity)
   **Adjusted Estimate:** 46.8 days

3. **Add Project Management:**
   - **Development Time:** 46.8 days
   - **PM Overhead:** 15% = 7 days
   - **Testing & QA:** 20% = 9.4 days
   **Total Estimate:** 63.2 days

### **Phase 3: Risk Adjustment**

#### **Risk Buffer Calculation:**

| Risk Factor | Probability | Impact | Buffer |
|-------------|-------------|---------|--------|
| **Requirements Changes** | 70% | 20% timeline | +14% |
| **Technical Challenges** | 30% | 30% timeline | +9% |
| **Resource Availability** | 20% | 25% timeline | +5% |
| **Integration Issues** | 40% | 15% timeline | +6% |
| **Total Risk Buffer** | | | **+34%** |

**Final Estimate:** 63.2 × 1.34 = 84.7 days

---

## 📊 Team Velocity Planning

### **Velocity Calculation**

#### **Historical Velocity Analysis:**

```text
Sprint 1: 18 points completed
Sprint 2: 22 points completed
Sprint 3: 16 points completed
Sprint 4: 20 points completed

Average Velocity: (18 + 22 + 16 + 20) ÷ 4 = 19 points/sprint
```

#### **Team Capacity Planning:**

| Team Member | Hours/Sprint | Focus Factor | Effective Hours |
|-------------|--------------|--------------|-----------------|
| **Senior Developer** | 80 hours | 0.8 | 64 hours |
| **Mid Developer** | 80 hours | 0.75 | 60 hours |
| **Junior Developer** | 80 hours | 0.7 | 56 hours |
| **Total** | **240 hours** | | **180 hours** |

**Velocity Calculation:** 180 ÷ 8 (hours per point) = 22.5 points/sprint

### **Sprint Planning Examples**

#### **Sample Sprint Plan:**

| Story | Points | Owner | Status |
|-------|--------|-------|--------|
| **User Login API** | 5 | Dev A | Not Started |
| **Registration Page** | 8 | Dev B | Not Started |
| **Password Reset** | 3 | Dev A | Not Started |
| **Database Schema** | 2 | Dev C | In Progress |
| **Unit Tests** | 3 | Dev B | Not Started |
| **Code Review** | 2 | All | Not Started |
| **Total** | **23 points** | | |

---

## 🛠️ Estimation Tools & Techniques

### **Planning Poker**

#### **Guidelines:**

1. **Select User Story:** Clear description, acceptance criteria
2. **Team Discussion:** Clarify requirements, identify risks
3. **Private Estimation:** Each member estimates secretly
4. **Reveal Estimates:** Show cards simultaneously
5. **Discuss Differences:** Outliers explain their reasoning
6. **Re-estimate:** Repeat until consensus achieved

#### **Planning Poker Card Values:**

```
0, ½, 1, 2, 3, 5, 8, 13, 20, 40, 100, ?
```

### **Three-Point Estimation**

#### **PERT Formula:**

```
Expected = (Optimistic + 4 × Likely + Pessimistic) ÷ 6
Standard Deviation = (Pessimistic - Optimistic) ÷ 6
Confidence Interval = Expected ± (2 × Standard Deviation)
```

#### **Example:**

```
Task: API Integration
Optimistic: 4 days
Likely: 8 days
Pessimistic: 12 days

Expected = (4 + 4×8 + 12) ÷ 6 = 8 days
Standard Deviation = (12 - 4) ÷ 6 = 1.33 days
Confidence Interval: 8 ± 2.67 days (5.33 to 10.67 days)
```

---

## 📈 Estimation Accuracy Metrics

### **Tracking Estimation Accuracy**

#### **Forecast Accuracy:**

```text
Actual Time ÷ Estimated Time = Accuracy Ratio

Example:
Estimated: 40 hours
Actual: 50 hours
Accuracy Ratio: 50 ÷ 40 = 1.25 (25% over estimate)
```

#### **Accuracy Categories:**

- **Excellent:** 0.8 - 1.1 (±10%)
- **Good:** 0.7 - 1.3 (±30%)
- **Fair:** 0.6 - 1.5 (±50%)
- **Poor:** Outside 0.6 - 1.5 range

### **Improvement Strategies**

#### **Common Estimation Errors:**

1. **Optimism Bias:** Underestimating complexity
2. **Planning Fallacy:** Ignoring historical data
3. **Anchoring:** First number influences final estimate
4. **Groupthink:** Team pressure affects estimates

#### **Mitigation Techniques:**

- Use historical velocity data
- Break down large tasks
- Consider buffer time for unknowns
- Regular retrospectives on estimation accuracy
- Independent estimates from multiple team members

---

## 📝 Estimation Templates

### **Task Estimation Template**

```markdown
## Task: [Task Name]

**Description:** [Clear task description]
**Acceptance Criteria:**
- [ ] Criteria 1
- [ ] Criteria 2

**Complexity Factors:**
- Technical: [Low/Medium/High]
- Integration: [None/1-2 systems/3+ systems]
- Dependencies: [List dependencies]

**Estimation:**
- Story Points: [Points]
- Optimistic: [Hours/Days]
- Likely: [Hours/Days]
- Pessimistic: [Hours/Days]
- Expected: [Hours/Days]

**Risks:**
- [Risk 1]: [Impact]
- [Risk 2]: [Impact]

**Notes:** [Additional considerations]
```

### **Project Estimation Summary**

```markdown
## Project Estimation Summary

**Project:** [Project Name]
**Team:** [Team Size & Composition]
**Velocity:** [Points per sprint]

### Feature Breakdown:
| Feature | Story Points | Estimated Days |
|---------|--------------|----------------|
| [Feature 1] | [Points] | [Days] |
| [Feature 2] | [Points] | [Days] |
| **Total** | **[Total Points]** | **[Total Days]** |

### Timeline Planning:
- **Development Sprints:** [Number] sprints
- **Testing & QA:** [Number] sprints
- **Buffer Time:** [Number] sprints
- **Total Timeline:** [Number] sprints ([Number] weeks)

### Budget Estimate:
- **Development Cost:** [Amount]
- **PM Overhead (15%):** [Amount]
- **Contingency (20%):** [Amount]
- **Total Budget:** [Amount]
```

---

## ⚠️ Estimation Pitfalls & Solutions

### **Common Pitfalls**

| Pitfall | Symptoms | Solutions |
|---------|----------|-----------|
| **Underestimation** | Consistently late delivery | Add buffer time, use three-point estimation |
| **Overestimation** | Early delivery, wasted time | Track actual time, adjust future estimates |
| **Scope Creep** | Growing requirements | Strict change control process |
| **Optimism Bias** | Best-case scenario planning | Use historical data, pessimistic scenarios |
| **Group Pressure** | Consensus without discussion | Anonymous estimation first, then discuss |

### **Best Practices**

1. **Break Down Large Tasks:** Anything > 13 points should be split
2. **Involve the Whole Team:** Diverse perspectives improve accuracy
3. **Use Historical Data:** Base estimates on actual performance
4. **Regular Updates:** Re-estimate as requirements become clearer
5. **Track Accuracy:** Compare estimates vs. actual to improve

---

## 🎯 Real-World Examples

### **Example 1: E-commerce Platform**

**Requirements:**

- User authentication and profiles
- Product catalog with categories
- Shopping cart and checkout
- Payment gateway integration
- Admin dashboard
- Mobile responsive design

**Estimation Breakdown:**

```
Authentication System: 21 points
Product Catalog: 34 points
Shopping Cart: 21 points
Payment Integration: 34 points
Admin Dashboard: 34 points
Mobile Responsive: 21 points
Testing & QA: 40 points
Total: 205 points
```

**Timeline:**

- **Team Velocity:** 25 points/sprint
- **Development Sprints:** 8 sprints (16 weeks)
- **Buffer (20%):** 3.2 sprints
- **Total Timeline:** 11.2 sprints (22.4 weeks)

### **Example 2: Internal CRM**

**Requirements:**

- Lead management
- Contact management
- Sales pipeline tracking
- Reporting dashboard
- Email integration

**Estimation Breakdown:**

```
Lead Management: 21 points
Contact Management: 13 points
Sales Pipeline: 21 points
Reporting Dashboard: 21 points
Email Integration: 13 points
Testing & QA: 20 points
Total: 109 points
```

**Timeline:**

- **Team Velocity:** 20 points/sprint
- **Development Sprints:** 5.5 sprints (11 weeks)
- **Buffer (20%):** 1.1 sprints
- **Total Timeline:** 6.6 sprints (13.2 weeks)

---

## 📞 Support & Resources

### **Estimation Tools:**

- **Jira:** Story point estimation and velocity tracking
- **Trello:** Simple task management with time tracking
- **Asana:** Project timeline and resource planning
- **ClickUp:** Complex project estimation and planning

### **Training Resources:**

- **Agile Estimation and Planning** - Mike Cohn
- **Software Estimation: Demystifying the Black Art** - Steve McConnell
- **Planning Poker Cards** - Digital or physical card decks

### **Internal Support:**

- **Senior Developers:** Technical complexity assessment
- **Project Managers:** Historical data and process guidance
- **Business Analysts:** Requirements clarification
- **QA Team:** Testing effort estimation

---

**Document Version:** 1.0
**Last Updated:** 1 Januari 2024
**Next Review:** 1 Juli 2024
**Maintained by:** Project Management Office, PT Akordium Lab Digital

> 💡 **Key Success Factor:** Estimation is not about being perfect—it's about being realistic and continuously improving. Use estimates as planning tools, not as absolute commitments.
