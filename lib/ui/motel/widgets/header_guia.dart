import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_model/motel_view_model.dart';
import '../../core/widgets/lowercase_text.dart';
import '../../core/widgets/rating_badge.dart';

class HeaderGuia extends StatelessWidget {
  const HeaderGuia({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MotelViewModel>(
      builder: (context, viewModel, child) {
        final motel = viewModel.motel;
        if (motel == null) return const SizedBox();

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: ClipOval(
                  child: Image.network(
                    motel.logo,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(width: 16),
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
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        RatingBadge(rating: motel.media),
                        const SizedBox(width: 8),
                        LowercaseText('${motel.qtdAvaliacoes} avaliações'),
                        Icon(
                          Icons.keyboard_arrow_down,
                          size: 16,
                          color: Colors.grey[600],
                        ),
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
          ),
        );
      },
    );
  }
}
