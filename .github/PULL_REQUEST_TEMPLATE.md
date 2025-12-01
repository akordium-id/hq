## Deskripsi Perubahan
Jelaskan secara ringkas perubahan apa yang Anda buat.

## Context & Motivation
Mengapa perubahan ini perlu dilakukan? Apa masalah yang diselesaikan?

## Tipe Perubahan
- [ ] **Bug fix** - Perbaikan bug non-breaking
- [ ] **New feature** - Fitur baru non-breaking
- [ ] **Breaking change** - Perubahan yang breaking compatibility
- [ ] **Documentation** - Update dokumentasi saja
- [ ] **Refactoring** - Kode refactoring tanpa perubahan fungsi
- [ ] **Performance** - Improvement performansi
- [ ] **Hotfix** - Patch urgent untuk production

## Checklist Testing
### Testing Manual
- [ ] Fitur berfungsi sesuai expected behavior
- [ ] User interface tidak ada broken elements
- [ ] Responsive design works on mobile
- [ ] Error handling works properly

### Testing Otomatis (jika applicable)
- [ ] Unit tests passing
- [ ] Integration tests passing
- [ ] E2E tests passing

### Cross-browser Testing
- [ ] Chrome (latest)
- [ ] Firefox (latest)
- [ ] Safari (latest)
- [ ] Edge (latest)

## Checklist Code Quality
- [ ] Code follows coding standards perusahaan
- [ ] Functions dan classes memiliki proper documentation
- [ ] Tidak ada hardcoded values atau sensitive data
- [ ] Error handling sudah implementasi
- [ ] Performance considerations sudah diperiksa
- [ ] Security review sudah dilakukan (jika applicable)

## Dampak Perubahan
### Database Changes
- [ ] **Migration required** - Jelaskan perubahan schema:
- [ ] **Data migration needed** - Jelaskan:
- [ ] **No database changes**

### API Changes
- [ ] **Breaking changes** - Endpoint yang terpengaruh:
- [ ] **New endpoints added**:
- [ ] **No API changes**

### Configuration Changes
- [ ] **Environment variables needed**:
- [ ] **Config file changes**:
- [ ] **No config changes**

## Screenshots/Demo
Jika ada perubahan UI, tambahkan screenshots atau GIF demo:
1.
2.
3.

## Dokumentasi yang Perlu Diupdate
- [ ] API Documentation
- [ ] User Guide
- [ ] Technical Documentation
- [ ] README.md
- [ ] Tidak ada

## Breaking Changes Checklist
### Jika ini breaking change:
- [ ] Sudah discuss dengan stakeholders
- [ ] Migration plan sudah disiapkan
- [ ] Communication plan ke users sudah dibuat
- [ ] Rollback plan sudah disiapkan

## Deployment Notes
### Pre-deployment
- [ ] Backup database dibutuhkan
- [ ] Maintenance window diperlukan
- [ ] Dependencies perlu di-update
- [ ] Cache invalidation diperlukan

### Post-deployment
- [ ] Need data verification
- [ ] Need monitoring setup
- [ ] Need user notification
- [ ] No special actions needed

## Reviewer Notes
Pertanyaan atau catatan khusus untuk reviewer:

## Related Issues
Closes #(issue number)
Fixes #(issue number)
Relates to #(issue number)

## Test Instructions
Bagaimana cara tester untuk mereproduksi dan test perubahan ini?
1.
2.
3.

## Additional Context
Informasi tambahan yang relevan tentang PR ini.