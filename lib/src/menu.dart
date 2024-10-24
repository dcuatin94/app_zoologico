import 'package:app_zoologico/src/contactos.dart';
import 'package:app_zoologico/src/home.dart';
import 'package:app_zoologico/src/mapa.dart';
import 'package:app_zoologico/src/nosotros.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const MapaScreen(),
    const NosotrosScreen(),
    const ContactosScreen(),
  ];

  void _selectedOptionInMyBottomNav(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset(
          'assets/images/zoo-color.svg',
          width: 50,
          height: 50,
        ),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
              icon: const Icon(Icons.person),
              onPressed: () {
                Navigator.pushNamed(context, '/registro');
              })
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
            icon: Icon(Icons.map),
            label: 'Mapa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pets),
            label: 'Animales',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.email),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[100],
        unselectedItemColor: Colors.black,
        onTap: _selectedOptionInMyBottomNav,
        backgroundColor: Colors.green,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
