# ⚡ Performance Guidelines

Comprehensive performance optimization guidelines untuk semua Akordium Lab products. Mencakup database optimization, caching strategies, frontend performance, dan monitoring practices.

## 🎯 Performance Philosophy

### **Core Principles**

- **Performance by Design:** Performance considerations di setiap development stage
- **Measurement First:** Always measure before optimizing
- **User Experience Focus:** Prioritize metrics yang impact user experience
- **Practical Optimization:** Focus on high-impact, low-effort improvements first
- **Continuous Monitoring:** Performance is ongoing process, bukan one-time effort

### **Performance Targets**

```yaml
web_performance_targets:
  time_to_first_byte:
    target: "< 200ms"
    ideal: "< 100ms"
    critical: "> 500ms"

  first_contentful_paint:
    target: "< 1.5s"
    ideal: "< 1.0s"
    critical: "> 3s"

  largest_contentful_paint:
    target: "< 2.5s"
    ideal: "< 1.8s"
    critical: "> 4s"

  time_to_interactive:
    target: "< 3.0s"
    ideal: "< 2.0s"
    critical: "> 5s"

api_performance_targets:
  response_time:
    simple: "< 50ms"
    complex: "< 200ms"
    very_complex: "< 500ms"
    critical: "> 2s"

  throughput:
    target: "1000 requests/second"
    peak: "5000 requests/second"
    burst: "10000 requests/second"

  error_rate:
    target: "< 0.1%"
    acceptable: "< 0.5%"
    critical: "> 1%"
```

## 🗄️ Database Performance

### **Query Optimization**

#### **Indexing Strategy**

```sql
-- Primary Index Patterns
-- 1. Single Column Indexes (frequently filtered)
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_waqf_projects_status ON waqf_projects(status);
CREATE INDEX idx_transactions_user_id ON transactions(user_id);

-- 2. Composite Indexes (multi-column filtering)
CREATE INDEX idx_transactions_user_status_date
ON transactions(user_id, status, created_at DESC);

CREATE INDEX idx_projects_status_category
ON waqf_projects(status, category_id);

-- 3. Partial Indexes (for specific conditions)
CREATE INDEX idx_active_projects_featured
ON waqf_projects(id)
WHERE status = 'active' AND is_featured = true;

CREATE INDEX idx_recent_transactions
ON transactions(id)
WHERE created_at >= NOW() - INTERVAL '30 days';

-- 4. Covering Indexes (include all query columns)
CREATE INDEX idx_transactions_covering
ON transactions(user_id, status, created_at DESC)
INCLUDE (amount, payment_method_id);
```

#### **Query Writing Best Practices**

```sql
-- ✅ GOOD: Specific column selection
SELECT id, name, email, created_at
FROM users
WHERE status = 'active'
ORDER BY created_at DESC
LIMIT 20;

-- ❌ BAD: SELECT *
SELECT * FROM users WHERE status = 'active';

-- ✅ GOOD: Use EXISTS for existence checks
SELECT u.id, u.name
FROM users u
WHERE EXISTS (
    SELECT 1 FROM transactions t
    WHERE t.user_id = u.id
    AND t.status = 'completed'
);

-- ❌ BAD: JOIN for existence checks
SELECT DISTINCT u.id, u.name
FROM users u
JOIN transactions t ON u.id = t.user_id
WHERE t.status = 'completed';

-- ✅ GOOD: Proper pagination
SELECT id, title, description
FROM waqf_projects
WHERE status = 'active'
ORDER BY created_at DESC
LIMIT 20 OFFSET 40;  -- Page 3

-- ✅ BETTER: Cursor-based pagination for large datasets
SELECT id, title, description
FROM waqf_projects
WHERE status = 'active'
AND created_at < '2024-01-15 10:30:00'
ORDER BY created_at DESC
LIMIT 20;

-- ✅ GOOD: Use appropriate JOIN types
SELECT p.*, u.name as user_name
FROM waqf_projects p
INNER JOIN users u ON p.created_by = u.id
WHERE p.status = 'active';

-- ❌ BAD: N+1 Query Problem (avoid in application code)
-- Instead, use eager loading in ORM
```

#### **Database Connection Optimization**

```go
// pkg/database/connection_pool.go
package database

import (
    "database/sql"
    "fmt"
    "log"
    "time"

    _ "github.com/lib/pq"
)

type DBConfig struct {
    Host            string
    Port            int
    Database        string
    Username        string
    Password        string
    SSLMode         string
    MaxOpenConns    int
    MaxIdleConns    int
    ConnMaxLifetime time.Duration
    ConnMaxIdleTime time.Duration
}

func NewConnectionPool(config DBConfig) (*sql.DB, error) {
    dsn := fmt.Sprintf(
        "host=%s port=%d user=%s password=%s dbname=%s sslmode=%s",
        config.Host, config.Port, config.Username,
        config.Password, config.Database, config.SSLMode,
    )

    db, err := sql.Open("postgres", dsn)
    if err != nil {
        return nil, fmt.Errorf("failed to open database: %w", err)
    }

    // Connection pool settings
    db.SetMaxOpenConns(config.MaxOpenConns)        // Maximum number of open connections
    db.SetMaxIdleConns(config.MaxIdleConns)        // Maximum number of idle connections
    db.SetConnMaxLifetime(config.ConnMaxLifetime) // Maximum lifetime of a connection
    db.SetConnMaxIdleTime(config.ConnMaxIdleTime) // Maximum idle time for a connection

    // Test connection
    if err := db.Ping(); err != nil {
        return nil, fmt.Errorf("failed to ping database: %w", err)
    }

    log.Printf("Database connection pool initialized: MaxOpen=%d, MaxIdle=%d",
        config.MaxOpenConns, config.MaxIdleConns)

    return db, nil
}

// Production configuration
func ProductionDBConfig() DBConfig {
    return DBConfig{
        MaxOpenConns:    50,  // Maximum concurrent database connections
        MaxIdleConns:    10,  // Keep 10 connections ready
        ConnMaxLifetime: 1 * time.Hour, // Recycle connections after 1 hour
        ConnMaxIdleTime: 30 * time.Minute, // Close idle connections after 30 minutes
    }
}

// Development configuration
func DevelopmentDBConfig() DBConfig {
    return DBConfig{
        MaxOpenConns:    10,
        MaxIdleConns:    5,
        ConnMaxLifetime: 1 * time.Hour,
        ConnMaxIdleTime: 15 * time.Minute,
    }
}
```

