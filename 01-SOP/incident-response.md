# 🚨 Incident Response SOP

Standard Operating Procedure untuk menangani critical incidents di Akordium Lab. Fokus pada fast recovery, clear communication, dan learning dari setiap incident.

## 🎯 Incident Response Philosophy

### **Primary Goals:**
- **Minimize Downtime:** Restore services as quickly as possible
- **User Experience:** Limit impact pada customers
- **Data Safety:** Protect user data dan company assets
- **Learning:** Learn dari setiap incident
- **Prevention:** Prevent similar incidents di future

### **Response Principles:**
- **Speed over Perfection:** Fix first, perfect later
- **Communication First:** Keep stakeholders informed
- **Blameless Culture:** Focus on systems, not individuals
- **Documentation:** Record everything for learning

## 🚨 Incident Classification

### **Severity Levels**
#### **P0 - Critical (Total Outage)**
- Service completely unavailable
- Major data corruption or loss
- Security breach dengan active threat
- **Response Time:** 15 minutes
- **Resolution Target:** 1-2 hours
- **Examples:** Website down, payment processing failed, database corrupted

#### **P1 - High (Major Impact)**
- Service partially available dengan significant degradation
- Important features non-functional
- Performance issues affecting majority users
- **Response Time:** 30 minutes
- **Resolution Target:** 4-8 hours
- **Examples:** Slow loading times, API timeouts, login failures

#### **P2 - Medium (Limited Impact)**
- Service available dengan some issues
- Non-critical features not working
- Performance issues affecting subset of users
- **Response Time:** 2 hours
- **Resolution Target:** 24 hours
- **Examples:** Report generation slow, minor UI bugs, email delays

#### **P3 - Low (Minor Impact)**
- Service fully functional dengan cosmetic issues
- Workarounds available
- **Response Time:** 24 hours
- **Resolution Target:** 72 hours
- **Examples:** Typo errors, minor display issues, documentation gaps

## 👥 Response Team Roles

### **Incident Commander (IC)**
- **Responsibilities:** Overall coordination, decision making, communication
- **Skills:** Technical leadership, crisis management, communication
- **Authority:** Can make executive decisions during incident

### **Technical Lead (TL)**
- **Responsibilities:** Technical investigation, solution implementation
- **Skills:** Deep system knowledge, debugging, problem solving
- **Focus:** Restore service functionality

### **Communications Lead**
- **Responsibilities:** Stakeholder communication, status updates
- **Skills:** Clear writing, customer communication, diplomacy
- **Channels:** Internal team, customers, management

### **Subject Matter Experts (SMEs)**
- **Responsibilities:** Domain-specific expertise
- **Examples:** Database admin, network engineer, security specialist
- **Role:** Provide specialized knowledge saat needed

## ⏰ Response Timeline

### **Phase 1: Detection (0-5 minutes)**
#### **Identification**
- **Monitoring Alerts:** Automated system alerts
- **User Reports:** Customer complaints, support tickets
- **Manual Detection:** Team member发现问题
- **Health Checks:** Failed automated checks

#### **Initial Assessment**
```bash
# Quick verification checklist
curl -f https://app.akordium.id/health
curl -f https://api.akordium.id/health
psql $DATABASE_URL -c "SELECT 1;"
redis-cli ping
```

#### **Triage Questions**
- What services are affected?
- How many users impacted?
- Is this security-related?
- Any recent deployments or changes?

### **Phase 2: Immediate Response (5-30 minutes)**
#### **Declaration**
- Create incident channel (Slack/WhatsApp)
- Tag severity level (P0, P1, P2, P3)
- Assemble initial response team
- Declare war room jika P0/P1

#### **Communication**
- **Internal:** Incident channel created, team notified
- **External:** Status page update (jika applicable)
- **Stakeholders:** Management and relevant teams informed

#### **Initial Actions**
- **Stabilize:** Prevent further damage
- **Isolate:** Contain affected systems
- **Preserve:** Save logs dan evidence
- **Assess:** Determine scope dan impact

### **Phase 3: Investigation (30 minutes - 2 hours)**
#### **Root Cause Analysis**
- **Timeline:** Identify when incident started
- **Changes:** Recent deployments, config updates
- **Logs:** Application, system, database logs
- **Metrics:** Performance, error rates, resource usage

#### **Diagnostic Commands**
```bash
# System health
top -p $(pgrep process-name)
df -h
free -m

# Application logs
tail -f /var/log/app.log
docker logs container-name

# Database status
pg_stat_activity
show processlist
```

