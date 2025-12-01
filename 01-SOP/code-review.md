# 🔍 Code Review Standards & Process

Code review adalah quality assurance process di Akordium Lab. Tujuannya bukan mencari kesalahan, tapi meningkatkan code quality, knowledge sharing, dan team growth.

## 🎯 Objectives

### **Primary Goals:**
- **Quality Assurance:** Catch bugs sebelum production
- **Knowledge Transfer:** Learn dari code orang lain
- **Consistency:** Maintain coding standards
- **Security:** Identify vulnerabilities
- **Performance:** Optimize inefficient code

### **Secondary Benefits:**
- Team alignment dan understanding
- Architecture improvements
- Documentation updates
- Best practices sharing

## 👥 Roles & Responsibilities

### **Author (PR Creator)**
- **Before PR:** Self-review code thoroughly
- **Documentation:** Update README, comments, API docs
- **Testing:** Ensure all tests pass dan relevant
- **Description:** Clear PR description dengan context
- **Responsive:** Reply ke feedback timely

### **Reviewer(s)**
- **Constructive:** Focus pada improvement, bukan criticism
- **Thorough:** Review all changes, not just core logic
- **Educational:** Explain "why" behind suggestions
- **Timely:** Review within 24 business hours
- **Collaborative:** Discuss alternative approaches

### **Maintainer (Approver)**
- **Final Approval:** Merge decision responsibility
- **Standards:** Ensure company guidelines met
- **Conflict Resolution:** Handle disagreements
- **Mentorship:** Guide team members

## 🔄 Review Process Flow

### **1. Preparation**
Author sebelum create PR:
- [ ] Code compiles dan tests pass
- [ ] Self-review dengan fresh eyes
- [ ] Documentation updated
- [ ] Environment-specific changes documented
- [ ] Security considerations checked

### **2. Pull Request Creation**
Gunakan PR template dari `.github/PULL_REQUEST_TEMPLATE.md`:
- **Title:** Clear dan descriptive
- **Description:** Context, problem, solution
- **Testing:** How tested, additional tests needed
- **Breaking Changes:** Clearly documented
- **Screenshots/Demo:** If applicable

### **3. Review Assignment**
- **Minimum 1 reviewer** untuk simple changes
- **Minimum 2 reviewers** untuk complex changes
- **Domain expert** untuk specialized code
- **Senior engineer** untuk architecture changes

### **4. Review Process**
Reviewers check:
- **Functionality:** Does it solve intended problem?
- **Quality:** Clean, readable, maintainable code?
- **Performance:** Efficient algorithms dan data structures?
- **Security:** No vulnerabilities atau exposed data?
- **Testing:** Adequate test coverage?
- **Documentation:** Clear comments dan updates?

### **5. Feedback & Discussion**
- **Constructive:** Specific, actionable feedback
- **Respectful:** Assume good intent
- **Educational:** Explain reasoning behind suggestions
- **Open-minded:** Consider alternative approaches

### **6. Revision & Approval**
- **Author updates** code berdasarkan feedback
- **Reviewers verify** changes address concerns
- **Approval granted** ketika semua criteria met
- **Merge dengan squash** untuk clean history

## 📋 Review Checklist

### **Functional Requirements**
- [ ] **Correctness:** Code works as intended
- [ ] **Edge Cases:** Error handling dan boundary conditions
- [ ] **Business Logic:** Matches requirements dan expectations
- [ ] **Integration:** Works dengan existing systems

### **Code Quality**
- [ ] **Readability:** Clear variable names dan structure
- [ ] **Simplicity:** Not over-engineered
- [ ] **Consistency:** Follows team coding standards
- [ ] **Maintainability:** Easy untuk modify dan extend

### **Performance & Scalability**
- [ ] **Efficiency:** Appropriate algorithms dan data structures
- [ ] **Resource Usage:** Memory, CPU, network optimization
- [ ] **Scalability:** Handles expected growth
- [ ] **Caching:** Proper cache strategies jika needed

### **Security**
- [ ] **Input Validation:** Sanitize all user inputs
- [ ] **Authentication:** Proper access controls
- [ ] **Data Protection:** Sensitive data properly handled
- [ ] **Dependencies:** No vulnerable libraries

### **Testing**
- [ ] **Unit Tests:** Cover critical functionality
- [ ] **Integration Tests:** Verify component interactions
- [ ] **Edge Cases:** Boundary condition testing
- [ ] **Manual Testing:** Verify user workflows

### **Documentation**
- [ ] **Comments:** Complex logic explained
- [ ] **API Docs:** Updated if applicable
- [ ] **README:** Installation/setup instructions
- [ ] **Changelog:** Notable changes recorded