### **Database Caching**

```php
<?php
// app/Models/BaseModel.php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\DB;

abstract class BaseModel extends Model
{
    protected static $cacheEnabled = true;
    protected static $cacheDuration = 3600; // 1 hour
    protected static $cacheTags = [];

    /**
     * Cache key helper
     */
    protected static function cacheKey(string $method, ...$args): string
    {
        $className = class_basename(static::class);
        $argsHash = md5(serialize($args));
        return "{$className}:{$method}:{$argsHash}";
    }

    /**
     * Cached find operation
     */
    public static function cachedFind($id, $columns = ['*'])
    {
        if (!static::$cacheEnabled) {
            return static::find($id, $columns);
        }

        $cacheKey = static::cacheKey('find', $id, $columns);

        return Cache::tags(static::getCacheTags())->remember(
            $cacheKey,
            static::$cacheDuration,
            function () use ($id, $columns) {
                return static::find($id, $columns);
            }
        );
    }

    /**
     * Cached query with complex conditions
     */
    public static function cachedQuery(callable $query, int $duration = null)
    {
        if (!static::$cacheEnabled) {
            return $query();
        }

        $cacheKey = static::cacheKey('query', md5(serialize($query)));
        $duration = $duration ?? static::$cacheDuration;

        return Cache::tags(static::getCacheTags())->remember(
            $cacheKey,
            $duration,
            $query
        );
    }

    /**
     * Cache invalidation
     */
    public static function invalidateCache($pattern = null)
    {
        if ($pattern) {
            Cache::tags(static::getCacheTags())->flush();
        } else {
            Cache::tags(static::getCacheTags())->flush();
        }
    }

    /**
     * Get cache tags for model
     */
    protected static function getCacheTags(): array
    {
        $className = strtolower(class_basename(static::class));
        return array_merge(static::$cacheTags, [$className]);
    }

    /**
     * Model events to clear cache
     */
    protected static function boot()
    {
        parent::boot();

        static::saved(function ($model) {
            static::invalidateCache();
        });

        static::deleted(function ($model) {
            static::invalidateCache();
        });
    }
}

// app/Models/WaqfProject.php
class WaqfProject extends BaseModel
{
    protected static $cacheTags = ['waqf_projects'];
    protected static $cacheDuration = 7200; // 2 hours for projects

    /**
     * Cached active projects query
     */
    public static function cachedActiveProjects()
    {
        return static::cachedQuery(function () {
            return static::where('status', 'active')
                ->with(['category', 'creator'])
                ->orderBy('featured', 'desc')
                ->orderBy('created_at', 'desc')
                ->paginate(20);
        }, 1800); // 30 minutes cache for paginated data
    }

    /**
     * Cached featured projects
     */
    public static function cachedFeaturedProjects($limit = 6)
    {
        return static::cachedQuery(function () use ($limit) {
            return static::where('status', 'active')
                ->where('featured', true)
                ->with(['category'])
                ->limit($limit)
                ->get();
        });
    }
}
```

## 🚀 Application Performance

### **Caching Strategies**

#### **Multi-Level Caching Architecture**

