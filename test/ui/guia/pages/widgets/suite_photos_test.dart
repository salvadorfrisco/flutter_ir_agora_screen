import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import 'package:flutter_ir_agora_screen/ui/guia/widgets/suite_photo.dart';
import 'package:flutter_ir_agora_screen/ui/guia/pages/suite_photos_page.dart';

@GenerateMocks([])
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

  Widget createTestWidget({
    required String photo,
    required String name,
    required List<String> photos,
    int? qtd,
    bool exibirQtdDisponiveis = false,
  }) {
    return MaterialApp(
      home: Scaffold(
        body: SuitePhoto(
          photo: photo,
          name: name,
          photos: photos,
          qtd: qtd,
          exibirQtdDisponiveis: exibirQtdDisponiveis,
        ),
      ),
    );
  }

  testWidgets('Navega para SuitePhotosPage ao tocar na imagem',
      (WidgetTester tester) async {
    await tester.pumpWidget(createTestWidget(
      photo: 'https://via.placeholder.com/150',
      name: 'Suite Luxo',
      photos: ['https://via.placeholder.com/150'],
    ));

    await tester.tap(find.byType(GestureDetector));
    await tester.pumpAndSettle();

    // Verifica se a página de fotos da suíte é exibida
    expect(find.byType(SuitePhotosPage), findsOneWidget);
  });

  testWidgets('Exibe a quantidade disponível quando necessário',
      (WidgetTester tester) async {
    await tester.pumpWidget(createTestWidget(
      photo: 'https://via.placeholder.com/150',
      name: 'Suite Luxo',
      photos: ['https://via.placeholder.com/150'],
      qtd: 3,
      exibirQtdDisponiveis: true,
    ));

    // Verifica se o texto "só mais 3 pelo app" é exibido
    expect(find.text('só mais 3 pelo app'), findsOneWidget);
  });
}
