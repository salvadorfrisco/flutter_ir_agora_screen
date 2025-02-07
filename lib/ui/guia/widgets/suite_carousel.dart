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
        if (viewModel.motel == null) {
          return const SizedBox();
        }

        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.7,
          child: PageView.builder(
            controller: PageController(
              viewportFraction: 0.9,
            ),
            itemCount: viewModel.motel!.suites.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6.0),
                child: SuiteCard(suite: viewModel.motel!.suites[index]),
              );
            },
          ),
        );
      },
    );
  }
}