```go
// pkg/cache/multi_level.go
package cache

import (
    "context"
    "encoding/json"
    "fmt"
    "time"

    "github.com/go-redis/redis/v8"
)

type CacheLevel int

const (
    MemoryCache CacheLevel = iota
    RedisCache
    DatabaseCache
)

type CacheItem struct {
    Value      interface{}
    ExpiresAt  time.Time
    AccessCount int64
    LastAccess time.Time
}

type MultiLevelCache struct {
    memoryCache *MemoryCache
    redisClient *redis.Client
    dbCache     *DatabaseCache
}

type CacheOptions struct {
    TTL         time.Duration
    MemoryOnly  bool
    RedisOnly   bool
    ForceRefresh bool
    Tags        []string
}

func NewMultiLevelCache(redisClient *redis.Client) *MultiLevelCache {
    return &MultiLevelCache{
        memoryCache: NewMemoryCache(1000, 10*time.Minute),
        redisClient: redisClient,
        dbCache:     NewDatabaseCache(),
    }
}

func (mlc *MultiLevelCache) Get(ctx context.Context, key string, dest interface{}, opts CacheOptions) error {
    // 1. Try Memory Cache first (fastest)
    if !opts.RedisOnly {
        if item, found := mlc.memoryCache.Get(key); found {
            if time.Now().Before(item.ExpiresAt) {
                item.AccessCount++
                item.LastAccess = time.Now()
                mlc.memoryCache.Set(key, item)

                if err := json.Unmarshal(item.Value.([]byte), dest); err != nil {
                    return fmt.Errorf("failed to unmarshal memory cache: %w", err)
                }

                return nil
            }
            mlc.memoryCache.Delete(key)
        }
    }

    // 2. Try Redis Cache (medium speed)
    if !opts.MemoryOnly && mlc.redisClient != nil {
        val, err := mlc.redisClient.Get(ctx, key).Result()
        if err == nil {
            var expiresAt time.Time
            if ttl, ttlErr := mlc.redisClient.TTL(ctx, key).Result(); ttlErr == nil {
                expiresAt = time.Now().Add(ttl)
            }

            // Store in memory cache for faster future access
            mlc.memoryCache.Set(key, CacheItem{
                Value:      []byte(val),
                ExpiresAt:  expiresAt,
                LastAccess: time.Now(),
            })

            if err := json.Unmarshal([]byte(val), dest); err != nil {
                return fmt.Errorf("failed to unmarshal redis cache: %w", err)
            }

            return nil
        } else if err != redis.Nil {
            // Log Redis error but continue to database cache
            fmt.Printf("Redis cache error for key %s: %v\n", key, err)
        }
    }

    // 3. Database Cache as fallback
    if !opts.ForceRefresh {
        if err := mlc.dbCache.Get(ctx, key, dest); err == nil {
            return nil
        }
    }

    return fmt.Errorf("cache miss for key: %s", key)
}

func (mlc *MultiLevelCache) Set(ctx context.Context, key string, value interface{}, opts CacheOptions) error {
    data, err := json.Marshal(value)
    if err != nil {
        return fmt.Errorf("failed to marshal value: %w", err)
    }

    expiresAt := time.Now().Add(opts.TTL)
    ttlSeconds := int64(opts.TTL.Seconds())

    // Set in memory cache
    if !opts.RedisOnly {
        mlc.memoryCache.Set(key, CacheItem{
            Value:      data,
            ExpiresAt:  expiresAt,
            LastAccess: time.Now(),
        })
    }

    // Set in Redis cache
    if !opts.MemoryOnly && mlc.redisClient != nil {
        if err := mlc.redisClient.Set(ctx, key, data, opts.TTL).Err(); err != nil {
            fmt.Printf("Failed to set Redis cache for key %s: %v\n", key, err)
        }

        // Add tags for cache invalidation
        if len(opts.Tags) > 0 {
            for _, tag := range opts.Tags {
                tagKey := fmt.Sprintf("tag:%s", tag)
                mlc.redisClient.SAdd(ctx, tagKey, key)
                mlc.redisClient.Expire(ctx, tagKey, opts.TTL)
            }
        }
    }

    // Set in database cache (for critical data)
    if opts.TTL > time.Hour {
        if err := mlc.dbCache.Set(ctx, key, data, opts.TTL); err != nil {
            fmt.Printf("Failed to set database cache for key %s: %v\n", key, err)
        }
    }

    return nil
}

func (mlc *MultiLevelCache) InvalidateByTag(ctx context.Context, tag string) error {
    if mlc.redisClient == nil {
        return fmt.Errorf("redis client not available for tag invalidation")
    }

    tagKey := fmt.Sprintf("tag:%s", tag)
    keys, err := mlc.redisClient.SMembers(ctx, tagKey).Result()
    if err != nil {
        return fmt.Errorf("failed to get keys for tag %s: %w", tag, err)
    }

    if len(keys) > 0 {
        // Delete from Redis
        if err := mlc.redisClient.Del(ctx, keys...).Err(); err != nil {
            fmt.Printf("Failed to delete keys from Redis: %v\n", err)
        }

        // Delete from memory cache
        for _, key := range keys {
            mlc.memoryCache.Delete(key)
        }

        // Delete from database cache
        for _, key := range keys {
            mlc.dbCache.Delete(ctx, key)
        }
    }

    // Delete the tag itself
    mlc.redisClient.Del(ctx, tagKey)

    return nil
}
```

#### **Smart Caching Patterns**

