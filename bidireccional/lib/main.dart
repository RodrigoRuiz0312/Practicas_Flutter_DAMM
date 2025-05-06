import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flujo Bidireccional',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      home: const Pantalla1Bidireccional(),
    );
  }
}

class Pantalla1Bidireccional extends StatefulWidget {
  const Pantalla1Bidireccional({super.key});

  @override
  State<Pantalla1Bidireccional> createState() => _Pantalla1BidireccionalState();
}

class _Pantalla1BidireccionalState extends State<Pantalla1Bidireccional> {
  String? frutaSeleccionada;

  void actualizarFrutaSeleccionada(String fruta) {
    setState(() {
      frutaSeleccionada = fruta;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flujo Bidireccional')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              frutaSeleccionada != null 
                ? 'Fruta seleccionada: $frutaSeleccionada'
                : 'No hay fruta seleccionada',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Seleccionar Fruta'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Pantalla2Bidireccional(
                      frutas: ['Fresa', 'Manzana', 'Pera', 'Uva'],
                      onFrutaSeleccionada: actualizarFrutaSeleccionada,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Pantalla2Bidireccional extends StatelessWidget {
  final List<String> frutas;
  final Function(String) onFrutaSeleccionada;

  const Pantalla2Bidireccional({
    super.key,
    required this.frutas,
    required this.onFrutaSeleccionada,
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
            onTap: () {
              onFrutaSeleccionada(frutas[index]);
              Navigator.pop(context);
            },
          );
        },
      ),
    );
  }
}