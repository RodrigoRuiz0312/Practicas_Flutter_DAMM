import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Widget> pages = <Widget>[PrincipalPage(), PerfilPage(), AjustesPage()];

  List<Tab> tabs = <Tab>[
    Tab(icon: Icon(Icons.home), text: 'Principal'),
    Tab(icon: Icon(Icons.person), text: 'Perfil'),
    Tab(icon: Icon(Icons.settings), text: 'Ajustes'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navegación',
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: tabs.length,
        child: Scaffold(
          appBar: AppBar(title: Text('Navegación'), bottom: TabBar(tabs: tabs)),
          body: TabBarView(children: pages),
        ),
      ),
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
