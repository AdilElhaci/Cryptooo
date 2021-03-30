import 'package:cryptoo/core/constants/icons_url.dart';
import 'package:cryptoo/core/constants/images.dart';
import 'package:cryptoo/core/constants/theme.dart';
import 'package:cryptoo/screens/splash/widgets/splash_screen_logo_widget.dart';
import 'package:cryptoo/screens/splash/widgets/splash_screen_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeSecreen extends StatefulWidget {
  @override
  _HomeSecreenState createState() => _HomeSecreenState();
}

class _HomeSecreenState extends State<HomeSecreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectThemes.MAINCOLOR,
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            Expanded(
                flex: 3,
                child: Stack(
                  children: [
                    Positioned(
                      left: 11,
                      top: 13,
                      child: logoContainer(64, 64),
                    ),
                    Positioned(left: 83, top: 13, child: pageTitle(36)),
                  ],
                )),
            Expanded(
                flex: 19,
                child: ListView.separated(
                  itemCount: 4,
                  separatorBuilder: (BuildContext context, int index) =>
                      SizedBox(
                    height: 35,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 29),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Color(0xFFC4C4C4),
                        ),
                        width: 356,
                        height: 123,
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
                    );
                  },
                )),
            Expanded(
                flex: 2,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      top: 10,
                      left: 15,
                      child: Container(
                        width: 79,
                        height: 67,
                        child: FloatingActionButton(
                            elevation: 0.0,
                            child: SvgPicture.asset(ImageURL.CALCULATOR),
                            backgroundColor: new Color(0xFFFF7A00),
                            onPressed: () {}),
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
