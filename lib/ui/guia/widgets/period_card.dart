import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../domain/models/periodo.dart';
import '../../core/widgets/lowercase_text.dart';
import '../../core/widgets/discount_badge.dart';

class PeriodCard extends StatelessWidget {
  final Periodo periodo;

  const PeriodCard({super.key, required this.periodo});

  @override
  Widget build(BuildContext context) {
    final currencyFormat =
        NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');

    return Container(
      width: MediaQuery.of(context).size.width * 0.95,
      margin: const EdgeInsets.symmetric(vertical: 2.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      LowercaseText(
                        periodo.tempoFormatado,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      if (periodo.desconto != null) ...[
                        const SizedBox(width: 8),
                        DiscountBadge(
                          originalValue: periodo.valor,
                          discountValue: periodo.desconto!.desconto,
                        ),
                      ],
                    ],
                  ),
                  Row(
                    children: [
                      if (periodo.desconto != null)
                        Text(
                          currencyFormat.format(periodo.valor),
                          style: TextStyle(
                            color: Colors.grey[500],
                            decoration: TextDecoration.lineThrough,
                            fontSize: 16,
                          ),
                        ),
                      if (periodo.desconto != null) const SizedBox(width: 8),
                      Text(
                        currencyFormat.format(periodo.valorTotal),
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
