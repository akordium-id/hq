# 🛠️ DukunGPS - Technical Architecture & Tech Stack

> **Last Updated:** 2026-01-06
> **Related Bead:** [hq-4kb.10](https://github.com/akordium/hq/issues/4kb.10) - Tech Stack Validation

---

## 📋 Technology Choices Overview

### Why This Stack?

**Backend (Go + Fiber):**
- **Performance:** High throughput for 10k+ concurrent WebSocket connections
- **Concurrency:** Goroutines perfect for real-time GPS data processing
- **Type Safety:** Catch errors at compile time, critical for infrastructure code
- **Deployment:** Single binary, easy deployment with Coolify

**Frontend (SvelteKit):**
- **Performance:** Smallest bundle size, fastest load times
- **Developer Experience:** Excellent DX, TypeScript-first
- **Reactivity:** Built-in reactivity perfect for real-time dashboard updates
- **Mobile:** Responsive design works well, PWA option for driver app

**Database (PostgreSQL + TimescaleDB):**
- **Time-Series:** TimescaleDB extension optimized for GPS trajectory data
- **Reliability:** Battle-tested, ACID compliant
- **Ecosystem:** Rich tooling, ORMs, monitoring tools
- **Cost:** Open-source, no licensing fees

---

## 🔧 Backend Architecture

### Tech Stack

**Language & Framework:**
- **Go 1.21+** - Primary backend language
- **Fiber v2** - High-performance HTTP framework (inspired by Express.js)
- **WebSocket** - Native Fiber WebSocket handler for real-time updates

**Key Dependencies:**
```go
// Web Framework
github.com/gofiber/fiber/v2

// Database
github.com/lib/pq                    // PostgreSQL driver
github.com/uptrace/bun               // ORM
github.com/uptrace/bun/dbutil/pgdriver
github.com/timescale/promscale       // TimescaleDB client

// Real-time
github.com/gofiber/websocket/v2      // WebSocket support

// Authentication
github.com/golang-jwt/jwt/v5         // JWT tokens
golang.org/x/crypto/bcrypt           // Password hashing

// Task Queue
github.com/hibiken/asynq             // Redis-based task queue

// Validation
github.com/go-playground/validator/v10

// Logging
go.uber.org/zap                      // Structured logging

// Configuration
github.com/spf13/viper               // Config management
```

### Architecture Pattern

**Layered Architecture:**
```
┌─────────────────────────────────────────────────────────┐
│                     Client Layer                        │
│  (Web Dashboard, Driver PWA, Mobile Apps, API Clients)  │
└────────────────────┬────────────────────────────────────┘
                     │ HTTP/WebSocket
┌────────────────────▼────────────────────────────────────┐
│                  API Gateway Layer                      │
│  (Rate Limiting, CORS, JWT Auth, Request Validation)    │
└────────────────────┬────────────────────────────────────┘
                     │
┌────────────────────▼────────────────────────────────────┐
│                 Service Layer                           │
│  (Business Logic, GPS Processing, Alert Engine, AI)     │
└─────┬──────┬──────┬──────┬──────┬───────────────┬──────┘
      │      │      │      │      │               │
      ▼      ▼      ▼      ▼      ▼               ▼
  Tracking  Fleet  Geofence  Alert  Analytics  AI/ML
  Service  Service Service Service Service   Service
      │      │      │      │      │               │
      └──────┴──────┴──────┴──────┴───────┬───────┘
                                        │
┌───────────────────────────────────────▼──────────────────┐
│                  Data Access Layer                      │
│         (Repository Pattern, Query Builders)             │
└────────────────────┬─────────────────────────────────────┘
                     │
┌────────────────────▼─────────────────────────────────────┐
│                Infrastructure Layer                      │
│  (PostgreSQL, TimescaleDB, Redis, S3, External APIs)     │
└──────────────────────────────────────────────────────────┘
```

### Key Services

**1. Tracking Service** (`internal/tracking`)
- **Responsibility:** Ingest GPS data from devices, store in TimescaleDB
- **Endpoints:**
  - `POST /api/v1/gps` - Receive GPS data from device
  - `GET /api/v1/devices/:id/location` - Get latest location
  - `GET /api/v1/devices/:id/history` - Get location history
- **Performance:** Handle 10k+ concurrent WebSocket connections
- **Optimization:** Batch inserts for GPS points (100 points/batch)

**2. Fleet Service** (`internal/fleet`)
- **Responsibility:** Multi-tenant fleet hierarchy management
- **Endpoints:**
  - `GET /api/v1/fleets` - List fleets
  - `POST /api/v1/fleets` - Create fleet
  - `PUT /api/v1/fleets/:id` - Update fleet
- **Models:** Company → Fleet → Vehicle hierarchy
- **Authorization:** Role-based access (Owner, Manager, Dispatcher, Driver)

**3. Geofence Service** (`internal/geofence`)
- **Responsibility:** Geofence zone management & violation detection
- **Endpoints:**
  - `GET /api/v1/geofences` - List geofences
  - `POST /api/v1/geofences` - Create geofence (circular or polygon)
  - `DELETE /api/v1/geofences/:id` - Delete geofence
- **Algorithms:**
  - Circular zones: Distance calculation (Haversine formula)
  - Polygon zones: Point-in-polygon (ray casting algorithm)
- **Performance:** R-tree indexing for fast spatial queries

**4. Alert Service** (`internal/alert`)
- **Responsibility:** Real-time alert generation & delivery
- **Endpoints:**
  - `GET /api/v1/alerts` - List alerts
  - `POST /api/v1/alerts/:id/ack` - Acknowledge alert
- **Alert Types:** Speed, harsh braking, geofence, device offline
- **Delivery:** WebSocket push, email (SendGrid), WhatsApp (API), FCM
- **Throttling:** Max 10 alerts/hour/vehicle (configurable)

**5. Analytics Service** (`internal/analytics`)
- **Responsibility:** Historical reports, driver behavior scores
- **Endpoints:**
  - `GET /api/v1/analytics/trips` - Trip reports
  - `GET /api/v1/analytics/driver-behavior` - Driver scorecard
  - `GET /api/v1/analytics/fuel-estimation` - Fuel consumption
- **Performance:** Materialized views for common queries
- **Caching:** Redis for frequently accessed reports

**6. AI/ML Service** (`internal/ai`)
- **Responsibility:** Traffic prediction, route optimization
- **Endpoints:**
  - `POST /api/v1/ai/predict-route` - Predict optimal route
  - `GET /api/v1/ai/eta` - Estimated arrival time
- **Models:**
  - **MVP:** Google Maps API (Directions API with traffic)
  - **Phase 2:** Custom ML model (TensorFlow Lite) trained on historical GPS data
- **Data Sources:** Google Maps Traffic API, OpenStreetMap, historical GPS logs

---

## 🎨 Frontend Architecture

### Tech Stack

**Framework & Libraries:**
- **SvelteKit 2** - Meta-framework for Svelte 5
- **Svelte 5** - UI framework with runes-based reactivity
- **TypeScript 5** - Type safety (strict mode)
- **Tailwind CSS 3** - Utility-first styling
- **Skeleton UI** - Svelte component library (shadcn-svelte inspired)
- **Leaflet.js** - Map visualization (OpenStreetMap)
- **Chart.js** - Analytics charts
- **Svelte WebSocket Client** - Real-time connection to backend

**Key Dependencies:**
```json
{
  "dependencies": {
    "svelte": "^4.2.0",
    "@sveltejs/kit": "^2.0.0",
    "leaflet": "^1.9.4",
    "chart.js": "^4.4.0",
    "socket.io-client": "^2.5.0"
  }
}
```

### Architecture Pattern

**SvelteKit Structure:**
```
src/
├── routes/                    # File-based routing
│   ├── (app)/                # App layout group
│   │   ├── dashboard/        # Dashboard pages
│   │   ├── fleets/           # Fleet management
│   │   ├── vehicles/         # Vehicle management
│   │   ├── geofences/        # Geofence management
│   │   ├── alerts/           # Alert history
│   │   └── analytics/        # Analytics & reports
│   ├── auth/                 # Authentication
│   └── api/                  # API routes (server-side)
├── lib/
│   ├── components/           # Reusable components
│   │   ├── map/              # Map components (Leaflet)
│   │   ├── charts/           # Chart components
│   │   ├── tables/           # Data tables
│   │   └── forms/            # Form components
│   ├── stores/               # Svelte stores (state)
│   │   ├── vehicle.ts        # Vehicle state
│   │   ├── gps.ts            # GPS data state
│   │   └── auth.ts           # Auth state
│   ├── services/             # API clients
│   │   ├── api.ts            # Base API client
│   │   ├── gps.ts            # GPS service
│   │   └── websocket.ts      # WebSocket client
│   └── utils/                # Utilities
│       ├── formatters.ts     # Date, number formatters
│       └── validators.ts     # Input validators
└── app.html                  # Root layout
```

### State Management

**Svelte Stores (Reactive State):**
```typescript
// vehicle.ts - Vehicle data store
import { writable } from 'svelte/store';

export const vehicles = writable<Vehicle[]>([]);
export const selectedVehicle = writable<Vehicle | null>(null);
export const vehicleLocations = writable<Map<string, GPSPoint>>(new Map());

// gps.ts - Real-time GPS data
export const liveGPS = writable<Record<string, GPSPoint>>({});
export const gpsHistory = writable<Map<string, GPSPoint[]>>(new Map());

// websocket.ts - WebSocket connection
export const wsConnected = writable(false);
export const wsError = writable<string | null>(null);
```

### Real-time Updates

**WebSocket Integration:**
```typescript
// services/websocket.ts
import { wsConnected, liveGPS } from '$lib/stores/gps';

export function connectWebSocket(token: string) {
  const ws = new WebSocket(`wss://dukungps.com/ws?token=${token}`);

  ws.onopen = () => {
    wsConnected.set(true);
  };

  ws.onmessage = (event) => {
    const data = JSON.parse(event.data);
    if (data.type === 'gps_update') {
      liveGPS.update((current) => ({
        ...current,
        [data.deviceId]: data.point
      }));
    }
  };

  return ws;
}
```

### Map Visualization

**Leaflet Integration:**
```svelte
<!-- components/map/VehicleMap.svelte -->
<script lang="ts">
  import { onMount } from 'svelte';
  import L from 'leaflet';
  import { vehicles, liveGPS } from '$lib/stores/gps';

  let map: L.Map;
  let markers: Map<string, L.Marker> = new Map();

  onMount(() => {
    map = L.map('map').setView([-6.2088, 106.8456], 12); // Jakarta

    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
      attribution: '© OpenStreetMap'
    }).addTo(map);

    // Subscribe to live GPS updates
    liveGPS.subscribe((gps) => {
      Object.entries(gps).forEach(([deviceId, point]) => {
        updateMarker(deviceId, point);
      });
    });
  });

  function updateMarker(deviceId: string, point: GPSPoint) {
    if (!markers.has(deviceId)) {
      const marker = L.marker([point.lat, point.lng]).addTo(map);
      markers.set(deviceId, marker);
    } else {
      markers.get(deviceId)!.setLatLng([point.lat, point.lng]);
    }
  }
