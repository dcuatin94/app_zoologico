import 'package:flutter/material.dart';
import 'src/home.dart'; // Asegúrate de que la ruta es correcta. Si tu archivo home.dart está en lib/src/

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false, // Elimina la bandera de depuración
      home:
          HomeScreen(), // Asegúrate de que HomeScreen está bien definido e importado
    );
  }
}
