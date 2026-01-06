# MVP Feature Specification - All Core Features

**Status:** 📋 In Progress
**Last Updated:** 2026-01-06
**Author:** Product Team
**Related Beads Item:** hq-bl3.7

## Overview

This document provides detailed specifications for all M1 (Milestone 1) features of Sesarra. These features represent the minimum viable product needed to validate the core value proposition: all-in-one wedding planning + unlimited cloud storage for forever memories.

**M1 Goal:** Build a functional product that 50 beta couples can use for real weddings, with clear feedback loops to iterate.

---

## Feature 1: Wedding Timeline & Checklist

### Problem Statement

Couples are overwhelmed by wedding planning. They don't know what to do, when to do it, or who's responsible for what. Tasks get forgotten, deadlines are missed, and stress levels skyrocket.

### Solution

Comprehensive wedding timeline & checklist system with:
- Pre-built templates (6-month, 3-month, 1-month countdown)
- Custom milestones (lamaran, tunangan, akad, resepsi)
- Task assignment (couple collaboration)
- Deadline reminders via WhatsApp/email

### User Stories

**As a bride-to-be**, I want to see a pre-built wedding checklist so I don't forget important tasks.

**As a groom**, I want to see my assigned tasks so I know what I'm responsible for.

**As a couple**, I want to customize the checklist for our cultural/religious requirements.

**As a busy professional**, I want deadline reminders so I don't miss critical dates.

### Functional Requirements

#### FR 1.1: Pre-Built Templates

**Templates Included:**

| Template Name | Timeline | Tasks | Use Case |
|---------------|----------|-------|----------|
| "Relaxed 6-Month Countdown" | 6 months | ~150 tasks | Long engagement, want thorough preparation |
| "Standard 3-Month Countdown" | 3 months | ~100 tasks | Average engagement length |
| "Crunch-Time 1-Month Countdown" | 1 month | ~60 tasks | Short engagement, focused on essentials |

**Task Categories:**
- Lamaran (Khitbah, Pertunangan)
- Venue & Catering
- Dekorasi & Flowers
- Busana (Gaun pengantin, Jas pengantin)
- MUA & Hair
- Fotografer & Videografer
- Undangan & Souvenir
- Dokumen Legal (KUA, Catatan Sipil)
- Guest Management
- Akad Nikah
- Resepsi (Logistik, Rundown)
- Honeymoon

**Task Properties:**
- Title (e.g., "Book venue for reception")
- Description (e.g., "Visit 3-5 venues, compare prices, sign contract")
- Category (e.g., "Venue & Catering")
- Due Date (auto-calculated based on wedding date)
- Status (Not Started, In Progress, Completed)
- Priority (Low, Medium, High, Critical)
- Assigned To (Self, Partner, Family, Vendor)
- Checklist Items (sub-tasks with checkboxes)

#### FR 1.2: Custom Milestones

**Supported Milestones:**
- Lamaran (Proposal)
- Tunangan (Engagement)
- Akad Nikah (Marriage Contract)
- Resepsi (Reception)

**Customization:**
- Add custom milestones (e.g., "Prewedding Shoot")
- Remove irrelevant milestones
- Reorder milestones
- Set specific dates for each milestone

#### FR 1.3: Task Assignment

**Assignment Options:**
- Self (the logged-in user)
- Partner (fiancé/fiancée with shared account access)
- Family member (parent, sibling with limited access)
- Vendor (external collaborator with task-only access)

**Collaboration Features:**
- Real-time updates (when partner completes task, both see it)
- Comments on tasks (e.g., "I called the venue, they're fully booked!")
- File attachments (e.g., venue contract PDF)
- Task history (who changed what, when)

#### FR 1.4: Deadline Reminders

**Reminder Channels:**
- Email (default: 3 days before, 1 day before, day of)
- WhatsApp (optional: requires WhatsApp Business API integration)

**Reminder Triggers:**
- 7 days before due date
- 3 days before due date
- 1 day before due date
- Day of due date (morning)
- Overdue (daily until completed)

**Customization:**
- Users can adjust reminder frequency
- Users can opt out of specific reminders
- Critical tasks cannot be disabled

### UI/UX Specifications

