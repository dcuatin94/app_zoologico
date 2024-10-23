import 'package:app_zoologico/src/inicio.dart';
import 'package:app_zoologico/src/page_not_found.dart';
import 'package:app_zoologico/src/registro.dart';
import 'package:flutter/material.dart';
import 'src/home.dart'; // Asegúrate de que la ruta es correcta. Si tu archivo home.dart está en lib/src/

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final _routes = {
    '/': (context) => const InicioScreen(),
    '/home': (context) =>
        const HomeScreen(), // Asigna una ruta para HomeScreen(),
  };
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zoologico App',
      debugShowCheckedModeBanner: false, // Elimina la bandera de depuración
      initialRoute: '/',
      routes: _routes,
      onGenerateRoute: (settings) => MaterialPageRoute(
          builder: (context) =>
              const PageNotFound()), // Asegúrate de que HomeScreen está bien definido e importado
    );
  }
}
