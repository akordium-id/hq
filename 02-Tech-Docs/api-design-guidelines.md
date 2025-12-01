# 🔌 API Design Guidelines

Comprehensive RESTful API design standards untuk semua Akordium Lab products. Fokus pada consistency, performance, security, dan developer experience.

## 🎯 API Design Philosophy

### **Core Principles**

- **Resource-Oriented:** API endpoints represent resources, not actions
- **Stateless:** Setiap request contains all information needed
- **Consistent Interface:** Uniform interface across all endpoints
- **Layered System:** Multiple layers with clear separation
- **Cacheable:** Responses designed untuk caching
- **Self-Descriptive:** Clear documentation dan metadata

### **Technology Stack**

- **Primary:** RESTful APIs with JSON
- **Authentication:** JWT tokens
- **Documentation:** OpenAPI/Swagger specifications
- **Versioning:** URL-based versioning
- **Rate Limiting:** Redis-based rate limiting
- **Monitoring:** API usage dan performance tracking

## 📡 URL Structure & Naming

### **Base URL Format**

```text
Production: https://api.akordium.id/v1/
Staging:    https://api-staging.akordium.id/v1/
Development: http://localhost:3000/api/v1/
```

### **Resource Naming Conventions**

```http
# ✅ Good RESTful URLs
GET    /api/v1/users
GET    /api/v1/users/{id}
POST   /api/v1/users
PUT    /api/v1/users/{id}
PATCH  /api/v1/users/{id}
DELETE /api/v1/users/{id}

# Nested resources
GET    /api/v1/users/{userId}/orders
POST   /api/v1/users/{userId}/orders
GET    /api/v1/waqf-projects/{projectId}/donations

# ✅ Query parameters for filtering
GET    /api/v1/users?status=active&role=admin
GET    /api/v1/transactions?date_from=2024-01-01&date_to=2024-12-31

# ❌ Bad practices (action URLs)
POST   /api/v1/createUser
GET    /api/v1/getUserById
POST   /api/v1/users/1234/update
```

### **Resource Naming Rules**

- **Plural nouns:** `/users`, `/orders`, `/waqf-projects`
- **Hyphen-separated:** Use kebab-case, not camelCase
- **No trailing slashes:** `/api/v1/users`, not `/api/v1/users/`
- **Lowercase only:** All URLs in lowercase
- **Consistent across products:** Same naming patterns

## 🏷️ HTTP Methods & Status Codes

### **HTTP Methods Usage**

```http
# GET - Retrieve resources
GET    /api/v1/users                    # Get all users
GET    /api/v1/users/123               # Get specific user

# POST - Create new resource
POST   /api/v1/users                    # Create new user
POST   /api/v1/users/123/orders        # Create order for user

# PUT - Replace entire resource
PUT    /api/v1/users/123               # Replace user completely

# PATCH - Partial update
PATCH  /api/v1/users/123               // Update user partially

# DELETE - Remove resource
DELETE /api/v1/users/123               # Delete user

# HEAD - Get headers only
HEAD   /api/v1/users/123               # Check if user exists

# OPTIONS - Get allowed methods
OPTIONS /api/v1/users                   # Get allowed methods
```

### **Status Code Standards**

```http
# Success Codes
200 OK              - Request successful
201 Created         - Resource created successfully
202 Accepted        - Request accepted for processing
204 No Content      - Request successful, no content to return

# Client Error Codes
400 Bad Request     - Invalid request data
401 Unauthorized    - Authentication required
403 Forbidden       - Access denied (authenticated but not authorized)
404 Not Found       - Resource not found
405 Method Not Allowed - HTTP method not allowed
409 Conflict        - Resource conflict
422 Unprocessable Entity - Validation errors
429 Too Many Requests - Rate limit exceeded

# Server Error Codes
500 Internal Server Error - Unexpected server error
502 Bad Gateway    - Gateway/proxy error
503 Service Unavailable - Service temporarily unavailable
504 Gateway Timeout - Gateway timeout
```

### **Response Format Standard**