**Main Checklist View:**
```
┌─────────────────────────────────────────────┐
│ Wedding Countdown: 89 days to go! 🎉       │
│ Progress: 47/150 tasks completed (31%)      │
├─────────────────────────────────────────────┤
│                                             │
│ ▼ Filter: All | Not Started | In Progress │ ✓ Completed │
│                                             │
│ ┌─ VENUE & CATERING (8/12 tasks) ─────────┐ │
│ │ ✅ Book venue for reception               │ │
│ │ ✅ Sign venue contract                   │ │
│ │ ✅ Pay venue deposit (DP 50%)            │ │
│ │ ⏳ Choose catering menu                  │ │
│ │ ⏳ Final guest count for catering        │ │
│ │ ⏳ Pay catering balance                  │ │
│ └──────────────────────────────────────────┘ │
│                                             │
│ ┌─ BUSANA (3/10 tasks) ──────────────────┐ │
│ │ ⏳ Find bridal gown inspiration         │ │
│ │ ⏳ Book bridal fitting appointment       │ │
│ │ ⏳ Choose groom's suit/jas              │ │
│ └──────────────────────────────────────────┘ │
└─────────────────────────────────────────────┘
```

**Task Detail View:**
```
┌─────────────────────────────────────────────┐
│ Task: Choose catering menu                  │
├─────────────────────────────────────────────┤
│ Category: Venue & Catering                  │
│ Assigned to: Sarah (You)                    │
│ Due: March 15, 2026 (14 days from now)     │
│ Priority: High                              │
│ Status: Not Started                         │
├─────────────────────────────────────────────┤
│ Description:                                │
│ Research 3-5 catering options, taste test   │
│ menus, compare prices, and sign contract.   │
│                                             │
│ Budget allocated: Rp 50 Million            │
│ Actual cost: TBD                            │
├─────────────────────────────────────────────┤
│ Sub-tasks (0/3 completed):                  │
│ ☐ Research caterers on Instagram           │
│ ☐ Schedule 3 taste test appointments        │
│ ☐ Sign catering contract                   │
├─────────────────────────────────────────────┤
│ Comments (2):                               │
│ [Sarah, Mar 1]: Found 5 promising options!  │
│ [Ahmad, Mar 2]: I'll handle taste tests    │
├─────────────────────────────────────────────┤
│ Attachments:                                │
│ 📄 Catering_Comparison.xlsx                 │
│                                             │
│ [Mark Complete] [Edit] [Delete]             │
└─────────────────────────────────────────────┘
```

### Technical Notes

**Data Model:**
```sql
checklists (
  id UUID PRIMARY KEY,
  couple_id UUID NOT NULL,
  title VARCHAR(255) NOT NULL,
  description TEXT,
  category VARCHAR(100),
  due_date DATE,
  status VARCHAR(20), -- not_started, in_progress, completed
  priority VARCHAR(20), -- low, medium, high, critical
  assigned_to UUID, -- user_id
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  completed_at TIMESTAMP
)

checklist_templates (
  id UUID PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  timeline_months INTEGER NOT NULL,
  tasks JSONB NOT NULL, -- array of task objects
  is_custom BOOLEAN DEFAULT false
)
```

---

## Feature 2: Budget Planner

### Problem Statement

Weddings are expensive (Rp 100-500M+), and couples struggle to:
- Track expenses across 20+ vendors
- Compare estimated vs. actual costs
- Manage payment schedules (DP, pelunasan)
- Avoid budget overruns

### Solution

Category-based budget planner with:
- Pre-built categories (venue, catering, dekorasi, MUA, fotografer, etc.)
- Vendor cost tracking (estimated vs. actual)
- Payment status tracking (DP, pelunasan)
- Budget overrun alerts
- Export to Excel for accountant

### User Stories

**As a bride**, I want to set a total wedding budget so I know how much I can spend.

**As a groom**, I want to see how much we've spent vs. budget so we don't overspend.

**As a couple**, we want to track vendor payments so we know what's been paid and what's outstanding.

**As a detail-oriented person**, I want to export budget data to Excel for my accountant.

### Functional Requirements

#### FR 2.1: Budget Setup

**Initial Setup Wizard:**
1. Enter total wedding budget (e.g., Rp 300 Million)
2. Choose allocation strategy:
   - "Recommended" (auto-split based on industry averages)
   - "Custom" (user manually sets category budgets)
3. Review and adjust allocations