```php
<?php
// app/Services/Cache/SmartCache.php

namespace App\Services\Cache;

use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Redis;

class SmartCache
{
    private static $defaultTTL = 3600;
    private static $hitRatioThreshold = 0.7; // 70% hit ratio threshold

    /**
     * Remember with automatic TTL adjustment based on hit ratio
     */
    public static function rememberSmart(string $key, callable $callback, int $defaultTTL = null)
    {
        $defaultTTL = $defaultTTL ?? self::$defaultTTL;
        $statsKey = "{$key}:stats";

        // Get current cache statistics
        $stats = Redis::hmget($statsKey, ['hits', 'misses', 'last_updated']);
        $hits = (int) ($stats[0] ?? 0);
        $misses = (int) ($stats[1] ?? 0);

        // Calculate hit ratio
        $totalRequests = $hits + $misses;
        $hitRatio = $totalRequests > 0 ? $hits / $totalRequests : 0;

        // Adjust TTL based on hit ratio
        if ($hitRatio > self::$hitRatioThreshold) {
            $ttl = $defaultTTL * 2; // Double TTL for frequently accessed data
        } elseif ($hitRatio < 0.3) {
            $ttl = $defaultTTL / 2; // Half TTL for rarely accessed data
        } else {
            $ttl = $defaultTTL;
        }

        $result = Cache::remember($key, $ttl, $callback);

        // Update statistics
        if (Cache::has($key)) {
            Redis::hincrby($statsKey, 'hits', 1);
        } else {
            Redis::hincrby($statsKey, 'misses', 1);
        }
        Redis::hset($statsKey, 'last_updated', now()->timestamp);

        return $result;
    }

    /**
     * Cache with prewarming
     */
    public static function rememberWithPrewarm(
        string $key,
        callable $callback,
        callable $prewarmer = null,
        int $ttl = null
    ) {
        $prewarmer = $prewarmer ?? $callback;

        if (Cache::has($key)) {
            return Cache::get($key);
        }

        // Get fresh data
        $data = $callback();

        // Store in cache
        Cache::put($key, $data, $ttl ?? self::$defaultTTL);

        // Trigger background prewarming for related keys
        if ($prewarmer) {
            dispatch(function () use ($key, $prewarmer) {
                try {
                    $prewarmer();
                } catch (\Exception $e) {
                    \Log::error("Prewarming failed for key: {$key}", [
                        'error' => $e->getMessage()
                    ]);
                }
            })->afterResponse();
        }

        return $data;
    }

    /**
     * Cache with dependency invalidation
     */
    public static function rememberWithDependencies(
        string $key,
        array $dependencies,
        callable $callback,
        int $ttl = null
    ) {
        // Check if any dependency is newer than cached item
        $cacheTime = Cache::get("{$key}:timestamp");

        foreach ($dependencies as $depKey) {
            $depTime = Cache::get("{$depKey}:timestamp");

            if ($depTime && $cacheTime && $depTime > $cacheTime) {
                // Dependency is newer, invalidate cache
                Cache::forget($key);
                break;
            }
        }

        return Cache::remember($key, $ttl ?? self::$defaultTTL, function () use ($callback, $key) {
            $result = $callback();
            Cache::put("{$key}:timestamp", now()->timestamp, self::$defaultTTL);
            return $result;
        });
    }

    /**
     * Distributed cache lock to prevent stampede
     */
    public static function rememberWithLock(
        string $key,
        callable $callback,
        int $lockTTL = 30,
        int $cacheTTL = null
    ) {
        $lockKey = "lock:{$key}";

        if (Cache::has($key)) {
            return Cache::get($key);
        }

        // Try to acquire lock
        $lock = Cache::lock($lockKey, $lockTTL);

        if ($lock->get()) {
            try {
                // Double-check cache after acquiring lock
                if (Cache::has($key)) {
                    return Cache::get($key);
                }

                // Generate fresh data
                $data = $callback();
                Cache::put($key, $data, $cacheTTL ?? self::$defaultTTL);

                return $data;
            } finally {
                $lock->release();
            }
        } else {
            // Failed to acquire lock, wait and retry
            sleep(1);
            return Cache::get($key, function () use ($callback) {
                return $callback(); // Fallback to generate fresh data
            });
        }
    }

    /**
     * Cache warming strategy for frequently accessed data
     */
    public static function warmUpCache(array $patterns): void
    {
        foreach ($patterns as $pattern => $callback) {
            if (is_numeric($pattern)) {
                // Simple pattern
                $pattern = $callback;
                $callback = null;
            }

            // Generate cache keys for the pattern
            $keys = $this->generateKeysForPattern($pattern);

            foreach ($keys as $key) {
                dispatch(function () use ($key, $callback) {
                    try {
                        if ($callback) {
                            $data = $callback($key);
                            Cache::put($key, $data, self::$defaultTTL);
                        }
                    } catch (\Exception $e) {
                        \Log::error("Cache warming failed for key: {$key}", [
                            'error' => $e->getMessage()
                        ]);
                    }
                })->afterResponse();
            }
        }
    }

    private function generateKeysForPattern(string $pattern): array
    {
        // Implementation depends on your pattern matching logic
        // This could use Redis KEYS command or maintain an index
        return [];
    }
}
```

### **API Performance Optimization**

#### **Request Processing Pipeline**

