# Tugas Pertemuan 5 — Halaman Profil Flutter

Aplikasi halaman profil dari materi KB1185 (layout, komposisi widget, dan
Extract Widget). Kode dari materi diperbaiki dari bug yang sengaja disisipkan,
lalu di-refactor menjadi widget reusable. Kode dibagi menjadi dua file
sesuai materi: `lib/main.dart` dan `lib/profile_page.dart`.

Data profil memakai data sendiri (nama, jabatan, dan daftar pengalaman
placeholder).

## Struktur

- `lib/main.dart` — `MainApp`, `LayoutRulesExample`, `MyPages1`, `MyPages2`,
  `MyPages3`, `ContohPohonWidget`, dan `PercobaanAturan3`
- `lib/profile_page.dart` — `ProfilePage`, `ProfileAvatar`, `ProfileInfo`,
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

## Penyesuaian ke soal (2026-11-02)

6. **`MyPages1` dikembalikan ke contoh modul.** Sebelumnya constraints diubah
   menjadi maks 1000x1000, kotak menjadi merah, dan teks menjadi lelucon,
   sehingga demo aturan constraints/size tidak lagi terbukti (hasilnya
   500x100, bukan 200x100) dan bertentangan dengan teks penjelasan di
   atasnya. Dikembalikan persis ke modul: constraints maks 200x200, kotak
   biru, teks `'Saya minta 500x50, tapi dapatnya 200x100'`.
7. **`PercobaanAturan3` ditambahkan.** Eksperimen dari modul yang belum ada:
   `Center` di-comment sehingga Container induk meneruskan tight constraints
   200x200 langsung ke anak, dan kotak merah yang minta 80x80 dipaksa
   memenuhi 200x200.
8. **Tombol Edit Profil awalnya memakai versi statis dari modul** (`SnackBar`
   `'Fitur edit belum aktif pada modul statis.'`), sesuai blok kode final
   materi. Versi ini digantikan oleh poin 9.
9. **Hari 4 lanjutan: dialog edit profil.** `ProfilePage` diubah dari
   `StatelessWidget` menjadi `StatefulWidget` dengan `userName` di state
   class. Tombol Edit Profil membuka dialog berisi `TextFormField`
   (terisi nama saat ini); tombol Simpan memperbarui `userName` lewat
   `setState()` sehingga nama di layar utama berubah, tombol Batal
   membatalkan, dan nama kosong diabaikan.
10. **Struktur dua file sesuai materi (2026-11-02).** `ProfilePage` dan
    widget profil dipisah ke `profile_page.dart`; `main.dart` berisi
    `MainApp` dan kelas demo layout. Data profil tetap memakai data
    sendiri, karena halaman ini adalah profil pembuatnya.

## Verifikasi

- `flutter analyze` — 0 issue
- `flutter test` — 1/1 lolos, termasuk pengecekan bahwa string pengalaman yang
  menyatu sudah tidak ada dan keempat pengalaman muncul

## Menjalankan

```sh
flutter run
flutter test
```
