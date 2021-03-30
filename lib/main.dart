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
        title: 'Flutter Code Sample for Navigator',
        // MaterialApp contains our top-level Navigator
        initialRoute: '/',
        routes: {
          '/': (BuildContext context) => SplashScreen(),
          '/home': (BuildContext context) => HomeSecreen(),
        });
  }
}
