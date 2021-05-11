import 'package:cryptoo/core/database-helper.dart';
import 'package:cryptoo/core/models/weekly-crpyto.model.dart';
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
    // TODO: implement initState
    super.initState();
    getCryptoStatus();
  }

  getCryptoStatus() async {
    List<WeeklyCryptoModel> list;
    double result, last, previous;
    list = await DatabaseHelper.instance.getCryptoPrices(widget.crypto.symbol);
    last = list[0].price;
    previous = list[1].price;
    result = last - previous;
    if (result > 0) {
      status = true;
    }
    status = false;
  }

  @override
  Widget build(BuildContext context) {
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
