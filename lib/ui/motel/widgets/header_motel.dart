import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_model/motel_view_model.dart';
import '../../core/widgets/lowercase_text.dart';

class HeaderMotel extends StatelessWidget {
  const HeaderMotel({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MotelViewModel>(
      builder: (context, viewModel, child) {
        final motel = viewModel.motel;
        if (motel == null) return const SizedBox();

        return Row(
          children: [
            Expanded(
              flex: 1,
              child: Image.network(motel.logo),
            ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LowercaseText(
                    motel.fantasia,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Row(
                    children: [
                      LowercaseText(motel.distancia.toString()),
                      const SizedBox(width: 8),
                      LowercaseText(motel.bairro),
                    ],
                  ),
                  Row(
                    children: [
                      LowercaseText(motel.media.toString()),
                      const SizedBox(width: 8),
                      LowercaseText('(${motel.qtdAvaliacoes} avaliações)'),
                    ],
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.favorite,
                color: motel.isFavorito ? Colors.red : Colors.grey,
              ),
              onPressed: viewModel.toggleFavorito,
            ),
          ],
        );
      },
    );
  }
}
