import 'package:flutter/material.dart';
import 'src/home.dart'; // Importa la pantalla de inicio que tiene la navegación

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navegación Básica',
      theme: ThemeData(
        primarySwatch: Colors.green, // Color principal verde
      ),
      home:
          const HomeScreen(), // Pantalla principal será la de inicio (HomeScreen)
    );
  }
}
