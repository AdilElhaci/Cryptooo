import 'package:cryptoo/screens/cryptoanalysis/crypto_analysis_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

Widget homePageCardList() {
  return ListView.separated(
    itemCount: 4,
    separatorBuilder: (BuildContext context, int index) => SizedBox(
      height: 35,
    ),
    itemBuilder: (BuildContext context, int index) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 29),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CryptoAnalysisScreen()),
            );
          },
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
        ),
      );
    },
  );
}
