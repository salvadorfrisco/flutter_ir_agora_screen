import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ir_agora_screen/ui/guia/pages/suite_photos_page.dart';

// Função para mockar carregamento de imagens
void mockNetworkImages() {
  TestWidgetsFlutterBinding.ensureInitialized();

  // Intercepta chamadas da NetworkImage e retorna um placeholder
  FlutterError.onError = (FlutterErrorDetails details) {
    if (details.exception.toString().contains('NetworkImageLoadException')) {
      debugPrint('Interceptando erro de imagem de rede para testes.');
    } else {
      FlutterError.presentError(details);
    }
  };
}

void main() {
  final List<String> mockPhotos = [
    'https://via.placeholder.com/150',
    'https://via.placeholder.com/151',
    'https://via.placeholder.com/152',
    'https://via.placeholder.com/153',
  ];

  const String mockSuiteName = 'Suite Test';

  Widget createTestWidget() {
    return MaterialApp(
      home: SuitePhotosPage(
        photos: mockPhotos,
        suiteName: mockSuiteName,
      ),
    );
  }

  testWidgets('deve exibir a primeira foto em tamanho grande', (tester) async {
    mockNetworkImages(); // Intercepta carregamento de imagens

    await tester.pumpWidget(createTestWidget());

    final firstImageFinder = find.byType(Image);
    expect(firstImageFinder, findsWidgets);

    final Image firstImage = tester.widget(firstImageFinder.first);
    expect(
      (firstImage.image as NetworkImage).url,
      equals(mockPhotos[0]),
    );
  });
}
