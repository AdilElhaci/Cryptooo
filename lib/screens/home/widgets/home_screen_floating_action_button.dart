import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/constants/images.dart';
import '../../calculator/calculator_screen.dart';

Widget homePageFloatingActionButton(BuildContext context) {
  return Stack(
    clipBehavior: Clip.none,
    children: [
      Positioned(
        top: 10,
        left: 15,
        child: Container(
          width: 79,
          height: 67,
          child: FloatingActionButton(
              elevation: 0.0,
              child: SvgPicture.asset(ImageURL.CALCULATOR),
              backgroundColor: new Color(0xFFFF7A00),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CalculatorScreen()),
                );
              }),
        ),
      ),
    ],
  );
}
