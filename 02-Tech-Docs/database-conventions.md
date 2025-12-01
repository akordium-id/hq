# 🗄️ Database Conventions & Standards

Comprehensive database design standards untuk PostgreSQL ecosystem di Akordium Lab. Fokus pada consistency, performance, dan maintainability.

## 🎯 Database Philosophy

### **Core Principles**

- **Data Integrity:** Enforce referential integrity di database level
- **Performance First:** Design queries dengan performance in mind
- **Consistent Naming:** Standardized naming conventions across all projects
- **Migration Safety:** All schema changes via version-controlled migrations
- **Backup Ready:** Always assume data recovery will be needed

### **Technology Choice: PostgreSQL**

- **Reasoning:** Advanced features, JSON support, reliability
- **Version:** PostgreSQL 15+ (latest stable)
- **Migration:** Strategic transition dari MySQL
- **Features Utilized:** JSONB, Index types, Partitioning, Extensions

## 📝 Naming Conventions

### **General Naming Rules**

- **snake_case:** Semua identifiers menggunakan snake_case
- **Plural Tables:** Table names dalam plural form
- **Singular Columns:** Column names dalam singular form
- **Descriptive Names:** Nama yang jelas dan tidak ambiguous
- **No Reserved Words:** Hindari SQL reserved words

```sql
-- ✅ Good Examples
CREATE TABLE users ();
CREATE TABLE user_profiles ();
CREATE TABLE waqf_transactions ();
CREATE TABLE financial_categories ();

-- ❌ Bad Examples
CREATE TABLE user ();           -- singular table name
CREATE TABLE profile ();        -- too generic
CREATE TABLE transaksi ();      -- mixed language
CREATE TABLE order ();          -- SQL reserved word
```

### **Table Naming Patterns**

#### **Standard Tables**

```sql
-- Users & Authentication
users
user_profiles
user_sessions
password_resets

-- Core Business Tables
waqf_projects
waqf_donations
financial_transactions
expense_categories
```

#### **Relationship Tables**

```sql
-- Many-to-Many Relationships
user_waqf_subscriptions
product_category_assignments
permission_role_mappings

-- Naming: {table1}_{table2} (alphabetical order)
```

#### **Lookup/Reference Tables**

```sql
-- Prefixed with type
countries
currencies
payment_methods
transaction_statuses
```

### **Column Naming Conventions**

#### **Standard Columns**

```sql
-- Primary Keys
id                    -- Serial BIGINT auto-increment

-- Timestamps
created_at            -- Row creation timestamp
updated_at            -- Row last modification timestamp
deleted_at            -- Soft delete timestamp (nullable)

-- Foreign Keys
user_id               -- Reference ke users.id
waqf_project_id       -- Reference ke waqf_projects.id
parent_id             -- Self-referencing hierarchy
```

#### **Data-Specific Columns**

```sql
-- User related
email
full_name
phone_number
date_of_birth

-- Financial
amount
currency_code
transaction_date
exchange_rate

-- System
uuid                   -- Unique identifier (UUID type)
slug                   -- URL-friendly string
metadata               -- JSONB untuk flexible data
is_active              -- Boolean flags
sort_order             -- Ordering
```

### **Index Naming Conventions**

```sql
-- Primary Key
PK_table_name

-- Unique Index
UQ_table_name_column_name

-- Regular Index
IX_table_name_column_name

-- Composite Index
IX_table_name_column1_column2

-- Foreign Key Index
FK_table_name_foreign_table_name

-- Partial Index
IX_table_name_column_condition
```

## 🏗️ Schema Design Patterns

### **Table Structure Template**

```sql
CREATE TABLE example_table (
    -- Primary Key
    id BIGSERIAL PRIMARY KEY,

    -- Foreign Keys
    user_id BIGINT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    parent_id BIGINT REFERENCES example_table(id) ON DELETE SET NULL,

    -- Core Fields
    name VARCHAR(255) NOT NULL,
    slug VARCHAR(255) UNIQUE NOT NULL,
    description TEXT,

    -- Configuration
    is_active BOOLEAN DEFAULT true,
    sort_order INTEGER DEFAULT 0,
    metadata JSONB DEFAULT '{}'::jsonb,

    -- Timestamps
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP WITH TIME ZONE NULL, -- Soft delete

    -- Constraints
    CONSTRAINT CHK_example_table_sort_order CHECK (sort_order >= 0)
);

-- Standard Indexes
CREATE INDEX IX_example_table_user_id ON example_table(user_id);
CREATE INDEX IX_example_table_is_active ON example_table(is_active) WHERE deleted_at IS NULL;
CREATE UNIQUE INDEX UQ_example_table_slug ON example_table(slug) WHERE deleted_at IS NULL;
```

