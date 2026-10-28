import 'package:flutter_test/flutter_test.dart';

import 'package:belajar_flutt/main.dart';

void main() {
  testWidgets('Profile page renders with fixed experience list', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MainApp());

    // Header, identitas, tombol, dan statistik.
    expect(find.text('Profil Pengguna'), findsOneWidget);
    expect(find.text('Rico Adi Pratama'), findsOneWidget);
    expect(find.text('Mahasiswa Teknik Informatika'), findsOneWidget);
    expect(find.text('Edit Profil'), findsOneWidget);
    expect(find.text('Proyek'), findsOneWidget);
    expect(find.text('Followers'), findsOneWidget);
    expect(find.text('Following'), findsOneWidget);
    expect(find.text('Pengalaman Kerja'), findsOneWidget);

    // Daftar pengalaman: 4 item placeholder terpisah, bukan string menyatu.
    await tester.scrollUntilVisible(
      find.text('Pengalaman 4'),
      100.0,
    );
    expect(
      find.text('Pengalaman 4'),
      findsOneWidget,
    );
    await tester.scrollUntilVisible(
      find.text('Pengalaman 3'),
      100.0,
    );
    expect(find.text('Pengalaman 3'), findsOneWidget);
    expect(
      find.text(
        'Pengalaman 3Pengalaman 4',
      ),
      findsNothing,
    );
  });
}
