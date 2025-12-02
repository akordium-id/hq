# 🤖 GitHub Actions Library

**Reusable GitHub Actions for Akordium Lab CI/CD Pipelines**

**Library Version:** 1.0
**Effective Date:** 1 Januari 2024
**Review Cycle:** Quarterly
**Maintained by:** DevOps Team & Tech Lead

---

## 🎯 Overview

### **Purpose:**

- Provide reusable GitHub Actions for common CI/CD tasks
- Standardize development workflows across projects
- Reduce duplication of pipeline configurations
- Ensure consistent quality and security standards
- Enable rapid pipeline development and maintenance

### **Available Actions:**

#### **🔄 CI/CD Actions:**

- `setup-go-env` - Go environment setup and caching
- `setup-node-env` - Node.js environment setup and caching
- `run-tests` - Comprehensive test execution
- `build-application` - Multi-language application building
- `deploy-to-coolify` - Automated deployment to Coolify

#### **🔍 Quality Actions:**

- `code-quality-check` - Code formatting and linting
- `security-scan` - Security vulnerability scanning
- `dependency-check` - Outdated dependency detection
- `performance-test` - Load and performance testing

#### **📝 Notification Actions:**

- `slack-notification` - Slack integration for notifications
- `teams-notification` - Microsoft Teams integration
- `email-notification` - Email notifications for pipeline status

---

## 🔄 CI/CD Actions

### **setup-go-env**

**Description:** Sets up Go environment with optimized caching

**Usage:**

```yaml
- name: Setup Go Environment
  uses: ./github-actions-library/setup-go-env
  with:
    go-version: '1.21'
    cache-modules: true
    cache-build-cache: true
```

**Inputs:**

| Input | Description | Required | Default |
|-------|-------------|----------|---------|
| `go-version` | Go version to setup | Yes | `1.21` |
| `cache-modules` | Enable module caching | No | `true` |
| `cache-build-cache` | Enable build cache | No | `true` |
| `working-directory` | Working directory | No | `.` |

**Outputs:**

| Output | Description |
|--------|-------------|
| `cache-hit` | Whether cache was hit |
| `go-path` | Go installation path |

---

### **setup-node-env**

**Description:** Sets up Node.js environment with npm/yarn caching

**Usage:**

```yaml
- name: Setup Node.js Environment
  uses: ./github-actions-library/setup-node-env
  with:
    node-version: '20'
    package-manager: 'npm'
    cache-dependencies: true
```

**Inputs:**

| Input | Description | Required | Default |
|-------|-------------|----------|---------|
| `node-version` | Node.js version | Yes | `20` |
| `package-manager` | Package manager (npm/yarn/pnpm) | No | `npm` |
| `cache-dependencies` | Enable dependency caching | No | `true` |
| `working-directory` | Working directory | No | `.` |

---

### **run-tests**

**Description:** Executes comprehensive test suite with coverage

**Usage:**

```yaml
- name: Run Tests
  uses: ./github-actions-library/run-tests
  with:
    framework: 'go'
    coverage-threshold: '80'
    generate-report: true
```

**Inputs:**

| Input | Description | Required | Default |
|-------|-------------|----------|---------|
| `framework` | Test framework (go/php/nodejs) | Yes | - |
| `test-path` | Test directory path | No | `./tests` |
| `coverage-threshold` | Minimum coverage percentage | No | `80` |
| `generate-report` | Generate test report | No | `true` |
| `parallel` | Run tests in parallel | No | `false` |

**Outputs:**

| Output | Description |
|--------|-------------|
| `tests-passed` | Whether all tests passed |
| `coverage-percentage` | Actual coverage percentage |
| `test-report-path` | Path to generated test report |

---

### **build-application**

**Description:** Builds application for multiple platforms and architectures

**Usage:**

```yaml
- name: Build Application
  uses: ./github-actions-library/build-application
  with:
    language: 'go'
    platforms: 'linux/amd64,linux/arm64'
    generate-artifacts: true
```

**Inputs:**

| Input | Description | Required | Default |
|-------|-------------|----------|---------|
| `language` | Programming language (go/php/nodejs) | Yes | - |
| `build-command` | Custom build command | No | Auto-detected |
| `platforms` | Target platforms | No | `linux/amd64` |
| `generate-artifacts` | Generate build artifacts | No | `true` |
| `artifact-prefix` | Artifact name prefix | No | `app` |

