import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Paso de información',
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          // Fondo de la pantalla
          Container(
            width: screenWidth,
            height: screenHeight,
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/fondoLogin.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Contenedor del login (puedes moverlo ajustando el `top`)
          Positioned(
            top: 280, // Ajusta esta posición para mover el contenedor
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: screenWidth, // Ancho del contenedor principal
                height: 835, // Altura del contenedor
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 0, 234, 255).withOpacity(0.9),
                      Color.fromARGB(255, 0, 255, 94).withOpacity(0.9),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 250),
                    // Título del formulario
                    const Text(
                      'INICIA SESION',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 30),
                    // Campo de entrada para el usuario
                    TextField(
                      controller: _userController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.person,
                          color: const Color.fromARGB(255, 255, 255, 255),
                        ),
                        hintText: 'Nombre de usuario',
                        filled: true,
                        fillColor: const Color.fromARGB(
                          255,
                          255,
                          255,
                          255,
                        ).withOpacity(0.3),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Campo de entrada para la contraseña
                    TextField(
                      controller: _passwordController,
                      obscureText: true, // Oculta la contraseña
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock, color: Colors.white),
                        suffixIcon: Icon(
                          Icons.visibility,
                          color: Colors.white,
                        ), // Icono para mostrar u ocultar contraseña
                        hintText: 'Contraseña',
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.3),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Opciones de recordar usuario y olvidar contraseña
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(value: false, onChanged: (value) {}),
                            const Text(
                              'Recordar usuario',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: () {}, // Acción para recuperar contraseña
                          child: const Text(
                            '¿Olvidaste tu contraseña?',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    // Botón de Login
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white, // Color del botón
                          padding: EdgeInsets.symmetric(
                            vertical: 12,
                          ), // Tamaño del botón
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              10,
                            ), // Bordes redondeados
                          ),
                        ),
                        onPressed: () {
                          // Navegar a Pantalla2 pasando la información del usuario
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) => Pantalla2(
                                    name: _userController.text,
                                    email: _passwordController.text,
                                  ),
                            ),
                          );
                        },
                        child: const Text(
                          'Entrar',
                          style: TextStyle(
                            color: Colors.blue, // Color del texto del botón
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '¿No tienes cuenta?',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 1),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegistroScreen(),
                              ),
                            );
                          }, // Acción para recuperar contraseña
                          child: const Text(
                            'Registrate ahora',
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 55, 255),
                              fontSize: 15,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.blue,
                              decorationThickness: 1.5,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Texto "BIENVENIDO A" sobrepuesto
          Positioned(
            top: 65,
            left: (screenWidth - 200) / 2,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 33, 149, 243),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'BIENVENIDO A',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                  color: Colors.white,
                ),
              ),
            ),
          ),

          // Texto "PetAssist" sobrepuesto
          Positioned(
            top: 130,
            left: (screenWidth - 285) / 2,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 33, 149, 243),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'Pet Assist',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Kings',
                  letterSpacing: 7.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),

          // Imagen "pluto.jpg" sobrepuesta
          Positioned(
            top:
                screenHeight * 0.23, // Ajusta la posición vertical de la imagen
            left: (screenWidth - 240) / 2, // Centra la imagen horizontalmente
            child: Image.asset(
              'assets/pluto.png', // Ruta de la imagen
              width: 270, // Ancho de la imagen
              height: 270, // Alto de la imagen
            ),
          ),
        ],
      ),
    );
  }
}

class Pantalla2 extends StatelessWidget {
  final String name;
  final String email;

  Pantalla2({required this.name, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pantalla 2')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('Nombre: $name'), Text('Correo: $email')],
        ),
      ),
    );
  }
}

class RegistroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          // Fondo de la pantalla
          Container(
            width: screenWidth,
            height: screenHeight,
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/fondoLogin.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Contenedor del login (puedes moverlo ajustando el `top`)
          Positioned(
            top: 280, // Ajusta esta posición para mover el contenedor
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: screenWidth, // Ancho del contenedor principal
                height: 835, // Altura del contenedor
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 0, 234, 255).withOpacity(0.9),
                      Color.fromARGB(255, 0, 255, 94).withOpacity(0.9),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 250),
                    // Título del formulario
                    const Text(
                      'REGISTRATE',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 30),
                    // Campo de entrada para el usuario
                    TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.person,
                          color: const Color.fromARGB(255, 255, 255, 255),
                        ),
                        hintText: 'Nombre completo',
                        filled: true,
                        fillColor: const Color.fromARGB(
                          255,
                          255,
                          255,
                          255,
                        ).withOpacity(0.3),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Campo de entrada para la contraseña
                    TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person_pin, color: Colors.white),
                        hintText: 'Nombre de usuario',
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.3),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),

                    TextField(
                      obscureText: true, // Oculta la contraseña
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock, color: Colors.white),
                        suffixIcon: Icon(
                          Icons.person_pin,
                          color: Colors.white,
                        ), // Icono para mostrar u ocultar contraseña
                        hintText: 'Contraseña',
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.3),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    TextField(
                      obscureText: true, // Oculta la contraseña
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock, color: Colors.white),
                        suffixIcon: Icon(
                          Icons.person_pin,
                          color: Colors.white,
                        ), // Icono para mostrar u ocultar contraseña
                        hintText: 'Confirme su contraseña',
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.3),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Opciones de recordar usuario y olvidar contraseña
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(value: false, onChanged: (value) {}),
                            const Text(
                              'Recordar usuario',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: () {}, // Acción para recuperar contraseña
                          child: const Text(
                            '¿Olvidaste tu contraseña?',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    // Botón de Login
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white, // Color del botón
                          padding: EdgeInsets.symmetric(
                            vertical: 12,
                          ), // Tamaño del botón
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              10,
                            ), // Bordes redondeados
                          ),
                        ),
                        onPressed: () {}, // Acción al presionar el botón
                        child: const Text(
                          'Registrarse',
                          style: TextStyle(
                            color: Colors.blue, // Color del texto del botón
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '¿Ya tienes cuenta?',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 1),
                        TextButton(
                          onPressed: () {}, // Acción para recuperar contraseña
                          child: const Text(
                            'Inicia sesion',
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 55, 255),
                              fontSize: 15,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.blue,
                              decorationThickness: 1.5,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Texto "BIENVENIDO A" sobrepuesto
          Positioned(
            top: 65,
            left: (screenWidth - 200) / 2,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 33, 149, 243),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'BIENVENIDO A',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                  color: Colors.white,
                ),
              ),
            ),
          ),

          // Texto "PetAssist" sobrepuesto
          Positioned(
            top: 130,
            left: (screenWidth - 285) / 2,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 33, 149, 243),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'Pet Assist',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Kings',
                  letterSpacing: 7.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),

          // Imagen "pluto.jpg" sobrepuesta
          Positioned(
            top:
                screenHeight * 0.23, // Ajusta la posición vertical de la imagen
            left: (screenWidth - 240) / 2, // Centra la imagen horizontalmente
            child: Image.asset(
              'assets/pluto.png', // Ruta de la imagen
              width: 270, // Ancho de la imagen
              height: 270, // Alto de la imagen
            ),
          ),
        ],
      ),
    );
  }
}

class Pantalla3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, String> args =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    return Scaffold(
      appBar: AppBar(title: Text('Pantalla 3')),
      body: Center(
        child: Column(
          children: [
            Text('Nombre: ${args['nombre']}'),
            Text('Email: ${args['email']}'),
          ],
        ),
      ),
    );
  }
}