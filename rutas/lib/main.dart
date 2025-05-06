import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  List<Widget> pages = <Widget>[PrincipalPage(), PerfilPage(), AjustesPage()];

  List<BottomNavigationBarItem> tabs = <BottomNavigationBarItem>[
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Principal'),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
    BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Ajustes'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navegación',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('Navegación')),
        body: pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: tabs,
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
      routes: {
        '/principal': (context) => PrincipalPage(),
        '/perfil': (context) => PerfilPage(),
        '/ajustes': (context) => AjustesPage(),
      },
    );
  }
}

class PrincipalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Página Principal', style: TextStyle(fontSize: 24)),
    );
  }
}

class PerfilPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Página de Perfil', style: TextStyle(fontSize: 24)),
    );
  }
}

class AjustesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Página de Ajustes', style: TextStyle(fontSize: 24)),
    );
  }
}
