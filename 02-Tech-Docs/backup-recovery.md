# 💾 Backup & Recovery Procedures

Comprehensive backup dan disaster recovery strategy untuk Akordium Lab. Fokus pada data protection, business continuity, dan fast recovery capabilities.

## 🎯 Backup Philosophy

### **Core Principles**

- **3-2-1 Rule:** 3 copies, 2 different media, 1 off-site
- **Zero-Downtime Recovery:** Recovery dengan minimal service interruption
- **Regular Testing:** Backup verification adalah bagian dari backup process
- **Comprehensive Coverage:** Backups untuk semua critical data dan configurations
- **Security-First:** Backup data encrypted dengan proper access controls

### **Recovery Time Objectives (RTO/RPO)**

```yaml
backup_targets:
  waqfwise_production:
    rto: 4_hours      # Recovery Time Objective
    rpo: 1_hour      # Recovery Point Objective
    backup_frequency: hourly

  anggarin_production:
    rto: 2_hours
    rpo: 30_minutes
    backup_frequency: every 30 minutes

  database_clusters:
    rto: 1_hour
    rpo: 15_minutes
    backup_frequency: continuous (WAL archiving)

  application_code:
    rto: 30_minutes
    rpo: real-time
    backup_frequency: on every commit (Git)
```

## 📊 Backup Architecture

### **Backup Storage Hierarchy**

```text
┌─────────────────────────────────────────────────┐
│                 Primary Systems                 │
├─────────────────────────────────────────────────┤
│  Applications  │   Database   │  File Storage   │
│  (WaqfWise,    │  PostgreSQL  │  Static Assets  │
│   Anggarin)    │   Clusters   │  User Uploads   │
└─────────┬───────┬─────────────┬─────────────────┘
          │         │             │
    ┌─────▼─────┐  ┌─────▼─────┐  ┌─────▼─────┐
    │  Hot Backups │ │ Continuous │  Scheduled   │
    │   (Real-time)│ │   Backups  │  Backups     │
    └────────────┘  └────────────┘  └────────────┘
          │         │             │
    ┌─────▼─────┐  ┌─────▼─────┐  ┌─────▼─────┐
    │  Local      │ │  Local     │  Local       │
    │  Storage    │  Storage   │  Storage     │
    │  (Oracle     │  (Postgres │  (Oracle     │
    │   Cloud)    │   WAL)     │   Object)    │
    └────────────┘  └────────────┘  └────────────┘
          │         │             │
    ┌─────▼─────┐  ┌─────▼─────┐  ┌─────▼─────┐
    │  Off-site    │  Off-site   │  Off-site    │
    │  Storage    │  Storage   │  Storage     │
    │ (Cloudflare│  (Cloudflare│  (Cloudflare│
    │      R2)    │      R2)   │      R2)    │
    └────────────┘  └────────────┘  └────────────┘
```

### **Backup Types**

#### **Full Backups**

- **Frequency:** Daily untuk production databases
- **Scope:** Complete database atau application snapshot
- **Retention:** 30 days (online), 90 days (archive)
- **Storage:** Compressed binary dumps

#### **Incremental Backups**

- **Frequency:** Hourly untuk transaction-heavy systems
- **Scope:** Changes sejak last full backup
- **Retention:** 7 days (merge ke full backup setiap minggu)

#### **Differential Backups**

- **Frequency:** Setiap 6 hours untuk critical systems
- **Scope:** Changes sejak last full backup
- **Faster Recovery:** More recent backups available

#### **Continuous Backups**

- **Technology:** WAL (Write-Ahead Log) archiving
- **Frequency:** Real-time transaction logs
- **RPO:** Near-zero data loss
- **Critical for:** Financial data, transaction logs

## 🗄️ Database Backup Procedures

### **PostgreSQL Backup Scripts**

#### **Full Database Backup**

