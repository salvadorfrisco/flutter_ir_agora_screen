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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SuitePhoto(
          photo: suite.fotos[0],
          name: suite.nome,
        ),
        ItensCategoryCard(itens: suite.categoriaItens),
        ...suite.periodos.map(
          (periodo) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: PeriodCard(periodo: periodo),
          ),
        ),
      ],
    );
  }
}
