import 'package:flutter_test/flutter_test.dart';

import 'package:belajar_flutt/main.dart';

void main() {
  testWidgets('Profile page renders with fixed experience list', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MainApp());

    // Header, identitas, tombol, dan statistik.
    expect(find.text('Profil Pengguna'), findsOneWidget);
    expect(find.text('I Ketut Gunawan, S.Kom, M.T.I.'), findsOneWidget);
    expect(find.text('Senior Backend Engineer & Dosen'), findsOneWidget);
    expect(find.text('Edit Profil'), findsOneWidget);
    expect(find.text('Proyek'), findsOneWidget);
    expect(find.text('Followers'), findsOneWidget);
    expect(find.text('Following'), findsOneWidget);
    expect(find.text('Pengalaman Kerja'), findsOneWidget);

    // Daftar pengalaman: 4 item terpisah, bukan 3 karena string menyatu.
    await tester.scrollUntilVisible(
      find.text('Backend Engineer - Pengembangan Sistem E-money'),
      100.0,
    );
    expect(
      find.text('Backend Engineer - Pengembangan Sistem E-money'),
      findsOneWidget,
    );
    await tester.scrollUntilVisible(
      find.text('Lead Developer - Aplikasi Sekurindo'),
      100.0,
    );
    expect(find.text('Lead Developer - Aplikasi Sekurindo'), findsOneWidget);
    expect(
      find.text(
        'Lead Developer - Aplikasi SekurindoBackend Engineer - Pengembangan Sistem E-money',
      ),
      findsNothing,
    );
  });
}
