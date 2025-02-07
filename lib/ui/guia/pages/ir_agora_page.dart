import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../ui/guia/view_model/motel_view_model.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/header_guia.dart';
import '../widgets/suite_carousel.dart';

class IrAgoraPage extends StatefulWidget {
  const IrAgoraPage({super.key});

  @override
  State<IrAgoraPage> createState() => _IrAgoraPageState();
}

class _IrAgoraPageState extends State<IrAgoraPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<MotelViewModel>().loadMotel();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: const CustomAppBar(),
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFF5F5F5),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Consumer<MotelViewModel>(
          builder: (context, viewModel, child) {
            if (viewModel.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (viewModel.error != null) {
              return Center(
                  child:
                      Text(viewModel.error?.toString() ?? 'Erro desconhecido'));
            }

            return SizedBox.expand(
              child: Column(
                children: const [
                  Header(),
                  Expanded(child: SuiteCarousel()),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
