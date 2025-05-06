import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flujo Unidireccional',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const Pantalla1Unidireccional(),
    );
  }
}

class Pantalla1Unidireccional extends StatelessWidget {
  const Pantalla1Unidireccional({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flujo Unidireccional')),
      body: Center(
        child: ElevatedButton(
          child: const Text('Seleccionar Fruta'),
          onPressed: () async {
            final frutaSeleccionada = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Pantalla2Unidireccional(
                  frutas: ['Fresa', 'Manzana', 'Pera', 'Uva'],
                ),
              ),
            );
            
            if (frutaSeleccionada != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Fruta seleccionada: $frutaSeleccionada')),
              );
            }
          },
        ),
      ),
    );
  }
}

class Pantalla2Unidireccional extends StatelessWidget {
  final List<String> frutas;

  const Pantalla2Unidireccional({
    super.key,
    required this.frutas,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Selecciona una fruta')),
      body: ListView.builder(
        itemCount: frutas.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(frutas[index]),
            onTap: () => Navigator.pop(context, frutas[index]),
          );
        },
      ),
    );
  }
}