**Outputs:**

| Output | Description |
|--------|-------------|
| `build-success` | Whether build succeeded |
| `artifact-paths` | Paths to generated artifacts |
| `build-time` | Build duration in seconds |

---

### **deploy-to-coolify**

**Description:** Deploys application to Coolify PaaS platform

**Usage:**

```yaml
- name: Deploy to Coolify
  uses: ./github-actions-library/deploy-to-coolify
  with:
    coolify-url: ${{ secrets.COOLIFY_URL }}
    application-id: ${{ secrets.COOLIFY_APP_ID }}
    api-token: ${{ secrets.COOLIFY_API_TOKEN }}
```

**Inputs:**

| Input | Description | Required | Default |
|-------|-------------|----------|---------|
| `coolify-url` | Coolify instance URL | Yes | - |
| `application-id` | Application UUID | Yes | - |
| `api-token` | Coolify API token | Yes | - |
| `environment` | Target environment | No | `production` |
| `timeout` | Deployment timeout (seconds) | No | `600` |

**Outputs:**

| Output | Description |
|--------|-------------|
| `deployment-success` | Whether deployment succeeded |
| `deployment-url` | Live application URL |
| `deployment-id` | Coolify deployment ID |

---

## 🔍 Quality Actions

### **code-quality-check**

**Description:** Performs code formatting, linting, and quality analysis

**Usage:**

```yaml
- name: Code Quality Check
  uses: ./github-actions-library/code-quality-check
  with:
    language: 'go'
    check-formatting: true
| Input | Description | Required | Default |
| check-linting: true
| run-static-analysis: true
```

**Inputs:**

| Input | Description | Required | Default |
|-------|-------------|----------|---------|
| `language` | Programming language | Yes | - |
| `check-formatting` | Check code formatting | No | `true` |
| `check-linting` | Run linting tools | No | `true` |
| `run-static-analysis` | Run static analysis | No | `true` |
| `fail-on-warnings` | Fail on warnings | No | `false` |
| `config-file` | Custom configuration file | No | Auto-detected |

**Outputs:**

| Output | Description |
|--------|-------------|
| `formatting-passed` | Formatting check result |
| `linting-passed` | Linting check result |
| `analysis-score` | Static analysis score |
| `issues-found` | Number of issues found |

---

### **security-scan**

**Description:** Scans for security vulnerabilities and secrets

**Usage:**

```yaml
- name: Security Scan
  uses: ./github-actions-library/security-scan
  with:
    scan-type: 'comprehensive'
    fail-on-critical: true
```

**Inputs:**

| Input | Description | Required | Default |
|-------|-------------|----------|---------|
| `scan-type` | Scan type (basic/comprehensive) | No | `comprehensive` |
| `fail-on-critical` | Fail on critical vulnerabilities | No | `true` |
| `fail-on-high` | Fail on high vulnerabilities | No | `false` |
| `exclude-dev-dependencies` | Exclude development dependencies | No | `true` |
| `output-format` | Report format (json/sarif) | No | `sarif` |

**Outputs:**

| Output | Description |
|--------|-------------|
| `vulnerabilities-found` | Total vulnerabilities found |
| `critical-vulnerabilities` | Critical vulnerability count |
| `high-vulnerabilities` | High vulnerability count |
| `scan-report-path` | Path to scan report |

---

### **dependency-check**

**Description:** Checks for outdated dependencies and security updates

**Usage:**

```yaml
- name: Dependency Check
  uses: ./github-actions-library/dependency-check
  with:
    check-updates: true
    fail-on-major: true
```

**Inputs:**

| Input | Description | Required | Default |
|-------|-------------|----------|---------|
| `check-updates` | Check for dependency updates | No | `true` |
| `fail-on-major` | Fail on major version updates | No | `true` |
| `fail-on-minor` | Fail on minor version updates | No | `false` |
| `include-dev-dependencies` | Include dev dependencies | No | `false` |
| `generate-report` | Generate dependency report | No | `true` |

**Outputs:**

| Output | Description |
|--------|-------------|
| `outdated-dependencies` | Number of outdated dependencies |
| `updates-available` | Updates available count |
| `dependency-report-path` | Path to dependency report |

---

### **performance-test**

**Description:** Executes performance and load testing

**Usage:**

```yaml
- name: Performance Test
  uses: ./github-actions-library/performance-test
  with:
    test-type: 'load'
    duration: '300'
    concurrent-users: '50'
```

