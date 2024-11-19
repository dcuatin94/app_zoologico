// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class RegistroScreen extends StatefulWidget {
  const RegistroScreen({super.key});

  @override
  _RegistroScreenState createState() => _RegistroScreenState();
}

class _RegistroScreenState extends State<RegistroScreen> {
  // Controladores para los campos de texto
  final _usuarioController = TextEditingController();
  final _claveController = TextEditingController();
  final _emailController = TextEditingController();
  final _celularController = TextEditingController();

  // Llave global para el formulario
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de Usuario'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey, // Asignamos la clave del formulario
          child: ListView(
            children: [
              TextFormField(
                controller: _usuarioController,
                decoration: const InputDecoration(labelText: 'Usuario'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa tu usuario';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _claveController,
                decoration: const InputDecoration(labelText: 'Clave'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.length < 6) {
                    return 'La clave debe tener al menos 6 caracteres';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || !value.contains('@')) {
                    return 'Por favor ingresa un email válido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _celularController,
                decoration: const InputDecoration(labelText: 'Celular'),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.length != 10) {
                    return 'El celular debe tener 10 dígitos';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Validamos el formulario
                  if (_formKey.currentState!.validate()) {
                    // Si es válido, mostramos un mensaje de éxito
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Registro exitoso')),
                    );
                  }
                },
                child: const Text('Registrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Limpiar los controladores al salir de la pantalla
    _usuarioController.dispose();
    _claveController.dispose();
    _emailController.dispose();
    _celularController.dispose();
    super.dispose();
  }
}
