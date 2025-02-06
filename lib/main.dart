import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/injection/injection.dart';
import 'ui/guia/pages/ir_agora_page.dart';
import 'ui/guia/view_model/motel_view_model.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MotelViewModel(motelRepository),
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
      ),
      home: const IrAgoraPage(),
    );
  }
}
