import 'package:flutter/material.dart';

class GaleriaScreen extends StatelessWidget {  // Nombre de la clase debe coincidir con lo que usas en 'home.dart'
  const GaleriaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Galería de Animales'),
      ),
      body: const Center(
        child: Text('Aquí puedes mostrar la galería de animales.'),
      ),
    );
  }
}
