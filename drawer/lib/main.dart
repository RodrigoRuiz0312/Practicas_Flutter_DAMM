import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navegación',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => HomePage(),
        '/principal': (context) => PrincipalPage(),
        '/perfil': (context) => PerfilPage(),
        '/ajustes': (context) => AjustesPage(),
      },
      initialRoute: '/',
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página Inicial'),
      ),
      drawer: buildDrawer(context),
      body: Center(
        child: Text('Contenido Principal', style: TextStyle(fontSize: 24)),
      ),
    );
  }

  Widget buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Rodrigo Ruiz'),
            accountEmail: Text('rodrigorm0312@gmail.com'),
            currentAccountPicture: CircleAvatar(
              // Asegúrate de tener esta imagen en tu carpeta assets
              backgroundImage: AssetImage('assets/avatar.jpg'),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: Text('Principal'),
            leading: Icon(Icons.home),
            onTap: () {
              Navigator.pushNamed(context, '/principal');
            },
          ),
          ListTile(
            title: Text('Perfil'),
            leading: Icon(Icons.person),
            onTap: () {
              Navigator.pushNamed(context, '/perfil');
            },
          ),
          ListTile(
            title: Text('Ajustes'),
            leading: Icon(Icons.settings),
            onTap: () {
              Navigator.pushNamed(context, '/ajustes');
            },
          ),
        ],
      ),
    );
  }
}

class PrincipalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Principal'),
      ),
      drawer: HomePage().buildDrawer(context),
      body: Center(
        child: Text('Página Principal', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}

class PerfilPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
      ),
      drawer: HomePage().buildDrawer(context),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/avatar.jpg'),
            ),
            SizedBox(height: 20),
            Text('Rodrigo Ruiz', style: TextStyle(fontSize: 24)),
            Text('rodrigorm0312@gmail.com', style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: Text('Editar Perfil'),
            ),
          ],
        ),
      ),
    );
  }
}

class AjustesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajustes'),
      ),
      drawer: HomePage().buildDrawer(context),
      body: ListView(
        children: [
          SwitchListTile(
            title: Text('Notificaciones'),
            value: true,
            onChanged: (bool value) {},
          ),
          SwitchListTile(
            title: Text('Modo Oscuro'),
            value: false,
            onChanged: (bool value) {},
          ),
          ListTile(
            title: Text('Privacidad'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {},
          ),
          ListTile(
            title: Text('Acerca de'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {},
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {},
              child: Text('Cerrar Sesión'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}