import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime? _selectedDate;

  void _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 1),
      lastDate: DateTime(DateTime.now().year + 1),
      builder: (BuildContext context, Widget? child) {
        return Theme(data: ThemeData.light(), child: child!);
      },
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  void _showSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Mensaje temporal')),
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Título del diálogo'),
          content: const Text('Contenido del diálogo'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: const Text('Carlos es mi bff'),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Segundo Collage')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min, // Evita overflow
          children: [
            Switch(
              value: true,
              onChanged: (value) {/* ... */},
            ),
            SwitchListTile(
              title: const Text('Activar notificaciones'),
              value: true,
              onChanged: (value) {/*...*/},
            ),
            Slider(
              value: 50,
              min: 0,
              max: 100,
              divisions: 10,
              onChanged: (value) {/*...*/},
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Fecha de nacimiento',
                hintText: 'Seleccione su fecha de nacimiento',
              ),
              readOnly: true,
              controller: TextEditingController(
                text: _selectedDate != null
                    ? "${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}"
                    : "",
              ),
              onTap: () => _selectDate(context),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _showSnackBar(context),
              child: const Text('Mostrar SnackBar'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _showDialog(context),
              child: const Text('Mostrar Diálogo'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _showBottomSheet(context),
              child: const Text('Mostrar BottomSheet'),
            ),
          ],
        ),
      ),
    );
  }
}