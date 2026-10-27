# Tugas Pertemuan 5 — Halaman Profil Flutter

Aplikasi halaman profil dari materi KB1185 (layout, komposisi widget, dan
Extract Widget). Kode dari materi diperbaiki dari bug yang sengaja disisipkan,
lalu di-refactor menjadi widget reusable. Seluruh kode berada di satu file,
`lib/main.dart`.

Data profil (nama, jabatan, dan daftar pengalaman) diambil dari contoh kode
materi.

## Struktur

- `lib/main.dart` — `MainApp`, `ProfilePage`, `ProfileAvatar`, `ProfileInfo`,
  `ProfileStats`, `StatItem`, dan `ExperienceCard`
- `test/widget_test.dart` — smoke test halaman profil

## Perbaikan dari kode materi

1. **Koma hilang di daftar pengalaman.** Setelah
   `'Lead Developer - Aplikasi Sekurindo'` tidak ada koma, sehingga di Dart
   string tersebut menyatu dengan string berikutnya dan 4 pengalaman tampil
   menjadi 3. Koma ditambahkan sehingga keempat pengalaman tampil terpisah.
2. **Spasi vertikal salah sumbu.** `SizedBox(width: 16)` dipakai sebagai jarak
   antara avatar dan nama di dalam `Column`, padahal `Column` tersusun vertikal
   sehingga jaraknya tidak muncul. Diubah menjadi `SizedBox(height: 16)`.
3. **Spasi horizontal salah sumbu.** `SizedBox(height: 24)` dipakai sebagai
   jarak antar `StatItem` di dalam `Row`, padahal `Row` tersusun horizontal
   sehingga jaraknya tidak muncul. Diubah menjadi `SizedBox(width: 24)`.
4. **Tipe data salah di `StatItem`.** `StatItem(count: 42, ...)` mengirim `int`
   ke parameter `count` yang bertipe `String`, sehingga kode gagal compile.
   Diubah menjadi `StatItem(count: '42', ...)`.
5. **`ListView` tanpa batas tinggi.** `ListView.builder` diletakkan langsung di
   dalam `Column` tanpa pembungkus, sehingga mendapat tinggi tak terbatas dan
   menimbulkan runtime error. Dibungkus dengan `Expanded` agar mengisi sisa
   ruang yang tersedia dan bisa di-scroll.

## Verifikasi

- `flutter analyze` — 0 issue
- `flutter test` — 1/1 lolos, termasuk pengecekan bahwa string pengalaman yang
  menyatu sudah tidak ada dan keempat pengalaman muncul

## Menjalankan

```sh
flutter run
flutter test
```
