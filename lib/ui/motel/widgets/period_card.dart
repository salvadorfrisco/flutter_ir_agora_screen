import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../domain/models/periodo.dart';

class PeriodCard extends StatelessWidget {
  final Periodo periodo;

  const PeriodCard({super.key, required this.periodo});

  @override
  Widget build(BuildContext context) {
    final currencyFormat =
        NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');

    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(periodo.tempoFormatado),
              Text(
                currencyFormat.format(periodo.valorTotal),
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        ),
        const Icon(Icons.chevron_right, color: Colors.grey),
      ],
    );
  }
}
