import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget pageTitle(double fontSize) {
  return Text(
    'Cryptooo',
    style: GoogleFonts.spaceMono(
        textStyle: TextStyle(
      fontSize: fontSize,
      color: Colors.black,
    )),
  );
}
