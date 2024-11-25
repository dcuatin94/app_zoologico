import 'package:app_zoologico/src/pages/animalPage.dart';
import 'package:flutter/material.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen(
      {super.key}); // Constructor constante definido correctamente

  final List<Map<String, String>> animals = const [
    {
      "name": "Lion",
      "image": "assets/galeria/leon.jpg",
    },
    {
      "name": "Jaguar",
      "image": "assets/galeria/jaguar.jpg",
    },
    {
      "name": "Armadillo",
      "image": "assets/galeria/Armadillo.jpg",
    },
    {
      "name": "Elephant",
      "image": "assets/galeria/elephant.jpg",
    },
    {
      "name": "Pangolin",
      "image": "assets/galeria/pangolin.jpg",
    },
    {
      "name": "Tapir",
      "image": "assets/galeria/tapir.jpg",
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
                  final String name = animal["name"].toString();
                  final String image = animal["image"].toString();
                  // final description = animal["description"];

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AnimalListPage(name: name, image: image),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: Image.asset(
                              image,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  const Center(child: Text("No disponible")),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              name,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
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

// Pantalla de detalles del animal
// class AnimalDetailScreen extends StatelessWidget {
//   final String name;
//   final String image;
//   final String description;

//   const AnimalDetailScreen({
//     super.key,
//     required this.name,
//     required this.image,
//     required this.description,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(name),
//         backgroundColor: Colors.green,
//       ),
//       body: Container(
//         color: Colors.green.shade100,
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               Image.asset(
//                 image,
//                 height: 300,
//                 fit: BoxFit.cover,
//                 errorBuilder: (context, error, stackTrace) =>
//                     const Center(child: Text("Imagen no disponible")),
//               ),
//               Container(
//                 color: Colors.green.shade300,
//                 padding: const EdgeInsets.all(16.0),
//                 child: Text(
//                   name,
//                   style: const TextStyle(
//                     fontSize: 28,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(10),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black.withOpacity(0.2),
//                         blurRadius: 8,
//                         offset: const Offset(0, 4),
//                       ),
//                     ],
//                   ),
//                   padding: const EdgeInsets.all(16.0),
//                   child: Text(
//                     description,
//                     style: const TextStyle(
//                       fontSize: 16,
//                       color: Colors.black87,
//                     ),
//                     textAlign: TextAlign.justify,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
