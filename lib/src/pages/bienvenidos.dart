import 'package:app_zoologico/src/widgets/ExpandingCircleImage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../services/auth_service.dart';

class BienvenidoScreen extends StatelessWidget {
  const BienvenidoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userService = Provider.of<AuthService>(context);
    print(userService.user);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: SvgPicture.asset(
          'assets/images/zoo-color.svg',
          width: 50,
          height: 50,
        ),
        backgroundColor: Colors.green,
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ExpandingCircleImage(imagePath: 'assets/galeria/oso.jpg'),
            SizedBox(
              height: 20,
            ),
            Text(
              '¡Bienvenido al Zoológico de Quito!',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
                height: 20), // Espacio entre el título y el texto descriptivo
            Text(
              'Disfruta de una experiencia única con nuestros increíbles animales.',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black54,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
                height:
                    20), // Espacio entre el texto descriptivo y cualquier contenido adicional
            Text(
              '¡Gracias por tu visita!',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/login');
        },
        backgroundColor: Colors.amber.shade400,
        child: const Icon(Icons.arrow_forward, color: Colors.white),
      ),
    );
  }
}