```go
// pkg/middleware/performance.go
package middleware

import (
    "context"
    "fmt"
    "net/http"
    "strings"
    "sync/atomic"
    "time"

    "github.com/gin-gonic/gin"
    "github.com/prometheus/client_golang/prometheus"
    "github.com/prometheus/client_golang/prometheus/promauto"
)

var (
    requestDuration = promauto.NewHistogramVec(prometheus.HistogramOpts{
        Name: "http_request_duration_seconds",
        Help: "HTTP request duration in seconds",
        Buckets: prometheus.DefBuckets,
    }, []string{"method", "endpoint", "status_code"})

    requestCount = promauto.NewCounterVec(prometheus.CounterOpts{
        Name: "http_requests_total",
        Help: "Total number of HTTP requests",
    }, []string{"method", "endpoint", "status_code"})

    activeRequests = promauto.NewGauge(prometheus.GaugeOpts{
        Name: "http_active_requests",
        Help: "Number of currently active HTTP requests",
    })

    cacheHitRatio = promauto.NewGaugeVec(prometheus.GaugeOpts{
        Name: "cache_hit_ratio",
        Help: "Cache hit ratio for different cache types",
    }, []string{"cache_type"})
)

// Performance monitoring middleware
func PerformanceMonitoring() gin.HandlerFunc {
    return func(c *gin.Context) {
        start := time.Now()
        activeRequests.Inc()

        // Generate unique request ID
        requestID := generateRequestID()
        c.Set("request_id", requestID)
        c.Header("X-Request-ID", requestID)

        // Record request size
        requestSize := c.Request.ContentLength
        if requestSize > 0 {
            c.Set("request_size", requestSize)
        }

        // Process request
        c.Next()

        // Calculate metrics
        duration := time.Since(start)
        statusCode := c.Writer.Status()

        // Format endpoint for metrics (remove IDs)
        endpoint := formatEndpointForMetrics(c.Request.URL.Path, c.Params)
        method := c.Request.Method

        // Record metrics
        requestDuration.WithLabelValues(method, endpoint, fmt.Sprintf("%d", statusCode)).Observe(duration.Seconds())
        requestCount.WithLabelValues(method, endpoint, fmt.Sprintf("%d", statusCode)).Inc()
        activeRequests.Dec()

        // Add performance headers
        c.Header("X-Response-Time", fmt.Sprintf("%v", duration))
        c.Header("X-Request-Start", fmt.Sprintf("%d", start.UnixMilli()))

        // Log slow requests
        if duration > time.Second {
            c.Request = c.Request.WithContext(context.WithValue(c.Request.Context(), "slow_request", true))
        }

        // Set cache metrics if available
        if cacheHits, exists := c.Get("cache_hits"); exists {
            cacheTotal, _ := c.Get("cache_total")
            if total, ok := cacheTotal.(int64); ok {
                if hits, ok := cacheHits.(int64); ok {
                    ratio := float64(hits) / float64(total)
                    cacheHitRatio.WithLabelValues("redis").Set(ratio)
                }
            }
        }
    }
}

// Rate limiting middleware
func RateLimiting(requestsPerMinute int, burst int) gin.HandlerFunc {
    return func(c *gin.Context) {
        // Simple in-memory rate limiter
        // In production, use Redis-based rate limiting
        key := fmt.Sprintf("rate_limit:%s", c.ClientIP())

        // Check rate limit
        if isRateLimited(key, requestsPerMinute, burst) {
            c.JSON(429, gin.H{
                "error": "Rate limit exceeded",
                "retry_after": 60,
            })
            c.Abort()
            return
        }

        c.Next()
    }
}

// Response compression middleware
func ResponseCompression(minSize int) gin.HandlerFunc {
    return func(c *gin.Context) {
        // Check if client accepts gzip
        if !strings.Contains(c.Request.Header.Get("Accept-Encoding"), "gzip") {
            c.Next()
            return
        }

        // Wrap response writer
        c.Writer = &gzipResponseWriter{
            ResponseWriter: c.Writer,
            minSize:       minSize,
        }

        c.Next()
    }
}

type gzipResponseWriter struct {
    gin.ResponseWriter
    minSize     int
    written     int
    gzipWriter  *gzip.Writer
}

func (g *gzipResponseWriter) Write(data []byte) (int, error) {
    g.written += len(data)

    if g.written >= g.minSize && g.gzipWriter == nil {
        g.gzipWriter = gzip.NewWriter(g.ResponseWriter)
        g.Header().Set("Content-Encoding", "gzip")
        g.Header().Del("Content-Length")
    }

    if g.gzipWriter != nil {
        return g.gzipWriter.Write(data)
    }

    return g.ResponseWriter.Write(data)
}

func (g *gzipResponseWriter) Flush() {
    if g.gzipWriter != nil {
        g.gzipWriter.Flush()
    }
    g.ResponseWriter.Flush()
}

// Request size limiting
func RequestSizeLimit(maxSize int64) gin.HandlerFunc {
    return func(c *gin.Context) {
        if c.Request.ContentLength > maxSize {
            c.JSON(413, gin.H{
                "error": "Request entity too large",
                "max_size": maxSize,
            })
            c.Abort()
            return
        }

        c.Next()
    }
}

// Database connection optimization
func DatabaseOptimization() gin.HandlerFunc {
    return func(c *gin.Context) {
        // Set read-only for GET requests
        if c.Request.Method == "GET" {
            c.Set("read_only", true)
        }

        // Set connection timeout based on request type
        if isReadRequest(c.Request.Method) {
            // Use read replicas for read requests
            c.Set("use_read_replica", true)
        }

        c.Next()
    }
}

// Helper functions
func generateRequestID() string {
    return fmt.Sprintf("%d", atomic.AddInt64(&requestCounter, 1))
}

func formatEndpointForMetrics(path string, params gin.Params) string {
    // Replace IDs with placeholders
    endpoint := path
    for _, param := range params {
        endpoint = strings.Replace(endpoint, param.Value, fmt.Sprintf(":%s", param.Key), 1)
    }
    return endpoint
}

func isRateLimited(key string, requestsPerMinute, burst int) bool {
    // Implement rate limiting logic
    // This is a simplified version
    return false
}

func isReadRequest(method string) bool {
    return method == "GET" || method == "HEAD" || method == "OPTIONS"
}

var requestCounter int64
```

## 🎨 Frontend Performance

### **Asset Optimization**

```javascript
// frontend/config/webpack.optimize.js
const TerserPlugin = require('terser-webpack-plugin');
const CompressionPlugin = require('compression-webpack-plugin');
const BundleAnalyzerPlugin = require('webpack-bundle-analyzer').BundleAnalyzerPlugin;

module.exports = (isProduction = false) => ({
  optimization: {
    minimize: isProduction,
    minimizer: [
      new TerserPlugin({
        terserOptions: {
          compress: {
            drop_console: isProduction,
            drop_debugger: isProduction,
            pure_funcs: isProduction ? ['console.log'] : [],
          },
          mangle: isProduction,
          format: {
            comments: false,
          },
        },
        extractComments: false,
      }),
    ],
    splitChunks: {
      chunks: 'all',
      cacheGroups: {
        // Vendor chunks
        vendor: {
          test: /[\\/]node_modules[\\/]/,
          name: 'vendors',
          chunks: 'all',
          priority: 10,
        },
        // Common chunks
        common: {
          name: 'common',
          minChunks: 2,
          chunks: 'all',
          priority: 5,
          reuseExistingChunk: true,
        },
        // Runtime chunk
        runtime: {
          name: 'runtime',
          minChunks: 1,
          chunks: 'all',
          priority: 15,
          enforce: true,
        },
      },
    },
    moduleIds: 'deterministic',
    runtimeChunk: 'single',
  },
  plugins: [
    ...(isProduction ? [
      new CompressionPlugin({
        algorithm: 'gzip',
        test: /\.(js|css|html|svg)$/,
        threshold: 8192,
        minRatio: 0.8,
      }),
    ] : []),
    ...(process.env.ANALYZE ? [new BundleAnalyzerPlugin()] : []),
  ],
});

// frontend/src/utils/lazy-loading.js
class LazyLoader {
  constructor() {
    this.loadedModules = new Set();
    this.loadingPromises = new Map();
  }

  // Dynamic import with caching
  async loadModule(modulePath, fallbackPath = null) {
    if (this.loadedModules.has(modulePath)) {
      return import(/* webpackChunkName: "[request]" */ modulePath);
    }

    if (this.loadingPromises.has(modulePath)) {
      return this.loadingPromises.get(modulePath);
    }

    const loadPromise = this.doLoadModule(modulePath, fallbackPath);
    this.loadingPromises.set(modulePath, loadPromise);

    try {
      const module = await loadPromise;
      this.loadedModules.add(modulePath);
      return module;
    } finally {
      this.loadingPromises.delete(modulePath);
    }
  }

  async doLoadModule(modulePath, fallbackPath) {
    try {
      return await import(/* webpackChunkName: "[request]" */ modulePath);
    } catch (error) {
      console.warn(`Failed to load module ${modulePath}, trying fallback...`);

      if (fallbackPath) {
        return await import(/* webpackChunkName: "[request]" */ fallbackPath);
      }

      throw error;
    }
  }

  // Preload critical modules
  preloadModules(modulePaths) {
    modulePaths.forEach(path => {
      this.loadModule(path);
    });
  }

  // Intersection Observer for lazy loading
  observeElement(element, callback, options = {}) {
    const defaultOptions = {
      rootMargin: '50px',
      threshold: 0.1,
      ...options
    };

    const observer = new IntersectionObserver((entries) => {
      entries.forEach(entry => {
        if (entry.isIntersecting) {
          callback(entry.target);
          observer.unobserve(entry.target);
        }
      });
    }, defaultOptions);

    observer.observe(element);
    return observer;
  }
}

// Usage examples
const lazyLoader = new LazyLoader();

// Lazy load components
export const loadDashboard = () => lazyLoader.loadModule('../pages/Dashboard.vue');
export const loadSettings = () => lazyLoader.loadModule('../pages/Settings.vue');

// Preload critical modules on page load
document.addEventListener('DOMContentLoaded', () => {
  lazyLoader.preloadModules([
    '../components/Header.vue',
    '../components/Sidebar.vue'
  ]);
});
```

