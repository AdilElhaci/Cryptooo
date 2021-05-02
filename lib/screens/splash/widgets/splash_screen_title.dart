import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget pageTitle(double fontSize) {
  final String _title = 'Cryptooo';
  return Text(
    _title,
    style: GoogleFonts.spaceMono(
        textStyle: TextStyle(
      fontSize: fontSize,
      color: Colors.black,
    )),
  );
}
