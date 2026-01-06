# Technical Architecture - Go + Tanstack Start

**Status:** 📋 In Progress
**Last Updated:** 2026-01-06
**Author:** Najib (Tech Lead)
**Related Beads Items:**
- hq-bl3.8: Go Backend Architecture Design
- hq-bl3.9: Tanstack Start Frontend Architecture
- hq-bl3.10: Database Schema Design
- hq-bl3.11: Cloud Storage Solution Design
- hq-bl3.12: Multi-Device Synchronization Design

## Executive Summary

Sesarra uses a modern, scalable architecture with **Go backend** for performance and **Tanstack Start frontend** for exceptional developer experience. This combination provides:
- Fast API responses (<200ms p50)
- Excellent SEO (server-side rendering)
- Type safety across the stack (TypeScript + Go)
- Cost-effective cloud storage (Cloudflare R2)

---

## Architecture Overview

```
┌─────────────────────────────────────────────────────────────┐
│                        CLIENTS                              │
│  ┌──────────┐  ┌──────────┐  ┌──────────┐  ┌──────────┐  │
│  │ Browser  │  │ Mobile   │  │  Vendor  │  │  Admin   │  │
│  │ (Tanstack│  │  (PWA)   │  │ Dashboard│  │  Panel   │  │
│  │  Start)  │  │          │  │          │  │          │  │
│  └────┬─────┘  └────┬─────┘  └────┬─────┘  └────┬─────┘  │
└───────┼────────────┼─────────────┼─────────────┼──────────┘
        │            │             │             │
        └────────────┴─────────────┴─────────────┘
                     │
              ┌──────▼──────┐
              │ Cloudflare  │
              │    CDN      │
              └──────┬──────┘
                     │
        ┌────────────┴────────────┐
        │                         │
   ┌────▼─────┐            ┌─────▼────┐
   │  Nginx   │            │  WebSocket│
   │ (Reverse │            │  Server   │
   │  Proxy)  │            │ (Real-time│
   └────┬─────┘            │  Sync)    │
        │                 └─────┬─────┘
        │                       │
   ┌────▼─────┐         ┌──────▼──────┐
   │   Go     │         │  PostgreSQL │
   │  Backend │◄────────┤   Database  │
   │ (Echo/   │         │  (Primary)  │
   │  Fiber)  │         └──────┬──────┘
   └────┬─────┘                │
        │              ┌───────▼───────┐
        │              │  PostgreSQL   │
        │              │  (Replica)    │
        │              └───────┬───────┘
        │                      │
   ┌────▼─────┐         ┌──────▼──────┐
   │  Redis   │         │ Cloudflare  │
   │  Cache   │         │     R2      │
   └──────────┘         │ (Object     │
                        │  Storage)   │
                        └─────────────┘
```

---

## Backend Architecture (Go)

### Framework Selection

**Recommended: Echo Framework**

**Rationale:**
- Lightweight and fast (minimal overhead)
- Excellent middleware support
- Built-in JSON validation
- Active community (good documentation)
- Easy to learn (Go beginners friendly)