```bash
#!/bin/bash
# backup_full_database.sh
# Full database backup with compression

DB_NAME="waqwise_prod"
BACKUP_DIR="/backups/postgresql"
DATE=$(date +%Y%m%d_%H%M%S)
RETENTION_DAYS=30

# Create backup directory
mkdir -p "$BACKUP_DIR"

# Create database backup with custom format
pg_dump -h localhost -U postgres -d "$DB_NAME" \
    --format=custom \
    --compress=9 \
    --verbose \
    --file="$BACKUP_DIR/${DB_NAME}_full_${DATE}.dump"

# Create schema-only backup
pg_dump -h localhost -U postgres -d "$DB_NAME" \
    --schema-only \
    --file="$BACKUP_DIR/${DB_NAME}_schema_${DATE}.sql"

# Verify backup integrity
pg_restore --list "$BACKUP_DIR/${DB_NAME}_full_${DATE}.dump" > /dev/null
if [ $? -eq 0 ]; then
    echo "✅ Backup verification successful: ${DB_NAME}_full_${DATE}.dump"
else
    echo "❌ Backup verification failed: ${DB_NAME}_full_${DATE}.dump"
    exit 1
fi

# Create backup manifest
cat > "$BACKUP_DIR/${DB_NAME}_backup_manifest_${DATE}.json" << EOF
{
    "backup_type": "full",
    "database_name": "$DB_NAME",
    "backup_file": "${DB_NAME}_full_${DATE}.dump",
    "schema_file": "${DB_NAME}_schema_${DATE}.sql",
    "timestamp": "$(date -I)",
    "size_bytes": $(stat -c%s "$BACKUP_DIR/${DB_NAME}_full_${DATE}.dump"),
    "checksum": "$(sha256sum "$BACKUP_DIR/${DB_NAME}_full_${DATE}.dump" | cut -d' ' -f1)",
    "retention_days": $RETENTION_DAYS
}
EOF

# Cleanup old backups
find "$BACKUP_DIR" -name "${DB_NAME}_full_*.dump" -mtime +$RETENTION_DAYS -delete
find "$BACKUP_DIR" -name "${DB_NAME}_schema_*.sql" -mtime +$RETENTION_DAYS -delete
find "$BACKUP_DIR" -name "${DB_NAME}_backup_manifest_*.json" -mtime +$RETENTION_DAYS -delete

echo "🗄️ Full backup completed: ${DB_NAME}_full_${DATE}.dump"
```

#### **WAL Archiving Setup**

```bash
#!/bin/bash
# setup_wal_archiving.sh
# Configure PostgreSQL WAL archiving

# Edit postgresql.conf
cat >> /var/lib/postgresql/data/postgresql.conf << EOF
# WAL Archiving Configuration
wal_level = replica
archive_mode = on
archive_command = 'cp %p /backups/postgresql/wal_archive/%f'
archive_timeout = 300
max_wal_senders = 5
wal_keep_segments = 32
```

#### **Continuous Restore Point Preparation**

```bash
#!/bin/bash
# setup_base_backup.sh
# Create base backup for PITR

DB_NAME="waqwise_prod"
BACKUP_DIR="/backups/postgresql"
BASE_BACKUP_DIR="$BACKUP_DIR/base_backups"
DATE=$(date +%Y%m%d_%H%M%S)

mkdir -p "$BASE_BACKUP_DIR"

# Create base backup
pg_basebackup -h localhost -U postgres -D "$DB_NAME" \
    -v \
    -Ft \
    -z \
    -P \
    "$BASE_BACKUP_DIR/${DB_NAME}_base_${DATE}"

# Create recovery.conf for standby
cat > "$BASE_BACKUP_DIR/${DB_NAME}_base_${DATE}/recovery.conf" << EOF
standby_mode = 'on'
primary_conninfo = 'host=localhost port=5432 user=postgres'
trigger_file = '/tmp/postgresql.trigger'
restore_command = 'cp /backups/postgresql/wal_archive/%f %p'
```

### **MySQL Backup Scripts (for migration period)**

```bash
#!/bin/bash
# backup_mysql_database.sh
# MySQL database backup with mysqldump

DB_NAME="legacy_app"
DB_USER="mysql_user"
DB_PASS="secure_password"
BACKUP_DIR="/backups/mysql"
DATE=$(date +%Y%m%d_%H%M%S)

mkdir -p "$BACKUP_DIR"

# Create backup with routines, triggers, and events
mysqldump -h localhost -u "$DB_USER" -p"$DB_PASS" \
    --single-transaction \
    --routines \
    --triggers \
    --events \
    --hex-blob \
    --opt \
    --verbose \
    --compress \
    "$DB_NAME" | gzip > "$BACKUP_DIR/${DB_NAME}_backup_${DATE}.sql.gz"

# Verify backup
if gzip -t "$BACKUP_DIR/${DB_NAME}_backup_${DATE}.sql.gz"; then
    echo "✅ MySQL backup verified: ${DB_NAME}_backup_${DATE}.sql.gz"
else
    echo "❌ MySQL backup corrupted: ${DB_NAME}_backup_${DATE}.sql.gz"
    exit 1
fi

echo "🗄️ MySQL backup completed: ${DB_NAME}_backup_${DATE}.sql.gz"
```

