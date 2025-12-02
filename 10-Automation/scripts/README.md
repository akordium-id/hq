# 📜 Utility Scripts

Kumpulan utility scripts untuk otomasi development dan operational tasks di Akordium Lab.

## 🗂️ Daftar Scripts

### Development Environment

- `setup-go-env.sh` - Setup Go development environment
- `setup-node-env.sh` - Setup Node.js development environment
- `database-setup.sh` - Database initialization and migration

### Deployment & CI/CD

- `deploy-staging.sh` - Deploy ke staging environment
- `deploy-production.sh` - Deploy ke production environment
- `health-check.sh` - Application health monitoring

### Maintenance

- `backup-database.sh` - Automated database backup
- `cleanup-logs.sh` - Log file cleanup
- `ssl-renewal.sh` - SSL certificate renewal

## 🚀 Cara Penggunaan

```bash
# Make scripts executable
chmod +x scripts/*.sh

# Run specific script
./scripts/setup-go-env.sh

# Run with parameters
./scripts/deploy-staging.sh --project=waqfwise --environment=staging
```

## 📝 Kontribusi

1. Ikuti naming convention yang sudah ada
2. Add proper error handling
3. Include help documentation (`-h` flag)
4. Test scripts sebelum commit
5. Update dokumentasi di README.md ini

## ⚠️ Security Notes

- Jangan hardcode sensitive information
- Gunakan environment variables untuk secrets
- Validasi input parameters
- Log semua execution untuk audit trail