**Alternative: Fiber Framework**
- Inspired by Express.js (if you're coming from Node.js)
- Slightly faster than Echo (benchmark: +5-10%)
- Less mature than Echo (smaller community)

**Decision:** Start with **Echo** for stability and ease of onboarding.

### Project Structure

**Standard Go Project Layout:**

```
sesarra/
├── cmd/
│   ├── api/
│   │   └── main.go           # API server entry point
│   ├── worker/
│   │   └── main.go           # Background jobs (email, reminders)
│   └── migrate/
│       └── main.go           # Database migration runner
├── internal/
│   ├── handler/              # HTTP handlers (controllers)
│   │   ├── auth.go
│   │   ├── checklist.go
│   │   ├── budget.go
│   │   ├── guest.go
│   │   ├── media.go
│   │   └── user.go
│   ├── service/              # Business logic layer
│   │   ├── auth_service.go
│   │   ├── checklist_service.go
│   │   ├── budget_service.go
│   │   ├── guest_service.go
│   │   ├── media_service.go
│   │   └── r2_service.go     # Cloudflare R2 integration
│   ├── repository/           # Data access layer
│   │   ├── checklist_repo.go
│   │   ├── budget_repo.go
│   │   ├── guest_repo.go
│   │   ├── media_repo.go
│   │   └── user_repo.go
│   ├── model/                # Data models
│   │   ├── user.go
│   │   ├── checklist.go
│   │   ├── budget.go
│   │   ├── guest.go
│   │   └── media.go
│   └── middleware/           # Echo middleware
│       ├── auth.go           # JWT authentication
│       ├── cors.go
│       └── logging.go
├── pkg/
│   ├── database/             # Database connection
│   │   └── postgres.go
│   ├── cache/                # Redis cache
│   │   └── redis.go
│   ├── storage/              # Cloudflare R2 client
│   │   └── r2.go
│   └── validation/           # Input validation
│       └── validator.go
├── migrations/               # SQL migration files
│   ├── 000001_init_schema.up.sql
│   ├── 000001_init_schema.down.sql
│   └── ...
├── scripts/                  # Utility scripts
│   ├── build.sh
│   └── deploy.sh
├── .env.example              # Environment variables template
├── go.mod
├── go.sum
└── README.md
```

### Key Backend Modules

#### 1. File Upload Service (Critical Path)

**Purpose:** Handle large file uploads (photos/videos) with resumable support.

**Implementation:**

```go
// internal/service/media_service.go
package service

type MediaService struct {
    r2Client    *storage.R2Client
    repo        repository.MediaRepository
    maxFileSize int64 // 50MB for photos, 5GB for videos
}

func (s *MediaService) UploadMedia(
    ctx context.Context,
    userID string,
    file io.Reader,
    filename string,
    mimeType string,
) (*model.Media, error) {
    // 1. Validate file size
    // 2. Validate MIME type
    // 3. Generate unique file path: couples/{userID}/{timestamp}_{filename}
    // 4. Upload to Cloudflare R2 using multipart upload
    // 5. Save metadata to PostgreSQL
    // 6. Return media object with URL
}
```

**Cloudflare R2 Integration:**

```go
// pkg/storage/r2.go
package storage

import (
    "github.com/aws/aws-sdk-go-v2/service/s3"
)

type R2Client struct {
    client *s3.Client
    bucket string
}

func (c *R2Client) Upload(
    ctx context.Context,
    key string,
    reader io.Reader,
) (string, error) {
    // Use S3-compatible SDK (R2 is S3-compatible)
    // Upload to R2
    // Return public URL: https://pub-{bucket}.r2.dev/{key}
}
```

**Performance Targets:**
- 10MB photo upload: <5 seconds on 10Mbps connection
- 1GB video upload: <5 minutes on 10Mbps connection
- Resumable upload support (retry on network failure)

#### 2. Real-Time Sync Service (Collaboration)

**Purpose:** Allow both partners to edit budget/checklist simultaneously.

**Implementation:**

```go
// internal/service/sync_service.go
package service

import (
    "github.com/gorilla/websocket"
)

type SyncService struct {
    hub *Hub
}

type Hub struct {
    clients    map[*Client]bool
    broadcast  chan []byte
    register   chan *Client
    unregister chan *Client
}

type Client struct {
    conn  *websocket.Conn
    userID string
    send  chan []byte
}

func (h *Hub) Run() {
    for {
        select {
        case client := <-h.register:
            h.clients[client] = true
        case client := <-h.unregister:
            delete(h.clients, client)
        case message := <-h.broadcast:
            // Broadcast to all clients in the same couple
        }
    }
}
```

**WebSocket Protocol:**

```json
// Client → Server (update budget)
{
  "type": "budget_update",
  "coupleId": "uuid",
  "data": {
    "vendorId": "uuid",
    "amount": 85000000
  }
}

// Server → Client (broadcast to partner)
{
  "type": "budget_updated",
  "data": {
    "vendorId": "uuid",
    "amount": 85000000,
    "updatedBy": "Sarah"
  }
}
```

#### 3. Budget Calculation Engine

**Purpose:** Aggregate budget data with accurate calculations.

**Implementation:**

```go
// internal/service/budget_service.go
package service

type BudgetService struct {
    repo repository.BudgetRepository
    cache *cache.RedisClient
}

func (s *BudgetService) GetBudgetSummary(
    ctx context.Context,
    coupleID string,
) (*model.BudgetSummary, error) {
    // 1. Check cache first (TTL: 5 minutes)
    cached, err := s.cache.Get(ctx, "budget:"+coupleID)
    if err == nil {
        return unmarshal(cached), nil
    }

    // 2. Query database
    categories, err := s.repo.ListCategories(ctx, coupleID)
    if err != nil {
        return nil, err
    }

    vendors, err := s.repo.ListVendors(ctx, coupleID)
    if err != nil {
        return nil, err
    }

    // 3. Calculate aggregates (accurate to 2 decimal places)
    summary := &model.BudgetSummary{
        TotalBudget:     sumCategoryAllocations(categories),
        TotalSpent:      sumVendorActuals(vendors),
        Remaining:       calculateRemaining(...),
        OverrunCategories: findOverruns(categories, vendors),
    }

    // 4. Cache result
    s.cache.Set(ctx, "budget:"+coupleID, marshal(summary), 5*time.Minute)

    return summary, nil
}
```

**Precision:** Use `decimal.Decimal` instead of `float64` for monetary values.

```go
import "github.com/shopspring/decimal"

type BudgetCategory struct {
    Allocated decimal.Decimal `db:"allocated_amount"`
    Spent     decimal.Decimal `db:"spent_amount"`
}
```

#### 4. Guest Management (Bulk Operations)

**Purpose:** Handle bulk guest list imports (500+ guests).

**Implementation:**

```go
// internal/service/guest_service.go
package service

func (s *GuestService) BulkImportGuests(
    ctx context.Context,
    coupleID string,
    guests []model.GuestImport,
) error {
    // 1. Start transaction
    tx, err := s.repo.BeginTx(ctx)
    if err != nil {
        return err
    }
    defer tx.Rollback()

    // 2. Batch insert (100 guests at a time)
    batchSize := 100
    for i := 0; i < len(guests); i += batchSize {
        end := min(i+batchSize, len(guests))
        batch := guests[i:end]

        if err := tx.InsertGuests(ctx, batch); err != nil {
            return err
        }
    }

    // 3. Commit transaction
    return tx.Commit()
}
```

### API Design (RESTful)

**Base URL:** `https://api.sesarra.com/v1`

**Authentication:** JWT Bearer Token

```
Authorization: Bearer {jwt_token}
```

**Endpoint Examples:**

```
# Authentication
POST   /auth/register
POST   /auth/login
POST   /auth/refresh
POST   /auth/logout

# Checklist
GET    /checklists                    # List all checklists
POST   /checklists                    # Create checklist
GET    /checklists/:id                # Get checklist details
PUT    /checklists/:id                # Update checklist
DELETE /checklists/:id                # Delete checklist
PATCH  /checklists/:id/complete       # Mark complete

# Budget
GET    /budget/categories             # List budget categories
POST   /budget/categories             # Create category
GET    /budget/vendors                # List vendors
POST   /budget/vendors                # Add vendor
GET    /budget/vendors/:id            # Get vendor details
PUT    /budget/vendors/:id            # Update vendor
POST   /budget/vendors/:id/payments   # Record payment

# Guests
GET    /guests                        # List all guests
POST   /guests/import                 # Bulk import
POST   /guests                        # Add guest
GET    /guests/:id                    # Get guest details
PUT    /guests/:id                    # Update guest RSVP
DELETE /guests/:id                    # Remove guest
GET    /guests/tables                 # List seating arrangement
POST   /guests/tables                 # Create table
PUT    /guests/seating                # Assign guests to tables

# Media
GET    /media/albums                  # List albums
POST   /media/albums                  # Create album
GET    /media/albums/:id              # Get album details
POST   /media/albums/:id/photos       # Upload photos
GET    /media/photos/:id              # Get photo URL
DELETE /media/photos/:id              # Delete photo
POST   /media/albums/:id/share        # Generate share link
```

**API Response Format:**

```json
{
  "success": true,
  "data": {
    "id": "uuid",
    "title": "Book venue for reception",
    "status": "in_progress"
  },
  "error": null,
  "meta": {
    "timestamp": "2026-01-06T10:00:00Z",
    "requestId": "req_123abc"
  }
}
```

**Error Response:**

```json
{
  "success": false,
  "data": null,
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "Invalid email format",
    "details": {
      "field": "email",
      "value": "not-an-email"
    }
  },
  "meta": {
    "timestamp": "2026-01-06T10:00:00Z",
    "requestId": "req_123abc"
  }
}
```

---

## Frontend Architecture (Tanstack Start)

### Framework Selection

**Tanstack Start** (formerly Tanstack Router)

**Rationale:**
- File-based routing (like Next.js) but better TypeScript inference
- Server-side rendering (SSR) for SEO (landing pages)
- Client-side routing for app (authenticated area)
- Smaller bundle size vs. Next.js
- Better DX (developer experience) with type-safe routes

**Decision:** Use **Tanstack Start** for modern, type-safe routing.

### Project Structure

```
frontend/
├── app/
│   ├── routes/                    # File-based routing
│   │   ├── __root.tsx            # Root layout
│   │   ├── index.tsx             # Landing page
│   │   ├── about.tsx             # About page
│   │   ├── pricing.tsx           # Pricing page
│   │   ├── auth/
│   │   │   ├── login.tsx         # Login page
│   │   │   └── register.tsx      # Register page
│   │   └── app/                  # Authenticated app area
│   │       ├── __root.tsx        # App layout (navbar, sidebar)
│   │       ├── dashboard.tsx     # Dashboard (checklist + budget)
│   │       ├── checklist.tsx     # Checklist feature
│   │       ├── budget.tsx        # Budget planner
│   │       ├── guests.tsx        # Guest management
│   │       ├── photos.tsx        # Photo gallery
│   │       └── settings.tsx      # User settings
│   └── services/                  # API client services
│       ├── api.ts                # Axios/fetch wrapper
│       ├── auth.service.ts
│       ├── checklist.service.ts
│       ├── budget.service.ts
│       ├── guest.service.ts
│       └── media.service.ts
├── components/                    # Reusable components
│   ├── ui/                       # Shadcn/ui components
│   │   ├── button.tsx
│   │   ├── input.tsx
│   │   ├── dialog.tsx
│   │   └── ...
│   ├── checklist/
│   │   ├── ChecklistItem.tsx
│   │   ├── CheckListTable.tsx
│   │   └── CategoryFilter.tsx
│   ├── budget/
│   │   ├── BudgetCard.tsx
│   │   ├── ProgressBar.tsx
│   │   └── VendorForm.tsx
│   ├── guests/
│   │   ├── GuestTable.tsx
│   │   ├── SeatingChart.tsx
│   │   └── RSVPBadge.tsx
│   └── media/
│       ├── PhotoGrid.tsx
│       ├── AlbumCard.tsx
│       └── UploadModal.tsx
├── lib/                          # Utilities
│   ├── api-client.ts             # HTTP client (axios/fetch)
│   ├── auth.ts                   # Auth utilities (JWT storage)
│   └── validation.ts             # Zod schemas
├── styles/                       # Global styles
│   └── globals.css               # Tailwind CSS imports
├── package.json
├── tsconfig.json
├── vite.config.ts
├── tailwind.config.js
└── README.md
```

### Key Frontend Features

#### 1. File Upload with Progress

**Implementation:**

```tsx
// components/media/UploadModal.tsx
import { useMutation } from '@tanstack/react-query';

export function UploadModal() {
  const uploadMutation = useMutation({
    mutationFn: async (files: File[]) => {
      const formData = new FormData();
      files.forEach(file => formData.append('photos', file));

      const response = await fetch('/api/v1/media/upload', {
        method: 'POST',
        body: formData,
        // Track upload progress
        // @ts-ignore
        onUploadProgress: (progressEvent) => {
          const percentCompleted = Math.round(
            (progressEvent.loaded * 100) / progressEvent.total
          );
          setProgress(percentCompleted);
        },
      });

      return response.json();
    },
  });

  return (
    <div>
      <input
        type="file"
        multiple
        accept="image/*,video/*"
        onChange={(e) => {
          const files = Array.from(e.target.files || []);
          uploadMutation.mutate(files);
        }}
      />
      {uploadMutation.isPending && (
        <ProgressBar progress={progress} />
      )}
    </div>
  );
}
```

#### 2. Real-Time Budget Updates

**Implementation (WebSocket + Tanstack Query):**

```tsx
// components/budget/BudgetDashboard.tsx
import { useQuery, useQueryClient } from '@tanstack/react-query';
import { useEffect } from 'react';
import { useWebSocket } from '@/hooks/useWebSocket';

export function BudgetDashboard() {
  const queryClient = useQueryClient();
  const { data: budget } = useQuery({
    queryKey: ['budget', 'summary'],
    queryFn: () => fetch('/api/v1/budget/summary').then(r => r.json()),
  });

  // Subscribe to WebSocket updates
  useWebSocket('ws://api.sesarra.com/v1/sync', {
    onMessage: (event) => {
      const message = JSON.parse(event.data);
      if (message.type === 'budget_updated') {
        // Invalidate cache to trigger refetch
        queryClient.invalidateQueries(['budget', 'summary']);
      }
    },
  });

  return (
    <div>
      <h1>Budget: {budget?.totalSpent}</h1>
      <ProgressBar value={budget?.spentPercent} />
    </div>
  );
}
```

#### 3. Mobile-Responsive Design

**Tailwind CSS Breakpoints:**

```tsx
// components/checklist/ChecklistTable.tsx
export function ChecklistTable() {
  return (
    <div className="grid gap-4
                md:grid-cols-2
                lg:grid-cols-3">
      {/* Mobile: 1 column */}
      {/* Tablet: 2 columns */}
      {/* Desktop: 3 columns */}
      {checklists.map(item => (
        <ChecklistCard key={item.id} item={item} />
      ))}
    </div>
  );
}
```

**PWA Support:**

```tsx
// app/routes/__root.tsx
export function Layout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="en">
      <head>
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="manifest" href="/manifest.json" />
      </head>
      <body>{children}</body>
    </html>
  );
}
```

**manifest.json:**
```json
{
  "name": "Sesarra - Wedding Planning",
  "short_name": "Sesarra",
  "start_url": "/",
  "display": "standalone",
  "background_color": "#ffffff",
  "theme_color": "#f472b6",
  "icons": [
    {
      "src": "/icon-192.png",
      "sizes": "192x192",
      "type": "image/png"
    },
    {
      "src": "/icon-512.png",
      "sizes": "512x512",
      "type": "image/png"
    }
  ]
}
```

---

## Database Schema (PostgreSQL)

### Schema Design

```sql
-- Users & Authentication
CREATE TABLE users (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    full_name VARCHAR(255) NOT NULL,
    role VARCHAR(20) NOT NULL DEFAULT 'couple', -- couple, family, vendor, admin
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

CREATE INDEX idx_users_email ON users(email);

-- Couples (wedding accounts)
CREATE TABLE couples (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id_1 UUID REFERENCES users(id) NOT NULL,
    user_id_2 UUID REFERENCES users(id), -- Optional (some couples don't both have accounts)
    wedding_date DATE NOT NULL,
    wedding_theme VARCHAR(100),
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

CREATE INDEX idx_couples_user1 ON couples(user_id_1);
CREATE INDEX idx_couples_user2 ON couples(user_id_2);
CREATE INDEX idx_couples_wedding_date ON couples(wedding_date);

-- Checklist & Timeline
CREATE TABLE checklist_templates (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(255) NOT NULL,
    timeline_months INTEGER NOT NULL,
    tasks JSONB NOT NULL, -- Array of task objects
    is_custom BOOLEAN DEFAULT false,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE checklists (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    couple_id UUID REFERENCES couples(id) NOT NULL,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    category VARCHAR(100),
    due_date DATE,
    status VARCHAR(20) NOT NULL DEFAULT 'not_started', -- not_started, in_progress, completed
    priority VARCHAR(20) NOT NULL DEFAULT 'medium', -- low, medium, high, critical
    assigned_to UUID REFERENCES users(id),
    completed_at TIMESTAMP,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

CREATE INDEX idx_checklists_couple ON checklists(couple_id);
CREATE INDEX idx_checklists_status ON checklists(status);
CREATE INDEX idx_checklists_due_date ON checklists(due_date);

-- Budget Planner
CREATE TABLE budget_categories (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    couple_id UUID REFERENCES couples(id) NOT NULL,
    name VARCHAR(255) NOT NULL,
    allocated_amount DECIMAL(15,2) NOT NULL,
    spent_amount DECIMAL(15,2) DEFAULT 0,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE vendors (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    couple_id UUID REFERENCES couples(id) NOT NULL,
    category_id UUID REFERENCES budget_categories(id),
    name VARCHAR(255) NOT NULL,
    contact_phone VARCHAR(50),
    contact_email VARCHAR(255),
    address TEXT,
    estimated_cost DECIMAL(15,2),
    actual_cost DECIMAL(15,2),
    notes TEXT,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE payments (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    vendor_id UUID REFERENCES vendors(id) NOT NULL,
    amount DECIMAL(15,2) NOT NULL,
    payment_type VARCHAR(50) NOT NULL, -- DP, pelunasan, progress
    payment_method VARCHAR(50), -- transfer, cash, midtrans
    payment_date DATE,
    status VARCHAR(20) NOT NULL DEFAULT 'pending', -- pending, paid, overdue
    receipt_url TEXT, -- Cloudflare R2 URL
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE INDEX idx_vendors_couple ON vendors(couple_id);
CREATE INDEX idx_payments_vendor ON payments(vendor_id);
CREATE INDEX idx_payments_status ON payments(status);

-- Guest Management
CREATE TABLE guests (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    couple_id UUID REFERENCES couples(id) NOT NULL,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    phone VARCHAR(50),
    category VARCHAR(50), -- family, friend, colleague
    side VARCHAR(20), -- bride, groom
    rsvp_status VARCHAR(20) NOT NULL DEFAULT 'pending', -- pending, coming, not_coming, maybe
    dietary_requirements TEXT,
    table_id UUID, -- Foreign key to guest_tables (set later)
    plus_one INTEGER DEFAULT 0,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE guest_tables (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    couple_id UUID REFERENCES couples(id) NOT NULL,
    table_number VARCHAR(50) NOT NULL,
    capacity INTEGER NOT NULL,
    table_type VARCHAR(20), -- round_8, rectangular_10, custom
    position_x INTEGER,
    position_y INTEGER,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE seating_arrangements (
    guest_id UUID REFERENCES guests(id),
    table_id UUID REFERENCES guest_tables(id),
    seat_number INTEGER,
    PRIMARY KEY (guest_id, table_id)
);

CREATE INDEX idx_guests_couple ON guests(couple_id);
CREATE INDEX idx_guests_rsvp ON guests(rsvp_status);
CREATE INDEX idx_guests_table ON guests(table_id);

-- Cloud Storage (Media)
CREATE TABLE albums (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    couple_id UUID REFERENCES couples(id) NOT NULL,
    title VARCHAR(255) NOT NULL,
    event_type VARCHAR(50), -- lamaran, akad, resepsi, custom
    is_public BOOLEAN DEFAULT false,
    password_protected BOOLEAN DEFAULT false,
    access_password VARCHAR(255),
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE media (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    album_id UUID REFERENCES albums(id) NOT NULL,
    file_url TEXT NOT NULL, -- Cloudflare R2 URL
    file_name VARCHAR(500) NOT NULL,
    file_size BIGINT NOT NULL,
    mime_type VARCHAR(100) NOT NULL,
    width INTEGER, -- For photos
    height INTEGER, -- For photos
    duration INTEGER, -- For videos (seconds)
    uploaded_by UUID REFERENCES users(id),
    description TEXT,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE shared_album_access (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    album_id UUID REFERENCES albums(id) NOT NULL,
    email VARCHAR(255),
    access_token VARCHAR(255),
    can_download BOOLEAN DEFAULT true,
    can_upload BOOLEAN DEFAULT false,
    expires_at TIMESTAMP,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE INDEX idx_media_album ON media(album_id);
CREATE INDEX idx_media_uploaded_by ON media(uploaded_by);

-- Notifications
CREATE TABLE notifications (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID REFERENCES users(id) NOT NULL,
    type VARCHAR(50) NOT NULL, -- rsvp_reminder, budget_alert, deadline_reminder
    message TEXT NOT NULL,
    is_read BOOLEAN DEFAULT false,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE INDEX idx_notifications_user ON notifications(user_id);
CREATE INDEX idx_notifications_read ON notifications(is_read);
```

### Migration Strategy

**Tool:** golang-migrate

**Migration Files:**

```
migrations/
├── 000001_init_schema.up.sql
├── 000001_init_schema.down.sql
├── 000002_add_checklist_templates.up.sql
├── 000002_add_checklist_templates.down.sql
└── ...
```

**Run Migrations:**

```bash
# Up
go run cmd/migrate/main.go up

# Down
go run cmd/migrate/main.go down

# Force version (for development)
go run cmd/migrate/main.go force 000002
```

---

## Cloud Storage Solution (Cloudflare R2)

### Why Cloudflare R2?

| Feature | Cloudflare R2 | AWS S3 | Oracle Cloud |
|---------|---------------|--------|--------------|
| Storage Cost | $0.015/GB/month | $0.023/GB/month | $0.0255/GB/month |
| **Egress Cost** | **FREE** | $0.09/GB | $0.0085-0.025/GB |
| CDN Integration | Built-in (Cloudflare CDN) | CloudFront ($$$) | Separate setup |
| S3 Compatible | ✅ Yes | N/A | ❌ No |

**Winner:** **Cloudflare R2** (zero egress fees = massive cost savings for photo delivery)

### R2 Configuration

**Bucket Setup:**

```bash
# Create bucket
wrangler r2 bucket create sesarra-media

# List buckets
wrangler r2 bucket list

# Upload test file
wrangler r2 object put sesarra-media/test.jpg --file=test.jpg
```

**Go SDK Integration:**

```go
// pkg/storage/r2.go
package storage

import (
    "context"
    "github.com/aws/aws-sdk-go-v2/config"
    "github.com/aws/aws-sdk-go-v2/service/s3"
)

type R2Config struct {
    AccountID   string
    AccessKey   string
    SecretKey   string
    Bucket      string
}

func NewR2Client(cfg R2Config) (*s3.Client, error) {
    cfg, err := config.LoadDefaultConfig(context.TODO(),
        config.WithRegion("auto"),
        config.WithCredentialsProvider(
            credentials.NewStaticCredentialsProvider(
                cfg.AccessKey,
                cfg.SecretKey,
                "",
            ),
        ),
    )
    if err != nil {
        return nil, err
    }

    return s3.NewFromConfig(cfg, func(o *s3.Options) {
        o.BaseEndpoint = aws.String(
            "https://" + cfg.AccountID + ".r2.cloudflarestorage.com",
        )
    }), nil
}
```

**File Organization:**

```
sesarra-media/
├── couples/
│   ├── {couple_id}/
│   │   ├── lamaran/
│   │   │   ├── photo_1.jpg
│   │   │   └── photo_2.jpg
│   │   ├── akad/
│   │   └── resepsi/
└── vendors/
    └── {vendor_id}/
        └── profile.jpg
```

---

## Multi-Device Synchronization

### Sync Strategy: Last-Write-Wins

**Conflict Resolution:**
1. Each update includes server timestamp
2. Client with latest timestamp wins
3. For conflicts (simultaneous edits), prompt user to choose

**Real-Time Sync (WebSocket):**

```
┌────────────────┐                    ┌────────────────┐
│   Partner A    │                    │   Partner B    │
│  (Laptop)      │                    │  (Mobile App)  │
└────────┬───────┘                    └────────┬───────┘
         │                                     │
         │ 1. Edit budget item                 │
         │    {vendorId: "123", amount: 80M}  │
         ├────────────────────────────────────>│
         │                                     │
         │ 2. Broadcast via WebSocket          │
         │<────────────────────────────────────┤
         │                                     │
         │ 3. Receive update                   │
         │    Re-render budget chart           │
         │                                     │
```

**Offline Support (PWA):**

```tsx
// Service Worker (sw.ts)
self.addEventListener('fetch', (event) => {
  // Cache-first strategy for static assets
  if (event.request.url.includes('/api/')) {
    // Network-first strategy for API calls
    event.respondWith(
      fetch(event.request)
        .then(response => {
          // Cache response
          caches.open('api-cache').then(cache => {
            cache.put(event.request, response.clone());
          });
          return response;
        })
        .catch(() => {
          // Fallback to cache if offline
          return caches.match(event.request);
        })
    );
  }
});
```

---

## Performance & Monitoring

### Performance Targets

| Metric | Target | Measurement |
|--------|--------|-------------|
| API Response Time (p50) | <200ms | Server logs |
| API Response Time (p99) | <1s | Server logs |
| Photo Upload Speed (10MB) | <5s | Client timing |
| Page Load Time (LCP) | <2.5s | Lighthouse |
| Mobile Lighthouse Score | >90 | Lighthouse |

### Monitoring Tools

1. **Application Performance:** Sentry (error tracking)
2. **Uptime Monitoring:** Cloudflare Analytics + custom health checks
3. **Business Metrics:** Custom dashboard with Metabase
4. **User Behavior:** Google Analytics 4 + custom events

---

## Security Considerations

### Authentication

- **JWT-based auth** with access tokens (15 min) + refresh tokens (30 days)
- **Password hashing** with bcrypt (cost factor 12)
- **HTTPS-only** (Cloudflare SSL)

### Authorization

- **Role-based access control (RBAC)**: Couple, Family, Vendor, Admin
- **Couple isolation**: Users can only access their own data
- **API rate limiting**: 100 req/min per user (prevent abuse)

### Data Protection

- **Input validation**: Zod schemas on frontend, Go validation on backend
- **SQL injection prevention**: Parameterized queries (no raw SQL)
- **XSS prevention**: React auto-escapes, Content-Security-Policy headers
- **File upload validation**: Virus scanning, MIME type checking, size limits

### Privacy

- **GDPR compliance**: Right to data export, right to deletion
- **Data retention**: Photos stored "forever" unless account deleted
- **Privacy settings**: Granular controls for shared albums

---

## Deployment Architecture

### Environments

| Environment | Purpose | URL |
|-------------|---------|-----|
| Development | Local development | localhost:3000 |
| Staging | Pre-production testing | staging.sesarra.com |
| Production | Live site | sesarra.com |

### Deployment Process

**Continuous Deployment (Coolify):**

```
GitHub Push (main branch)
    ↓
Coolify Auto-Deploy
    ↓
Docker Build → Test → Deploy
    ↓
Health Checks (Go live if all pass)
```

**Dockerfile:**

```dockerfile
# Backend (Go)
FROM golang:1.21-alpine AS builder
WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download
COPY . .
RUN CGO_ENABLED=0 go build -o sesarra-api cmd/api/main.go

FROM alpine:latest
RUN apk --no-cache add ca-certificates
WORKDIR /root/
COPY --from=builder /app/sesarra-api .
CMD ["./sesarra-api"]
```

**docker-compose.yml:**

```yaml
version: '3.8'
services:
  api:
    build: .
    ports:
      - "3000:3000"
    environment:
      - DB_HOST=postgres
      - DB_PORT=5432
      - DB_NAME=sesarra
      - DB_USER=postgres
      - DB_PASSWORD=secret
    depends_on:
      - postgres
      - redis

  postgres:
    image: postgres:15-alpine
    environment:
      - POSTGRES_DB=sesarra
      - POSTGRES_USER=postgres
      - POSTGRES_PASSWORD=secret
    volumes:
      - postgres_data:/var/lib/postgresql/data

  redis:
    image: redis:7-alpine
    ports:
      - "6379:6379"

volumes:
  postgres_data:
```

---

## Next Steps

1. ✅ Complete tech architecture document (this document)
2. ⏳ Set up Go project structure (follow layout above)
3. ⏳ Set up Tanstack Start frontend project
4. ⏳ Implement PoC: File upload + budget calculator (2 weeks)
5. ⏳ Test PoC performance (benchmarks)
6. ⏳ Iterate based on results

---

**Last Updated:** 2026-01-06
**Version:** 0.1.0-draft
**Next Review:** After PoC implementation (2 weeks)