### **Common Patterns**

#### **Soft Delete Pattern**

```sql
CREATE TABLE soft_delete_example (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    deleted_at TIMESTAMP WITH TIME ZONE NULL,

    -- Always include deleted_at in indexes
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Query pattern untuk active records
SELECT * FROM soft_delete_example WHERE deleted_at IS NULL;

-- Include deleted_at in all relevant indexes
CREATE INDEX IX_soft_delete_example_name ON soft_delete_example(name) WHERE deleted_at IS NULL;
```

#### **Audit Trail Pattern**

```sql
CREATE TABLE audit_logs (
    id BIGSERIAL PRIMARY KEY,
    table_name VARCHAR(255) NOT NULL,
    record_id BIGINT NOT NULL,
    action VARCHAR(50) NOT NULL, -- INSERT, UPDATE, DELETE
    old_values JSONB,
    new_values JSONB,
    user_id BIGINT REFERENCES users(id),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX IX_audit_logs_table_record ON audit_logs(table_name, record_id);
CREATE INDEX IX_audit_logs_user_id ON audit_logs(user_id);
CREATE INDEX IX_audit_logs_created_at ON audit_logs(created_at);
```

#### **Hierarchical Data Pattern**

```sql
CREATE TABLE categories (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    parent_id BIGINT REFERENCES categories(id),
    path VARCHAR(1000), -- Materialized path
    level INTEGER NOT NULL,

    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- indexes untuk hierarchy queries
CREATE INDEX IX_categories_parent_id ON categories(parent_id);
CREATE INDEX IX_categories_path ON categories USING GIN (to_tsvector('simple', path));
CREATE INDEX IX_categories_level ON categories(level);
```

## 🔄 Migration Strategy

### **Migration File Naming**

```bash
migrations/
├── 2024_01_01_000001_create_users_table.sql
├── 2024_01_01_000002_create_user_profiles_table.sql
├── 2024_01_02_000003_add_waqf_projects_table.sql
├── 2024_01_03_000004_add_indexes_for_users.sql
└── 2024_01_15_000005_migrate_from_legacy_data.sql
```

### **Migration Template**

```sql
-- Migration: 2024_01_01_000001_create_example_table.sql
-- Description: Create example table dengan proper indexes
-- Author: Developer Name
-- Dependencies: 2024_01_01_000000_create_extensions.sql

BEGIN;

-- Create table
CREATE TABLE example_table (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    slug VARCHAR(255) NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Add constraints
ALTER TABLE example_table ADD CONSTRAINT UQ_example_table_slug UNIQUE (slug);

-- Create indexes
CREATE INDEX IX_example_table_name ON example_table(name);
CREATE INDEX IX_example_table_created_at ON example_table(created_at);

-- Insert initial data
INSERT INTO example_table (name, slug) VALUES
    ('Example Item', 'example-item');

-- Create trigger for updated_at
CREATE OR REPLACE FUNCTION trigger_set_timestamp()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_example_table_updated_at
    BEFORE UPDATE ON example_table
    FOR EACH ROW
    EXECUTE FUNCTION trigger_set_timestamp();

COMMIT;
```

### **Rollback Migration Template**

```sql
-- Rollback: 2024_01_01_000001_create_example_table.sql
BEGIN;

-- Drop trigger
DROP TRIGGER IF EXISTS trg_example_table_updated_at ON example_table;

-- Drop function
DROP FUNCTION IF EXISTS trigger_set_timestamp();

-- Drop indexes
DROP INDEX IF EXISTS IX_example_table_created_at;
DROP INDEX IF EXISTS IX_example_table_name;

-- Drop table
DROP TABLE IF EXISTS example_table;

COMMIT;
```

### **Migration Best Practices**

- **Never use `IF EXISTS` dalam forward migrations** (makes rollback predictable)
- **Always include rollback scripts** untuk production safety
- **Test migrations on staging** before production
- **Break large migrations** into smaller, manageable chunks
- **Monitor migration performance** pada large tables

