# 🔀 Beads Cross-Device Workflow

**Beads** is a local-first task management system that uses git as its synchronization backend. Unlike GitHub Issues or JIRA, beads stores everything locally in SQLite for instant queries, then periodically syncs to a special `beads-sync` branch in your git repository.

This document explains how to work with beads across multiple devices seamlessly.

---

## 📐 Architecture Overview

### Dual-Branch Structure

Beads separates your work (documentation, code) from your tasks using two branches:

| Branch | Purpose | Contents |
|:-------|:--------|:---------|
| **`main`** | Your actual work | Source code, documentation, configs |
| **`beads-sync`** | Task database | Encrypted beads database (`issues.jsonl`) |

### How It Works

```
Device A (Desktop)                    Device B (Laptop)
┌─────────────────┐                  ┌─────────────────┐
│  .beads/beads.db │                  │  .beads/beads.db │
│  (Local SQLite)  │                  │  (Local SQLite)  │
└────────┬────────┘                  └────────┬────────┘
         │                                    │
         │ bd sync                            │ bd sync
         │                                    │
         ↓                                    ↓
    ┌─────────┐                        ┌─────────┐
    │  Local  │                        │  Local  │
    │   git   │                        │   git   │
    └────┬────┘                        └────┬────┘
         │                                    │
         │ git push                           │ git pull
         │                                    │
         ↓                                    ↓
    ┌──────────────────────────────────────────┐
    │         GitHub Remote Repository         │
    ├──────────────────────────────────────────┤
    │  main branch: Your work (docs, code)     │
    │  beads-sync: Task database (JSONL)       │
    └──────────────────────────────────────────┘
```

**Key Benefits:**
- **Offline-first**: Work on tasks even without internet
- **Fast queries**: SQLite database for instant searches
- **Git-based sync**: Works with any git remote (GitHub, GitLab, etc.)
- **Conflict resolution**: Timestamp-aware merging prevents data loss
- **Complete audit trail**: Every sync creates a git commit

---

## 🚀 Initial Setup (First Device)

### Step 1: Initialize Beads

If you haven't initialized beads in your repository yet:

```bash
cd /path/to/your/repo
bd init
```

This creates:
- `.beads/beads.db` - SQLite database (gitignored)
- `.beads/config.yaml` - Beads configuration
- `.beads/issues.jsonl` - JSONL export for git sync

### Step 2: Configure Sync Branch

```bash
# Set the sync branch name (default: beads-sync)
bd config set sync.branch beads-sync
```

**Note:** This is automatically configured in Akordium Lab's `hq` repository.

### Step 3: Create Your First Tasks

```bash
# Create an epic
bd create "Product Validation" --id hq-qh7 --type epic --labels validation

# Create child items
bd create "Market research" --id hq-qh7.0 --labels validation --priority P1
bd create "Competitive analysis" --id hq-qh7.1 --labels validation --priority P1
```

### Step 4: Initial Sync

```bash
# Push to sync branch
bd sync

# Push to remote
git push origin beads-sync
```

---

## 🔄 Setting Up Additional Devices

### First Time on New Device

```bash
# 1. Clone the repository (if not already cloned)
git clone git@github.com:akordium-id/hq.git
cd hq

# 2. Initialize beads on the new device
bd init

# 3. Fetch and checkout the sync branch
git fetch origin
git checkout beads-sync

# 4. Sync beads to import all tasks
bd sync

# 5. Verify tasks are available
bd list --label-any validation
bd show hq-qh7
```

**That's it!** You now have:
- All tasks with their descriptions
- All dependencies intact
- All progress tracking preserved
- Full offline capability

---

## 💡 Daily Workflow

### Before Switching Devices (ALWAYS sync!)

```bash
# On Device A before leaving
bd sync              # Pushes local changes to beads-sync branch
git push             # Ensures both branches are on remote
```

### On the New Device

```bash
# On Device B when you start working
git pull             # Get latest from main branch
bd sync              # Pull latest beads database
# Now work on your tasks...
```

### When You're Done on the New Device

```bash
# Sync before switching back
bd sync              # Push changes back to beads-sync
git push             # Push to remote
```

---

## 🌐 Real-World Workflow Examples

### Example 1: Start Validation on Desktop, Continue on Laptop

