import 'package:app_zoologico/src/widgets/cards_row.dart';
import 'package:app_zoologico/src/widgets/carousel.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Historias de Animales'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AnimalCarousel(),
            const SizedBox(
              height: 20,
            ),
            const CardsRow(),
          ],
        ),
      ),
    );
  }
}
