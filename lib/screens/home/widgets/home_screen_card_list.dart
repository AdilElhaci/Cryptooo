import 'package:cryptoo/screens/cryptoanalysis/crypto_analysis_screen.dart';
import 'package:flutter/material.dart';
import 'home_screen_crypto_card.dart';

Widget homePageCardList(datList) {
  print('home page card list');
  print(datList.length);
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
              MaterialPageRoute(builder: (context) => CryptoAnalysisScreen()),
            );
          },
          child: cryptooCard(datList[index]),
        ),
      );
    },
  );
}
