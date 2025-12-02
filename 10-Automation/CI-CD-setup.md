# 🔄 CI/CD Setup Guide

Dokumentasi lengkap untuk setup dan konfigurasi Continuous Integration/Continuous Deployment (CI/CD) pipeline di Akordium Lab.

## 🏗️ Architecture Overview

### Current Stack

- **Version Control**: GitHub
- **CI/CD Platform**: GitHub Actions
- **Deployment**: Coolify (PaaS)
- **Infrastructure**: Oracle Cloud
- **Monitoring**: GitHub Actions logs + application monitoring

### Pipeline Flow

```
Code Push → GitHub Actions → Build → Test → Security Scan → Deploy → Monitor
```

## 📋 CI/CD Pipeline Stages

### 1. **Pre-commit Hooks**

```yaml
# .husky/pre-commit
#!/bin/sh
. "$(dirname "$0")/_/husky.sh"
npx lint-staged
npm run test
```

### 2. **Continuous Integration (CI)**

- **Code Quality**: ESLint, Prettier, PHP-CS-Fixer
- **Testing**: PHPUnit, Jest, Go test
- **Security**: Snyk, Dependabot, security scanning
- **Build**: Docker image creation, asset compilation

### 3. **Continuous Deployment (CD)**

- **Staging**: Auto-deploy on push to `develop` branch
- **Production**: Manual approval on `main` branch
- **Rollback**: Automated rollback on failure detection

## 🔧 Configuration Templates

### GitHub Actions Workflow Template

```yaml
# .github/workflows/ci-cd.yml
name: CI/CD Pipeline

on:
  push:
    branches: [ develop, main ]
  pull_request:
    branches: [ main ]

jobs:
  test:
    runs-on: ubuntu-latest
    services:
      postgres:
        image: postgres:15
        env:
          POSTGRES_PASSWORD: postgres
          POSTGRES_DB: test_db
        options: >-
          --health-cmd pg_isready
          --health-interval 10s
          --health-timeout 5s
          --health-retries 5

    steps:
    - uses: actions/checkout@v4

    - name: Setup Go
      uses: actions/setup-go@v4
      with:
        go-version: '1.21'

    - name: Setup Node.js
      uses: actions/setup-node@v4
      with:
        node-version: '20'
        cache: 'npm'

    - name: Install dependencies
      run: |
        go mod download
        npm ci

    - name: Run tests
      run: |
        go test -v ./...
        npm run test

    - name: Security scan
      run: |
        go vet ./...
        npm audit

  build:
    needs: test
    runs-on: ubuntu-latest
    if: github.ref == 'refs/heads/develop' || github.ref == 'refs/heads/main'

    steps:
    - uses: actions/checkout@v4

    - name: Build Docker image
      run: |
        docker build -t akordium/${{ github.event.repository.name }}:${{ github.sha }} .

    - name: Push to registry
      run: |
        echo ${{ secrets.DOCKER_PASSWORD }} | docker login -u ${{ secrets.DOCKER_USERNAME }} --password-stdin
        docker push akordium/${{ github.event.repository.name }}:${{ github.sha }}

  deploy:
    needs: build
    runs-on: ubuntu-latest
    if: github.ref == 'refs/heads/develop'

    steps:
    - name: Deploy to staging
      run: |
        curl -X POST "${{ secrets.COOLIFY_WEBHOOK_URL }}" \
          -H "Authorization: Bearer ${{ secrets.COOLIFY_TOKEN }}" \
          -H "Content-Type: application/json" \
          -d '{
            "image": "akordium/${{ github.event.repository.name }}:${{ github.sha }}",
            "environment": "staging"
          }'

  deploy-production:
    needs: build
    runs-on: ubuntu-latest
    if: github.ref == 'refs/heads/main'
    environment: production

    steps:
    - name: Deploy to production
      run: |
        curl -X POST "${{ secrets.COOLIFY_WEBHOOK_URL }}" \
          -H "Authorization: Bearer ${{ secrets.COOLIFY_TOKEN }}" \
          -H "Content-Type: application/json" \
          -d '{
            "image": "akordium/${{ github.event.repository.name }}:${{ github.sha }}",
            "environment": "production"
          }'
```

### Environment Configuration

```yaml
# .github/workflows/deploy-staging.yml
name: Deploy to Staging

on:
  push:
    branches: [ develop ]

jobs:
  deploy:
    runs-on: ubuntu-latest
    environment: staging

    steps:
    - uses: actions/checkout@v4

    - name: Deploy to Coolify
      uses: self-actuated/cdn-connect@v1
      with:
        webhook: ${{ secrets.COOLIFY_STAGING_WEBHOOK }}
        token: ${{ secrets.COOLIFY_TOKEN }}
```

