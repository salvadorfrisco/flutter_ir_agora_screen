import 'package:flutter/material.dart';
import '../../../domain/models/suite.dart';
import 'period_card.dart';
import 'suite_photo.dart';
import 'itens_category_card.dart';

class SuiteCard extends StatelessWidget {
  final Suite suite;

  const SuiteCard({super.key, required this.suite});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      children: [
        SuitePhoto(
          photo: suite.fotos[0],
          name: suite.nome,
          photos: suite.fotos,
          qtd: suite.qtd,
          exibirQtdDisponiveis: suite.exibirQtdDisponiveis,
        ),
        ItensCategoryCard(itens: suite.categoriaItens),
        ...suite.periodos.map(
          (periodo) => PeriodCard(periodo: periodo),
        ),
      ],
    );
  }
}