## 📁 File System Backups

### **Application Code Backup**

```bash
#!/bin/bash
# backup_application_code.sh
# Git-based code backup strategy

REPO_BASE="/var/www"
BACKUP_DIR="/backups/code"
DATE=$(date +%Y%m%d_%H%M%S)

mkdir -p "$BACKUP_DIR"

# Backup all repositories
for repo in waqwise anggarin atribuo snapkasir akordium-hq; do
    REPO_PATH="$REPO_BASE/$repo"

    if [ -d "$REPO_PATH" ]; then
        # Create archive
        tar -czf "$BACKUP_DIR/${repo}_${DATE}.tar.gz" \
            -C "$REPO_BASE" \
            "$repo"

        echo "✅ Backed up: $repo → ${repo}_${DATE}.tar.gz"
    fi
done

# Create backup manifest
cat > "$BACKUP_DIR/code_backup_manifest_${DATE}.json" << EOF
{
    "backup_type": "code",
    "timestamp": "$(date -I)",
    "repositories": [
        {
            "name": "waqwise",
            "backup_file": "waqwise_${DATE}.tar.gz",
            "size_bytes": $(stat -c%s "$BACKUP_DIR/waqwise_${DATE}.tar.gz" 2>/dev/null || echo 0),
            "commit_hash": "$(cd /var/www/waqwise && git rev-parse HEAD 2>/dev/null || echo 'unknown')"
        },
        {
            "name": "anggarin",
            "backup_file": "anggarin_${DATE}.tar.gz",
            "size_bytes": $(stat -c%s "$BACKUP_DIR/anggarin_${DATE}.tar.gz" 2>/dev/null || echo 0),
            "commit_hash": "$(cd /var/www/anggarin && git rev-parse HEAD 2>/dev/null || echo 'unknown')"
        },
        {
            "name": "atribuo",
            "backup_file": "atribuo_${DATE}.tar.gz",
            "size_bytes": $(stat -c%s "$BACKUP_DIR/atribuo_${DATE}.tar.gz" 2>/dev/null || echo 0),
            "commit_hash": "$(cd /var/www/atribuo && git rev-parse HEAD 2>/dev/null || echo 'unknown')"
        },
        {
            "name": "snapkasir",
            "backup_file": "snapkasir_${DATE}.tar.gz",
            "size_bytes": $(stat -c%s "$BACKUP_DIR/snapkasir_${DATE}.tar.gz" 2>/dev/null || echo 0),
            "commit_hash": "$(cd /var/www/snapkasir && git rev-parse HEAD 2>/dev/null || echo 'unknown')"
        },
        {
            "name": "akordium-hq",
            "backup_file": "akordium-hq_${DATE}.tar.gz",
            "size_bytes": $(stat -c%s "$BACKUP_DIR/akordium-hq_${DATE}.tar.gz" 2>/dev/null || echo 0),
            "commit_hash": "$(cd /var/www/akordium-hq && git rev-parse HEAD 2>/dev/null || echo 'unknown')"
        }
    ]
}
EOF

echo "🗄️ Code backup completed with manifest"
```

### **Static Assets Backup**

```bash
#!/bin/bash
# backup_static_assets.sh
# Backup user-uploaded files and static assets

ASSETS_DIR="/var/www/storage"
BACKUP_DIR="/backups/assets"
DATE=$(date +%Y%m%d_%H%M%S)

mkdir -p "$BACKUP_DIR"

# Backup all storage directories
for dir in app public uploads; do
    if [ -d "$ASSETS_DIR/$dir" ]; then
        tar -czf "$BACKUP_DIR/${dir}_assets_${DATE}.tar.gz" \
            -C "$ASSETS_DIR" \
            "$dir"

        echo "✅ Backed up assets: $dir → ${dir}_assets_${DATE}.tar.gz"
    fi
done

# Sync to Cloudflare R2
rclone sync "$ASSETS_DIR" "cf-r2:akordium-backups/storage/" \
    --progress \
    --create-empty-src-dirs

echo "🗄️ Assets backup completed"
```

