import 'package:flutter/material.dart';

import '../../splash/widgets/splash_screen_logo_widget.dart';
import '../../splash/widgets/splash_screen_title.dart';

Widget pageTitleAndLogo() {
  return Stack(
    children: [
      Positioned(
        left: 11,
        top: 13,
        child: logoContainer(64, 64),
      ),
      Positioned(left: 83, top: 13, child: pageTitle(36)),
    ],
  );
}
