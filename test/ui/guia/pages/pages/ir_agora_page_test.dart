import 'package:flutter/material.dart';
import 'package:flutter_ir_agora_screen/domain/models/motel.dart';
import 'package:flutter_ir_agora_screen/ui/guia/view_model/motel_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:flutter_ir_agora_screen/ui/guia/pages/ir_agora_page.dart';
import 'package:flutter_ir_agora_screen/ui/guia/widgets/header_guia.dart';
import 'package:flutter_ir_agora_screen/ui/guia/widgets/suite_carousel.dart';
import 'ir_agora_page_test.mocks.dart';
import 'dart:io';

@GenerateMocks([MotelViewModel])
class TestHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  late MockMotelViewModel mockViewModel;

  setUpAll(() {
    HttpOverrides.global = TestHttpOverrides();
    TestWidgetsFlutterBinding.ensureInitialized();
    mockViewModel = MockMotelViewModel();
  });

  Widget createTestWidget() {
    return MaterialApp(
      home: ChangeNotifierProvider<MotelViewModel>.value(
        value: mockViewModel,
        child: const IrAgoraPage(),
      ),
    );
  }

  Future<void> pumpTestWidget(WidgetTester tester) async {
    await tester.pumpWidget(createTestWidget());
    await tester.pump(const Duration(milliseconds: 100));
  }

  testWidgets('Exibe o indicador de carregamento quando estiver carregando',
      (WidgetTester tester) async {
    when(mockViewModel.isLoading).thenReturn(true);
    when(mockViewModel.error).thenReturn(null);
    when(mockViewModel.loadMotel()).thenAnswer((_) async {});
    when(mockViewModel.motel).thenReturn(null);

    await pumpTestWidget(tester);

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('Exibe mensagem de erro quando ocorre um erro',
      (WidgetTester tester) async {
    when(mockViewModel.isLoading).thenReturn(false);
    when(mockViewModel.error).thenReturn('Erro ao carregar dados');
    when(mockViewModel.loadMotel()).thenAnswer((_) async {});
    when(mockViewModel.motel).thenReturn(null); // Stub para 'motel'

    await pumpTestWidget(tester);

    expect(find.text('Erro ao carregar dados'), findsOneWidget);
  });

  testWidgets(
      'Exibe os widgets Header e SuiteCarousel quando os dados são carregados',
      (WidgetTester tester) async {
    when(mockViewModel.isLoading).thenReturn(false);
    when(mockViewModel.error).thenReturn(null);
    when(mockViewModel.loadMotel()).thenAnswer((_) async {});
    when(mockViewModel.motel).thenReturn(mockMotelData());

    await pumpTestWidget(tester);

    expect(find.byType(Header), findsOneWidget);
    expect(find.byType(SuiteCarousel), findsOneWidget);
  });
}

// Dados mockados de motel
Motel mockMotelData() {
  return Motel(
    logo: 'https://via.placeholder.com/150', // URL que funciona nos testes
    fantasia: 'Motel Teste',
    distancia: 2.5,
    bairro: 'Centro',
    media: 4.5,
    qtdAvaliacoes: 100,
    suites: [],
  );
}