```bash
# === ON DESKTOP ===
# View and start market sizing task
bd show hq-qh7.0          # View task details
bd update hq-qh7.0 --status in_progress

# Do research work...
vim 03-Produk/ExcelCircle/market-sizing.md

# Update validation tracker
vim 03-Produk/ExcelCircle/validasi.md

# Mark task complete and sync
bd update hq-qh7.0 --status completed
bd sync
git push

# === ON LAPTOP (later that day) ===
git pull
bd sync

# See it's completed, move to next task
bd show hq-qh7.1
bd update hq-qh7.1 --status in_progress
```

### Example 2: Collaborative Workflow (Team)

```bash
# === DEV 1 (Backend) ===
bd create "API authentication" --id api-1 --labels backend
# Creates task...
bd sync && git push

# === DEV 2 (Frontend) ===
git pull && bd sync
bd list --labels backend              # Sees api-1
bd create "Frontend auth UI" --id web-1 --deps api-1 --labels frontend
# Creates dependent task...
bd sync && git push

# === DEV 1 (Backend) ===
git pull && bd sync
bd show api-1                          # Sees web-1 depends on it
```

### Example 3: Working Offline

```bash
# === AT HOME (no internet) ===
# Update tasks locally
bd update hq-qh7.0 --status in_progress
# Work on documentation...
vim 03-Produk/ExcelCircle/market-sizing.md
# Beads works fine offline (SQLite)

# === NEXT MORNING (at office with wifi) ===
bd sync              # Syncs all offline work
git push             # Pushes to remote
```

---

## ⚙️ Useful Commands

### Viewing Tasks

```bash
# List all tasks
bd list

# List with pretty formatting
bd list --pretty

# Filter by label
bd list --label-any excelcircle

# Show specific task
bd show hq-qh7.0

# Show children of an epic
bd list --parent hq-qh7
```

### Updating Tasks

```bash
# Update status
bd update hq-qh7.0 --status in_progress
bd update hq-qh7.0 --status completed

# Add notes
bd update hq-qh7.0 --notes "Interviewed 5 users"

# Change priority
bd update hq-qh7.0 --priority P1
```

### Managing Dependencies

```bash
# Add dependency
bd dep add hq-qh7.1 hq-qh7.0            # hq-qh7.1 depends on hq-qh7.0

# Remove dependency
bd dep remove hq-qh7.1 hq-qh7.0

# Show dependencies
bd show hq-qh7.1 | grep "Depends on"
```

### Sync Status

```bash
# Check sync status
bd sync --status

# View sync branch history
git log --oneline beads-sync | head -10

# View what's in the sync branch
git show beads-sync:issues.jsonl | head
```

---

## 🔧 Configuration

### Shell Aliases (Recommended!)

Add these to your `~/.bashrc` or `~/.zshrc` for faster workflow:

```bash
# Beads sync shortcuts
alias bdsync='bd sync && git push'
alias bdpull='git pull && bd sync'
alias bdstatus='bd sync --status'

# Beads task shortcuts
alias bdlist='bd list --pretty'
alias bdopen='bd list --status open --pretty'
alias bddone='bd list --status completed --pretty'
alias bdinprogress='bd list --status in_progress --pretty'
```

**Usage:**
```bash
bdsync              # Quick sync and push
bdpull              # Pull and sync
bdopen              # Show open tasks
bdinprogress        # Show what you're working on
```

### Project-Specific Config

Edit `.beads/config.yaml` in your repository:

```yaml
# Git branch for beads commits
sync-branch: "beads-sync"

# Default actor for audit trail
actor: "najib"

# Disable auto-sync (manual sync only)
no-auto-flush: false
```

---

## ⚠️ Troubleshooting

### Conflict Resolution

If you update the same task on two devices without syncing:

```bash
# On Device A
bd update hq-qh7.0 --status in_progress
bd sync

# On Device B (before pulling Device A's changes)
bd update hq-qh7.0 --status completed
bd sync              # Detects conflict!
```

**Beads handles this by:**
1. Preserving both versions with timestamps
2. Marking the conflict in the database
3. Allowing you to choose which version to keep

```bash
# View conflicts
bd list --status conflicted

# Resolve (keep latest)
bd resolve hq-qh7.0 --keep latest

# Or keep specific version
bd resolve hq-qh7.0 --keep 2026-01-07T10:30:00
```

