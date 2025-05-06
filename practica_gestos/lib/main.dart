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
      title: 'Gestos',
      debugShowCheckedModeBanner: false,
      home: Gestos(),
    );
  }
}

class Gestos extends StatefulWidget {
  @override
  _GestosState createState() => _GestosState();
}

class _GestosState extends State<Gestos> {
  bool _pressed = false;
  bool _pressed2 = false;
  bool _showFirst = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Gestos')),
      resizeToAvoidBottomInset: false,
      body: Center(
        child: SingleChildScrollView( // Agregado para evitar overflow
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  print('Un toque');
                },
                onDoubleTap: () {
                  print('Doble toque');
                },
                onLongPress: () {
                  print('Toque largo');
                },
                onPanUpdate: (details) {},
                child: Container(width: 100, height: 100, color: Colors.red),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  color: const Color.fromARGB(118, 33, 149, 243),
                  width: 100,
                  height: 100,
                ),
              ),
              Dismissible(
                key: Key('1'),
                child: ListTile(title: Text('Elemento 1')),
                onDismissed: (direction) {
                  if (direction == DismissDirection.endToStart) {
                    print('Eliminado');
                  }
                },
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _pressed = !_pressed;
                  });
                },
                child: AnimatedContainer(
                  duration: Duration(seconds: 1),
                  curve: Curves.fastOutSlowIn,
                  height: _pressed ? 100 : 200,
                  width: _pressed ? 100 : 200,
                  color: _pressed ? Colors.red : Colors.blue,
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 200,
                height: 200,
                child: Stack(
                  children: [
                    AnimatedPositioned(
                      duration: Duration(seconds: 5),
                      left: _pressed2 ? 150 : 0,
                      top: _pressed2 ? 150 : 0,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _pressed2 = !_pressed2;
                          });
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _showFirst = !_showFirst;
                  });
                },
                child: AnimatedCrossFade(
                  duration: Duration(seconds: 1),
                  firstChild: Text('Persona'),
                  secondChild: Icon(Icons.person),
                  crossFadeState: _showFirst
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
