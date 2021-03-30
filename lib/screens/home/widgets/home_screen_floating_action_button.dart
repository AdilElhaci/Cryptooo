import 'package:cryptoo/core/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget homePageFloatingActionButton() {
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
              onPressed: () {}),
        ),
      ),
    ],
  );
}
