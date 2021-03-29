import 'package:flutter/material.dart';

import 'widgets/splash_screen_logo_widget.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF129898),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Cryptooo',
              style: TextStyle(
                fontSize: 48,
              ),
            ),
            SizedBox(height: 30),
            logoContainer()
          ],
        ),
      ),
    );
  }
}