## ☁️ Cloud Storage Backups

### **Cloudflare R2 (S3-Compatible) Setup**

```bash
#!/bin/bash
# setup_r2_backup.sh
# Configure Cloudflare R2 for backups

# Install rclone if not installed
if ! command -v rclone &> /dev/null; then
    curl https://rclone.org/install.sh | sudo bash
fi

# Configure rclone for Cloudflare R2
rclone config create cf-r2 s3 << EOF
provider = Cloudflare
access_key_id = YOUR_R2_ACCESS_KEY
secret_access_key = YOUR_R2_SECRET_KEY
endpoint = https://YOUR_ACCOUNT_ID.r2.cloudflarestorage.com
region = auto
EOF

# Test connection
if rclone lsd cf-r2:akordium-backups &>/dev/null; then
    echo "✅ Cloudflare R2 connection successful"
else
    echo "❌ Failed to connect to Cloudflare R2"
    exit 1
fi
```

### **Cloud Backup Scripts**

```bash
#!/bin/bash
# backup_to_cloud.sh
# Upload local backups to cloud storage

BACKUP_DIR="/backups"
CLOUD_STORAGE="cf-r2:akordium-backups"
DATE=$(date +%Y%m%d_%H%M%S)

# Sync database backups
rclone sync "$BACKUP_DIR/postgresql" "$CLOUD_STORAGE/database/" \
    --progress \
    --create-empty-src-dirs \
    --include "*.dump" \
    --include "*.sql" \
    --include "*.json"

# Sync code backups
rclone sync "$BACKUP_DIR/code" "$CLOUD_STORAGE/code/" \
    --progress \
    --create-empty-src-dirs \
    --include "*.tar.gz" \
    --include "*.json"

# Sync assets backups
rclone sync "$BACKUP_DIR/assets" "$CLOUD_STORAGE/assets/" \
    --progress \
    --create-empty-src-dirs \
    --include "*.tar.gz"

# Create backup index
rclone lsjson "$CLOUD_STORAGE/" > "$BACKUP_DIR/cloud_index_${DATE}.json"

echo "🌥 Cloud backup completed successfully"
```

## 🔍 Backup Verification

### **Backup Integrity Verification**

```bash
#!/bin/bash
# verify_backups.sh
# Verify backup integrity and completeness

BACKUP_DIR="/backups"
DATE=$(date +%Y%m%d)

echo "🔍 Starting backup verification for $DATE"

# Verify database backups
echo "📊 Verifying database backups..."
for backup in "$BACKUP_DIR/postgresql/"*.dump; do
    if [ -f "$backup" ]; then
        backup_file=$(basename "$backup")

        # Test backup integrity
        if pg_restore --list "$backup" > /dev/null 2>&1; then
            echo "✅ $backup_file - Integrity OK"

            # Get backup size
            size=$(stat -c%s "$backup" 2>/dev/null)
            echo "   Size: $((size / 1024 / 1024)) MB"
        else
            echo "❌ $backup_file - CORRUPTED"
        fi
    fi
done

# Verify code backups
echo "💻 Verifying code backups..."
for backup in "$BACKUP_DIR/code/"*.tar.gz; do
    if [ -f "$backup" ]; then
        backup_file=$(basename "$backup")

        # Test archive integrity
        if gzip -t "$backup" > /dev/null 2>&1; then
            echo "✅ $backup_file - Integrity OK"

            # List contents (first 5 files)
            echo "   Contents: $(tar -tzf "$backup" | head -5 | tr '\n' ', ')"
        else
            echo "❌ $backup_file - CORRUPTED"
        fi
    fi
done

# Verify cloud backups
echo "☁️ Verifying cloud backups..."
if command -v rclone &> /dev/null; then
    if rclone lsf cf-r2:akordium-backups --max-depth 2 &>/dev/null; then
        echo "✅ Cloud storage accessible"
        rclone lsf cf-r2:akordium-backups --max-depth 1 | head -10
    else
        echo "❌ Cloud storage not accessible"
    fi
fi

# Generate verification report
cat > "$BACKUP_DIR/verification_report_$DATE.txt" << EOF
Backup Verification Report
Date: $(date)
Total Database Backups: $(ls -1 "$BACKUP_DIR/postgresql/"*.dump 2>/dev/null | wc -l)
Total Code Backups: $(ls -1 "$BACKUP_DIR/code/"*.tar.gz 2>/dev/null | wc -l)
Total Asset Backups: $(ls -1 "$BACKUP_DIR/assets/"*.tar.gz 2>/dev/null | wc -l)

Disk Usage: $(du -sh "$BACKUP_DIR" | cut -f1)
Last Modified: $(ls -la "$BACKUP_DIR" | tail -1 | awk '{print $6, $7, $8}')

Backup Status: $(grep -c "✅" "$BACKUP_DIR/verification_report_$DATE.txt" 2>/dev/null) files verified
EOF

echo "📋 Verification report generated: verification_report_$DATE.txt"
```