### **Image Optimization**

```javascript
// frontend/src/utils/image-optimizer.js
class ImageOptimizer {
  constructor() {
    this.supportedFormats = this.getSupportedFormats();
    this.observedImages = new WeakMap();
  }

  // Check browser support for different image formats
  getSupportedFormats() {
    const canvas = document.createElement('canvas');
    const ctx = canvas.getContext('2d');

    return {
      webp: canvas.toDataURL('image/webp').indexOf('data:image/webp') === 0,
      avif: canvas.toDataURL('image/avif').indexOf('data:image/avif') === 0,
    };
  }

  // Generate responsive image sources
  generateSrcset(baseUrl, sizes = [320, 640, 960, 1280, 1920]) {
    return sizes
      .map(size => `${baseUrl}?w=${size}&q=80 ${size}w`)
      .join(', ');
  }

  // Optimize image loading with lazy loading
  optimizeImage(img, options = {}) {
    const {
      lazy = true,
      placeholder = true,
      quality = 80,
      format = 'auto',
    } = options;

    // Add loading="lazy" attribute
    if (lazy) {
      img.loading = 'lazy';
    }

    // Generate srcset for responsive images
    if (img.dataset.src) {
      const baseUrl = img.dataset.src;
      img.srcset = this.generateSrcset(baseUrl);
      img.sizes = this.calculateSizes(img);
    }

    // Add placeholder
    if (placeholder && !img.src) {
      this.addPlaceholder(img);
    }

    // Setup intersection observer for lazy loading
    if (lazy && img.dataset.src) {
      this.setupLazyLoading(img);
    }

    // Optimize format
    if (format === 'auto') {
      this.optimizeFormat(img);
    }
  }

  // Calculate appropriate sizes attribute
  calculateSizes(img) {
    // Simple responsive calculation
    return '(max-width: 640px) 100vw, (max-width: 1024px) 50vw, 33vw';
  }

  // Add low-quality placeholder
  addPlaceholder(img) {
    const canvas = document.createElement('canvas');
    const ctx = canvas.getContext('2d');
    canvas.width = 32;
    canvas.height = 24;

    // Create simple gradient placeholder
    const gradient = ctx.createLinearGradient(0, 0, 32, 24);
    gradient.addColorStop(0, '#f0f0f0');
    gradient.addColorStop(1, '#e0e0e0');
    ctx.fillStyle = gradient;
    ctx.fillRect(0, 0, 32, 24);

    img.src = canvas.toDataURL();
    img.classList.add('image-loading');
  }

  // Setup intersection observer for lazy loading
  setupLazyLoading(img) {
    if (this.observedImages.has(img)) {
      return;
    }

    const observer = new IntersectionObserver((entries) => {
      entries.forEach(entry => {
        if (entry.isIntersecting) {
          const img = entry.target;
          this.loadImage(img);
          observer.unobserve(img);
        }
      });
    }, {
      rootMargin: '50px',
      threshold: 0.1,
    });

    observer.observe(img);
    this.observedImages.set(img, observer);
  }

  // Load actual image
  async loadImage(img) {
    if (!img.dataset.src) return;

    try {
      // Create new image to preload
      const tempImg = new Image();

      await new Promise((resolve, reject) => {
        tempImg.onload = resolve;
        tempImg.onerror = reject;
        tempImg.src = img.dataset.src;

        if (img.srcset) {
          tempImg.srcset = img.srcset;
        }
      });

      // Replace placeholder with actual image
      img.src = img.dataset.src;
      img.classList.remove('image-loading');
      img.classList.add('image-loaded');

    } catch (error) {
      console.error('Failed to load image:', error);
      img.classList.add('image-error');
    }
  }

  // Optimize image format
  optimizeFormat(img) {
    if (this.supportedFormats.avif && img.dataset.src) {
      // Use AVIF if supported
      img.dataset.src = img.dataset.src.replace(/\.(jpg|jpeg|png)$/, '.avif');
    } else if (this.supportedFormats.webp && img.dataset.src) {
      // Use WebP if supported
      img.dataset.src = img.dataset.src.replace(/\.(jpg|jpeg|png)$/, '.webp');
    }
  }

  // Batch optimize all images on page
  optimizePageImages() {
    const images = document.querySelectorAll('img[data-optimize]');
    images.forEach(img => {
      const options = JSON.parse(img.dataset.optimize || '{}');
      this.optimizeImage(img, options);
    });
  }
}

// Initialize image optimizer
const imageOptimizer = new ImageOptimizer();

// Auto-optimize images on DOM ready
document.addEventListener('DOMContentLoaded', () => {
  imageOptimizer.optimizePageImages();
});

// Export for manual usage
window.ImageOptimizer = ImageOptimizer;
```

