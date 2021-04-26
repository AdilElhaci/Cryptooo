import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/constants/images.dart';

Widget logoContainer(double height, double width) {
  return SvgPicture.asset(
    ImageURL.LOGO,
    height: height,
    width: width,
  );
}
