# Kontribusi ke Akordium Lab HQ

Repository ini adalah Single Source of Truth (SSOT) untuk semua dokumentasi Akordium Lab. Setiap kontribusi harus mempertahankan kualitas dan konsistensi informasi.

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

---

**Terima kasih atas kontribusi Anda!** 🎉

Setiap kontribusi membantu meningkatkan kualitas dan consistency dokumentasi Akordium Lab. Jika ada pertanyaan, jangan ragu untuk membuka issue atau diskusi.