**Pre-Built Categories:**

| Category | Recommended % | For Rp 300M Budget |
|----------|---------------|-------------------|
| Venue & Catering | 35% | Rp 105M |
| Dekorasi & Flowers | 15% | Rp 45M |
| Busana Pengantin | 10% | Rp 30M |
| MUA & Hair | 5% | Rp 15M |
| Fotografer & Videografer | 10% | Rp 30M |
| Undangan & Souvenir | 8% | Rp 24M |
| Entertainment (MC, Band) | 5% | Rp 15M |
| Dokumen Legal | 2% | Rp 6M |
| Guest Management | 3% | Rp 9M |
| Miscellaneous/Buffer | 7% | Rp 21M |
| **TOTAL** | **100%** | **Rp 300M** |

**Custom Categories:**
Users can add/remove categories based on their needs.

#### FR 2.2: Vendor Cost Tracking

**For Each Vendor:**

**Estimated Costs:**
- Quoted price (from vendor quote/invoice)
- Negotiated price (after discounts)
- Final contract price

**Actual Costs:**
- Deposit amount (DP)
- Progress payments (if applicable)
- Final payment (pelunasan)
- Additional costs (extra hours, add-ons)

**Payment Tracking:**
- Payment type (DP 50%, Pelunasan 50%, or custom split)
- Payment date
- Payment method (transfer, cash, Midtrans)
- Payment status (Pending, Paid, Overdue)
- Proof of payment (upload receipt/invoice PDF)

**Example:**
```
Vendor: Royal Ballroom (Venue)
Category: Venue & Catering
├─ Estimated: Rp 80,000,000
├─ Actual: Rp 85,000,000 (+Rp 5M overtime fee)
└─ Payments:
   ├─ DP (50%): Rp 40,000,000 [Paid] - Mar 1, 2026
   ├─ Pelunasan (50%): Rp 45,000,000 [Pending] - Due: May 1, 2026
   └─ Total Paid: Rp 40,000,000 / Rp 85,000,000 (47%)
```

#### FR 2.3: Budget Overrun Alerts

**Alert Triggers:**
- Category exceeds allocated budget by 10%
- Total budget exceeds 90% (warning)
- Total budget exceeds 100% (critical alert)

**Alert Channels:**
- In-app notification (bell icon)
- Email summary (weekly)
- WhatsApp (optional, for critical alerts)

**Alert Content:**
```
⚠️ Budget Alert: Venue & Catering

You've spent Rp 90M of your Rp 80M budget (112%).
Overrun: Rp 10M

Recommendation:
- Reduce other categories or
- Increase total budget or
- Negotiate with venue for refund
```

#### FR 2.4: Export to Excel

**Export Options:**
- Summary view (category-level only)
- Detailed view (all transactions)
- Payment status view (outstanding payments only)

**Excel Format:**
| Category | Budget | Spent | Remaining | % Used |
|----------|--------|-------|-----------|--------|
| Venue & Catering | Rp 80M | Rp 90M | -Rp 10M | 112% |
| Dekorasi | Rp 45M | Rp 40M | Rp 5M | 89% |
| ... | ... | ... | ... | ... |

### UI/UX Specifications

**Budget Dashboard View:**
```
┌─────────────────────────────────────────────┐
│ 💰 Total Budget: Rp 300,000,000            │
│ 💵 Spent: Rp 156,000,000 (52%)             │
│ 📉 Remaining: Rp 144,000,000 (48%)          │
├─────────────────────────────────────────────┤
│                                             │
│ Budget Progress Bar:                        │
│ ██████████████░░░░░░░░░░░░░░░ 52%          │
│                                             │
│ ⚠️ 1 category over budget (Venue & Catering)│
│                                             │
┌─ CATEGORY BREAKDOWN ─────────────────────┐ │
│                                            │
│ Venue & Catering  [112% ⚠️]               │
│ Budget: Rp 80M  |  Spent: Rp 90M         │
│ ████████████████████████░ 112%             │
│                                            │
│ Dekorasi  [89% ✅]                         │
│ Budget: Rp 45M  |  Spent: Rp 40M         │
│ ████████████████████░░░░ 89%               │
│                                            │
│ Busana  [65% ✅]                           │
│ Budget: Rp 30M  |  Spent: Rp 19.5M       │
│ █████████████░░░░░░░░░░░░ 65%              │
│                                            │
│ [View All Categories]                      │
└────────────────────────────────────────────┘│
│                                             │
│ [Add Expense] [Export to Excel]            │
└─────────────────────────────────────────────┘
```