## 📊 Performance Optimization

### **Indexing Strategy**

#### **When to Create Indexes**

- **Foreign Keys:** Always index foreign key columns
- **Query Columns:** Columns used in WHERE, JOIN, ORDER BY clauses
- **Composite Indexes:** Multi-column queries (2-3 columns max)
- **Partial Indexes:** Rows with specific conditions

#### **Indexing Examples**

```sql
-- Foreign Key Indexes (Always!)
CREATE INDEX IX_orders_customer_id ON orders(customer_id);
CREATE INDEX IX_order_items_order_id ON order_items(order_id);

-- Single Column Indexes
CREATE INDEX IX_users_email ON users(email);
CREATE INDEX IX_transactions_status ON transactions(status);

-- Composite Indexes (order matters!)
CREATE INDEX IX_transactions_user_date ON transactions(user_id, created_at);
CREATE INDEX IX_products_category_price ON products(category_id, price);

-- Partial Indexes (for common queries)
CREATE INDEX IX_active_users ON users(id) WHERE is_active = true;
CREATE INDEX IX_recent_orders ON orders(created_at) WHERE created_at > '2024-01-01';

-- JSONB Indexes
CREATE INDEX IX_users_metadata ON users USING GIN (metadata);
CREATE INDEX IX_users_metadata_email ON users USING GIN (metadata) WHERE metadata ? 'email';
```

#### **Index Maintenance**

```sql
-- Analyze table statistics
ANALYZE users;

-- Rebuild indexes (jika fragmented)
REINDEX INDEX IX_users_email;

-- Check index usage
SELECT * FROM pg_stat_user_indexes WHERE relname = 'users';
```

### **Query Optimization**

#### **Efficient Query Patterns**

```sql
-- ✅ Good: Using indexes properly
SELECT u.id, u.name, COUNT(o.id) as order_count
FROM users u
LEFT JOIN orders o ON u.id = o.user_id AND o.status = 'completed'
WHERE u.created_at >= '2024-01-01'
GROUP BY u.id, u.name
ORDER BY order_count DESC
LIMIT 10;

-- ❌ Bad: Missing indexes, functions on columns
SELECT u.id, u.name, COUNT(o.id) as order_count
FROM users u
LEFT JOIN orders o ON u.id = o.user_id
WHERE DATE(u.created_at) = '2024-01-01'  -- Function on column
GROUP BY u.id, u.name;
```

#### **Connection Pooling**

```go
// Go connection pool example
db, err := sql.Open("postgres", connStr)
if err != nil {
    log.Fatal(err)
}

// Connection pool settings
db.SetMaxOpenConns(25)        // Max connections
db.SetMaxIdleConns(5)         // Idle connections
db.SetConnMaxLifetime(300)    // Connection lifetime (seconds)
db.SetConnMaxIdleTime(60)     // Idle timeout (seconds)
```

## 💾 Backup & Recovery Strategy

### **Backup Types**

#### **Daily Automated Backups**

```sql
-- Daily backup script
#!/bin/bash
DATE=$(date +%Y%m%d)
BACKUP_DIR="/backups/postgres"
DB_NAME="waqfwise_prod"

# Create directory
mkdir -p $BACKUP_DIR/$DATE

# Full database backup
pg_dump -h localhost -U postgres -d $DB_NAME \
    --format=custom \
    --compress=9 \
    --file=$BACKUP_DIR/$DATE/waqfwise_prod_$DATE.dump

# Schema-only backup
pg_dump -h localhost -U postgres -d $DB_NAME \
    --schema-only \
    --file=$BACKUP_DIR/$DATE/waqfwise_schema_$DATE.sql
```

#### **Incremental Backups (WAL)**

```sql
-- Enable WAL archiving di postgresql.conf
wal_level = replica
archive_mode = on
archive_command = 'cp %p /backups/postgres/wal_archive/%f'
```

### **Recovery Procedures**

#### **Full Database Recovery**

```bash
# Drop existing database
dropdb -h localhost -U postgres waqwisa_prod

# Restore from backup
pg_restore -h localhost -U postgres -d waqfwise_prod \
    --verbose --clean --no-owner --no-privileges \
    /backups/postgres/20241201/waqfwise_prod_20241201.dump
```

