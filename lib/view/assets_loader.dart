import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

// IMPORTANT TODO : Compile SVG for release (https://pub.dev/packages/flutter_svg)
Widget getMainLogo() {
  return SvgPicture.asset(
    "assets/logos/logotmp.svg",
    height: 200,
  );
}