### Sync Branch Not Found

If you get "branch not found" error:

```bash
# Create and push the sync branch
git checkout -b beads-sync
git push origin beads-sync
git checkout main
bd sync
```

### Database Corruption (Rare)

If beads database gets corrupted:

```bash
# Rebuild from JSONL backup
bd rebuild

# Or restore from git history
git checkout beads-sync
cp issues.jsonl .beads/
bd import .beads/issues.jsonl
```

### Sync Seems Stuck

```bash
# Check beads daemon status
bd daemon status

# Restart daemon if needed
bd daemon restart

# Force direct mode (bypass daemon)
bd sync --no-daemon
```

---

## 📊 Best Practices

### 1. **Sync Before Switching Devices**

Always run `bd sync && git push` before leaving a device. This becomes muscle memory quickly.

### 2. **Use Descriptive Task IDs**

Use hierarchical IDs for better organization:
```
hq-qh7         - Epic (Product Validation)
hq-qh7.0       - Phase 0, Task 0
hq-qh7.1.0     - Phase 1, Task 0
```

### 3. **Set Up Dependencies Early**

Configure dependencies when creating tasks to enforce workflow:
```bash
bd create "Phase 1 task" --id hq-qh7.1.0 --deps hq-qh7.0
```

### 4. **Use Labels for Filtering**

Create consistent label sets:
```bash
# Product-specific labels
bd list --label-any excelcircle
bd list --label-any anggarin

# Type labels
bd list --label-any validation
bd list --label-any backend
```

### 5. **Document Task Templates**

Create reusable task templates in your repo:
```bash
# .beads/templates/validation.md
## Task: [Name]

**Description:**
- [ ] Research question 1
- [ ] Research question 2
- [ ] Document findings

**Deliverable:** [What you'll produce]

**Links:**
- Documentation: /path/to/docs.md
- Related issues: [issue-id]
```

### 6. **Regular Maintenance**

```bash
# Weekly cleanup (close old completed tasks)
bd list --status completed --closed-before "2025-12-01"
bd close [ids...]

# Archive old tasks (create archive project)
bd create "Archive 2024" --type project
bd move [old-task-ids] --parent "Archive 2024"
```

### 7. **Team Coordination**

For team workflows:
- **Sync at least daily** if multiple people work on related tasks
- **Communicate** which tasks you're working on (assign tasks to yourself)
- **Review sync branch** occasionally: `git log beads-sync`

---

## 📚 Additional Resources

### Beads Documentation
- GitHub: https://github.com/braydonf/beads
- CLI Reference: Run `bd --help` or `bd [command] --help`

### Internal Documentation
- `/01-SOP/workflow-git.md` - Git workflow
- `/01-SOP/manajemen-tugas.md` - Task management principles
- `/02-Tech-Docs/` - Technical documentation

### Quick Reference Card

```
═══════════════════════════════════════════════════════════
                    BEADS QUICK REFERENCE
═══════════════════════════════════════════════════════════

TASK MANAGEMENT:
  bd create "Title"              Create new task
  bd show <id>                   Show task details
  bd list                        List all tasks
  bd list --pretty               Pretty format
  bd list --label <label>        Filter by label
  bd update <id> --status <s>    Update status

SYNC:
  bd sync                        Sync to git
  git push                       Push to remote
  git pull && bd sync            Pull and sync

DEPENDENCIES:
  bd dep add <id> <dep-id>       Add dependency
  bd dep remove <id> <dep-id>    Remove dependency

SHELL ALIASES (add to ~/.bashrc):
  alias bdsync='bd sync && git push'
  alias bdpull='git pull && bd sync'

═══════════════════════════════════════════════════════════
```

---

## 🎓 Summary

**Beads gives you:**
1. ✅ **Local SQLite database** - Fast queries, offline-capable
2. ✅ **Git-based sync** - Works with any git remote
3. ✅ **Automatic conflict handling** - Timestamp-aware merging
4. ✅ **Complete audit trail** - Every sync creates a commit
5. ✅ **Branch isolation** - Tasks in `beads-sync`, work in `main`

**The Golden Rule:**
> **Always sync before switching devices.**
> `bd sync && git push` ← Your best friend

**Your task management is now portable across any device with git access!** 🎉

---

*Last updated: 2026-01-07*
*Maintained by: Akordium Lab Team*