### **Automated Backup Testing**

```python
#!/usr/bin/env python3
# test_backup_recovery.py
# Test backup and recovery procedures

import subprocess
import datetime
import os
import sys

def test_database_recovery():
    """Test database recovery from backup"""
    print("🧪 Testing database recovery...")

    backup_file = "/backups/postgresql/waqfwise_prod_latest.dump"
    test_db = "test_waqfwise_recovery"

    # Create test database
    try:
        subprocess.run([
            "createdb", test_db
        ], check=True)

        # Restore from backup
        subprocess.run([
            "pg_restore",
            "--verbose",
            "--clean",
            "--no-owner",
            "--no-privileges",
            "--dbname", test_db,
            backup_file
        ], check=True)

        # Verify data integrity
        result = subprocess.run([
            "psql", "-d", test_db, "-c", "SELECT COUNT(*) FROM users"
        ], capture_output=True, text=True)

        if result.returncode == 0:
            user_count = int(result.stdout.strip())
            print(f"✅ Database recovery successful: {user_count} users restored")
            return True
        else:
            print("❌ Database recovery failed")
            return False

    except subprocess.CalledProcessError as e:
        print(f"❌ Error during recovery test: {e}")
        return False
    finally:
        # Cleanup test database
        subprocess.run(["dropdb", test_db], check=False)

def test_code_recovery():
    """Test code archive extraction"""
    print("💻 Testing code recovery...")

    backup_file = "/backups/code/waqwise_latest.tar.gz"
    test_dir = "/tmp/test_code_recovery"

    try:
        # Create test directory
        os.makedirs(test_dir, exist_ok=True)

        # Extract backup
        subprocess.run([
            "tar", "xzf", backup_file, "-C", test_dir
        ], check=True)

        # Verify structure
        extracted_dir = os.path.join(test_dir, "waqwise")
        if os.path.exists(extracted_dir):
            print("✅ Code extraction successful")
            return True
        else:
            print("❌ Code extraction failed - directory not found")
            return False

    except subprocess.CalledProcessError as e:
        print(f"❌ Error during code recovery test: {e}")
        return False
    finally:
        # Cleanup test directory
        import shutil
        shutil.rmtree(test_dir, ignore_errors=True)

def main():
    print("🔧 Backup and Recovery Test Suite")
    print("=" * 50)

    tests = [
        ("Database Recovery", test_database_recovery),
        ("Code Recovery", test_code_recovery),
    ]

    passed = 0
    total = len(tests)

    for test_name, test_func in tests:
        print(f"\n🧪 {test_name}:")
        if test_func():
            passed += 1
        print(f"   Status: {'PASSED' if test_func() else 'FAILED'}")

    print("\n" + "=" * 50)
    print(f"📊 Test Results: {passed}/{total} tests passed")

    if passed == total:
        print("✅ All backup and recovery tests passed!")
        sys.exit(0)
    else:
        print("❌ Some backup and recovery tests failed!")
        sys.exit(1)

if __name__ == "__main__":
    main()
```

## 🚨 Disaster Recovery Procedures

### **Complete Database Recovery**

