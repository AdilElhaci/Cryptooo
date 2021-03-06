import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/models/crypto.model.dart';

Widget cryptoCardContent(CryptoModel crypto, bool status) {
  print(crypto.changePercent24Hr);
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Expanded(
          flex: 1,
          child: SvgPicture.asset(
            'assets/SVG/${crypto.symbol}.svg',
            height: 60,
            width: 50,
          )),
      Expanded(
        flex: 2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              crypto.name,
              style: GoogleFonts.spaceMono(
                  textStyle: TextStyle(
                fontSize: 20,
                color: Colors.black,
              )),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '\$' + crypto.priceUsd.toInt().toString(),
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
                (crypto?.changePercent24Hr ?? 0) >= 0 ? 'assets/icons/increaseicon.svg' : 'assets/icons/decreaseicon.svg',
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ))
    ],
  );
}
