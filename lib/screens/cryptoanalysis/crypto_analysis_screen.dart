import 'package:cryptoo/core/constants/icons_url.dart';
import 'package:cryptoo/core/constants/images.dart';
import 'package:cryptoo/core/constants/theme.dart';
import 'package:cryptoo/screens/home/home_screen.dart';
import 'package:cryptoo/screens/splash/widgets/splash_screen_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

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
                width: 60,
                height: 60,
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeSecreen()),
                    );
                  },
                  icon: SvgPicture.asset(
                    IconURL.GOBACK,
                  ),
                ),
              )),
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
                    Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                              flex: 1,
                              child: SvgPicture.asset(
                                'assets/images/ada.svg',
                              )),
                          Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'ADA',
                                  style: GoogleFonts.spaceMono(
                                      textStyle: TextStyle(
                                    fontSize: 24,
                                    color: Colors.black,
                                  )),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '10,000',
                                  style: GoogleFonts.spaceMono(
                                      textStyle: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                  )),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    'assets/icons/decreaseicon.svg',
                                    width: 60,
                                    height: 50,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    '02,87%',
                                    style: GoogleFonts.spaceMono(
                                        textStyle: TextStyle(
                                      fontSize: 18,
                                      color: Colors.red,
                                    )),
                                  ),
                                ],
                              ))
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
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
