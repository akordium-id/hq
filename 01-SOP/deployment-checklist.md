# 🚀 Deployment Checklist

Deployment checklist untuk memastikan proses deployment di Akordium Lab berjalan smooth, safe, dan terdokumentasi. Mengikuti DevOps best practices dengan zero-downtime mindset.

## 🎯 Deployment Philosophy

### **Primary Goals:**
- **Zero Downtime:** Users tidak terganggu oleh deployment
- **Rollback Ready:** Always ada cara untuk kembali ke versi sebelumnya
- **Security First:** Tidak ada security gaps saat deployment
- **Documentation:** Semua perubahan terdokumentasi
- **Monitoring:** Health checks dan alerts aktif

### **Deployment Types:**
- **Hotfix:** Critical bug fix ke production (expedited)
- **Feature:** New functionality ke production (standard)
- **Infrastructure:** Server/config changes (careful)
- **Database:** Schema changes (dangerous)

## 📋 Pre-Deployment Checklist

### **1. Code Readiness**
- [ ] **All tests pass** (unit, integration, e2e)
- [ ] **Code review completed** dan approved
- [ ] **Branch up-to-date** dengan main/latest
- [ ] **Security scan completed** (jika applicable)
- [ ] **Performance testing** untuk significant changes
- [ ] **Documentation updated** (API docs, README, changelog)

### **2. Environment Preparation**
- [ ] **Staging deployment** successful dan tested
- [ ] **Database migrations** tested di staging
- [ ] **Environment variables** verified untuk target environment
- [ ] **Dependencies checked** (no breaking changes)
- [ ] **Backup plan** ready (database, files)
- [ ] **Rollback procedure** documented dan tested

### **3. Communication & Coordination**
- [ ] **Team notified** tentang deployment window
- [ ] **Stakeholders informed** jika user-facing changes
- [ ] **Slack/WhatsApp channel** prepared untuk updates
- [ ] **On-call engineer** designated dan available
- [ ] **Customer support** notified jika needed

### **4. Safety Checks**
- [ ] **Feature flags** ready untuk gradual rollout
- [ ] **Load balancer** configuration verified
- [ ] **SSL certificates** valid (jika HTTPS)
- [ ] **Monitoring alerts** enabled dan tested
- [ ] **Log aggregation** working properly
- [ ] **Database connections** pool sizes appropriate

## 🔄 Deployment Process

### **Step 1: Final Verification**
```bash
# Verify branch dan environment
git checkout main
git pull origin main
git status  # Ensure clean working directory

# Run final tests
go test ./...
npm test  # jika applicable
```

### **Step 2: Staging Deployment (if not done)**
- Deploy ke staging environment
- Run smoke tests
- Verify functionality works end-to-end
- Performance baseline check
- Security validation

### **Step 3: Production Deployment**
#### **A. Preparation**
```bash
# Create deployment tag
git tag -a v1.2.3 -m "Release v1.2.3: Add payment gateway integration"
git push origin v1.2.3

# Backup database (jika database changes)
pg_dump dbname > backup_$(date +%Y%m%d_%H%M%S).sql
```

#### **B. Deployment via Coolify**
- Login ke Coolify dashboard
- Select project dan environment
- Choose commit/tag untuk deploy
- Set deployment options (health checks, etc.)
- Start deployment process

#### **C. Database Migrations**
```bash
# Run migrations with backup first
php artisan migrate --step --force  # Laravel
# atau
migrate -path ./migrations -database-url $DATABASE_URL  # Go
```

### **Step 4: Health Checks**
```bash
# Basic health checks
curl -f https://api.akordium.id/health || exit 1
curl -f https://app.akordium.id/ping || exit 1

# Database connectivity
psql $DATABASE_URL -c "SELECT 1;" || exit 1

# Service dependencies
curl -f redis-host:6379/ping || exit 1
```

## 📊 Post-Deployment Verification

### **Immediate Checks (5 minutes)**
- [ ] **Application starts** successfully
- [ ] **Health endpoints** responding correctly
- [ ] **Database connectivity** working
- [ ] **External APIs** accessible
- [ ] **No error spikes** di logs
- [ ] **Load balancer** traffic flowing

### **Functional Tests (15 minutes)**
- [ ] **User login** works correctly
- [ ] **Core features** functioning
- [ ] **API endpoints** responding
- [ ] **File uploads** working (jika applicable)
- [ ] **Payment processing** (jika applicable)
- [ ] **Email notifications** sending

### **Performance Verification (30 minutes)**
- [ ] **Response times** within acceptable range
- [ ] **Error rates** below threshold
- [ ] **Database queries** efficient
- [ ] **Memory usage** stable
- [ ] **CPU usage** normal
- [ ] **Network latency** acceptable