```json
// Success Response
{
  "success": true,
  "data": {
    "id": 123,
    "name": "John Doe",
    "email": "john@example.com"
  },
  "meta": {
    "timestamp": "2024-12-01T10:30:00Z",
    "version": "v1"
  }
}

// Paginated Response
{
  "success": true,
  "data": [
    {"id": 1, "name": "User 1"},
    {"id": 2, "name": "User 2"}
  ],
  "pagination": {
    "current_page": 1,
    "per_page": 20,
    "total": 100,
    "total_pages": 5
  },
  "meta": {
    "timestamp": "2024-12-01T10:30:00Z",
    "version": "v1"
  }
}

// Error Response
{
  "success": false,
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "Invalid request data",
    "details": {
      "email": ["Email is required"],
      "age": ["Age must be at least 18"]
    }
  },
  "meta": {
    "timestamp": "2024-12-01T10:30:00Z",
    "version": "v1"
  }
}
```

## 🔄 Versioning Strategy

### **URL-Based Versioning**

```http
# Version 1 (Current)
GET    /api/v1/users

# Version 2 (Future with breaking changes)
GET    /api/v2/users

# Version-specific endpoints
GET    /api/v1/users/{id}/orders      # v1 implementation
GET    /api/v2/users/{id}/orders      # v2 with new features
```

### **Versioning Rules**

- **Major Version:** Breaking changes to response structure
- **Minor Version:** Non-breaking additions
- **Deprecation:** Old versions supported minimum 6 months
- **Backward Compatibility:** Maintain compatibility when possible
- **Clear Migration Path:** Documentation for version migration

### **Version Response Headers**

```http
HTTP/1.1 200 OK
Content-Type: application/json
API-Version: v1
Supported-Versions: v1,v2
Deprecated: false
```

## 🔐 Authentication & Authorization

### **JWT Authentication Flow**

```http
# 1. Login Request
POST /api/v1/auth/login
{
  "email": "user@example.com",
  "password": "securepassword"
}

# 2. Login Response
{
  "success": true,
  "data": {
    "access_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
    "refresh_token": "def50200...",
    "token_type": "Bearer",
    "expires_in": 3600,
    "user": {
      "id": 123,
      "name": "John Doe",
      "email": "user@example.com",
      "roles": ["user", "admin"]
    }
  }
}

# 3. Protected API Request
GET /api/v1/users/123
Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...
```

### **Authorization Patterns**

```http
# Role-based access
GET /api/v1/admin/users              # Requires admin role
GET /api/v1/users/me                  # Requires authentication
GET /api/v1/public/health-check      # No authentication required

# Scope-based access
GET /api/v1/orders                   # List own orders
GET /api/v1/orders?all=true          # List all orders (admin scope)

# Resource ownership
PATCH /api/v1/users/123              # Can only update own profile
PATCH /api/v1/users/456              # Can update any user (admin)
```

### **Token Refresh**

```http
POST /api/v1/auth/refresh
{
  "refresh_token": "def50200..."
}
```

## 📊 Request & Response Patterns

### **Request Headers**

```http
# Standard Headers
Content-Type: application/json
Accept: application/json
Authorization: Bearer <token>
X-API-Version: v1
X-Client-ID: web-app-v2
X-Request-ID: uuid-generated-per-request
```

### **Response Headers**

```http
# Standard Response Headers
Content-Type: application/json
Cache-Control: no-cache, no-store, must-revalidate
X-API-Version: v1
X-Request-ID: uuid-generated-per-request
X-Rate-Limit-Limit: 1000
X-Rate-Limit-Remaining: 999
X-Rate-Limit-Reset: 1640995200
```

### **Query Parameters**

```http
# Filtering
GET /api/v1/users?status=active&role=admin

# Sorting
GET /api/v1/users?sort=created_at:desc,name:asc

# Pagination
GET /api/v1/users?page=2&per_page=20

# Field Selection (Sparse Fieldsets)
GET /api/v1/users?fields=id,name,email

# Search
GET /api/v1/users?search=john&search_fields=name,email

# Date Range
GET /api/v1/transactions?date_from=2024-01-01&date_to=2024-12-31
```

