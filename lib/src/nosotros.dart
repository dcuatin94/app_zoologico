import 'package:flutter/material.dart';

class NosotrosScreen extends StatelessWidget {
  const NosotrosScreen({super.key});

  // Lista de animales con sus nombres, imágenes y descripciones
  final List<Map<String, String>> animals = const [
    {
      "name": "Leon",
      "image": "assets/galeria/leon.jpg",
      "description": "El león es conocido como el rey de la selva."
    },
    {
      "name": "Jaguar",
      "image": "assets/galeria/jaguar.jpg",
      "description": "El jaguar es el felino más grande de América."
    },
    {
      "name": "Condor",
      "image": "assets/galeria/condor.jpg",
      "description": "El cóndor es una de las aves voladoras más grandes."
    },
    {
      "name": "Tortuga Galapagos",
      "image": "assets/galeria/galapagos.jpg",
      "description":
          "La tortuga de Galápagos es una de las más longevas del mundo."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                '¡Bienvenidos a nuestro zoologico Quito!',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Vive una experiencia inolvidable',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'En nuestro Zoologico encontraras diversos animales, que debes conocer.',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Número de columnas
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemCount: animals.length,
                itemBuilder: (context, index) {
                  final animal = animals[index];
                  final image = animal["image"];
                  final name = animal["name"];
                  final description = animal["description"];

                  return Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: image != null
                              ? Image.asset(
                                  image,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return const Center(
                                      child: Text('Imagen no disponible'),
                                    );
                                  },
                                )
                              : const Center(
                                  child: Text('Imagen no disponible')),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            name ?? 'Sin nombre',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            description ?? 'Sin descripción',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
