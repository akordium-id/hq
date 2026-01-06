# 🐛 Klustera.id - Known Issues & Limitations

> Known bugs, limitations, dan workarounds untuk Klustera.id

## 📋 Known Issues

*No issues yet - Product is in concept phase*

---

## ⚠️ Limitations

### Technical Limitations

#### Multi-Tenancy
- **Limitation:** Maximum 10,000 complexes per database instance (due to PostgreSQL connection limits)
- **Workaround:** For >10,000 complexes, implement database sharding (planned for Phase 3)
- **Timeline:** Expected to address by Milestone 9 (Enterprise features)

#### Invoice Generation Performance
- **Limitation:** Generating 10,000+ invoices may take >1 minute
- **Workaround:** Use queue system, generate invoices in batches during off-peak hours
- **Timeline:** Optimize by Milestone 6 (Analytics)

#### File Upload Size
- **Limitation:** Max 10MB per file upload (resident photos, complaint photos)
- **Workaround:** Compress photos before uploading, use Cloudflare R2 for large files
- **Timeline:** Current limitation, may increase based on user feedback

---

### Feature Limitations

#### Access Control
- **Limitation:** QR codes valid for maximum 30 days (security feature)
- **Workaround:** Residents must refresh QR code every 30 days
- **Timeline:** Intentional design choice, not planned to change

#### Guest Pre-Registration
- **Limitation:** Maximum 10 active guests per resident at a time
- **Workaround:** Complete guest visits before registering new guests, or contact support to increase limit
- **Timeline:** May increase based on enterprise customer feedback

#### Facility Booking
- **Limitation:** Maximum 30 days advance booking
- **Workaround:** For longer-term bookings (e.g., event hall), contact property manager directly
- **Timeline:** May increase based on user feedback

#### Mobile App Offline Mode
- **Limitation:** Mobile apps cache data for maximum 7 days offline
- **Workaround:** Connect to internet at least once per week to sync data
- **Timeline:** Intentional design choice (balance offline capability with data freshness)

---

### Integration Limitations

#### Payment Gateway
- **Limitation:** Xendit only (Midtrans integration planned as backup)
- **Workaround:** For alternative payment methods, use manual payment recording
- **Timeline:** Midtrans integration planned for Milestone 2

#### WhatsApp Gateway
- **Limitation:** WhatsApp notifications depend on third-party gateway (may have downtime)
- **Workaround:** Email notifications sent as backup
- **Timeline:** Multiple gateway integrations planned for Milestone 6

---

## 🛠️ Workarounds

### Common Scenarios

#### Scenario 1: Payment Webhook Not Received

**Problem:** Xendit payment success but invoice still shows "pending"

**Workaround:**
1. Check Xendit dashboard to confirm payment succeeded
2. Get transaction ID dari Xendit
3. Contact Klustera support dengan transaction ID
4. Support team will manually reconcile payment

**Prevention:**
- Ensure webhook URL is correctly configured di Xendit dashboard
- Check webhook logs regularly

---

#### Scenario 2: WhatsApp Notifications Not Sending

**Problem:** Residents not receiving WhatsApp notifications

**Workaround:**
1. Check if email notifications received (backup channel)
2. Verify resident phone number is correct format (+62 xxx xxxx xxxx)
3. Check if WhatsApp gateway is operational (status page)
4. If gateway is down, notifications will queue and send when back online

**Prevention:**
- Residents can opt-in to email notifications as backup
- Check gateway status page: [Coming Soon]

---

#### Scenario 3: Mobile App Offline Sync Issues

**Problem:** Staff mobile app shows "Sync failed" after reconnecting to internet

**Workaround:**
1. Close and reopen mobile app
2. If still failing, clear app cache (Settings → Clear Cache)
3. Log out and log back in
4. If persistent, uninstall and reinstall app (data will sync from server)

**Prevention:**
- Connect to internet at least once per day
- Keep app updated to latest version

---

## 🐛 Bug Reporting

### How to Report Bugs

1. **Check Known Issues:** Review this document first
2. **Search Existing Issues:** Check GitHub Issues or support ticket system
3. **Gather Information:**
   - Steps to reproduce (what you did)
   - Expected behavior (what should happen)
   - Actual behavior (what actually happened)
   - Screenshots (if applicable)
   - Browser/app version
   - Error messages (if any)
4. **Submit Report:**
   - **Email:** support@klustera.id
   - **WhatsApp:** +62 815-9988-995
   - **GitHub Issues:** [Coming Soon]

### Bug Priority Levels

| Priority | Response Time | Definition |
|----------|---------------|------------|
| **P0 - Critical** | 4 hours | System down, data loss, security breach |
| **P1 - High** | 24 hours | Major feature broken, affecting all users |
| **P2 - Medium** | 3 days | Minor feature broken, affecting some users |
| **P3 - Low** | 1 week | Cosmetic issues, minor annoyances |

### Bug Fix Process

1. **Triaged:** Bug reviewed by team, priority assigned
2. **Scheduled:** Added to sprint backlog (if not immediate fix)
3. **In Progress:** Developer working on fix
4. **Testing:** Fix tested by QA team
5. **Deployed:** Fix deployed to production
6. **Verified:** Reporter confirms fix works

---

## 📊 Planned Fixes

### Upcoming Releases

#### Milestone 2 (Month 3-4)
- [ ] Improve invoice generation performance (batch processing)
- [ ] Add webhook retry logic untuk Xendit
- [ ] Implement email notification fallback untuk WhatsApp failures

#### Milestone 3 (Month 5-6)
- [ ] Optimize database queries untuk faster dashboard loading
- [ ] Add bulk operations untuk resident management
- [ ] Improve mobile app offline sync reliability

#### Milestone 6 (Month 11-12)
- [ ] Implement caching strategy (Redis) untuk faster analytics
- [ ] Add export scheduling (generate large reports asynchronously)
- [ ] Optimize report generation untuk large complexes (1000+ units)

---

## 🔒 Security Issues

### Reporting Security Vulnerabilities

**Do NOT create public issues for security vulnerabilities!**

**Process:**
1. **Email:** Send details to security@klustera.id
2. **Include:** Description of vulnerability, steps to reproduce, impact assessment
3. **Response:** Security team will acknowledge within 24 hours
4. **Fix:** Patch will be released within 7 days (critical) atau 30 days (non-critical)
5. **Disclosure:** Coordinated disclosure after fix is deployed

**Responsible Disclosure Policy:**
- Researchers credited for findings (if desired)
- No legal action for good-faith security research
- Possible bug bounty (coming soon)

---

## 📞 Getting Help

### Self-Service Resources

- **Documentation:** [README.md](./README.md)
- **User Guides:** [Coming Soon]
- **FAQ:** [Coming Soon]
- **Video Tutorials:** [Coming Soon]

### Support Channels

- **Email:** support@klustera.id
- **WhatsApp:** +62 815-9988-995
- **Slack Community:** [Coming Soon]
- **Office Hours:** Weekly Zoom call untuk Standard & Enterprise customers

### Response Times

| Plan | Email Response | WhatsApp Response |
|------|---------------|-------------------|
| **Community (Free)** | Best effort (community forum) | Not available |
| **Standard** | 24 hours | 24 hours |
| **Enterprise** | 4 hours | 4 hours |
| **Critical Issues** | 4 hours (all plans) | 4 hours (all plans) |

---

**Last Updated:** 2026-01-06
**Version:** 1.0.0-concept
**Maintainer:** Development Team