### **Request Body Examples**

```json
// POST Create Resource
{
  "name": "John Doe",
  "email": "john@example.com",
  "password": "securepassword",
  "profile": {
    "phone": "+628123456789",
    "address": "Jakarta, Indonesia"
  }
}

// PATCH Partial Update
{
  "name": "John Updated",
  "profile": {
    "phone": "+628123456780"
  }
}

// POST with Nested Resources
{
  "title": "Waqf Project",
  "description": "Education waqf project",
  "target_amount": 100000000,
  "categories": [
    {"id": 1, "allocation_percentage": 60},
    {"id": 2, "allocation_percentage": 40}
  ]
}
```

## 🚨 Error Handling

### **Error Response Structure**

```json
{
  "success": false,
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "Request validation failed",
    "details": {
      "email": ["Email is required and must be valid"],
      "password": ["Password must be at least 8 characters"]
    },
    "request_id": "uuid-generated-per-request"
  },
  "meta": {
    "timestamp": "2024-12-01T10:30:00Z",
    "version": "v1"
  }
}
```

### **Common Error Codes**

```json
// Validation Error (422)
{
  "success": false,
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "Invalid request data",
    "details": {
      "field_name": ["Error message"]
    }
  }
}

// Authentication Error (401)
{
  "success": false,
  "error": {
    "code": "AUTHENTICATION_REQUIRED",
    "message": "Authentication required to access this resource"
  }
}

// Authorization Error (403)
{
  "success": false,
  "error": {
    "code": "ACCESS_DENIED",
    "message": "You don't have permission to access this resource"
  }
}

// Resource Not Found (404)
{
  "success": false,
  "error": {
    "code": "RESOURCE_NOT_FOUND",
    "message": "The requested resource was not found"
  }
}

// Rate Limit Exceeded (429)
{
  "success": false,
  "error": {
    "code": "RATE_LIMIT_EXCEEDED",
    "message": "Too many requests, please try again later",
    "retry_after": 60
  }
}
```

## ⚡ Performance Optimization

### **Pagination Strategy**

```http
# Limit-Offset Pagination (Simple)
GET /api/v1/users?page=1&per_page=20

# Cursor-based Pagination (Better untuk large datasets)
GET /api/v1/users?limit=20&cursor=eyJpZCI6MTIzfQ

# Response includes pagination metadata
{
  "success": true,
  "data": [...],
  "pagination": {
    "current_page": 1,
    "per_page": 20,
    "total": 1000,
    "total_pages": 50,
    "has_next": true,
    "has_prev": false,
    "next_cursor": "eyJpZCI6MTQ0fQ"
  }
}
```

### **Caching Strategy**

```http
# Cache-Control Headers
GET /api/v1/public/health-check
Cache-Control: public, max-age=300

GET /api/v1/users/123
Cache-Control: private, no-store, must-revalidate

GET /api/v1/products
Cache-Control: public, max-age=3600, must-revalidate
```

### **Compression**

```http
# Request Headers
Accept-Encoding: gzip, deflate

# Response Headers
Content-Encoding: gzip
Content-Length: 1024
```

## 📝 Documentation Standards

### **OpenAPI 3.0 Specification**

```yaml
openapi: 3.0.3
info:
  title: Akordium Lab API
  description: RESTful API for Akordium Lab products
  version: 1.0.0
  contact:
    name: API Support
    email: api@akordium.id
  license:
    name: MIT
    url: https://opensource.org/licenses/MIT

servers:
  - url: https://api.akordium.id/v1
    description: Production server
  - url: https://api-staging.akordium.id/v1
    description: Staging server

paths:
  /users:
    get:
      summary: Get list of users
      description: Retrieve paginated list of users
      parameters:
        - name: page
          in: query
          schema:
            type: integer
            minimum: 1
            default: 1
        - name: per_page
          in: query
          schema:
            type: integer
            minimum: 1
            maximum: 100
            default: 20
      responses:
        '200':
          description: Successful response
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/UserListResponse'
        '401':
          $ref: '#/components/responses/Unauthorized'
```

