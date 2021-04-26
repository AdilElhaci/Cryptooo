import 'package:animated_splash_screen/animated_splash_screen.dart';
import '../../core/constants/theme.dart';

import '../home/home_screen.dart';
import 'widgets/splash_screen_title.dart';
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
    return AnimatedSplashScreen(
      duration: 5000,
      splashTransition: SplashTransition.sizeTransition,
      backgroundColor: ProjectThemes.MAINCOLOR,
      splashIconSize: 300,
      splash: Column(
        children: [
          pageTitle(48),
          SizedBox(height: 30),
          logoContainer(153, 153)
        ],
      ),
      nextScreen: HomeSecreen(),
    );
  }
}
