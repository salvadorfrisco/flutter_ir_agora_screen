import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ir_agora_screen/ui/guia/widgets/suite_card.dart';
import 'package:flutter_ir_agora_screen/ui/guia/widgets/suite_photo.dart';
import 'package:flutter_ir_agora_screen/ui/guia/widgets/itens_category_card.dart';
import 'package:flutter_ir_agora_screen/ui/guia/widgets/period_card.dart';
import 'package:flutter_ir_agora_screen/domain/models/suite.dart';
import 'package:flutter_ir_agora_screen/domain/models/period.dart';
import 'package:flutter_ir_agora_screen/domain/models/category_item.dart';

class TestHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  group('SuiteCard Widget Tests', () {
    late Suite mockSuite;

    setUpAll(() {
      HttpOverrides.global = TestHttpOverrides();
      TestWidgetsFlutterBinding.ensureInitialized();

      mockSuite = Suite(
        nome: 'Suite Luxo',
        fotos: [
          'https://via.placeholder.com/150',
          'https://via.placeholder.com/151',
        ],
        qtd: 2,
        exibirQtdDisponiveis: true,
        categoriaItens: [
          CategoryItem(nome: 'TV', icone: 'https://example.com/tv.png'),
          CategoryItem(nome: 'Wi-Fi', icone: 'https://example.com/wifi.png'),
          CategoryItem(nome: 'Cama King', icone: 'https://example.com/bed.png'),
        ],
        periodos: [
          Period(
            tempoFormatado: 'Manhã',
            valor: 150.0,
            valorTotal: 150.0,
          ),
          Period(
            tempoFormatado: 'Noite',
            valor: 200.0,
            valorTotal: 200.0,
          ),
        ],
      );
    });

    Widget createTestWidget() {
      return MaterialApp(
        home: Scaffold(
          body: SuiteCard(suite: mockSuite),
        ),
      );
    }

    testWidgets('deve exibir o SuitePhoto corretamente', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      final suitePhotoFinder = find.byType(SuitePhoto);
      expect(suitePhotoFinder, findsOneWidget);

      final SuitePhoto suitePhoto = tester.widget(suitePhotoFinder);

      // Verifica se o SuitePhoto exibe a foto corretamente
      expect(suitePhoto.photo, mockSuite.fotos[0]);

      // Verifica se o SuitePhoto exibe as fotos corretamente
      expect(suitePhoto.photos, mockSuite.fotos);

      // Verifica se o SuitePhoto exibe o nome corretamente
      expect(suitePhoto.name, mockSuite.nome);
    });

    testWidgets('deve exibir ItensCategoryCard', (tester) async {
      await tester.pumpWidget(createTestWidget());

      final itensCategoryFinder = find.byType(ItensCategoryCard);

      // Verifica se o ItensCategoryCard é exibido
      expect(itensCategoryFinder, findsOneWidget);
    });

    testWidgets('deve renderizar os PeriodCard corretamente', (tester) async {
      await tester.pumpWidget(createTestWidget());

      final periodCardFinder = find.byType(PeriodCard);
      expect(periodCardFinder, findsNWidgets(mockSuite.periodos.length));

      final PeriodCard firstPeriod = tester.widget(periodCardFinder.first);

      // Verifica se o PeriodCard exibe o tempo formatado corretamente
      expect(firstPeriod.periodo.tempoFormatado,
          mockSuite.periodos[0].tempoFormatado);

      // Verifica se o PeriodCard exibe o valor corretamente
      expect(firstPeriod.periodo.valor, mockSuite.periodos[0].valor);

      // Verifica se o PeriodCard exibe o valor total corretamente
      expect(firstPeriod.periodo.valorTotal, mockSuite.periodos[0].valorTotal);
    });
  });
}
