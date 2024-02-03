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
          seedColor: const Color(0xFF075E54),
          secondary: const Color(0xFF128C7E),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF075E54),
          secondary: const Color(0xFF128C7E),
          brightness: Brightness.dark,
        ),
      ),
      home: const AuthenticationPage(),
    );
  }
}
