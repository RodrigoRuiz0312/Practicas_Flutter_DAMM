import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CalculadoraScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CalculadoraScreen extends StatefulWidget {
  @override
  _CalculadoraScreenState createState() => _CalculadoraScreenState();
}

class _CalculadoraScreenState extends State<CalculadoraScreen> {
  String _display = '';
  double? _primerNumero;
  String? _operador;
  bool _esperandoSegundoNumero = false;
  String _operacion = '';

  void _ingresarNumero(String numero) {
    setState(() {
      if (_esperandoSegundoNumero) {
        _display = numero;
        _esperandoSegundoNumero = false;
      } else {
        _display += numero;
      }
    });
  }

  void _seleccionarOperador(String operador) {
    setState(() {
      if (_display.isNotEmpty) {
        _primerNumero = double.tryParse(_display);
        _operador = operador;
        _esperandoSegundoNumero = true;
      }
    });
  }

  void _calcularResultado() {
    if (_primerNumero != null && _operador != null && _display.isNotEmpty) {
      double segundoNumero = double.tryParse(_display) ?? 0;
      double resultado = 0;

      switch (_operador) {
        case '+':
          resultado = _primerNumero! + segundoNumero;
          break;
        case '-':
          resultado = _primerNumero! - segundoNumero;
          break;
        case '*':
          resultado = _primerNumero! * segundoNumero;
          break;
        case '/':
          resultado = segundoNumero != 0 ? _primerNumero! / segundoNumero : 0;
          break;
      }

      setState(() {
        _display = resultado.toString();
        _primerNumero = null;
        _operador = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Center(child: Text('Calculadora'))),
        body: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _operacion,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(minimumSize: Size(85, 50)),
                    onPressed: () {
                      setState(() {
                        _operacion += '7';
                      });
                      print("7");
                    },
                    child: Text('7', style: TextStyle(fontSize: 25)),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(minimumSize: Size(85, 50)),
                    onPressed: () {
                      setState(() {
                        _operacion += '8';
                      });
                      print("8");
                    },
                    child: Text('8', style: TextStyle(fontSize: 25)),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(minimumSize: Size(85, 50)),
                    onPressed: () {
                      setState(() {
                        _operacion += '9';
                      });
                      print("9");
                    },
                    child: Text('9', style: TextStyle(fontSize: 25)),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Theme.of(context).colorScheme.onPrimary,
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      minimumSize: Size(85, 50),
                    ),
                    onPressed: () {
                      setState(() {
                        _operacion += '/';
                      });
                      print("/");
                    },
                    child: Text('/', style: TextStyle(fontSize: 25)),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(minimumSize: Size(85, 50)),
                    onPressed: () {
                      setState(() {
                        _operacion += '4';
                      });
                      print("4");
                    },
                    child: Text('4', style: TextStyle(fontSize: 25)),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(minimumSize: Size(85, 50)),
                    onPressed: () {
                      setState(() {
                        _operacion += '5';
                      });
                      print("5");
                    },
                    child: Text('5', style: TextStyle(fontSize: 25)),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(minimumSize: Size(85, 50)),
                    onPressed: () {
                      setState(() {
                        _operacion += '6';
                      });
                      print("6");
                    },
                    child: Text('6', style: TextStyle(fontSize: 25)),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Theme.of(context).colorScheme.onPrimary,
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      minimumSize: Size(85, 50),
                    ),
                    onPressed: () {
                      setState(() {
                        _operacion += '*';
                      });
                      print("*");
                    },
                    child: Text('*', style: TextStyle(fontSize: 25)),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(minimumSize: Size(85, 50)),
                    onPressed: () {
                      setState(() {
                        _operacion += '1';
                      });
                      print("1");
                    },
                    child: Text('1', style: TextStyle(fontSize: 25)),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(minimumSize: Size(85, 50)),
                    onPressed: () {
                      setState(() {
                        _operacion += '2';
                      });
                      print("2");
                    },
                    child: Text('2', style: TextStyle(fontSize: 25)),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(minimumSize: Size(85, 50)),
                    onPressed: () {
                      setState(() {
                        _operacion += '3';
                      });
                      print("3");
                    },
                    child: Text('3', style: TextStyle(fontSize: 25)),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Theme.of(context).colorScheme.onPrimary,
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      minimumSize: Size(85, 50),
                    ),
                    onPressed: () {
                      setState(() {
                        _operacion += '-';
                      });
                      print("-");
                    },
                    child: Text('-', style: TextStyle(fontSize: 25)),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(minimumSize: Size(85, 50)),
                    onPressed: () {
                      setState(() {
                        _operacion += '.';
                      });
                      print(".");
                    },
                    child: Text('.', style: TextStyle(fontSize: 25)),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(minimumSize: Size(85, 50)),
                    onPressed: () {
                      setState(() {
                        _operacion += '0';
                      });
                      print("0");
                    },
                    child: Text('0', style: TextStyle(fontSize: 25)),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(minimumSize: Size(85, 50)),
                    onPressed: () {
                      Parser p = Parser();
                      Expression exp = p.parse(_operacion);
                      ContextModel cm = ContextModel();
                      double result = exp.evaluate(EvaluationType.REAL, cm);

                      setState(() {
                        _operacion = result.toString();
                      });
                      print("=");
                    },
                    child: Text('=', style: TextStyle(fontSize: 25)),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Theme.of(context).colorScheme.onPrimary,
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      minimumSize: Size(85, 50),
                    ),
                    onPressed: () {
                      setState(() {
                        _operacion += '+';
                      });
                      print("+");
                    },
                    child: Text('+', style: TextStyle(fontSize: 25)),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _operacion = '';
                      });
                    },
                    child: Text('Limpiar', style: TextStyle(fontSize: 25)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}