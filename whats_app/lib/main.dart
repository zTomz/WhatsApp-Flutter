import 'package:flutter/material.dart';
import 'package:whats_app/extensions/theme_extension.dart';
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
      title: 'WhatsApp',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF05a784),
          primary: const Color(0xFF05a784),
          surfaceTint: const Color(0xFF05a784),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: context.colorScheme.surfaceTint,
          foregroundColor: Colors.white,
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF05a784),
          primary: const Color(0xFF05a784),
          secondary: const Color(0xFF111b21),
          surfaceTint: const Color(0xFF1f2c33),
          background: const Color(0xFF0B141A),
          brightness: Brightness.dark,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: context.colorScheme.surfaceTint,
          foregroundColor: context.colorScheme.background,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xFF05a784),
          foregroundColor: Color(0xFF0B141A),
        ),
      ),
      home: const AuthenticationPage(),
    );
  }
}
