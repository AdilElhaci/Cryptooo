import 'package:cryptoo/core/constants/icons_url.dart';
import 'package:cryptoo/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget goToHomeScreenIcon(BuildContext context) {
  return IconButton(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeSecreen()),
      );
    },
    icon: SvgPicture.asset(
      IconURL.GOBACK,
    ),
  );
}
