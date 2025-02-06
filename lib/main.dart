import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data/repositories/motel_repository.dart';
import 'ui/guia/view_model/motel_view_model.dart';
import 'ui/guia/widgets/header_guia.dart';
import 'ui/guia/widgets/suite_carousel.dart';
import 'ui/core/widgets/custom_app_bar.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MotelViewModel(MotelRepository()),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Motel App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
        useMaterial3: true,
        fontFamily: 'Titillium',
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontFamily: 'Titillium'),
          bodyMedium: TextStyle(fontFamily: 'Titillium'),
          titleLarge: TextStyle(fontFamily: 'Titillium'),
          titleMedium: TextStyle(fontFamily: 'Titillium'),
        ),
      ),
      home: const MotelScreen(),
    );
  }
}

class MotelScreen extends StatefulWidget {
  const MotelScreen({super.key});

  @override
  State<MotelScreen> createState() => _MotelScreenState();
}

class _MotelScreenState extends State<MotelScreen> {
  @override
  void initState() {
    super.initState();
    // Agenda a carga dos dados para depois do build
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

            return Column(
              children: const [
                Header(),
                Expanded(child: SuiteCarousel()),
              ],
            );
          },
        ),
      ),
    );
  }
}
