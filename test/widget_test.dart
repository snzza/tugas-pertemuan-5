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

    // Daftar pengalaman: 4 item terpisah, bukan string menyatu.
    await tester.scrollUntilVisible(
      find.text('Pengembang Mini App - Burikin Meme'),
      100.0,
    );
    expect(
      find.text('Pengembang Mini App - Burikin Meme'),
      findsOneWidget,
    );
    await tester.scrollUntilVisible(
      find.text('Pengembang Bot Telegram - Fsubku'),
      100.0,
    );
    expect(find.text('Pengembang Bot Telegram - Fsubku'), findsOneWidget);
    expect(
      find.text(
        'Pengembang Bot Telegram - FsubkuPengembang Mini App - Burikin Meme',
      ),
      findsNothing,
    );
  });
}
