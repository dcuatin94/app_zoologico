// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'package:app_zoologico/src/authentication/login.dart';
import 'package:app_zoologico/src/pages/contactos.dart';
import 'package:app_zoologico/src/pages/home.dart';
import 'package:app_zoologico/src/pages/gallery.dart';
import 'package:app_zoologico/src/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:app_zoologico/src/providers/user_provider.dart';
import 'package:provider/provider.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    // const MapaScreen(),
    const GalleryScreen(),
    const ContactosScreen(),
  ];

  void _selectedOptionInMyBottomNav(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final user = userProvider.user;

    return userProvider.user != null
        ? Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Logo(),
              backgroundColor: Colors.green,
              actions: [
                PopupMenuButton(
                  icon: Icon(Icons.settings, color: Colors.white, size: 25),
                  onSelected: (value) async {
                    if (value == 'logout') {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Cerrar Sesión'),
                            content: const Text(
                                '¿Estás seguro de que deseas cerrar sesión?'),
                            actions: [
                              TextButton(
                                onPressed: () async {
                                  await userProvider.signOut();
                                  Navigator.pushReplacementNamed(
                                      context, '/login');
                                },
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.green,
                                  foregroundColor: Colors.white,
                                ),
                                child: const Text('Cerrar sesión'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pop(); // Cerrar el dialogo
                                },
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.red,
                                  foregroundColor: Colors.white,
                                ),
                                child: const Text('Cancelar'),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      enabled: false,
                      child: Row(children: [
                        Icon(Icons.email),
                        SizedBox(width: 8),
                        Text(user?.email ?? '')
                      ],),
                    ),
                    PopupMenuItem(
                      value: 'logout',
                      child: Row(children: [
                        Icon(Icons.logout),
                        SizedBox(width: 8),
                        Text('Cerrar Sesión')
                      ],),
                    ),
                  ],
                ),
              ],
            ),
            body: Container(
              child: _widgetOptions.elementAt(_selectedIndex),
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Inicio',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.pets),
                  label: 'Animales',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.info),
                  label: 'Info',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.email),
                  label: 'Contáctanos',
                ),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: Colors.amber[100],
              unselectedItemColor: Colors.black,
              onTap: _selectedOptionInMyBottomNav,
              backgroundColor: Colors.green,
              type: BottomNavigationBarType.fixed,
            ),
          )
        : LoginPage();
  }
}
