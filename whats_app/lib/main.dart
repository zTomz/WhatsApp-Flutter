import 'package:flutter/material.dart';
import 'package:whats_app/presentation/pages/authentication_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF4BA586),
          surfaceTint: const Color(0xFF4BA586),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF4BA586),
          surfaceTint: const Color(0xFF222C32),
          background: const Color(0xFF131B20),
          brightness: Brightness.dark,
        ),
      ),
      home: const AuthenticationPage(),
    );
  }
}
