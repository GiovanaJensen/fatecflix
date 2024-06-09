import 'package:fatecflix/screens/tela_inicial.dart';
import 'package:flutter/material.dart';
import 'package:fatecflix/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FatecFlix',
      theme: ThemeData(
        primaryColor: const Color(0xFF101010),
        scaffoldBackgroundColor: const Color(0xFF101010),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF101010),
          secondary: Color(0xFFDB202C),
          background: Color(0xFF101010),
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: const Color(0xFFDB202C),
          textTheme: ButtonTextTheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
      home: const TelaInicial(),
    );
  }
}
