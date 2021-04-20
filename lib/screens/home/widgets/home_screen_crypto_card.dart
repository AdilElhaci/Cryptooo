import 'package:cryptoo/core/models/crypto.model.dart';
import 'package:flutter/material.dart';

import 'home_screen_card_content.dart';

Widget cryptooCard(CryptoModel crypto) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      color: Color(0xFFC4C4C4),
    ),
    width: 356,
    height: 123,
    child: cryptoCardContent(crypto),
  );
}