#### **Hypothesis Testing**
- Formulate likely causes
- Test hypotheses systematically
- Document findings dan evidence
- Update team on progress

### **Phase 4: Resolution (1-8 hours)**
#### **Solution Implementation**
- **Quick Fix:** Restore service immediately
- **Proper Fix:** Address root cause
- **Validation:** Verify fix works
- **Monitoring:** Watch for recurrence

#### **Rollback Decisions**
- If recent deployment caused issue
- Rollback to previous stable version
- Verify service restoration
- Plan proper fix untuk later

#### **Testing dan Validation**
- **Smoke Tests:** Basic functionality
- **Integration Tests:** Core user workflows
- **Performance Tests:** Response times
- **User Validation:** Real user scenarios

### **Phase 5: Recovery (1-24 hours)**
#### **Service Restoration**
- Confirm all services operational
- Verify data integrity
- Monitor system stability
- Performance baseline check

#### **Post-Incident Monitoring**
- Enhanced monitoring untuk 24-48 hours
- Automated alerts for recurrence
- Regular health checks
- Performance metrics tracking

## 📋 Incident Command System

### **Incident Declaration**
```markdown
## 🚨 INCIDENT DECLARED

**Incident ID:** INC-2024-001
**Severity:** P0 - Critical
**Service:** Primary Application
**Start Time:** 2024-12-01 14:30 UTC
**Impact:** All users unable to access application

### Current Status
- [x] Incident declared
- [x] Response team assembled
- [ ] Investigation in progress
- [ ] Resolution implemented
- [ ] Service restored

### Response Team
- **Incident Commander:** @name
- **Technical Lead:** @name
- **Communications:** @name
- **SMEs:** @name1, @name2

### Timeline
- 14:30: Initial detection
- 14:35: Incident declared
- 14:40: Team assembled
- 14:45: Investigation started

### Next Steps
1. Identify root cause
2. Implement fix
3. Validate resolution
4. Post-incident monitoring
```

### **Communication Templates**

#### **Internal Status Update**
```markdown
## Status Update - INC-2024-001

**Time:** 15:30 UTC
**Status:** Investigation in Progress
**Impact:** [Current impact assessment]

### Findings
- [ ] System logs showing [pattern]
- [ ] Recent deployment at [time]
- [ ] Database connections [status]

### Actions Taken
- [ ] Rollback initiated
- [ ] Additional monitoring enabled
- [ ] Team investigating [area]

### ETA
- [ ] Estimated resolution: [timeframe]
- [ ] Next update: [time]
```

#### **External Communication**
```markdown
## Service Status Update

We're currently experiencing issues with [service].

**Current Status:** We're investigating reports of [issue description]
**Impact:** Some users may experience [symptom]
**Actions:** Our team is actively working on a resolution

**Last Updated:** [time]
**Next Update:** [time]

We apologize for the inconvenience and appreciate your patience.
```

## 🔧 Technical Procedures

### **Common Incident Scenarios**

#### **Database Issues**
```bash
# Check database connectivity
psql $DATABASE_URL -c "SELECT 1;"

# Check active connections
psql $DATABASE_URL -c "SELECT count(*) FROM pg_stat_activity;"

# Check slow queries
psql $DATABASE_URL -c "SELECT query, mean_time, calls FROM pg_stat_statements ORDER BY mean_time DESC LIMIT 10;"

# Restart database service
sudo systemctl restart postgresql
```

#### **Application Crash**
```bash
# Check application logs
tail -f /var/log/app.log

# Restart application service
sudo systemctl restart app-service

# Check memory usage
free -m
ps aux --sort=-%mem | head
```

#### **High CPU/Memory Usage**
```bash
# Find processes using high CPU
top -o %CPU

# Find processes using high memory
top -o %MEM

# Kill problematic process
kill -9 <process-id>

# Restart affected service
sudo systemctl restart service-name
```

#### **Network Issues**
```bash
# Check network connectivity
ping google.com
netstat -tulpn

# Check DNS resolution
nslookup app.akordium.id

# Restart network service
sudo systemctl restart networking
```

## 📊 Post-Incident Process