### **JavaScript Performance Optimization**

```javascript
// frontend/src/utils/performance.js
class PerformanceOptimizer {
  constructor() {
    this.metrics = new Map();
    this.observers = new Map();
    this.init();
  }

  init() {
    this.measurePageLoad();
    this.observeWebVitals();
    this.setupResourceMonitoring();
  }

  // Core Web Vitals monitoring
  observeWebVitals() {
    // Largest Contentful Paint (LCP)
    this.observeLCP();

    // First Input Delay (FID)
    this.observeFID();

    // Cumulative Layout Shift (CLS)
    this.observeCLS();

    // Time to Interactive (TTI)
    this.observeTTI();
  }

  observeLCP() {
    const observer = new PerformanceObserver((list) => {
      const entries = list.getEntries();
      const lastEntry = entries[entries.length - 1];

      this.recordMetric('LCP', lastEntry.startTime);

      // Send to analytics
      this.sendToAnalytics('lcp', {
        value: Math.round(lastEntry.startTime),
        element: lastEntry.element?.tagName,
        url: lastEntry.url,
      });
    });

    observer.observe({ entryTypes: ['largest-contentful-paint'] });
    this.observers.set('LCP', observer);
  }

  observeFID() {
    const observer = new PerformanceObserver((list) => {
      list.getEntries().forEach((entry) => {
        this.recordMetric('FID', entry.processingStart - entry.startTime);

        this.sendToAnalytics('fid', {
          value: Math.round(entry.processingStart - entry.startTime),
          inputType: entry.name,
        });
      });
    });

    observer.observe({ entryTypes: ['first-input'] });
    this.observers.set('FID', observer);
  }

  observeCLS() {
    let clsValue = 0;
    let sessionValue = 0;
    let sessionEntries = [];

    const observer = new PerformanceObserver((list) => {
      list.getEntries().forEach((entry) => {
        if (!entry.hadRecentInput) {
          clsValue += entry.value;
          sessionValue += entry.value;
          sessionEntries.push(entry);
        }
      });

      // Record CLS when session ends (after 5 seconds of inactivity)
      if (sessionEntries.length > 0) {
        clearTimeout(this.clsTimeout);
        this.clsTimeout = setTimeout(() => {
          this.recordMetric('CLS', sessionValue);
          this.sendToAnalytics('cls', {
            value: Math.round(sessionValue * 1000) / 1000,
            entries: sessionEntries.length,
          });
          sessionValue = 0;
          sessionEntries = [];
        }, 5000);
      }
    });

    observer.observe({ entryTypes: ['layout-shift'] });
    this.observers.set('CLS', observer);
  }

  observeTTI() {
    // Simple TTI calculation
    const measureTTI = () => {
      const navEntry = performance.getEntriesByType('navigation')[0];
      const loadEvent = navEntry.loadEventEnd;

      // Find long tasks after load
      const longTasks = performance.getEntriesByType('longtask');
      const lastLongTask = longTasks
        .filter(task => task.startTime > loadEvent)
        .pop();

      const tti = lastLongTask ? lastLongTask.startTime + lastLongTask.duration : loadEvent;

      this.recordMetric('TTI', tti);
      this.sendToAnalytics('tti', {
        value: Math.round(tti),
      });
    };

    if (document.readyState === 'complete') {
      setTimeout(measureTTI, 100);
    } else {
      window.addEventListener('load', () => {
        setTimeout(measureTTI, 100);
      });
    }
  }

  // Resource performance monitoring
  setupResourceMonitoring() {
    const observer = new PerformanceObserver((list) => {
      list.getEntries().forEach((entry) => {
        if (entry.initiatorType === 'script' || entry.initiatorType === 'link') {
          this.recordMetric(`resource_${entry.initiatorType}`, entry.duration);
        }
      });
    });

    observer.observe({ entryTypes: ['resource'] });
    this.observers.set('resources', observer);
  }

  // Memory usage monitoring
  measureMemoryUsage() {
    if ('memory' in performance) {
      const memory = performance.memory;
      this.recordMetric('memory_used', memory.usedJSHeapSize);
      this.recordMetric('memory_total', memory.totalJSHeapSize);

      // Alert if memory usage is high
      if (memory.usedJSHeapSize > memory.totalJSHeapSize * 0.9) {
        console.warn('High memory usage detected:', {
          used: memory.usedJSHeapSize,
          total: memory.totalJSHeapSize,
          limit: memory.jsHeapSizeLimit,
        });
      }
    }
  }

  // Custom performance marks
  mark(name) {
    performance.mark(name);
  }

  measure(name, startMark, endMark = null) {
    try {
      if (endMark) {
        performance.measure(name, startMark, endMark);
      } else {
        performance.measure(name, startMark);
      }

      const measure = performance.getEntriesByName(name, 'measure')[0];
      this.recordMetric(name, measure.duration);
      return measure.duration;
    } catch (error) {
      console.error('Failed to measure performance:', error);
      return 0;
    }
  }

  // Record performance metrics
  recordMetric(name, value) {
    if (!this.metrics.has(name)) {
      this.metrics.set(name, []);
    }

    this.metrics.get(name).push({
      value,
      timestamp: performance.now(),
    });
  }

  // Get performance statistics
  getStats(metricName) {
    const values = this.metrics.get(metricName) || [];
    if (values.length === 0) return null;

    const sortedValues = values.map(v => v.value).sort((a, b) => a - b);

    return {
      count: values.length,
      min: sortedValues[0],
      max: sortedValues[sortedValues.length - 1],
      avg: sortedValues.reduce((a, b) => a + b, 0) / sortedValues.length,
      median: sortedValues[Math.floor(sortedValues.length / 2)],
      p95: sortedValues[Math.floor(sortedValues.length * 0.95)],
      p99: sortedValues[Math.floor(sortedValues.length * 0.99)],
    };
  }

  // Send metrics to analytics
  sendToAnalytics(name, data) {
    // Implementation depends on your analytics system
    if (window.gtag) {
      window.gtag('event', 'web_vitals', {
        name,
        ...data,
        custom_parameter_1: navigator.userAgent.includes('Mobile') ? 'mobile' : 'desktop',
      });
    }

    // Also send to your own analytics endpoint
    fetch('/api/v1/analytics/web-vitals', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({
        name,
        data,
        url: window.location.href,
        timestamp: Date.now(),
      }),
    }).catch(error => {
      console.error('Failed to send analytics:', error);
    });
  }

  // Measure page load performance
  measurePageLoad() {
    window.addEventListener('load', () => {
      setTimeout(() => {
        const navigation = performance.getEntriesByType('navigation')[0];

        this.recordMetric('domContentLoaded', navigation.domContentLoadedEventEnd - navigation.domContentLoadedEventStart);
        this.recordMetric('pageLoad', navigation.loadEventEnd - navigation.loadEventStart);
        this.recordMetric('dnsLookup', navigation.domainLookupEnd - navigation.domainLookupStart);
        this.recordMetric('tcpConnect', navigation.connectEnd - navigation.connectStart);
        this.recordMetric('serverResponse', navigation.responseEnd - navigation.requestStart);

        this.measureMemoryUsage();
      }, 0);
    });
  }

  // Get performance summary
  getSummary() {
    const summary = {};

    for (const [name] of this.metrics) {
      summary[name] = this.getStats(name);
    }

    return summary;
  }

  // Cleanup
  cleanup() {
    for (const observer of this.observers.values()) {
      observer.disconnect();
    }
    this.observers.clear();
    this.metrics.clear();
  }
}

// Initialize performance monitoring
const performanceOptimizer = new PerformanceOptimizer();

// Expose globally for debugging
window.performanceOptimizer = performanceOptimizer;

// Export for module usage
export default performanceOptimizer;
```

