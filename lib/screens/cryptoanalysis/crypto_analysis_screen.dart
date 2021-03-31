import 'package:cryptoo/core/constants/images.dart';
import 'package:cryptoo/core/constants/theme.dart';
import 'package:cryptoo/screens/calculator/widgets/calculator_screen_go_back_icon.dart';
import 'package:cryptoo/screens/home/widgets/home_screen_card_content.dart';
import 'package:cryptoo/screens/splash/widgets/splash_screen_title.dart';
import 'package:flutter/material.dart';

class CryptoAnalysisScreen extends StatefulWidget {
  @override
  _CryptoAnalysisScreenState createState() => _CryptoAnalysisScreenState();
}

class _CryptoAnalysisScreenState extends State<CryptoAnalysisScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectThemes.MAINCOLOR,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Stack(children: [
          Positioned(
              left: 10,
              child: Container(
                  width: 60, height: 60, child: goToHomeScreenIcon(context))),
          Positioned(
            left: 83,
            child: pageTitle(36),
          ),
          Positioned(
              left: 35,
              top: 200,
              child: Container(
                height: 385,
                width: 356,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white),
                child: Column(
                  children: [
                    Expanded(flex: 2, child: cryptoCardContent()),
                    Expanded(
                      flex: 4,
                      child: Container(child: Image.asset(ImageURL.ANLYSIS)),
                    )
                  ],
                ),
              ))
        ]),
      ),
    );
  }
}
