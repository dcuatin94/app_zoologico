import 'package:app_zoologico/src/authentication/register.dart';
import 'package:app_zoologico/src/pages/bienvenidos.dart';
import 'package:app_zoologico/src/pages/home.dart';
import 'package:app_zoologico/src/pages/menu.dart';
import 'package:app_zoologico/src/pages/page_not_found.dart';
import 'package:app_zoologico/src/authentication/login.dart';
import 'package:flutter/material.dart';
// Asegúrate de que la ruta es correcta. Si tu archivo home.dart está en lib/src/

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _routes = {
    '/': (context) => const Menu(),
    // '/': (context) => const InicioScreen(),
    '/menu': (context) => const Menu(),
    '/login': (context) => const LoginPage(),
    '/register': (context) =>
        const RegisterPage(), // Asigna una ruta para HomeScreen(),
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