### **Business Logic Testing (1 hour)**
- [ ] **User workflows** complete successfully
- [ ] **Data integrity** maintained
- [ ] **Reports** generate correctly
- [ ] **Search functionality** working
- [ ] **Background jobs** processing
- [ ] **Scheduled tasks** running

## 🔧 Environment-Specific Procedures

### **Production Deployment**
**Additional Requirements:**
- [ ] **Change request** documented dan approved
- [ ] **Business hours** consideration (jika applicable)
- [ ] **Customer communication** prepared
- [ ] **Rollback plan** tested dan communicated
- [ ] **Monitoring dashboard** prepared
- [ ] **Incident response** team on standby

### **Staging Deployment**
**Purpose:** Production simulation untuk testing
- [ ] **Production-like data** (anonymized jika needed)
- [ ] **Same configuration** sebagai production
- [ ] **Full testing suite** executed
- [ ] **Performance benchmarks** recorded
- [ ] **Security validation** completed

### **Development Environment**
**Purpose:** Feature development dan debugging
- [ ] **Hot reload** enabled
- [ ] **Debug tools** available
- [ ] **Test data** easily accessible
- [ ] **Fast feedback loops**
- [ ] **Integration testing** capabilities

## 🚨 Rollback Procedures

### **When to Rollback**
- **Critical bugs** affecting core functionality
- **Performance degradation** (>50% slower)
- **Security vulnerabilities** detected
- **Data corruption** or loss
- **External dependencies** unavailable

### **Rollback Steps**
#### **Application Rollback**
```bash
# Via Coolify (preferred)
1. Select previous deployment
2. Confirm rollback
3. Verify health checks
4. Monitor for 15 minutes

# Manual rollback (emergency)
git checkout previous-tag
docker-compose down
docker-compose up -d --build
```

#### **Database Rollback**
```bash
# Laravel migrations rollback
php artisan migrate:rollback --step=1 --force

# Custom database restore
psql dbname < backup_20241201_143022.sql
```

#### **Verification**
- [ ] Health checks passing
- [ ] Core functionality working
- [ ] No data corruption
- [ ] Performance acceptable
- [ ] Users not affected

## 📝 Deployment Documentation

### **Release Notes Template**
```markdown
## Release v1.2.3 - 2024-12-01

### Features
- Feature 1 description
- Feature 2 description

### Bug Fixes
- Fix for critical login issue (#123)
- Performance optimization for queries (#124)

### Improvements
- Updated UI for better UX
- Enhanced error logging

### Breaking Changes
- API endpoint changed from /old to /new
- Database migration required

### Deployment Notes
- Zero-downtime deployment
- Database migration took 2 minutes
- No rollback needed
```

### **Deployment Log**
- **Timestamp:** Start dan end times
- **Environment:** Target deployment environment
- **Changeset:** Commit hash atau tag
- **Team:** Deployer dan reviewer names
- **Issues:** Any problems encountered
- **Rollback:** Whether rollback was needed
- **Verification:** Test results summary

## 🎯 Deployment Best Practices

### **Before Deployment**
- **Test thoroughly** di environment yang mirip production
- **Automate** sebanyak mungkin untuk consistency
- **Communicate** dengan semua stakeholders
- **Prepare** rollback plan sebelum mulai
- **Monitor** baseline metrics sebelum deployment

### **During Deployment**
- **Deploy in small increments** untuk easier troubleshooting
- **Monitor continuously** selama proses
- **Communicate status** ke team
- **Be ready untuk rollback** anytime
- **Document** semua yang terjadi

### **After Deployment**
- **Monitor closely** untuk beberapa jam
- **Gather feedback** dari users
- **Update documentation** dengan lessons learned
- **Analyze metrics** untuk improvement
- **Celebrate success** dengan team!

## 🔗 Integration dengan Other Processes

### **Code Review:**
- [Code review SOP](./code-review.md) harus completed sebelum deployment

### **Incident Response:**
- Gunakan [incident response SOP](./incident-response.md) jika deployment gagal

### **Security Practices:**
- Follow [security practices SOP](./security-practices.md) untuk semua deployments

### **Project Management:**
- Update GitHub Projects dengan deployment status
- Close deployment-related issues

---

**Remember:** Smooth deployments are result of preparation, not luck. Every deployment should be boring and predictable. If deployment is exciting, you're not prepared enough.

*Related SOPs:* [Code Review](./code-review.md) | [Incident Response](./incident-response.md) | [Security Practices](./security-practices.md) | [Git Workflow](./workflow-git.md)