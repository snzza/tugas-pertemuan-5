# Tugas Pertemuan 5 — Halaman Profil

Aplikasi profil Flutter dari materi KB1185 (layout, komposisi widget,
Extract Widget). Kodenya dibagi dua file: `lib/main.dart` dan
`lib/profile_page.dart`.

## Isi

- `lib/main.dart` — MainApp, sama contoh layout (LayoutRulesExample,
  MyPages1/2/3, ContohPohonWidget, PercobaanAturan3)
- `lib/profile_page.dart` — ProfilePage, ProfileAvatar, ProfileInfo,
  ProfileStats, StatItem, ExperienceCard
- `test/widget_test.dart` — tes halaman profil

## Yang diperbaiki dari kode materi

1. Koma hilang di daftar pengalaman, 4 item jadi nyatu 3 — ditambahin
   komanya.
2. `SizedBox(width: 16)` di Column nggak muncul jaraknya — jadi
   `SizedBox(height: 16)`.
3. `SizedBox(height: 24)` di Row nggak muncul jaraknya — jadi
   `SizedBox(width: 24)`.
4. `StatItem(count: 42)` int dikirim ke parameter String — jadi `'42'`.
5. ListView langsung di Column error — dibungkus `Expanded`.
6. MyPages1 dibalikin ke contoh modul (constraints maks 200, kotak biru).
7. Tombol Edit Profil sekarang buka dialog edit nama (StatefulWidget +
   setState), bukan SnackBar lagi.

## Jalanin

```sh
flutter run
flutter test
```
