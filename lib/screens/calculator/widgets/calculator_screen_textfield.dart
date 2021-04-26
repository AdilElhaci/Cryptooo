import 'package:flutter/material.dart';

Widget buildPaddingCryptooTextField(
    BuildContext context, String hitText, String suffixText) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20),
    width: MediaQuery.of(context).size.width * 0.9,
    height: 74,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      color: Colors.white,
    ),
    child: Row(
      children: [
        Expanded(
          flex: 3,
          child: TextField(
              keyboardType: TextInputType.number,
              decoration: new InputDecoration(
                hintStyle: TextStyle(
                  fontSize: 30,
                ),
                border: InputBorder.none,
                hintText: hitText,
              )),
        ),
        Expanded(child: Text(suffixText, style: TextStyle(fontSize: 30)))
      ],
    ),
  );
}
