import 'package:cryptoo/screens/calculator/calculator_screen.dart';
import 'package:cryptoo/screens/cryptoanalysis/crypto_analysis_screen.dart';
import 'package:cryptoo/screens/home/home_screen.dart';
import 'package:cryptoo/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

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
        '/': (BuildContext context) => SplashScreen(),
        '/cryptooanlysis': (BuildContext context) => CryptoAnalysisScreen(
              cryptoModel: null,
            ),
        '/home': (BuildContext context) => HomeSecreen(),
        '/calculator': (BuildContext context) => CalculatorScreen(),
      },
    );
  }
}
