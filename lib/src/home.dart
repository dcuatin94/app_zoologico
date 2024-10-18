import 'package:flutter/material.dart';
import 'inicio.dart';
import 'nosotros.dart';
import 'contactos.dart';
import 'registro.dart';  // Importa la nueva pantalla de registro

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('APP ZOOLOGICO'),
        backgroundColor: Colors.green,  // Color personalizado para el AppBar
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navegar a la pantalla de Inicio
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const InicioScreen()),
                );
              },
              child: const Text('Ir a Inicio'),
            ),
            const SizedBox(height: 20),  // Espacio entre los botones
            ElevatedButton(
              onPressed: () {
                // Navegar a la pantalla de Nosotros
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const NosotrosScreen()),
                );
              },
              child: const Text('Ir a Nosotros'),
            ),
            const SizedBox(height: 20),  // Espacio entre los botones
            ElevatedButton(
              onPressed: () {
                // Navegar a la pantalla de Contactos
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ContactosScreen()),
                );
              },
              child: const Text('Ir a Contactos'),
            ),
            const SizedBox(height: 20),  // Espacio entre los botones
            ElevatedButton(
              onPressed: () {
                // Navegar a la pantalla de Registro
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RegistroScreen()),  // Navega a la nueva pantalla de registro
                );
              },
              child: const Text('Ir a Registro'),
            ),
          ],
        ),
      ),
    );
  }
}
