# Kontribusi ke Akordium Lab HQ

Repository ini adalah Single Source of Truth (SSOT) untuk semua dokumentasi Akordium Lab. Setiap kontribusi harus mempertahankan kualitas dan konsistensi informasi.

## 📝 Cara Mengedit Dokumentasi

### Prinsip Dasar
Repo ini adalah **Single Source of Truth**. Jika tidak ada di sini, itu belum resmi.

### Via Web Browser (Untuk Non-Developer)

**Cara tercepat tanpa install Git:**

1. **Buka Repository** di browser
2. **Tekan tombol `.` (titik)** di keyboard untuk masuk ke VS Code Web
3. **Edit file** yang diinginkan langsung di browser
4. **Klik icon Source Control** (atau tekan `Ctrl+Shift+G`)
5. **Tulis commit message** yang jelas
6. **Click "Commit & Push"**

**✅ Cocok untuk:**
- Typo fixes
- Update kecil (<10 baris)
- Non-developer team members
- Quick documentation updates

### Via Git CLI (Untuk Developer)

**Untuk perubahan yang lebih kompleks:**

```bash
# 1. Sync dulu dengan main branch
git checkout main
git pull upstream main

# 2. Buat branch baru
git checkout -b docs/update-onboarding-checklist
# atau: git checkout -b fix/typo-dokumentasi
# atau: git checkout -b feat/add-automation-guide

# 3. Edit file-file yang diperlukan

# 4. Add dan commit changes
git add .
git commit -m "docs: update onboarding checklist"

# 5. Push ke repository
git push origin docs/update-onboarding-checklist

# 6. Buat Pull Request di GitHub
```

**✅ Cocok untuk:**
- Perubahan besar (>10 baris)
- Multiple files changes
- Technical documentation updates
- SOP atau process changes

## 🏷️ Naming Conventions

### File & Folder Names
- **File**: `kebab-case.md` (gunakan hubungan-strip)
- **Folder**: `PascalCase` atau `01-Kebab-Case`
- **Contoh benar**: `setup-go-env.md`, `10-Automation/`, `03-Produk/`
- **Contoh salah**: `Setup Go Env.md`, `automation/`, `products/`

### Commit Message Format
```bash
# Format: type: description (singkat, jelas)
docs: update onboarding checklist
fix: correct git workflow steps
feat: add GitHub Actions guide
chore: update emergency contacts
```

**Types yang digunakan:**
- `docs:` - Perubahan dokumentasi
- `feat:` - Tambah fitur/guide baru
- `fix:` - Perbaikan error/typo
- `refactor:` - Restruktur dokumentasi
- `chore:` - Maintenance minor

## ⚡ Quick Review Process

### Simple Changes (Direct to Main)
- **Typo fixes** (<5 baris): Langsung merge ke main
- **Grammar fixes**: Tidak perlu review
- **Link corrections**: Langsung merge

### Small Changes (1 Approver)
- **Updates <100 lines**: 1 approver cukup
- **Non-SOP documentation**: 1 review
- **Template updates**: 1 approver

### Large Changes (2 Approvers)
- **SOP changes**: 2 approvers mandatory
- **New guides**: 2 reviews
- **Process changes**: 2 approvals

---

## Cara Berkontribusi

### 1. Issue & Discussion

Gunakan GitHub Issues untuk:

- **Bug Reports** - Template `bug-report.md`
- **Feature Requests** - Template `feature-request.md`
- **Access Requests** - Template `akses-request.md`
- **Product Ideas** - Template `ide-produk.md`
- **Admin Requests** - Template `request_admin.md`

### 2. Making Changes

#### Fork & Clone

```bash
# Fork repository via GitHub UI
git clone https://github.com/YOUR_USERNAME/akordium-hq.git
cd akordium-hq
git remote add upstream https://github.com/akordium/akordium-hq.git
```

#### Branch Strategy

```bash
# Sync dengan main terlebih dahulu
git checkout main
git pull upstream main

# Buat branch baru
git checkout -b feat/deskripsi-perubahan
# atau
git checkout -b docs/update-standar
# atau
git checkout -b fix/typo-dokumentasi
```

#### Branch Naming Convention

- `feat/` - Fitur baru atau improvement
- `fix/` - Bug fix atau perbaikan
- `docs/` - Perubahan dokumentasi
- `refactor/` - Refactoring dokumentasi
- `chore/` - Maintenance, update minor

### 3. Commit Standards