</script>

<div bind:this={map} id="map" class="h-full w-full"></div>
```

---

## 🗄️ Database Architecture

### PostgreSQL + TimescaleDB

**Why TimescaleDB?**
- **Time-Series Optimization:** Automatic partitioning by time
- **Query Performance:** 10-100x faster for time-range queries
- **Compression:** 90% storage savings for GPS data
- **PostgreSQL Compatible:** All Postgres features available

### Database Schema

**Core Tables:**

```sql
-- Companies (multi-tenant)
CREATE TABLE companies (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name TEXT NOT NULL,
  plan TEXT NOT NULL, -- 'starter', 'business', 'enterprise'
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Fleets (hierarchical)
CREATE TABLE fleets (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  company_id UUID NOT NULL REFERENCES companies(id),
  name TEXT NOT NULL,
  parent_fleet_id UUID REFERENCES fleets(id), -- Hierarchical fleets
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Vehicles (assets being tracked)
CREATE TABLE vehicles (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  fleet_id UUID NOT NULL REFERENCES fleets(id),
  name TEXT NOT NULL,
  device_id TEXT UNIQUE NOT NULL, -- Hardware device identifier
  vehicle_type TEXT, -- 'car', 'motorcycle', 'truck'
  license_plate TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- GPS Data (TimescaleDB hypertable)
CREATE TABLE gps_points (
  time TIMESTAMPTZ NOT NULL,
  device_id TEXT NOT NULL,
  latitude DOUBLE PRECISION NOT NULL,
  longitude DOUBLE PRECISION NOT NULL,
  speed DOUBLE PRECISION, -- km/h
  heading DOUBLE PRECISION, -- degrees
  altitude DOUBLE PRECISION, -- meters
  accuracy DOUBLE PRECISION, -- meters
  satellite_count INTEGER,
  battery_level INTEGER, -- 0-100
  status TEXT -- 'moving', 'idle', 'offline'
);

-- Convert to hypertable (partition by time)
SELECT create_hypertable('gps_points', 'time');

-- Create indexes for performance
CREATE INDEX idx_gps_device_time ON gps_points (device_id, time DESC);
CREATE INDEX idx_gps_location ON gps_points USING GiST (point(latitude, longitude));

-- Geofences (spatial data)
CREATE EXTENSION IF NOT EXISTS postgis;

CREATE TABLE geofences (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  fleet_id UUID NOT NULL REFERENCES fleets(id),
  name TEXT NOT NULL,
  type TEXT NOT NULL, -- 'circular', 'polygon'
  coordinates JSONB NOT NULL, -- GeoJSON or {radius, center}
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX idx_geofence_fleet ON geofences (fleet_id);
CREATE INDEX idx_geofence_spatial ON geofences USING GiST (coordinates);

-- Alerts
CREATE TABLE alerts (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  vehicle_id UUID NOT NULL REFERENCES vehicles(id),
  type TEXT NOT NULL, -- 'speed', 'geofence', 'braking', 'offline'
  severity TEXT NOT NULL, -- 'info', 'warning', 'critical'
  message TEXT NOT NULL,
  acknowledged BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX idx_alerts_vehicle_time ON alerts (vehicle_id, created_at DESC);
CREATE INDEX idx_alerts_unacknowledged ON alerts (acknowledged) WHERE acknowledged = FALSE;
```

### Data Retention Policy

**Automatic Cleanup (TimescaleDB):**
```sql
-- Drop data older than 90 days
SELECT add_retention_policy('gps_points', INTERVAL '90 days');

-- Drop older data to cheaper storage (optional)
SELECT add_compression_policy('gps_points', INTERVAL '7 days');
```

### Query Performance

**Optimized Queries:**
```sql
-- Get vehicle path for last 24 hours (uses time partition)
SELECT time, latitude, longitude, speed
FROM gps_points
WHERE device_id = 'ABC123'
  AND time > NOW() - INTERVAL '24 hours'
ORDER BY time DESC;

-- Check geofence violation (uses spatial index)
SELECT COUNT(*)
FROM gps_points gp
JOIN geofences gf ON gf.fleet_id = (
  SELECT fleet_id FROM vehicles WHERE device_id = gp.device_id
)
WHERE ST_Contains(
  ST_GeomFromGeoJSON(gf.coordinates),
  ST_SetSRID(ST_MakePoint(gp.longitude, gp.latitude), 4326)
)
AND gp.time > NOW() - INTERVAL '1 hour';
```

---

## 📡 Real-time Communication

### WebSocket Architecture

**Connection Flow:**
```
Client (SvelteKit)          Backend (Go/Fiber)
     │                            │
     ├─── 1. Connect ───────────→│
     │     ws://dukungps.com/ws    │
     │     ?token=JWT              │
     │                            │
     ├─── 2. Auth ───────────────→│
     │                            ├─ Validate JWT
     │                            ├─ Create connection
     │                            │
     │←── 3. Connected ────────────┤
     │                            │
     │←── 4. GPS Updates ──────────┤
     │     (every 30-60 sec)        │
     │     {type: "gps_update",     │
     │      deviceId: "ABC123",     │
     │      point: {...}}           │
     │                            │
     ├─── 5. Commands ───────────→│
     │     {action: "refresh",      │
     │      vehicleId: "xyz"}       │
     │                            │
```

**Scalability:**
- **Go Routine per Connection:** Lightweight, ~2KB per connection
- **Connection Pooling:** 10k+ concurrent connections on single server
- **Redis Pub/Sub:** Horizontal scaling (multiple backend servers)
- **Load Balancer:** Cloudflare + WebSocket passthrough

---

## 🤖 AI/ML Architecture

### Phase 1 (MVP): Google Maps API

**Traffic Prediction:**
```go
// internal/ai/traffic.go
func GetOptimalRoute(origin, dest LatLng) (Route, error) {
    // Call Google Maps Directions API
    resp, err := http.Get(fmt.Sprintf(
        "https://maps.googleapis.com/maps/api/directions/json?origin=%s&destination=%s&departure_time=now&traffic_model=best_guess&key=%s",
        origin.String(), dest.String(), config.GoogleMapsAPIKey,
    ))

    // Parse response, extract route with traffic
    var result DirectionsResponse
    json.NewDecoder(resp.Body).Decode(&result)

    return result.Routes[0], nil
}
```

### Phase 2: Custom ML Model

**Architecture:**
```
GPS Data Collection → Training Pipeline → Model Serving
        │                     │                  │
    TimescaleDB          Python Script        Go Inference
        │                  (TensorFlow)      (ONNX Runtime)
        │                     │                  │
        └─────> Historical Patterns ──> Trained Model ──> Predictions
```

**Model Training (Python):**
```python
# training/train_route_model.py
import tensorflow as tf
from timescaledb import fetch_historical_gps

# Fetch training data
data = fetch_historical_gps(days=90)

# Feature engineering
X = prepare_features(data)  # day_of_week, hour, weather, traffic
y = prepare_labels(data)    # travel_time, fuel_consumption

# Train model
model = tf.keras.Sequential([
    tf.keras.layers.Dense(128, activation='relu'),
    tf.keras.layers.Dense(64, activation='relu'),
    tf.keras.layers.Dense(1)  # Predict travel time
])

model.fit(X, y, epochs=50)

# Export to ONNX
import tf2onnx
onnx_model = tf2onnx.convert.from_keras(model)
onnx.save(onnx_model, 'route_model.onnx')
```

**Model Inference (Go):**
```go
// internal/ai/inference.go
import "github.com/ai-onnxruntime/go/onnxruntime"

func PredictTravelTime(features []float32) (float32, error) {
    // Load ONNX model
    session, _ := onnxruntime.NewSession("route_model.onnx")
    defer session.Close()

    // Run inference
    input := onnxruntime.NewTensor("features", features)
    output, _ := session.Run(map[string]onnxruntime.Tensor{"features": input})

    return output["travel_time"][0], nil
}
```

---

## 🚀 Deployment Architecture

### Infrastructure

**Oracle Cloud Infrastructure:**
```
┌─────────────────────────────────────────────────────────┐
│                    Cloudflare CDN                       │
│            (SSL, DDoS Protection, Caching)              │
└────────────────────┬────────────────────────────────────┘
                     │
┌────────────────────▼────────────────────────────────────┐
│              Coolify (PaaS)                             │
│  ┌───────────────────────────────────────────────────┐  │
│  │        Backend Server (Go + Fiber)                │  │
│  │  • API Server (HTTP)                              │  │
│  │  • WebSocket Server (Real-time)                   │  │
│  │  • Background Workers (Asynq)                     │  │
│  └───────────────────────────────────────────────────┘  │
│  ┌───────────────────────────────────────────────────┐  │
│  │        Frontend (SvelteKit)                       │  │
│  │  • Static Files (CDN)                             │  │
│  │  • Server-Side Rendering (SSR)                    │  │
│  └───────────────────────────────────────────────────┘  │
└────────────────────┬────────────────────────────────────┘
                     │
┌────────────────────▼────────────────────────────────────┐
│              Managed Services                           │
│  ┌─────────────┐  ┌─────────────┐  ┌──────────────┐   │
│  │ PostgreSQL  │  │   Redis     │  │  Object S3   │   │
│  │ +TimescaleDB│  │  (Cache)    │  │  (GPS Logs)  │   │
│  └─────────────┘  └─────────────┘  └──────────────┘   │
└──────────────────────────────────────────────────────────┘
```

### Environment Configuration

**Docker Compose (Development):**
```yaml
version: '3.8'
services:
  postgres:
    image: timescale/timescaledb:pg15
    environment:
      POSTGRES_DB: dukungps_dev
      POSTGRES_USER: postgres
      POSTGRES_PASSWORD: postgres
    ports:
      - "5432:5432"
    volumes:
      - postgres_data:/var/lib/postgresql/data

  redis:
    image: redis:7-alpine
    ports:
      - "6379:6379"

  backend:
    build: ./backend
    ports:
      - "3000:3000"
    environment:
      DB_HOST: postgres
      REDIS_HOST: redis
    depends_on:
      - postgres
      - redis

  frontend:
    build: ./frontend
    ports:
      - "5173:5173"

volumes:
  postgres_data:
```

---

## 📊 Performance Benchmarks

### Target Performance (Year 1)

| Metric | Target | Measurement Tool |
|--------|--------|------------------|
| **API Response Time** | <200ms p95 | Prometheus metrics |
| **WebSocket Latency** | <100ms avg | Client-side timing |
| **GPS Ingestion Rate** | 10k points/sec | Load testing (k6) |
| **Concurrent Connections** | 10k+ WebSockets | Connection counter |
| **Database Query Time** | <50ms for GPS logs | TimescaleDB query stats |
| **Frontend Load Time** | <2s First Paint | Lighthouse |
| **Mobile PWA Load** | <3s on 3G | WebPageTest |

### Scalability Plan

**Vertical Scaling (Single Server):**
- **CPU:** 8 vCPU → Handles 5k concurrent connections
- **RAM:** 32GB → GPS data caching in Redis
- **Storage:** 500GB SSD → ~100M GPS points (90-day retention for 10k devices)

**Horizontal Scaling (Multi-Server):**
- **Phase 1 (Months 1-6):** Single server, 1k devices
- **Phase 2 (Months 7-12):** 2 servers (load balanced), 5k devices
- **Phase 3 (Months 13+):** Auto-scaling, 10k+ devices

---

## 🔒 Security Architecture

### Authentication & Authorization

**JWT-based Auth:**
```go
// internal/auth/jwt.go
type Claims struct {
    UserID  string   `json:"user_id"`
    Roles   []string `json:"roles"`
    jwt.RegisteredClaims
}

func GenerateToken(user User, expiresAt time.Duration) (string, error) {
    claims := Claims{
        UserID: user.ID,
        Roles:  user.Roles,
        RegisteredClaims: jwt.RegisteredClaims{
            ExpiresAt: jwt.NewNumericDate(time.Now().Add(expiresAt)),
        },
    }

    token := jwt.NewWithClaims(jwt.SigningMethodHS256, claims)
    return token.SignedString([]byte(config.JWTSecret))
}
```

**Role-Based Access Control (RBAC):**
- **Owner:** Full access to all fleets, billing management
- **Manager:** Manage fleets, vehicles, drivers, reports
- **Dispatcher:** View live tracking, send messages
- **Driver:** View assigned vehicle only

### Data Encryption

- **Transit:** TLS 1.3 for all connections (Cloudflare SSL)
- **Rest:** AES-256 encryption for sensitive fields (database)
- **GPS Data:** Encrypted at rest (TimescaleDB encryption)

---

## 🧪 Testing Strategy

### Backend Testing

**Unit Tests (80% coverage target):**
```go
// internal/tracking/gps_test.go
func TestIngestGPSPoint(t *testing.T) {
    // Mock database
    db := mockDB()

    // Test GPS ingestion
    point := GPSPoint{
        DeviceID: "ABC123",
        Latitude: -6.2088,
        Longitude: 106.8456,
        Speed: 60.0,
    }

    err := IngestGPSPoint(db, point)
    assert.NoError(t, err)

    // Verify database insert
    var count int
    db.QueryRow("SELECT COUNT(*) FROM gps_points WHERE device_id = $1", point.DeviceID).Scan(&count)
    assert.Equal(t, 1, count)
}
```

**Load Testing (k6):**
```javascript
// load_test/websocket_test.js
import ws from 'k6/ws';
import { check } from 'k6';

export let options = {
  vus: 1000,  // 1000 concurrent users
  duration: '5m',
};

export default function () {
  let url = 'wss://dukungps.com/ws?token=xxx';
  let response = ws.connect(url, {}, function (socket) {
    socket.on('message', function (message) {
      check(message, {
        'GPS update received': (msg) => msg.type === 'gps_update',
      });
    });
  });
}
```

### Frontend Testing

**Component Tests (Vitest):**
```typescript
// components/map/VehicleMap.test.ts
import { render, screen } from '@testing-library/svelte';
import VehicleMap from './VehicleMap.svelte';

test('renders map with vehicle markers', () => {
  render(VehicleMap, {
    vehicles: [
      { id: '1', lat: -6.2088, lng: 106.8456 }
    ]
  });

  expect(screen.getByTestId('vehicle-marker-1')).toBeInTheDocument();
});
```

**E2E Tests (Playwright):**
```typescript
// e2e/tracking.spec.ts
import { test, expect } from '@playwright/test';

test('view live vehicle tracking', async ({ page }) => {
  await page.goto('/dashboard');
  await page.waitForSelector('map-container');

  // Verify vehicle marker visible
  const marker = page.locator('.vehicle-marker').first();
  await expect(marker).toBeVisible();

  // Click marker, verify popup
  await marker.click();
  await expect(page.locator('.vehicle-popup')).toContainText('60 km/h');
});
```

---

## 📈 Monitoring & Observability

### Metrics Collection

**Prometheus Metrics:**
```go
// internal/metrics/collector.go
var (
    gpsIngestionCounter = prometheus.NewCounterVec(
        prometheus.CounterOpts{
            Name: "gps_ingestion_total",
            Help: "Total number of GPS points ingested",
        },
        []string{"device_type"},
    )

    apiRequestDuration = prometheus.NewHistogramVec(
        prometheus.HistogramOpts{
            Name: "api_request_duration_seconds",
            Help: "API request duration in seconds",
        },
        []string{"endpoint", "method"},
    )
)
```

### Dashboards

**Grafana Dashboards:**
- **Business Metrics:** Active devices, alerts sent, subscription revenue
- **Technical Metrics:** API latency, WebSocket connections, database query time
- **Infrastructure:** CPU, memory, disk usage, network I/O

### Alerting

**Critical Alerts:**
- GPS ingestion rate drops >50% (potential system failure)
- API error rate >5% (service degradation)
- Database connection pool exhausted (scaling issue)
- WebSocket connections >90% of capacity (need to scale)

---

## 🚀 Next Steps

### Immediate (Weeks 1-4)
1. **Benchmarks:**
   - [ ] Fiber vs Echo vs Gin performance comparison
   - [ ] WebSocket concurrency test (10k connections)
   - [ ] TimescaleDB query performance (GPS range queries)

2. **Architecture Validation:**
   - [ ] Build GPS ingestion MVP (single endpoint)
   - [ ] Test WebSocket real-time updates
   - [ ] Verify TimescaleDB compression & partitioning

3. **Cost Estimation:**
   - [ ] OCI server sizing & pricing
   - [ ] TimescaleDB storage cost (per device per month)
   - [ ] Google Maps API usage & cost

### Short-term (Months 2-3)
4. **Hardware Integration:**
   - [ ] Order 3-5 white-label GPS devices
   - [ ] Build device communication protocol (MQTT/HTTP)
   - [ ] Test device accuracy & reliability

5. **AI/ML Feasibility:**
   - [ ] Prototype Google Maps routing integration
   - [ ] Estimate traffic API costs
   - [ ] Evaluate ONNX Runtime for Go

---

**Related Documentation:**
- [Product README](./README.md)
- [Validation Progress](./validasi.md)
- [Business Model](./business-model.md)

**Related Beads Items:**
- [hq-4kb.8](https://github.com/akordium/hq/issues/4kb.8) - Real-time Architecture Design
- [hq-4kb.9](https://github.com/akordium/hq/issues/4kb.9) - AI/ML Feasibility
- [hq-4kb.10](https://github.com/akordium/hq/issues/4kb.10) - Tech Stack Validation
- [hq-4kb.11](https://github.com/akordium/hq/issues/4kb.11) - Database & Time-Series Architecture

**Last Updated:** 2026-01-06
**Maintainer:** Najib Zain (Tech Lead)
**Review Cycle:** Monthly during validation phase