#### **Point-in-Time Recovery**

```bash
# Create recovery.conf
echo "restore_command = 'cp /backups/postgres/wal_archive/%f %p'" > recovery.conf
echo "recovery_target_time = '2024-12-01 10:30:00'" >> recovery.conf

# Start PostgreSQL with recovery
pg_ctl -D /var/lib/postgresql/data start
```

### **Backup Verification**

```bash
# Verify backup integrity
pg_restore --list /backups/postgres/20241201/waqfwise_prod_20241201.dump

# Test restore to staging database
pg_restore -h localhost -U postgres -d waqwise_staging \
    --clean --no-owner --no-privileges \
    /backups/postgres/20241201/waqfwise_prod_20241201.dump
```

## 🔒 Security Best Practices

### **Database Security**

#### **User Permissions**

```sql
-- Application user (least privilege)
CREATE USER waqwise_app WITH PASSWORD 'secure_password';
GRANT CONNECT ON DATABASE waqwise_prod TO waqwise_app;
GRANT USAGE ON SCHEMA public TO waqwise_app;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO waqwise_app;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO waqwise_app;

-- Read-only user for reporting
CREATE USER waqwise_readonly WITH PASSWORD 'readonly_password';
GRANT CONNECT ON DATABASE waqwise_prod TO waqwise_readonly;
GRANT USAGE ON SCHEMA public TO waqwise_readonly;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO waqwise_readonly;
```

#### **Row-Level Security**

```sql
-- Enable RLS
ALTER TABLE financial_transactions ENABLE ROW LEVEL SECURITY;

-- Policy untuk user access
CREATE POLICY user_transactions_policy ON financial_transactions
    FOR ALL TO waqwise_app
    USING (user_id = current_setting('app.current_user_id')::BIGINT);
```

### **Data Encryption**

#### **Column Encryption**

```sql
-- Encrypt sensitive columns
CREATE EXTENSION IF NOT EXISTS pgcrypto;

-- Store encrypted data
INSERT INTO users (email, phone_number, encrypted_ssn)
VALUES ('user@example.com', '+628123456789',
        crypt('123456789', gen_salt('bf')));

-- Verify encrypted data
SELECT * FROM users
WHERE encrypted_ssn = crypt('123456789', encrypted_ssn);
```

## 📋 Database Maintenance

### **Regular Maintenance Tasks**

```sql
-- Update table statistics
ANALYZE;

-- Rebuild indexes (fragmented indexes)
REINDEX DATABASE waqwise_prod;

-- Vacuum (reclaim storage)
VACUUM ANALYZE;

-- Check for table bloat
SELECT schemaname, tablename,
       pg_size_pretty(pg_total_relation_size(schemaname||'.'||tablename)) AS size,
       pg_size_pretty(pg_total_relation_size(schemaname||'.'||tablename) - pg_relation_size(schemaname||'.'||tablename)) AS table_size
FROM pg_tables
WHERE schemaname = 'public'
ORDER BY pg_total_relation_size(schemaname||'.'||tablename) DESC;
```

### **Performance Monitoring**

```sql
-- Slow queries
SELECT query, mean_time, calls, total_time
FROM pg_stat_statements
ORDER BY mean_time DESC
LIMIT 10;

-- Index usage
SELECT schemaname, tablename, indexname, idx_scan, idx_tup_read, idx_tup_fetch
FROM pg_stat_user_indexes
ORDER BY idx_scan DESC;

-- Table sizes
SELECT schemaname, tablename,
       pg_size_pretty(pg_total_relation_size(schemaname||'.'||tablename)) AS size,
       pg_size_pretty(pg_relation_size(schemaname||'.'||tablename)) AS table_only
FROM pg_tables
WHERE schemaname = 'public'
ORDER BY pg_total_relation_size(schemaname||'.'||tablename) DESC;
```

---

**Remember:** Database design is foundation aplikasi. Invest time dalam proper schema design, indexing, dan performance optimization. Good database design prevents problems di production scale.

*Related Documentation:* [API Design Guidelines](./api-design-guidelines.md) | [Backup Recovery Guide](./backup-recovery.md) | [Performance Guidelines](./performance-guidelines.md) | [Architecture Overview](./architecture-overview.md)
