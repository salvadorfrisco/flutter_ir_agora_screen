import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ir_agora_screen/ui/guia/pages/suite_photos_page.dart';

class TestHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  setUpAll(() {
    HttpOverrides.global = TestHttpOverrides();
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  final List<String> mockPhotos = [
    'https://via.placeholder.com/150',
    'https://via.placeholder.com/151',
    'https://via.placeholder.com/152',
    'https://via.placeholder.com/153',
  ];

  Widget createTestWidget() {
    return MaterialApp(
      home: SuitePhotosPage(
        photos: mockPhotos,
        suiteName: 'Suite Test',
      ),
    );
  }

  testWidgets('deve exibir a primeira foto em tamanho grande', (tester) async {
    await tester.pumpWidget(createTestWidget());
    await tester.pumpAndSettle();

    final firstImageFinder = find.byType(Image);
    expect(firstImageFinder, findsWidgets);

    final Image firstImage = tester.widget(firstImageFinder.first);

    // Verifica se a primeira foto é exibida
    expect(
      (firstImage.image as NetworkImage).url,
      equals(mockPhotos[0]),
    );
  });
}