**Inputs:**

| Input | Description | Required | Default |
|-------|-------------|----------|---------|
| `test-type` | Test type (load/stress/spike) | No | `load` |
| `target-url` | Target application URL | No | Auto-detected |
| `duration` | Test duration (seconds) | No | `300` |
| `concurrent-users` | Concurrent users | No | `10` |
| `ramp-up-time` | Ramp up time (seconds) | No | `60` |
| `script-file` | Custom test script file | No | Auto-generated |

**Outputs:**

| Output | Description |
|--------|-------------|
| `test-passed` | Whether performance tests passed |
| `avg-response-time` | Average response time (ms) |
| `max-response-time` | Maximum response time (ms) |
| `requests-per-second` | RPS achieved |
| `error-rate` | Error rate percentage |
| `performance-report-path` | Path to performance report |

---

## 📝 Notification Actions

### **slack-notification**

**Description:** Sends notifications to Slack channels

**Usage:**

```yaml
- name: Slack Notification
  uses: ./github-actions-library/slack-notification
  with:
    webhook-url: ${{ secrets.SLACK_WEBHOOK }}
    channel: '#deployments'
    message: 'Deployment completed successfully!'
```

**Inputs:**

| Input | Description | Required | Default |
|-------|-------------|----------|---------|
| `webhook-url` | Slack webhook URL | Yes | - |
| `channel` | Target Slack channel | No | `#general` |
| `message` | Custom message | No | Auto-generated |
| `include-context` | Include job context | No | `true` |
| `status-emoji` | Status emoji (✅/❌/⚠️) | No | Auto-detected |
| `mention-users` | Users to mention | No | - |

---

### **teams-notification**

**Description:** Sends notifications to Microsoft Teams

**Usage:**

```yaml
- name: Teams Notification
  uses: ./github-actions-library/teams-notification
  with:
    webhook-url: ${{ secrets.TEAMS_WEBHOOK }}
    title: 'Pipeline Status Update'
    message: 'Build completed successfully'
```

**Inputs:**

| Input | Description | Required | Default |
|-------|-------------|----------|---------|
| `webhook-url` | Teams webhook URL | Yes | - |
| `title` | Notification title | No | Auto-generated |
| `message` | Notification message | No | Auto-generated |
| `color` | Theme color | No | Auto-detected |
| `include-details` | Include build details | No | `true` |

---

### **email-notification**

**Description:** Sends email notifications

**Usage:**

```yaml
- name: Email Notification
  uses: ./github-actions-library/email-notification
  with:
    smtp-server: ${{ secrets.SMTP_SERVER }}
    smtp-port: '587'
    username: ${{ secrets.SMTP_USERNAME }}
    password: ${{ secrets.SMTP_PASSWORD }}
    to: 'team@akordium.id'
    subject: 'Pipeline Notification'
    body: 'Pipeline execution completed'
```

**Inputs:**

| Input | Description | Required | Default |
|-------|-------------|----------|---------|
| `smtp-server` | SMTP server address | Yes | - |
| `smtp-port` | SMTP port | No | `587` |
| `username` | SMTP username | Yes | - |
| `password` | SMTP password | Yes | - |
| `to` | Recipient email(s) | Yes | - |
| `from` | Sender email | No | Auto-detected |
| `subject` | Email subject | No | Auto-generated |
| `body` | Email body | No | Auto-generated |
| `use-tls` | Use TLS encryption | No | `true` |

---

## 🔧 Action Development

### **Creating New Actions**

#### **Directory Structure:**

```
github-actions-library/
├── action-name/
│   ├── action.yml          # Action metadata
│   ├── pre.js             # Entry point (JavaScript)
│   ├── lib/               # Helper functions
│   └── README.md          # Action documentation
```

#### **Action Template:**

**action.yml:**

```yaml
name: 'Action Name'
description: 'Action description'
author: 'Akordium Lab'
branding:
  icon: 'zap'
  color: 'blue'

inputs:
  input-name:
    description: 'Input description'
    required: true
    default: 'default-value'

outputs:
  output-name:
    description: 'Output description'

runs:
  using: 'node20'
  main: 'pre.js'
```

**pre.js:**

```javascript
const core = require('@actions/core');

async function run() {
  try {
    // Action logic here
    const input = core.getInput('input-name');

    // Process input
    const result = processInput(input);

    // Set outputs
    core.setOutput('output-name', result);

  } catch (error) {
    core.setFailed(error.message);
  }
}

run();
```