**Vendor Detail View:**
```
┌─────────────────────────────────────────────┐
│ Vendor: Royal Ballroom                      │
├─────────────────────────────────────────────┤
│ Category: Venue & Catering                  │
│ Contact: 0812-3456-7890 (Budi)             │
│ Address: Jakarta Selatan                    │
├─────────────────────────────────────────────┤
│ 💸 Budget Summary                           │
│ Estimated: Rp 80,000,000                    │
│ Actual: Rp 85,000,000 (+6.25%)              │
│ Status: ⚠️ Over budget by Rp 5M             │
├─────────────────────────────────────────────┤
│ 💳 Payments (47% paid)                      │
│                                            │
│ ✅ DP (50%): Rp 40,000,000                 │
│    Paid: Mar 1, 2026 via Transfer          │
│    📎 Transfer_Receipt.pdf                  │
│                                            │
│ ⏳ Pelunasan (50%): Rp 45,000,000          │
│    Due: May 1, 2026 (30 days from now)     │
│    Status: Pending                         │
│                                            │
│ [Record Payment] [Send Reminder]            │
└─────────────────────────────────────────────┘
```

### Technical Notes

**Data Model:**
```sql
budget_categories (
  id UUID PRIMARY KEY,
  couple_id UUID NOT NULL,
  name VARCHAR(255) NOT NULL,
  allocated_amount DECIMAL(15,2) NOT NULL,
  spent_amount DECIMAL(15,2) DEFAULT 0,
  created_at TIMESTAMP
)

vendors (
  id UUID PRIMARY KEY,
  couple_id UUID NOT NULL,
  category_id UUID REFERENCES budget_categories(id),
  name VARCHAR(255) NOT NULL,
  contact_phone VARCHAR(50),
  contact_email VARCHAR(255),
  estimated_cost DECIMAL(15,2),
  actual_cost DECIMAL(15,2),
  notes TEXT,
  created_at TIMESTAMP
)

payments (
  id UUID PRIMARY KEY,
  vendor_id UUID REFERENCES vendors(id),
  amount DECIMAL(15,2) NOT NULL,
  payment_type VARCHAR(50), -- DP, pelunasan, progress
  payment_method VARCHAR(50), -- transfer, cash, midtrans
  payment_date DATE,
  status VARCHAR(20), -- pending, paid, overdue
  receipt_url TEXT, -- Cloudflare R2 URL
  created_at TIMESTAMP
)
```

---

## Feature 3: Guest Management

### Problem Statement

Wedding guest management is chaotic:
- Guest lists scattered across spreadsheets, WhatsApp, notes
- RSVP tracking is manual and error-prone
- Seating arrangements are nightmares (family drama!)
- Dietary requirements get missed

### Solution

Comprehensive guest management with:
- Guest list import (Excel, contacts)
- RSVP tracking (coming, not coming, pending)
- Dietary requirements capture
- Seating arrangement tool (drag-drop)
- WhatsApp RSVP reminders

### User Stories

**As a bride**, I want to import guest list from Excel so I don't manually type 500 names.

**As a couple**, we want to track RSVPs so we know how much food to order.

**As a host**, I want to manage seating arrangements so family members don't fight.

**As a considerate host**, I want to track dietary requirements so guests with allergies are safe.

### Functional Requirements

#### FR 3.1: Guest List Import

**Import Sources:**
- Excel/CSV upload (bulk import)
- Google Contacts sync
- Manual entry (one-by-one)

**Excel Format:**
| Name | Email | Phone | Category | Side | Table |
|------|-------|-------|----------|------|-------|
| Ahmad Ibrahim | ahmad@email.com | 0812-xxxx-xxxx | Family | Bride | A1 |
| Sarah Putri | sarah@email.com | 0813-xxxx-xxxx | Friend | Groom | B5 |

**Import Validation:**
- Check for duplicates (by email or phone)
- Validate phone format (Indonesian numbers)
- Auto-detect category (family, friend, colleague) if not specified

#### FR 3.2: RSVP Tracking