```bash
#!/bin/bash
# disaster_recovery_database.sh
# Complete database disaster recovery procedure

DB_NAME="waqwise_prod"
BACKUP_DIR="/backups/postgresql"
RESTORE_LOG="/var/log/postgres/recovery.log"
DATE=$(date +%Y%m%d_%H%M%S)

echo "🚨 Starting disaster recovery for $DB_NAME at $(date)"
echo "Log: $RESTORE_LOG"

# Pre-recovery checks
echo "🔍 Pre-recovery checks..."

# Check PostgreSQL service status
if ! systemctl is-active --quiet postgresql; then
    echo "❌ PostgreSQL service is not running"
    exit 1
fi

# Find latest backup
LATEST_BACKUP=$(find "$BACKUP_DIR" -name "${DB_NAME}_full_*.dump" -printf '%T %p\n' | sort -n | tail -1 | cut -d' ' -f2)

if [ -z "$LATEST_BACKUP" ]; then
    echo "❌ No suitable backup found in $BACKUP_DIR"
    exit 1
fi

echo "✅ Using backup: $(basename $LATEST_BACKUP)"

# Stop application services to prevent conflicts
echo "🛑 Stopping application services..."
systemctl stop nginx
systemctl stop php-fpm

# Take current state snapshot (for emergency rollback)
echo "📸 Creating emergency snapshot..."
systemctl stop postgresql
cp -r /var/lib/postgresql/data /var/lib/postgresql/data_emergency_$DATE

# Start PostgreSQL in recovery mode
echo "🔄 Starting PostgreSQL..."
systemctl start postgresql

# Wait for PostgreSQL to be ready
sleep 10

# Drop existing database (will be recreated from backup)
echo "🗑️ Dropping existing database..."
dropdb "$DB_NAME" 2>/dev/null || true

# Create fresh database
echo "🏗️ Creating fresh database..."
createdb "$DB_NAME"

# Restore from backup
echo "📦 Restoring database from backup..."
if pg_restore \
    --verbose \
    --clean \
    --no-owner \
    --no-privileges \
    --dbname "$DB_NAME" \
    "$LATEST_BACKUP" \
    2>&1 | tee "$RESTORE_LOG"; then

    echo "✅ Database restore completed successfully"
else
    echo "❌ Database restore failed!"
    echo "Check log: $RESTORE_LOG"

    # Emergency rollback
    echo "🚨 Emergency rollback in progress..."
    systemctl stop postgresql
    rm -rf /var/lib/postgresql/data
    mv /var/lib/postgresql/data_emergency_$DATE /var/lib/postgresql/data
    systemctl start postgresql

    exit 1
fi

# Run post-restore scripts
echo "🔧 Running post-restore procedures..."

# Rebuild indexes (if needed)
psql -d "$DB_NAME" -c "REINDEX DATABASE $DB_NAME;"

# Update statistics
psql -d "$DB_NAME" -c "ANALYZE;"

# Verify restore
echo "✅ Verifying restore..."
USER_COUNT=$(psql -d "$DB_NAME" -t -c "SELECT COUNT(*) FROM users" 2>/dev/null || echo "0")
echo "   Users restored: $USER_COUNT"

# Restart services
echo "🚀 Restarting application services..."
systemctl start php-fpm
systemctl start nginx

# Final verification
echo "🔍 Final verification..."

# Test application connectivity
curl -f http://localhost/health || echo "⚠️ Application health check failed"

echo "✅ Disaster recovery completed successfully!"
echo "Timestamp: $(date)"

# Create recovery report
cat > "/var/log/postgres/recovery_report_${DATE}.txt" << EOF
Disaster Recovery Report
====================

Database: $DB_NAME
Timestamp: $(date)
Backup Used: $(basename $LATEST_BACKUP)
Recovery Log: $RESTORE_LOG

Status: SUCCESS
Users Restored: $USER_COUNT
Services Restarted: YES

Final Verification: $(curl -s http://localhost/health || echo "FAILED")
EOF

echo "📋 Recovery report generated: recovery_report_${DATE}.txt"
```

### **Application Recovery**

