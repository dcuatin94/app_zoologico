import 'package:flutter/material.dart';
// Importa la nueva pantalla de registro

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  // Para la animación controlada
  late AnimationController _controller;
  late Animation<double> _animation;
  bool isPaused = false; // Variable para controlar el estado de pausa

  // Variable para la animación implícita (tamaño del oso)
  bool isExpanded = false; // Cambiará el tamaño del oso

  @override
  void initState() {
    super.initState();
    // Inicializando el AnimationController
    _controller = AnimationController(
      duration: const Duration(
          seconds: 2), // Animación de 2 segundos para movimiento suave
      vsync: this,
    );

    // Definiendo el Tween para el movimiento horizontal (de izquierda a derecha)
    _animation = Tween<double>(begin: -40, end: 40).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut, // Movimiento suave
    ));

    // Iniciar la animación
    _controller.repeat(
        reverse: true); // Repetir animación de derecha a izquierda
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // Método para pausar y reanudar la animación
  void _togglePause() {
    setState(() {
      if (isPaused) {
        _controller.repeat(reverse: true); // Reanudar animación
      } else {
        _controller.stop(); // Detener la animación
      }
      isPaused = !isPaused; // Cambiar el estado de pausa
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Texto "Bienvenido al Zoológico"
            const Text(
              'Bienvenido al Zoológico',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20), // Espacio entre el texto y la imagen

            // Usamos AnimatedContainer para el oso (animación implícita)
            AnimatedContainer(
              duration: const Duration(seconds: 1), // Duración de la animación
              width: isExpanded ? 200 : 150, // Cambia el tamaño del oso
              height: isExpanded ? 200 : 150,
              child: GestureDetector(
                onTap: _togglePause, // Pausar/reanudar animación controlada
                child: AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(_animation.value,
                          0), // Movimiento horizontal controlado
                      child: ClipOval(
                        child: Image.asset(
                          'assets/galeria/oso.jpg', // Ruta correcta de la imagen
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
