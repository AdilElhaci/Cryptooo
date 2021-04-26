import 'package:flutter/material.dart';

import '../../../core/models/crypto.model.dart';
import 'home_screen_card_content.dart';

Widget cryptooCard(CryptoModel crypto, Color color) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      color: color,
    ),
    width: 356,
    height: 123,
    child: cryptoCardContent(crypto),
  );
}
