import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hello World'),
        ),
        body: Center(
          child: Column(
            children: [
              Row(
                children: [
              Text('Hello World', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
              Icon(Icons.star, color: Colors.yellow, size: 50),
                ],
              ),
              Row(
                children: [
              Image.asset('assets/R.jpg', height: 200, width: 400,),
              Image.network('https://lumiere-a.akamaihd.net/v1/images/cars_on_the_road_01_d8e1b843.jpeg?region=0,14,1555,874', height: 200, width: 400,)
                ],
              ),
            Column(
              children: [
                Row(
                  children: [
                    Image.asset('assets/pluto.png', height: 200, width: 100,),
                    Text('Wow', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    ElevatedButton(onPressed: () {}, child: Text('Aceptar'),),
                    TextButton(onPressed: () {}, child: Text('Cancelar')),
                    OutlinedButton(onPressed: () {}, child: Text('Salir')),
                    IconButton(onPressed: () {}, icon: Icon(Icons.star, color: Colors.yellow, size: 50),),
                    ElevatedButton(onPressed: () {}, style: ElevatedButton.styleFrom(foregroundColor: Colors.blue, backgroundColor: Colors.white) ,child: Text('Aceptar'),),  
                  ],
                )
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    
                  ],
                )
              ],
            )
            ],
          ),
        ),
      ),
    );
  }
}