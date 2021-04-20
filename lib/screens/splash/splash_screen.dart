import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:cryptoo/core/constants/theme.dart';
import 'package:cryptoo/core/models/crypto.model.dart';
import 'package:cryptoo/core/service/api.dart';
import 'package:cryptoo/screens/home/home_screen.dart';
import 'package:cryptoo/screens/splash/widgets/splash_screen_title.dart';
import 'package:flutter/material.dart';
import 'widgets/splash_screen_logo_widget.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  List<CryptoModel> cryptoDataList = [];

  getData() async {
    cryptoDataList = await getCryptoData();
    setState(() {});
    print(cryptoDataList.length);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 8000,
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
      nextScreen: HomeSecreen(
        datList: cryptoDataList,
      ),
    );
  }
}