```bash
#!/bin/bash
# recover_application.sh
# Recover application from code backup

APP_DIR="/var/www"
BACKUP_DIR="/backups/code"
DATE=$(date +%Y%m%d_%H%M%S)

echo "🚨 Starting application disaster recovery at $(date)"

# Find latest code backup
LATEST_BACKUP=$(find "$BACKUP_DIR" -name "waqwise_*.tar.gz" -printf '%T %p\n' | sort -n | tail -1 | cut -d' ' -f2)

if [ -z "$LATEST_BACKUP" ]; then
    echo "❌ No suitable code backup found"
    exit 1
fi

echo "✅ Using backup: $(basename $LATEST_BACKUP)"

# Take emergency snapshot
cp -r "$APP_DIR" "${APP_DIR}_emergency_$DATE"

# Stop services
echo "🛑 Stopping application services..."
systemctl stop nginx
systemctl stop php-fpm

# Clear current application
echo "🧹 Clearing current application..."
rm -rf "$APP_DIR/waqwise"

# Extract backup
echo "📦 Extracting code backup..."
if tar -xzf "$LATEST_BACKUP" -C "$APP_DIR"; then
    echo "✅ Code extraction successful"
else
    echo "❌ Code extraction failed!"

    # Emergency rollback
    echo "🚨 Emergency rollback in progress..."
    rm -rf "$APP_DIR/waqwise"
    mv "${APP_DIR}_emergency_$DATE/waqwise" "$APP_DIR"

    systemctl start php-fpm
    systemctl start nginx
    exit 1
fi

# Restore permissions
echo "🔧 Restoring file permissions..."
chown -R www-data:www-data "$APP_DIR"
chmod -R 755 "$APP_DIR"

# Install dependencies
echo "📦 Installing dependencies..."
cd "$APP_DIR/waqwise"
composer install --no-dev --optimize-autoloader

# Clear caches
echo "🧹 Clearing caches..."
php artisan cache:clear
php artisan config:clear
php artisan view:clear

# Run migrations (if needed)
echo "🗃 Running database migrations..."
php artisan migrate --force

# Restart services
echo "🚀 Restarting services..."
systemctl start php-fpm
systemctl start nginx

# Verify application
echo "🔍 Verifying application..."
curl -f http://localhost/health || echo "⚠️ Application health check failed"

echo "✅ Application recovery completed successfully!"
echo "Timestamp: $(date)"
```

## 📋 Monitoring & Maintenance

### **Backup Monitoring Dashboard**

```yaml
# Grafana Dashboard - Backup Monitoring
dashboard:
  title: "Backup & Recovery Status"
  panels:
    - title: "Backup Success Rate"
      type: singlestat
      targets:
        - expr: "backup_success_total / (backup_success_total + backup_failed_total) * 100"
          legendFormat: "{{query}}"

    - title: "Daily Backup Volume"
      type: graph
      targets:
        - expr: "sum(increase(backup_size_bytes[1d])) by (backup_type)"
          legendFormat: "{{backup_type}}"

    -   title: "Backup Duration"
      type: graph
      targets:
        - expr: "histogram_quantile(0.95, backup_duration_seconds)"
          legendFormat: "95th percentile"

    - title: "Storage Usage"
      type: graph
      targets:
        - expr: "backup_storage_used_bytes"
          legendFormat: "Used"
        - expr: "backup_storage_available_bytes"
          legendFormat: "Available"

    - title: "Recent Backup Failures"
      type: table
      targets:
        - expr: "backup_failed_total"
          legendFormat: "Failed Backups"
```

### **Backup Maintenance Checklist**

```bash
#!/bin/bash
# backup_maintenance.sh
# Weekly backup maintenance checklist

MAINTENANCE_LOG="/var/log/backup_maintenance.log"
DATE=$(date +%Y%m%d)

echo "🔧 Starting weekly backup maintenance at $(date)" | tee -a "$MAINTENANCE_LOG"

# Check backup storage usage
echo "📊 Checking backup storage usage..." | tee -a "$MAINTENANCE_LOG"
df -h /backups | tee -a "$MAINTENANCE_LOG"

# Clean old logs
echo "🧹 Cleaning old backup logs..." | tee -a "$MAINTENANCE_LOG"
find /var/log/postgres/backup_* -mtime +30 -delete

# Verify backup integrity
echo "🔍 Verifying backup integrity..." | tee -a "$MAINTENANCE_LOG"
/opt/scripts/verify_backups.sh | tee -a "$MAINTENANCE_LOG"

# Test recovery procedures
echo "🧪 Testing recovery procedures..." | tee -a "$MAINTENANCE_LOG"
python3 /opt/scripts/test_backup_recovery.py | tee -a "$MAINTENANCE_LOG"

# Update backup documentation
echo "📋 Updating backup documentation..." | tee -a "$MAINTENANCE_LOG"
/opt/scripts/backup_documentation_update.sh

echo "✅ Weekly maintenance completed at $(date)" | tee -a "$MAINTENANCE_LOG"
```

---

**Remember:** Backups are only useful if they can be restored successfully. Regular testing of backup procedures is essential to ensure data safety. Always verify your backups and document the recovery process.

*Related Documentation:* [Database Conventions](./database-conventions.md) | [Monitoring & Logging](./monitoring-logging.md) | [Incident Response](../01-SOP/incident-response.md) | [Performance Guidelines](./performance-guidelines.md)
