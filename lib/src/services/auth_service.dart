import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService extends ChangeNotifier {
  User? _user;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? get user => _user;
  //Metodo para actualizar el estado del usuario
  void setUser(User? user) {
    _user = user;
    notifyListeners();
  }

  //Metodo para iniciar sesion
  Future<void> signIn(
      String email, String password, BuildContext context) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      setUser(userCredential.user);
      if (userCredential.user != null) {
        Navigator.pushReplacementNamed(context, '/');
      } //Actualiza el estado del usuario
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          'Error al iniciar sesion: $e',
          style: TextStyle(color: Colors.white),
        ),
        duration: Duration(seconds: 5),
        backgroundColor: Colors.red,
        elevation: 4.0,
      ));
    }
  }

  //Metodo para cerrar sesion
  Future<void> signOut() async {
    await _auth.signOut();
    setUser(null); //Actualiza el estado del usuario
  }

  //Metodo para registrar un nuevo usuario
  Future<void> signUp(
      String email, String password, BuildContext context) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      setUser(userCredential.user); //Actualiza el estado del usuario
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              'Cuenta registrada exitosamente. Rediriginedo al inicio de sesión...',
              style: TextStyle(color: Colors.white)),
          duration: Duration(seconds: 2),
          backgroundColor: const Color.fromARGB(255, 119, 66, 23),
          elevation: 4.0,
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          'Error al registrar el usuario: $e',
          style: TextStyle(color: Colors.white),
        ),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
        elevation: 4.0,
      ));
    }
  }

  //Metodo para restablecer la contrasena
  Future<void> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print('Error al restablecer la contrasena: $e');
    }
  }

  //Metodo para comprobar si el usuario esta autenticado
  void checkAuth() {
    _auth.authStateChanges().listen((User? user) {
      setUser(user);
    });
  }
}
