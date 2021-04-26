import 'package:cryptoo/core/constants/theme.dart';
import 'package:cryptoo/core/models/crypto.model.dart';
import 'package:cryptoo/screens/calculator/widgets/calculator_screen_go_back_icon.dart';
import 'package:cryptoo/screens/cryptoanalysis/widgets/crypto_analysis_screen_analysis.dart';
import 'package:cryptoo/screens/home/widgets/home_screen_crypto_card.dart';
import 'package:cryptoo/screens/splash/widgets/splash_screen_title.dart';
import 'package:flutter/material.dart';

class CryptoAnalysisScreen extends StatefulWidget {
  final CryptoModel cryptoModel;

  const CryptoAnalysisScreen({Key key, @required this.cryptoModel})
      : super(key: key);
  @override
  _CryptoAnalysisScreenState createState() => _CryptoAnalysisScreenState();
}

class _CryptoAnalysisScreenState extends State<CryptoAnalysisScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectThemes.MAINCOLOR,
      body: SafeArea(
        child: Padding(
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
                left: 20,
                top: 150,
                child: Container(
                  height: 500,
                  width: 400,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.white),
                  child: Column(
                    children: [
                      Expanded(
                          flex: 3,
                          child: cryptooCard(widget.cryptoModel, Colors.white)),
                      Expanded(
                        flex: 6,
                        child: Container(child: LineSceeen()),
                      )
                    ],
                  ),
                ))
          ]),
        ),
      ),
    );
  }
}