## 🔐 Security Configuration

### Required Secrets

```yaml
# GitHub Repository Settings → Secrets and variables → Actions
secrets:
  DOCKER_USERNAME: "akordium_docker_username"
  DOCKER_PASSWORD: "docker_registry_password"
  COOLIFY_TOKEN: "coolify_api_token"
  COOLIFY_WEBHOOK_URL: "coolify_deployment_webhook"
  SLACK_WEBHOOK: "slack_notification_webhook"
  SENTRY_AUTH_TOKEN: "sentry_error_tracking_token"
```

### Security Best Practices

1. **Minimal Permissions**: Grant least privilege access to secrets
2. **Secret Rotation**: Regular rotation of API keys and tokens
3. **Audit Logs**: Monitor all deployment activities
4. **Environment Isolation**: Separate secrets for staging/production

## 📊 Monitoring & Alerting

### Slack Notifications

```yaml
# .github/workflows/notify.yml
name: Pipeline Notifications

on:
  workflow_run:
    workflows: ["CI/CD Pipeline"]
    types: [completed]

jobs:
  notify:
    runs-on: ubuntu-latest
    if: ${{ github.event.workflow_run.conclusion != 'success' }}

    steps:
    - name: Send Slack notification
      uses: 8398a7/action-slack@v3
      with:
        status: failure
        channel: '#deployments'
        webhook_url: ${{ secrets.SLACK_WEBHOOK }}
```

### Health Checks

```yaml
# Post-deployment health check
- name: Health Check
  run: |
    timeout 300 bash -c 'until curl -f http://${{ env.APP_URL }}/health; do sleep 5; done'
```

## 🚀 Deployment Strategies

### Blue-Green Deployment

- Zero downtime deployment
- Easy rollback capability
- Traffic switching via load balancer

### Rolling Updates

- Gradual instance replacement
- Health check validation
- Auto-rollback on failure

### Canary Releases

- Gradual traffic routing
- Monitor metrics before full rollout
- Quick rollback capability

## 🔧 Environment Setup

### Staging Environment

```yaml
# coolify-staging.yml
version: "3.8"
services:
  app:
    image: akordium/app:staging
    environment:
      - NODE_ENV=staging
      - DB_HOST=staging-db.akordium.id
      - REDIS_HOST=staging-redis.akordium.id
```

### Production Environment

```yaml
# coolify-production.yml
version: "3.8"
services:
  app:
    image: akordium/app:production
    replicas: 3
    environment:
      - NODE_ENV=production
      - DB_HOST=prod-db.akordium.id
      - REDIS_HOST=prod-redis.akordium.id
    healthcheck:
      test: ["CMD", "curl", "-f", "http://localhost:3000/health"]
      interval: 30s
      timeout: 10s
      retries: 3
```

## 📝 Project Setup Checklist

### New Project CI/CD Setup

- [ ] Create GitHub repository
- [ ] Set up branch protection rules
- [ ] Configure required secrets
- [ ] Copy workflow templates from `github-actions-library/`
- [ ] Set up environments (staging, production)
- [ ] Configure Coolify deployment
- [ ] Set up monitoring and alerting
- [ ] Test pipeline with dummy deployment
- [ ] Document project-specific configurations

### Branch Protection Rules

```yaml
# Repository Settings → Branches → Branch protection rule
main:
  require_pull_request_reviews: true
  require_approving_reviews: 2
  dismiss_stale_reviews: true
  require_status_checks: true
  required_status_checks:
    - test (ubuntu-latest)
    - build (ubuntu-latest)
  enforce_admins: true
```

## 🛠️ Troubleshooting

### Common Issues

1. **Pipeline Stuck in Pending**
   - Check runner availability
   - Verify workflow syntax
   - Review rate limits

2. **Deployment Failures**
   - Check Coolify connectivity
   - Verify image availability
   - Review application logs

3. **Test Failures**
   - Check test dependencies
   - Verify environment variables
   - Review test data setup

### Debug Commands

```bash
# Check workflow logs
gh run list --repo akordium/project-name
gh run view <run-id> --repo akordium/project-name

# Debug deployment
curl -X GET "${COOLIFY_API_URL}/deployments" \
  -H "Authorization: Bearer ${COOLIFY_TOKEN}"
```

## 📚 Additional Resources

- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [Coolify Documentation](https://coolify.io/docs)
- [Docker Best Practices](https://docs.docker.com/develop/dev-best-practices/)
- [Akordium GitHub Actions Library](./github-actions-library/)

---

> *"Automating deployment is not about eliminating manual work, but about making deployment reliable, repeatable, and fast."*
