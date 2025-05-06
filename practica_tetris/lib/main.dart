import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Piezas de Tetris')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildRow([null, null, Colors.purple, Colors.purple, Colors.purple, null, null]),
              buildRow([null, null, null, Colors.cyan, null, null, null]),
              buildRow([null, null, null, Colors.cyan, null, null, null]),
              buildRow([Colors.pink, Colors.pink, null, Colors.cyan, null, null, null]),
              buildRow([Colors.orange, null, Colors.red, Colors.red, null, null, null]),
              buildRow([Colors.orange, Colors.orange, Colors.red, Colors.red, null, null, null]),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildRow(List<Color?> colors) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: colors.map((color) => buildBlock(color)).toList(),
    );
  }

  Widget buildBlock(Color? color) {
    return Container(
      margin: EdgeInsets.all(2),
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: color ?? Colors.transparent,
        border: color != null ? Border.all(color: Colors.black, width: 1) : null,
      ),
    );
  }
}
