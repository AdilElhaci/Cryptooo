import 'package:flutter/material.dart';

import '../../../core/models/crypto.model.dart';
import 'home_screen_card_content.dart';

class CryptooCard extends StatefulWidget {
  CryptooCard({Key key, this.crypto, this.color}) : super(key: key);
  final CryptoModel crypto;
  final Color color;
  @override
  _CryptooCardState createState() => _CryptooCardState();
}

class _CryptooCardState extends State<CryptooCard> {
  bool status;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.crypto.marketCapUsd);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: widget.color,
      ),
      width: 356,
      height: 123,
      child: cryptoCardContent(widget.crypto, status),
    );
  }
}
