import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_model/motel_view_model.dart';
import 'suite_card.dart';

class SuiteCarousel extends StatelessWidget {
  const SuiteCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MotelViewModel>(
      builder: (context, viewModel, child) {
        final motel = viewModel.motel;
        if (motel == null) return const SizedBox();

        return SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height *
                0.75, // 75% da altura da tela
            child: PageView.builder(
              controller: PageController(viewportFraction: 0.9),
              itemCount: motel.suites.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: SuiteCard(suite: motel.suites[index]),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
