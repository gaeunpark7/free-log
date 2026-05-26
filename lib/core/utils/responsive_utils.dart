import 'package:flutter/material.dart';

class Responsive {
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 600;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 600 &&
      MediaQuery.of(context).size.width < 1200;

  static bool isWeb(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1200;

  static double buttonWidth(BuildContext context) {
    if (isWeb(context)) return 400;
    return MediaQuery.of(context).size.width * 0.85;
  }

  static EdgeInsets padding(BuildContext context) {
    if (isWeb(context)) return const EdgeInsets.all(32);
    if (isTablet(context)) return const EdgeInsets.all(24);
    return const EdgeInsets.all(12);
  }

  static double fontSize(BuildContext context, double base) {
    if (isWeb(context)) return base * 1.2;
    if (isTablet(context)) return base;
    return base * 0.9;
  }
}
