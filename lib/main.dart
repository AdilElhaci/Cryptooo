import 'package:cryptoo/screens/calculator/calculator_screen.dart';
import 'package:cryptoo/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'screens/splash/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cryptoo',
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => CalculatorScreen(),
        '/home': (BuildContext context) => HomeSecreen(),
        '/calculator': (BuildContext context) => CalculatorScreen(),
      },
    );
  }
}
