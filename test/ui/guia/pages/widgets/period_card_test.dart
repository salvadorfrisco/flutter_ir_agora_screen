import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:flutter_ir_agora_screen/ui/guia/widgets/period_card.dart';
import 'package:flutter_ir_agora_screen/domain/models/periodo.dart';
import 'package:flutter_ir_agora_screen/ui/core/widgets/discount_badge.dart';

void main() {
  Widget createTestWidget({
    required Periodo periodo,
  }) {
    return MaterialApp(
      home: Scaffold(
        body: PeriodCard(periodo: periodo),
      ),
    );
  }

  testWidgets('PeriodCard exibe valores corretamente sem desconto',
      (WidgetTester tester) async {
    final periodo = Periodo(
      tempoFormatado: '2 noites',
      valor: 200.0,
      valorTotal: 200.0,
      desconto: null, // Sem desconto
    );

    await tester.pumpWidget(createTestWidget(periodo: periodo));

    // Verifica se o valor total é exibido corretamente
    final currencyFormat =
        NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
    expect(
        find.text(currencyFormat.format(periodo.valorTotal)), findsOneWidget);
    // Verifica se o texto "2 noites" aparece
    expect(find.text('2 noites'), findsOneWidget);
    // Verifica se o desconto não é exibido
    expect(find.byType(DiscountBadge), findsNothing);
  });

  testWidgets('PeriodCard exibe valores corretamente com desconto',
      (WidgetTester tester) async {
    final periodo = Periodo(
      tempoFormatado: '3 noites',
      valor: 300.0,
      valorTotal: 250.0,
      desconto: Desconto(desconto: 50.0),
    );

    await tester.pumpWidget(createTestWidget(periodo: periodo));

    final currencyFormat =
        NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');

    // Verifica se o valor é exibido corretamente
    expect(find.text(currencyFormat.format(periodo.valor)), findsOneWidget);

    // Verifica se o valor total é exibido corretamente
    expect(
        find.text(currencyFormat.format(periodo.valorTotal)), findsOneWidget);

    // Verifica se o desconto é exibido
    expect(find.byType(DiscountBadge), findsOneWidget);

    // Verifica se o texto "3 noites" aparece
    expect(find.text('3 noites'), findsOneWidget);
  });

  testWidgets('PeriodCard exibe o ícone de navegação',
      (WidgetTester tester) async {
    final periodo = Periodo(
      tempoFormatado: '1 noite',
      valor: 100.0,
      valorTotal: 100.0,
      desconto: null,
    );

    await tester.pumpWidget(createTestWidget(periodo: periodo));

    // Verifica se o ícone de navegação está presente
    expect(find.byIcon(Icons.chevron_right), findsOneWidget);
  });
}