### **API Documentation Requirements**

- **Auto-generated:** From OpenAPI specifications
- **Interactive:** Swagger UI untuk testing
- **Examples:** Request/response examples for each endpoint
- **Error Codes:** Complete list of error codes
- **Authentication:** Clear authentication documentation
- **Rate Limiting:** Rate limiting information
- **SDK Examples:** Code examples in multiple languages

## 🛡️ Security Considerations

### **Input Validation**

```json
// Always validate input at multiple layers
{
  "name": "string|between:2,255|required",
  "email": "email|required|unique:users",
  "password": "password|min:8|confirmed",
  "amount": "numeric|min:0"
}
```

### **SQL Injection Prevention**

```go
// ✅ Safe: Parameterized queries
query := "SELECT * FROM users WHERE email = $1"
rows, err := db.Query(query, email)

// ❌ Unsafe: String concatenation
query := "SELECT * FROM users WHERE email = '" + email + "'"
rows, err := db.Query(query)
```

### **XSS Prevention**

```html
<!-- ✅ Safe: Escaped output -->
<div>{{ user.name }}</div>

<!-- ❌ Unsafe: Raw output -->
<div dangerouslySetInnerHTML={{{user.bio}}}></div>
```

### **Rate Limiting**

```go
// Rate limiting per user
rateLimiter := rate.NewLimiter(rate.Every(time.Minute), 100)
if !rateLimiter.Allow() {
    return c.Status(http.StatusTooManyRequests).JSON(gin.H{
        "error": "Rate limit exceeded",
    })
}
```

## 🔄 Integration Patterns

### **Webhooks**

```http
# Webhook Configuration
POST /api/v1/webhooks
{
  "url": "https://client-app.com/webhooks",
  "events": ["order.created", "payment.completed"],
  "secret": "webhook-secret-key"
}

# Webhook Delivery
POST https://client-app.com/webhooks
X-Webhook-Signature: sha256=abcdef123456
{
  "event": "order.created",
  "data": {
    "order_id": 123,
    "amount": 100000,
    "user_id": 456
  },
  "timestamp": "2024-12-01T10:30:00Z"
}
```

### **Bulk Operations**

```http
# Bulk Create
POST /api/v1/users/bulk
{
  "users": [
    {"name": "User 1", "email": "user1@example.com"},
    {"name": "User 2", "email": "user2@example.com"}
  ]
}

# Bulk Update
PATCH /api/v1/users/bulk
{
  "user_ids": [1, 2, 3],
  "updates": {
    "status": "active"
  }
}

# Bulk Delete
DELETE /api/v1/users/bulk
{
  "user_ids": [1, 2, 3]
}
```

## 📋 API Testing Guidelines

### **Postman Collection**

```json
{
  "info": {
    "name": "Akordium Lab API",
    "schema": "https://schema.getpostman.com/json/collection/v2.1.0/collection.json"
  },
  "item": [
    {
      "name": "Authentication",
      "item": [
        {
          "name": "Login",
          "request": {
            "method": "POST",
            "header": [],
            "body": {
              "mode": "raw",
              "raw": "{\n  \"email\": \"user@example.com\",\n  \"password\": \"password\"\n}",
              "options": {
                "raw": {
                  "language": "json"
                }
              }
            },
            "url": {
              "raw": "{{base_url}}/api/v1/auth/login"
            }
          }
        }
      ]
    }
  ],
  "variable": [
    {
      "key": "base_url",
      "value": "https://api.akordium.id",
      "type": "string"
    },
    {
      "key": "access_token",
      "value": "",
      "type": "string"
    }
  ]
}
```

---

**Remember:** Good API design is about developer experience. Consistent, predictable, and well-documented APIs make integration easier and reduce support burden. Think of your API as a product for other developers.

*Related Documentation:* [Database Conventions](./database-conventions.md) | [Security Practices](../01-SOP/security-practices.md) | [Testing Strategy](./testing-strategy.md) | [Architecture Overview](./architecture-overview.md)
