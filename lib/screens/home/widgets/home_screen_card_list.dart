import 'package:flutter/material.dart';

import '../../cryptoanalysis/crypto_analysis_screen.dart';
import 'home_screen_crypto_card.dart';

Widget homePageCardList(datList) {
  return ListView.separated(
    itemCount: datList.length,
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
              MaterialPageRoute(
                  builder: (context) =>
                      CryptoAnalysisScreen(cryptoModel: datList[index])),
            );
          },
          child: cryptooCard(datList[index], Color(0xFFC4C4C4)),
        ),
      );
    },
  );
}
