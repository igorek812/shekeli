import 'package:flutter/material.dart';
import 'ui/home-page/page/home-page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Симулятор Жида',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Симулятор Жида'),
          backgroundColor: Colors.blueAccent,
        ),
        body: new HomePage(),
      )
    );
  }
}
