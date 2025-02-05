import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data/repositories/motel_repository.dart';
import 'ui/core/widgets/lowercase_text.dart';
import 'ui/motel/view_model/motel_view_model.dart';
import 'ui/motel/widgets/header_guia.dart';
import 'ui/motel/widgets/suite_carousel.dart';

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
      appBar: AppBar(title: LowercaseText('ir agora')),
      body: Consumer<MotelViewModel>(
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
              HeaderGuia(),
              Expanded(child: SuiteCarousel()),
            ],
          );
        },
      ),
    );
  }
}