### **Incident Report Template**
```markdown
# Post-Incident Report: INC-2024-001

## Executive Summary
- **Incident Duration:** [start] to [end] ([total] hours)
- **Impact:** [number] users affected, [business impact]
- **Root Cause:** [brief description]
- **Resolution:** [how fixed]

## Timeline
| Time | Event |
|------|-------|
| 14:30 | Initial detection |
| 14:35 | Incident declared |
| 14:40 | Team assembled |
| 15:15 | Root cause identified |
| 15:45 | Fix implemented |
| 16:00 | Service restored |
| 16:30 | Monitoring verified |

## Root Cause Analysis
### What Happened
[Detailed description of the incident]

### Why It Happened
[Technical explanation of root cause]

### Contributing Factors
- Recent deployment
- Configuration changes
- Infrastructure issues
- Human error
- External dependencies

## Impact Assessment
### User Impact
- **Affected Users:** [number/count]
- **Duration of Impact:** [timeframe]
- **Functional Impact:** [what wasn't working]
- **Data Impact:** [any data loss/corruption]

### Business Impact
- **Revenue Impact:** [financial impact if any]
- **Customer Satisfaction:** [customer feedback]
- **Reputation Impact:** [public perception]
- **SLA Impact:** [service level agreement impact]

## Response Assessment
### What Went Well
- [ ] Fast detection
- [ ] Effective communication
- [ ] Quick resolution
- [ ] Good teamwork

### Areas for Improvement
- [ ] Monitoring gaps
- [ ] Alerting issues
- [ ] Documentation problems
- [ ] Process breakdowns

## Action Items
### Immediate Actions (Completed)
- [x] Fix implemented
- [x] Service restored
- [x] Monitoring enhanced

### Short-term Actions (1-2 weeks)
- [ ] Update monitoring alerts
- [ ] Improve runbooks
- [ ] Team training
- [ ] Process improvements

### Long-term Actions (1-3 months)
- [ ] Architecture changes
- [ ] Additional tooling
- [ ] Policy updates
- [ ] Training programs

## Lessons Learned
1. [Key lesson 1]
2. [Key lesson 2]
3. [Key lesson 3]

## Follow-up
- **Retrospective Meeting:** Scheduled for [date]
- **Action Item Review:** Weekly check-ins
- **Process Update:** SOP changes documented
```

### **Retrospective Meeting**
#### **Participants**
- All incident response team members
- Relevant stakeholders
- Management representatives

#### **Agenda**
1. **Timeline Review:** Walk through incident timeline
2. **Root Cause Discussion:** Deep dive into technical causes
3. **Response Assessment:** What worked, what didn't
4. **Process Improvement:** Identify areas for improvement
5. **Action Items:** Define specific next steps
6. **Learning:** Key takeaways untuk team

#### **Outcome**
- **Action items** assigned dengan owners dan deadlines
- **Process updates** documented dalam relevant SOPs
- **Training needs** identified dan scheduled
- **Tooling requirements** evaluated dan prioritized

## 🛡️ Prevention Strategies

### **Monitoring Enhancements**
- **Health Checks:** Comprehensive service health monitoring
- **Performance Metrics:** Baseline dan anomaly detection
- **Alert Tuning:** Reduce false positives, catch real issues
- **Log Aggregation:** Centralized logging dengan search capabilities

### **Process Improvements**
- **Change Management:** Better deployment procedures
- **Documentation:** Updated runbooks dan troubleshooting guides
- **Training:** Regular incident response drills
- **Communication:** Pre-defined templates dan channels

### **Technical Improvements**
- **Redundancy:** Eliminate single points of failure
- **Circuit Breakers:** Prevent cascade failures
- **Graceful Degradation:** Fallback functionality
- **Automated Recovery:** Self-healing capabilities

## 📞 Emergency Contacts

### **Internal Contacts**
- **Incident Commander:** [Name, Phone, Email]
- **Technical Lead:** [Name, Phone, Email]
- **System Administrator:** [Name, Phone, Email]
- **Database Administrator:** [Name, Phone, Email]
- **Security Lead:** [Name, Phone, Email]

### **External Contacts**
- **Hosting Provider:** [Company, Support Hotline]
- **CDN Provider:** [Company, Support Hotline]
- **DNS Provider:** [Company, Support Hotline]
- **Security Consultant:** [Name, Phone, Email]

### **Communication Channels**
- **Incident Channel:** #incidents (Slack/WhatsApp)
- **Management Updates:** Email distribution list
- **Customer Updates:** Status page, social media
- **Press Inquiries:** [Contact person, Phone]

---

**Remember:** The goal of incident response is not just to fix the problem, but to learn from it and prevent it from happening again. Every incident is an opportunity to improve our systems and processes.

*Related SOPs:* [Deployment Checklist](./deployment-checklist.md) | [Security Practices](./security-practices.md) | [Communication Guidelines](./komunikasi.md)