## 📊 Performance Monitoring & Metrics

### **Performance Dashboard Metrics**

```yaml
application_metrics:
  response_times:
    - metric: "p50_response_time"
      target: "< 100ms"
      alert_threshold: "> 200ms"

    - metric: "p95_response_time"
      target: "< 500ms"
      alert_threshold: "> 1s"

    - metric: "p99_response_time"
      target: "< 1s"
      alert_threshold: "> 2s"

  throughput:
    - metric: "requests_per_second"
      target: "> 1000 rps"
      alert_threshold: "< 500 rps"

    - metric: "error_rate"
      target: "< 0.1%"
      alert_threshold: "> 0.5%"

  resource_usage:
    - metric: "cpu_usage"
      target: "< 70%"
      alert_threshold: "> 85%"

    - metric: "memory_usage"
      target: "< 80%"
      alert_threshold: "> 90%"

    - metric: "disk_io"
      target: "< 70%"
      alert_threshold: "> 85%"

database_metrics:
  query_performance:
    - metric: "slow_queries"
      target: "< 10 per hour"
      alert_threshold: "> 50 per hour"

    - metric: "connection_pool_usage"
      target: "< 80%"
      alert_threshold: "> 95%"

    - metric: "replication_lag"
      target: "< 1 second"
      alert_threshold: "> 5 seconds"

  cache_performance:
    - metric: "cache_hit_ratio"
      target: "> 90%"
      alert_threshold: "< 70%"

    - metric: "cache_miss_rate"
      target: "< 10%"
      alert_threshold: "> 30%"

frontend_metrics:
  web_vitals:
    - metric: "lcp"
      target: "< 2.5s"
      alert_threshold: "> 4s"

    - metric: "fid"
      target: "< 100ms"
      alert_threshold: "> 300ms"

    - metric: "cls"
      target: "< 0.1"
      alert_threshold: "> 0.25"

    - metric: "tti"
      target: "< 3s"
      alert_threshold: "> 5s"

  user_experience:
    - metric: "bounce_rate"
      target: "< 40%"
      alert_threshold: "> 60%"

    - metric: "page_load_time"
      target: "< 2s"
      alert_threshold: "> 4s"
```

---

**Performance Optimization Checklist:**

- **Database:**
  - [ ] Optimize slow queries with proper indexing
  - [ ] Implement connection pooling
  - [ ] Add query result caching
  - [ ] Monitor and optimize database performance regularly

- **Application:**
  - [ ] Implement multi-level caching strategy
  - [ ] Use connection pooling for external services
  - [ ] Add performance monitoring and alerting
  - [ ] Optimize API response times

- **Frontend:**
  - [ ] Implement lazy loading for images and components
  - [ ] Optimize assets with compression and minification
  - [ ] Monitor Core Web Vitals
  - [ ] Implement progressive enhancement

- **Infrastructure:**
  - [ ] Use CDN for static assets
  - [ ] Implement load balancing
  - [ ] Monitor resource utilization
  - [ ] Plan for scalability

*Related Documentation:* [Database Conventions](./database-conventions.md) | [API Guidelines](./api-design-guidelines.md) | [Monitoring & Logging](./monitoring-logging.md) | [Architecture Overview](./architecture-overview.md)