import 'package:flutter/material.dart';

class NosotrosScreen extends StatelessWidget {
  const NosotrosScreen(
      {super.key}); // Constructor constante definido correctamente

  final List<Map<String, String>> animals = const [
    {
      "name": "Leon",
      "image": "assets/galeria/leon.jpg",
      "description": "El majestuoso león nació en 2010 en la vasta sabana africana, "
          "donde enfrentó múltiples peligros, incluidos cazadores furtivos y la amenaza de la pérdida de su hábitat natural. "
          "En un dramático giro del destino, fue capturado por traficantes ilegales, pero afortunadamente, "
          "un operativo internacional logró rescatarlo. Debilitado pero lleno de esperanza, fue trasladado al zoológico de Guayllabamba, en Ecuador, "
          "donde recibió cuidados intensivos y un hogar seguro. Hoy, este león simboliza la lucha por la conservación de especies y la esperanza "
          "de un futuro mejor para la fauna amenazada."
    },
    {
      "name": "Jaguar",
      "image": "assets/galeria/jaguar.jpg",
      "description": "El jaguar, nacido en 2015 en el corazón de la Amazonía, sufrió las consecuencias de la deforestación masiva que destruyó su hogar. "
          "Desplazado y en busca de alimento, tuvo un desafortunado encuentro con humanos, lo que casi le costó la vida. "
          "Afortunadamente, fue rescatado y llevado al zoológico de Guayllabamba, donde ahora vive protegido. "
          "Este imponente felino se ha convertido en un símbolo de la conservación y de la coexistencia armoniosa entre los humanos y la naturaleza."
    },
    {
      "name": "Condor",
      "image": "assets/galeria/condor.jpg",
      "description": "El cóndor andino, ave emblemática de Ecuador, es reconocido como una de las especies voladoras más grandes del mundo. "
          "Con su majestuosa envergadura que puede superar los tres metros, surca los cielos de los Andes simbolizando fuerza, libertad y esperanza. "
          "A pesar de su importancia cultural y natural, enfrenta serias amenazas debido a la pérdida de hábitat y la caza ilegal, lo que lo ha llevado al borde de la extinción. "
          "En Ecuador, esfuerzos de conservación buscan proteger a esta icónica ave, devolviéndole su lugar como guardián de las montañas."
    },
    {
      "name": "Tortuga Galapagos",
      "image": "assets/galeria/galapagos.jpg",
      "description": "La tortuga de Galápagos, una de las especies más longevas del mundo, puede vivir más de 100 años, "
          "y algunos ejemplares han llegado a superar los 150 años. Endémica de las Islas Galápagos, esta majestuosa criatura desempeña un papel fundamental en su ecosistema, "
          "ayudando a dispersar semillas y mantener el equilibrio natural. "
          "Sin embargo, durante siglos enfrentó la amenaza de la caza y la introducción de especies invasoras que pusieron en peligro su existencia. "
          "Gracias a los esfuerzos de conservación, hoy su población está en recuperación, representando un símbolo de esperanza y resiliencia."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nosotros"),
        backgroundColor: Colors.green,
      ),
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
                  final name = animal["name"];
                  final image = animal["image"];
                  final description = animal["description"];

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AnimalDetailScreen(
                            name: name ?? '',
                            image: image ?? '',
                            description: description ?? '',
                          ),
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
                              image!,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  const Center(child: Text("No disponible")),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              name!,
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
class AnimalDetailScreen extends StatelessWidget {
  final String name;
  final String image;
  final String description;

  const AnimalDetailScreen({
    super.key,
    required this.name,
    required this.image,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        backgroundColor: Colors.green,
      ),
      body: Container(
        color: Colors.green.shade100,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                image,
                height: 300,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    const Center(child: Text("Imagen no disponible")),
              ),
              Container(
                color: Colors.green.shade300,
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  name,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    description,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