Gunakan [Conventional Commits](https://www.conventionalcommits.org/) format:

```bash
# Format: type(scope): description

feat(techdocs): add Go migration guide
fix(sop): correct git workflow steps
docs(onboarding): update developer setup instructions
refactor(all): restructure documentation categories
chore(deps): update GitHub templates
```

#### Commit Types

- **feat** - Fitur atau improvement baru
- **fix** - Bug fix atau koreksi
- **docs** - Perubahan dokumentasi
- **style** - Formatting, whitespace, semicolon changes
- **refactor** - Refactoring kode atau dokumentasi
- **chore** - Maintenance tasks, dependency updates

### 4. Pull Request Process

#### Sebelum Membuat PR

1. Pastikan branch sudah up-to-date dengan main
2. Test semua perubahan (buka file-file yang diubah)
3. Pastikan formatting konsisten
4. Update CHANGELOG.md jika perubahan signifikan

#### Membuat PR

1. Push branch ke fork Anda
2. Buka Pull Request dengan template yang tersedia
3. Isi semua section yang relevan
4. Tag reviewer yang sesuai

#### PR Review Process

- **Minimum 1 approval** dari team member
- **Automated checks** harus passing
- **Documentation review** untuk perubahan teknis
- **Business review** untuk perubahan proses

### 5. Kategori Kontribusi

#### Technical Documentation (`/02-Tech-Docs/`)

- Coding standards dan conventions
- Architecture patterns
- Development workflow
- Infrastructure guides
- API documentation

#### SOP Documentation (`/01-SOP/`)

- Operational procedures
- Team workflows
- Communication guidelines
- Quality assurance processes

#### Product Documentation (`/03-Produk/`)

- Product specifications
- Requirements documentation
- User stories
- Technical specifications

#### Onboarding (`/00-Onboarding/`)

- New hire guides
- Developer setup instructions
- Team introduction materials

#### Marketing & Brand (`/04-Marketing-Brand/`)

- Brand guidelines
- Marketing materials
- Social media templates
- Press kit materials

### 6. Quality Standards

#### Content Guidelines

- **Bahasa Indonesia** untuk user-facing documentation
- **Bahasa Inggris** untuk technical terms
- **Clear structure** dengan headings dan subheadings
- **Action-oriented language** untuk instructions
- **Examples dan screenshots** jika applicable

#### Formatting Standards

- **Markdown** formatting yang konsisten
- **Code blocks** dengan syntax highlighting
- **Proper links** ke related documentation
- **Table of contents** untuk dokumen panjang
- **Consistent file naming** (kebab-case)

#### Review Checklist

- [ ] Content accurate dan up-to-date
- [ ] Grammar dan spelling checked
- [ ] Links work properly
- [ ] Images optimized sized
- [ ] Template compliance
- [ ] CHANGELOG updated (jika significant)

### 7. Release & Deployment

Repository ini menggunakan GitHub Pages untuk deployment otomatis:

- **Main branch** otomatis terdeploy ke https://akordium.github.io/akordium-hq/
- **Draft content** bisa di preview via GitHub preview
- **Version control** untuk tracking perubahan documentation

### 8. Getting Help

#### Discord/Slak Channel

- `#documentation` - Umum tentang dokumentasi
- `#technical-standards` - Konvensi teknis
- `#workflow-sop` - Proses kerja

#### Direct Contact

- **Documentation Owner**: Najib (Backend Lead)
- **Review Timeline**: 1-2 business days
- **Urgent Changes**: Tag `@najib` in issues

### 9. Guidelines Spesifik

#### API Documentation

- Gunakan OpenAPI/Swagger spec
- Include example requests/responses
- Document authentication methods
- Specify rate limits

#### Code Examples

- Always include working examples
- Use proper syntax highlighting
- Add comments for complex logic
- Test examples before publishing

#### Security Documentation

- Never include credentials in docs
- Use placeholders for sensitive data
- Document security best practices
- Include vulnerability reporting process

## 🚀 Quick Reference & FAQ

### Common Scenarios

#### Saya mau update nomor telepon di README
```bash
# Cara 1: Via Web (rekomendasi)
1. Buka repo di browser
2. Tekan `.` untuk VS Code Web
3. Edit README.md
4. Commit: "fix: update emergency contact number"

# Cara 2: Via Git
git checkout -b fix/update-contact
# Edit README.md
git add README.md
git commit -m "fix: update emergency contact number"
git push origin fix/update-contact
```

#### Saya mau menambah SOP baru
```bash
# Must use Git (complex changes)
git checkout -b docs/add-leave-request-sop
# Buat file baru: 01-SOP/leave-request.md
git add 01-SOP/leave-request.md
git commit -m "docs: add leave request SOP"
git push origin docs/add-leave-request-sop
# Buat PR (perlu 2 approvers untuk SOP)
```

#### Saya mau fix typo di banyak file
```bash
# Via Git untuk multiple changes
git checkout -b fix/typos-across-docs
# Edit semua file yang ada typo
git add .
git commit -m "fix: correct typos in documentation"
git push origin fix/typos-across-docs
```

### Troubleshooting

#### ❌ Cannot Push via Web
- **Causa**: Tidak punya write access
- **Solution**: Request access via [Akses Request](../../issues/new?assignees=&labels=&template=akses-request.md)

#### ❌ Merge Conflict
```bash
# Pull latest changes dulu
git checkout main
git pull upstream main

# Rebase branch Anda
git checkout nama-branch-anda
git rebase main

# Fix conflicts lalu continue
git add .
git rebase --continue
git push --force-with-lease origin nama-branch-anda
```

#### ❌ GitHub Actions Failed
- **Check**: Commit message format (menggunakan `type: description`)
- **Check**: File naming convention (kebab-case.md)
- **Fix**: Buka PR dan lihat error messages

### Pro Tips

#### 👍 Best Practices
- **Commit kecil**: Satu change per commit
- **Message jelas**: `docs: add x` vs `update docs`
- **Preview**: Check changes di GitHub preview
- **Links**: Test semua links setelah edit

#### 🎯 Before You Commit
1. **Read changes**: Review diff Anda
2. **Test links**: Buka semua links yang ditambah
3. **Check format**: Pastikan Markdown valid
4. **Proofread**: Check grammar dan spelling

#### 📱 Mobile Editing
- Buka repo di mobile browser
- Tap `...` menu → "Edit file"
- Gunakan simplified commit message
- Khusus untuk emergency fixes only

---

**Terima kasih atas kontribusi Anda!** 🎉

Setiap kontribusi membantu meningkatkan kualitas dan consistency dokumentasi Akordium Lab. Jika ada pertanyaan, jangan ragu untuk membuka issue atau diskusi.

**Butuh bantuan?**
- 🆘 **Emergency**: Najib (WhatsApp: +62-812-3456-7890)
- 💬 **General**: [GitHub Discussions](https://github.com/akordium-id/akordium-hq/discussions)
- 📋 **Issues**: [Create New Issue](../../issues/new)