---

## 📋 Action Usage Guidelines

### **Best Practices:**

#### **1. Input Validation:**

```javascript
// Always validate inputs
const input = core.getInput('required-input');
if (!input) {
  core.setFailed('Required input is missing');
  return;
}
```

#### **2. Error Handling:**

```javascript
try {
  await riskyOperation();
} catch (error) {
  core.warning(`Operation failed: ${error.message}`);
  // Continue execution or set failed
}
```

#### **3. Logging:**

```javascript
// Use appropriate log levels
core.debug('Debug information');
core.info('General information');
core.warning('Warning message');
core.error('Error message');
```

#### **4. Output Formatting:**

```javascript
// Format outputs consistently
const output = {
  success: true,
  data: result,
  timestamp: new Date().toISOString()
};

core.setOutput('result', JSON.stringify(output));
```

---

## 🧪 Testing Actions

### **Local Testing:**

#### **Using act:**

```bash
# Install act
curl https://raw.githubusercontent.com/nektos/act/master/install.sh | sudo bash

# Test action locally
act -j test-job
```

#### **Manual Testing:**

```javascript
// Create test script
const testAction = require('./action-name/pre.js');

// Mock GitHub Actions context
const mockCore = {
  getInput: (name) => process.env[`INPUT_${name.toUpperCase()}`],
  setOutput: (name, value) => console.log(`${name}: ${value}`),
  setFailed: (message) => console.error(`Failed: ${message}`)
};

// Test action
testAction();
```

### **Integration Testing:**

#### **Test Workflow:**

```yaml
name: Test Actions

on: [push, pull_request]

jobs:
  test-action:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - name: Test Custom Action
        uses: ./github-actions-library/action-name
        with:
          input-name: 'test-value'
```

---

## 🔄 Version Management

### **Semantic Versioning:**

- **Major (X.0.0):** Breaking changes
- **Minor (0.X.0):** New features, backward compatible
- **Patch (0.0.X):** Bug fixes, backward compatible

### **Release Process:**

#### **1. Update Version:**

```yaml
# action.yml
name: 'Action Name'
version: 'v1.2.3'  # Update this
```

#### **2. Tag Release:**

```bash
git tag -a v1.2.3 -m "Release version 1.2.3"
git push origin v1.2.3
```

#### **3. Update Documentation:**

```markdown
## Changelog

### v1.2.3 (2024-01-15)
- Added new input parameter
- Fixed bug in output formatting
- Updated documentation
```

---

## 📊 Performance Monitoring

### **Action Metrics:**

#### **Key Performance Indicators:**

- **Execution Time:** Average action runtime
- **Success Rate:** Percentage of successful runs
- **Cache Hit Rate:** Effectiveness of caching
- **Error Frequency:** Common error patterns

#### **Monitoring Setup:**

```yaml
- name: Monitor Action Performance
  uses: ./github-actions-library/performance-monitor
  with:
    action-name: 'custom-action'
    log-metrics: true
    alert-threshold: '300'  # seconds
```

---

## 🛠️ Maintenance

### **Regular Updates:**

#### **Monthly Tasks:**

- [ ] Review action performance metrics
- [ ] Update dependencies to latest versions
- [ ] Check for security vulnerabilities
- [ ] Review user feedback and issues

#### **Quarterly Tasks:**

- [ ] Major version updates if needed
- [ ] Documentation review and updates
- [ ] Architecture improvements
- [ ] Community contribution review

### **Troubleshooting:**

#### **Common Issues:**

1. **Action Timeout:**
   - Increase timeout in workflow
   - Optimize action performance
   - Check resource constraints

2. **Permission Errors:**
   - Verify required permissions
   - Check token scopes
   - Review repository settings

3. **Dependency Conflicts:**
   - Update action dependencies
   - Use specific version tags
   - Test compatibility

---

**Document Version:** 1.0
**Last Updated:** 1 Januari 2024
**Next Review:** 1 April 2024
**Maintained by:** DevOps Team & Tech Lead, PT Akordium Lab Digital

> 💡 **Action Development Tip:** When creating new GitHub Actions, always prioritize reusability, clear documentation, and comprehensive error handling. Actions should be idempotent (produce the same result for the same inputs) and include proper logging for debugging. Test actions thoroughly before promoting to production use.
