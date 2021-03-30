import 'package:cryptoo/screens/splash/widgets/splash_screen_logo_widget.dart';
import 'package:cryptoo/screens/splash/widgets/splash_screen_title.dart';
import 'package:flutter/material.dart';

class PageTitleAndLogo extends StatelessWidget {
  const PageTitleAndLogo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}