## 💬 Feedback Guidelines

### **Good Feedback Examples:**
- ✅ "Consider extracting this complex logic into a separate function for better testability"
- ✅ "This query might be slow with large datasets. Could we add an index?"
- ✅ "I like the approach! Have you considered handling the edge case when X is null?"
- ✅ "The variable name could be more descriptive. Maybe `userAuthenticatedStatus` instead of `flag`?"

### **Avoid These:**
- ❌ "This is wrong" (tanpa explanation)
- ❌ "Rewrite this" (tanpa specific guidance)
- ❌ "I don't like this" (tanpa reasoning)
- ❌ Personal criticism atau judgment

### **When Disagreeing:**
1. **Acknowledge** their point
2. **Explain** your reasoning
3. **Provide evidence** atau examples
4. **Suggest compromise** atau alternative
5. **Escalate** ke maintainer jika deadlock

## ⏱️ Timeline Expectations

### **Standard Review:**
- **Simple changes:** 24 business hours
- **Medium changes:** 48 business hours
- **Complex changes:** 72 business hours

### **Urgent Reviews:**
- **Production bugs:** 4 business hours
- **Client deadline:** 24 business hours
- **Security issues:** Immediate

### **Response Time:**
- **Initial review:** Within timeline above
- **Follow-up questions:** 4 business hours
- **Updated code:** 24 business hours

## 🔧 Technical Guidelines

### **Code Review Focus Areas:**

#### **Backend (Go/PHP)**
- Error handling patterns
- Database query efficiency
- API response consistency
- Security best practices
- Memory management

#### **Frontend (React/TypeScript)**
- Component reusability
- Performance optimization
- Accessibility compliance
- User experience consistency
- Browser compatibility

#### **Database**
- Query optimization
- Index efficiency
- Data integrity
- Migration safety
- Backup considerations

#### **Infrastructure**
- Configuration management
- Security settings
- Performance monitoring
- Backup procedures
- Scalability planning

## 🎓 Learning & Development

### **Review as Learning:**
- **Authors:** Learn dari feedback dan patterns
- **Reviewers:** Learn dari different approaches
- **Team:** Build collective knowledge base

### **Knowledge Sharing:**
- **Code walkthroughs:** Complex logic explanation
- **Pattern identification:** Best practice examples
- **Architecture discussions:** Design decision rationale
- **Tool recommendations:** Productivity improvements

### **Mentorship Program:**
- **Junior developers:** Paired dengan senior reviewers
- **Code review guidelines:** Regular training sessions
- **Quality standards:** Team alignment meetings
- **Best practices:** Knowledge sharing workshops

## 🚨 Anti-Patterns to Avoid

### **For Reviewers:**
- **Nitpicking:** Focus pada minor style issues
- **Gatekeeping:** Unnecessary barriers to merge
- **Micromanagement:** Over-prescriptive feedback
- **Delayed feedback:** Holding up reviews unnecessarily

### **For Authors:**
- **Defensive:** Arguing dengan semua feedback
- **Incomplete:** Pushing unfinished work
- **Unresponsive:** Ignoring review comments
- **Rushing:** Merging before proper review

### **Process Issues:**
- **Self-approval:** Never approve your own PR
- **Rubber stamping:** Approval tanpa proper review
- **Scope creep:** Adding unrelated changes
- **Bypassing:** Direct commits ke main branch

## 📊 Quality Metrics

### **Review Quality Indicators:**
- **Bug detection:** Issues caught in review vs production
- **Knowledge transfer:** Team understanding improvement
- **Code consistency:** Standards adherence
- **Security improvements:** Vulnerability prevention

### **Process Efficiency:**
- **Review time:** Average time to approval
- **Revision cycles:** Average rounds of changes
- **Merge rate:** Percentage approved without major changes
- **Team satisfaction:** Feedback on process effectiveness

## 🔗 Integration dengan Other Processes

### **Git Workflow:**
- PR creation adalah bagian dari [Git workflow](./workflow-git.md)
- Branch protection rules enforce review requirements
- Merge dengan squash maintain clean history

### **Project Management:**
- Issues linked ke PRs untuk traceability
- Project cards updated dengan PR status
- Timeline considerations dalam planning

### **Quality Assurance:**
- Code review complement automated testing
- Security review untuk sensitive changes
- Performance review untuk critical paths

---

**Remember:** Code review is about collaboration and improvement, not criticism. Every review is an opportunity for team growth and knowledge sharing. Be constructive, be respectful, and focus on building better software together.

*Related SOPs:* [Git Workflow](./workflow-git.md) | [Deployment Checklist](./deployment-checklist.md) | [Security Practices](./security-practices.md)