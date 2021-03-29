import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:cryptoo/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'widgets/splash_screen_logo_widget.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: Color(0xFF129898),
      splash: Column(
        children: [
          Text(
            'Cryptooo',
            style: GoogleFonts.spaceMono(textStyle: TextStyle(fontSize: 48)),
          ),
          SizedBox(height: 30),
          logoContainer()
        ],
      ),
      nextScreen: HomeSecreen(),
      splashIconSize: 300,
      splashTransition: SplashTransition.sizeTransition,
    );
  }
}