**RSVP Status:**
- Pending (haven't responded yet)
- Coming (confirmed attendance)
- Not Coming (declined)
- Maybe (uncertain)

**RSVP Collection Methods:**
1. **Manual Entry:** Couple marks RSVP status after guests confirm via WhatsApp
2. **Digital RSVP Form:** Guests fill form at sesarra.com/r/wedding-slug
3. **WhatsApp Integration:** Send RSVP link, auto-track responses

**RSVP Reminders:**
- Automatic reminders to "Pending" guests (7 days before, 3 days before)
- Manual reminders (couple can send anytime)
- WhatsApp integration (one-click send reminder)

**RSVP Summary Dashboard:**
```
Total Guests: 500
├─ Confirmed: 350 (70%) ✅
├─ Declined: 80 (16%) ❌
├─ Pending: 60 (12%) ⏳
└─ Maybe: 10 (2%) ❓

Final headcount: 350 guests
```

#### FR 3.3: Dietary Requirements

**Supported Requirements:**
- Halal (default for Muslim weddings)
- Vegetarian
- Vegan
- No beef
- No seafood
- Gluten-free
- Allergies (nuts, dairy, etc.) - custom text field
- Other (custom input)

**Capture Method:**
- RSVP form (guests select their requirements)
- Manual entry (couple inputs for guests)
- Bulk import (from Excel)

**Caterer Export:**
- Export list of dietary requirements by table
- Send to caterer for meal planning

#### FR 3.4: Seating Arrangement Tool

**Visual Table Layout:**
```
Stage (Panggung)
┌──────────────────────────────────────────┐
│                                          │
│   ┌─A1─┐  ┌─A2─┐  ┌─A3─┐  ┌─A4─┐       │
│   │ 8  │  │ 8  │  │ 8  │  │ 8  │       │
│   │seat│  │seat│  │seat│  │seat│       │
│   └────┘  └────┘  └────┘  └────┘       │
│                                          │
│   ┌─B1─┐  ┌─B2─┐  ┌─B3─┐  ┌─B4─┐       │
│   │ 8  │  │ 8  │  │ 8  │  │ 8  │       │
│   │seat│  │seat│  │seat│  │seat│       │
│   └────┘  └────┘  └────┘  └────┘       │
└──────────────────────────────────────────┘
```

**Features:**
- Create tables (8-seat round, 10-seat rectangular, custom)
- Drag-and-drop guests to tables
- Auto-assign based on categories (e.g., "Family" → Tables A1-A5)
- Conflict detection (e.g., "Don't seat divorced couple at same table")
- Export to PDF (print for venue setup)

**Seating Rules:**
- "Side" rule (Bride's guests vs. Groom's guests)
- "Category" rule (Family at front, friends at back)
- "Custom" rule (user-defined constraints)

### UI/UX Specifications

**Guest List View:**
```
┌─────────────────────────────────────────────┐
│ 👥 Guest List: 500 guests                   │
├─────────────────────────────────────────────┤
│                                             │
│ 🔍 Search guest...                          │
│                                             │
│ Filter: All | Confirmed (350) | Pending (60)│
│                                             │
│ ┌─VIP FAMILY──────────────────────────────┐│
│ ✅ Ahmad Ibrahim          +3 (Family)      ││
│    Table: A1 (Bride's side)                ││
│    🍖 Halal | 📞 0812-xxxx-xxxx           ││
│                                            ││
│ ✅ Siti Aminah             +2 (Family)     ││
│    Table: A2 (Bride's side)                ││
│    🥬 Vegetarian | 📞 0813-xxxx-xxxx      ││
│                                            ││
│ ┌─FRIENDS─────────────────────────────────┐│
│ ⏳ Budi Santoso           +1 (Friend)      ││
│    Table: Not assigned                     ││
│    🍖 Halal | 📞 0814-xxxx-xxxx           ││
│    [Send RSVP Reminder] 📱                 ││
└─────────────────────────────────────────────┘
```

**Seating Arrangement View:**
```
┌─────────────────────────────────────────────┐
│ 🪑 Seating Arrangement                      │
├─────────────────────────────────────────────┤
│                                             │
│ Unassigned: 60 guests                       │
│                                             │
│ ┌─ HALL LAYOUT ──────────────────────────┐ │
│                                          │ │
│  Stage                                   │ │
│  ┌─────────────────────────────────┐    │ │
│  │                                  │    │ │
│  │   🪑 A1 🪑 A2 🪑 A3 🪑 A4        │    │ │
│  │  (8)   (8)   (8)   (8)           │    │ │
│  │                                  │    │ │
│  │   🪑 B1 🪑 B2 🪑 B3 🪑 B4        │    │ │
│  │  (8)   (8)   (8)   (8)           │    │ │
│  │                                  │    │ │
│  └─────────────────────────────────┘    │ │
│                                          │ │
└──────────────────────────────────────────┘ │
│                                             │
│ [Add Table] [Auto-Assign] [Export PDF]     │
└─────────────────────────────────────────────┘
```

### Technical Notes

**Data Model:**
```sql
guests (
  id UUID PRIMARY KEY,
  couple_id UUID NOT NULL,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255),
  phone VARCHAR(50),
  category VARCHAR(50), -- family, friend, colleague
  side VARCHAR(20), -- bride, groom
  rsvp_status VARCHAR(20), -- pending, coming, not_coming, maybe
  dietary_requirements TEXT,
  table_id UUID, -- foreign key to guest_tables
  plus_one INTEGER DEFAULT 0, -- number of additional guests
  created_at TIMESTAMP
)

guest_tables (
  id UUID PRIMARY KEY,
  couple_id UUID NOT NULL,
  table_number VARCHAR(50) NOT NULL,
  capacity INTEGER NOT NULL,
  table_type VARCHAR(20), -- round_8, rectangular_10, custom
  position_x INTEGER, -- for visual layout
  position_y INTEGER,
  created_at TIMESTAMP
)

seating_arrangements (
  guest_id UUID REFERENCES guests(id),
  table_id UUID REFERENCES guest_tables(id),
  seat_number INTEGER,
  PRIMARY KEY (guest_id, table_id)
)
```

---

## Feature 4: Cloud Storage

### Problem Statement

Wedding photos are precious memories, but:
- Photos scattered across photographer's gallery, phones, WhatsApp, Google Photos
- Photographer deletes gallery after 6-12 months
- Phone storage fills up (1000+ photos)
- No centralized "forever" storage

### Solution

Unlimited cloud storage for wedding photos/videos with:
- Photo/video upload (before, during, after wedding)
- Automatic organization by event (lamaran, akad, reception)
- Shared albums (family, friends)
- Download all photos feature
- Forever storage guarantee

### User Stories

**As a bride**, I want to upload all wedding photos so they're safe forever.

**As a groom**, I want to organize photos by event so I can find lamaran vs. reception photos.

**As a mother**, I want to access my daughter's wedding album to show relatives.

**As a nostalgic couple**, we want to download all photos for backup on external hard drive.

### Functional Requirements

#### FR 4.1: Photo/Video Upload

**Supported File Types:**
- Photos: JPG, PNG, HEIC, WebP
- Videos: MP4, MOV, AVI

**File Size Limits:**
- Photos: Up to 50MB per photo
- Videos: Up to 5GB per video

**Upload Methods:**
1. **Web Upload:** Drag-and-drop or file picker (up to 100 photos at once)
2. **Mobile App Upload:** Select from camera roll (future feature)
3. **Vendor Upload:** Photographers get upload access (share album link)

**Upload Features:**
- **Resumable Upload:** If network fails, resume from where it stopped
- **Progress Indicator:** Show upload progress (e.g., "45% - 45 of 100 photos")
- **Auto-Compression:** Compress photos (WebP format) without quality loss
- **Background Upload:** Upload continues in background while user navigates app

**Upload Speed Target:**
- 10MB photo: <5 seconds on 10Mbps connection
- 1GB video: <5 minutes on 10Mbps connection

#### FR 4.2: Automatic Organization

**Albums Created Automatically:**

| Album Name | When Created | What's Inside |
|------------|--------------|---------------|
| Lamaran | After lamaran event | Proposal photos, engagement photos |
| Prewedding | After upload | Prewedding shoot photos |
| Akad Nikah | After akad event | Marriage contract ceremony photos |
| Resepsi | After reception | Reception party photos |
| Behind the Scenes | Auto-detected | Candid moments, preparation photos |

**Smart Organization:**
- **Date-based:** Auto-group photos by upload date
- **Location-based:** If GPS metadata exists, group by location
- **Face Recognition:** (Future) Auto-group photos by faces (couple, family)

**Manual Organization:**
- Users can create custom albums (e.g., "Favorite Moments")
- Users can move photos between albums
- Users can add descriptions/tags to photos

#### FR 4.3: Shared Albums

**Sharing Options:**
- **Public Link:** Anyone with link can view (e.g., for wedding website)
- **Password-Protected:** Link + password required
- **Invite-Only:** Only specific email addresses can access

**Album Permissions:**
- **View Only:** Guests can view but not download
- **View + Download:** Guests can view and download
- **Contribute:** Guests can upload their own photos (e.g., guests' phone photos)

**Album Features:**
- Comments on photos (e.g., "Beautiful shot of the bride!")
- Likes/Reactions (❤️, 👍, etc.)
- Download all (zip file)

**Album Use Cases:**
- Share with parents (they want to show relatives)
- Share on wedding website (public link)
- Collaborative album (guests upload their phone photos)

#### FR 4.4: "Forever Storage" Guarantee

**What "Forever" Means:**
- Photos stored for lifetime of Sesarra service (minimum 10 years commitment)
- If Sesarra shuts down, users get 6-month notice to download all photos
- Data export feature (download all photos as zip)

**Storage Infrastructure:**
- **Primary:** Cloudflare R2 (object storage, zero egress fees)
- **Backup:** Oracle Cloud Object Storage (geo-redundancy)
- **CDN:** Cloudflare CDN (fast delivery globally)

**Fair Use Policy:**
- "Unlimited" = 1TB per couple (covers 99% of weddings)
- If >1TB, contact support for custom plan

### UI/UX Specifications

**Photo Gallery View:**
```
┌─────────────────────────────────────────────┐
│ 📸 My Wedding Photos (1,247 photos)        │
├─────────────────────────────────────────────┤
│                                             │
│ Albums:                                     │
│ ┌─Lamaran───────────────┐ ┌─Akad─────────┐│
│ │ 📷 234 photos         │ │ 📷 456 photos││
│ │ Feb 15, 2026          │ │ Mar 20, 2026 ││
│ └───────────────────────┘ └──────────────┘│
│                                             │
│ ┌─Resepsi──────────────┐ ┌─Guest Photos─┐│
│ │ 📷 512 photos         │ │ 📷 45 photos ││
│ │ Mar 20, 2026          │ │ Mar 21, 2026 ││
│ └───────────────────────┘ └──────────────┘│
│                                             │
│ [Upload Photos] [Create Album]              │
└─────────────────────────────────────────────┘
```

**Album Detail View:**
```
┌─────────────────────────────────────────────┐
│ 📸 Album: Akad Nikah (456 photos)          │
├─────────────────────────────────────────────┤
│                                             │
│ [Upload More] [Download All] [Share Album]  │
│                                             │
│ ┌──────┐ ┌──────┐ ┌──────┐ ┌──────┐       │
│ │ 📷   │ │ 📷   │ │ 📷   │ │ 📷   │       │
│ │      │ │      │ │      │ │      │       │
│ └──────┘ └──────┘ └──────┘ └──────┘       │
│                                             │
│ ┌──────┐ ┌──────┐ ┌──────┐ ┌──────┐       │
│ │ 📷   │ │ 📷   │ │ 📷   │ │ 📷   │       │
│ │      │ │      │ │      │ │      │       │
│ └──────┘ └──────┘ └──────┘ └──────┘       │
│                                             │
│ [Load More Photos...]                        │
└─────────────────────────────────────────────┘
```

**Upload Modal:**
```
┌─────────────────────────────────────────────┐
│ Upload Photos                               │
├─────────────────────────────────────────────┤
│                                             │
│ Drag & drop photos here, or                 │
│ [Browse Files]                              │
│                                             │
│ Selected: 47 photos (1.2 GB)                │
│                                             │
│ Upload to: [Lamaran ▼]                      │
│                                             │
│ Progress: ████████████░░░░ 80% (38 of 47)   │
│                                             │
│ ⏳ Uploading: IMG_4023.jpg (2.3 MB)...     │
│                                             │
│ [Cancel] [Start Upload]                     │
└─────────────────────────────────────────────┘
```

### Technical Notes

**Data Model:**
```sql
albums (
  id UUID PRIMARY KEY,
  couple_id UUID NOT NULL,
  title VARCHAR(255) NOT NULL,
  event_type VARCHAR(50), -- lamaran, akad, resepsi, custom
  is_public BOOLEAN DEFAULT false,
  password_protected BOOLEAN DEFAULT false,
  access_password VARCHAR(255),
  created_at TIMESTAMP
)

media (
  id UUID PRIMARY KEY,
  album_id UUID REFERENCES albums(id),
  file_url TEXT NOT NULL, -- Cloudflare R2 URL
  file_name VARCHAR(500) NOT NULL,
  file_size BIGINT NOT NULL,
  mime_type VARCHAR(100) NOT NULL,
  width INTEGER, -- for photos
  height INTEGER, -- for photos
  duration INTEGER, -- for videos (seconds)
  uploaded_by UUID REFERENCES users(id),
  description TEXT,
  created_at TIMESTAMP
)

shared_album_access (
  id UUID PRIMARY KEY,
  album_id UUID REFERENCES albums(id),
  email VARCHAR(255),
  access_token VARCHAR(255),
  can_download BOOLEAN DEFAULT true,
  can_upload BOOLEAN DEFAULT false,
  expires_at TIMESTAMP,
  created_at TIMESTAMP
)
```

**Storage Cost Analysis:**

**Assumptions:**
- Average couple uploads: 1,000 photos (5MB each) = 5GB
- 10 videos (500MB each) = 5GB
- Total per couple: 10GB

**Cloudflare R2 Pricing:**
- Storage: $0.015/GB/month
- Egress: FREE (zero egress fees)
- Class A operations (upload): $4.50/million requests
- Class B operations (download): $0.36/million requests

**Cost per Couple:**
- Storage: 10GB × $0.015 = $0.15/month = $1.80/year
- Uploads: 1,000 photos × Class A = ~$0.02 (negligible)
- Downloads: 1,000 photos × Class B = ~$0.001 (negligible)
- **Total: ~$2/year per couple**

**Revenue vs. Cost:**
- Premium subscription: Rp 499k = ~$33/year
- Storage cost: $2/year
- **Gross margin: 94%** (excellent!)

---

## Cross-Cutting Features

### Authentication & Authorization

**User Roles:**
- **Couple:** Full access to all features
- **Family Member:** Read-only access to photos, RSVP
- **Vendor:** Access to assigned tasks only
- **Admin:** Full system access

**Authentication:**
- Email/password login
- OAuth (Google, Facebook)
- JWT-based session management
- Password reset via email

### Real-Time Collaboration

**Use Case:** Both partners can add tasks/edit budget simultaneously

**Implementation:**
- WebSocket connections for real-time updates
- Conflict resolution: Last-write-wins with server timestamp
- Offline support: PWA with service worker cache

### Mobile Responsiveness

**Design Principle:** Mobile-first

**Mobile Optimization:**
- Touch-friendly UI (large buttons, swipe gestures)
- Responsive layouts (adapt to phone, tablet, desktop)
- Offline support (view checklists, budget without internet)
- Progressive Web App (PWA) for installability

---

## MVP Feature Prioritization

### Must-Have (M1)
- ✅ Wedding checklist with pre-built templates
- ✅ Budget planner with vendor tracking
- ✅ Guest list with RSVP tracking
- ✅ Photo upload + cloud storage
- ✅ Basic collaboration (couple shared access)

### Nice-to-Have (M2)
- ⏳ Seating arrangement tool (drag-drop)
- ⏳ WhatsApp integration for reminders
- ⏳ Vendor directory & booking
- ⏳ Advanced photo organization (face recognition)
- ⏳ Wedding website builder

### Future (M3+)
- ⏳ Video message feature
- ⏳ Anniversary reminders & memory timeline
- ⏳ Auto-generated wedding story videos
- ⏳ Vendor reviews & ratings

---

## Next Steps

1. ✅ Complete MVP feature specification (this document)
2. ⏳ Create Figma mockups for all features
3. ⏳ Build Go backend APIs for all features
4. ⏳ Build Tanstack Start frontend for all features
5. ⏳ Beta test with 50 couples
6. ⏳ Iterate based on feedback

---

**Last Updated:** 2026-01-06
**Version:** 0.1.0-draft
**Next Review:** After beta testing complete
