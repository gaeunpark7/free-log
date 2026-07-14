import 'package:flutter/material.dart';

class Responsive {
  static bool isMobile(BuildContext context) => MediaQuery.of(context).size.width < 600;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 600 && MediaQuery.of(context).size.width < 1200;

  static bool isWeb(BuildContext context) => MediaQuery.of(context).size.width >= 1200;

  static double width(BuildContext context) => MediaQuery.of(context).size.width;
  static double height(BuildContext context) => MediaQuery.of(context).size.height;

  //텍스트
  static double fontSize(BuildContext context, double base) {
    if (isWeb(context)) return base * 1.15;
    if (isTablet(context)) return base * 1.05;
    return base;
  }

  static double padding(BuildContext context, double base) {
    if (isWeb(context)) return base * 1.5;
    if (isTablet(context)) return base * 1.2;
    return base;
  }

  static double buttonWidth(BuildContext context) {
    if (isWeb(context)) return 400;
    return (MediaQuery.of(context).size.width * 0.85).clamp(280, 500);
  }

  // 카드 패딩
  static EdgeInsets cardPadding(BuildContext context) {
    if (isWeb(context)) {
      return const EdgeInsets.all(24);
    }
    if (isTablet(context)) {
      return const EdgeInsets.all(20);
    }
    return const EdgeInsets.all(16);
  }

  //sizedbox
  static double sizedBoxHeight(BuildContext context, double base) {
    if (isWeb(context)) return base * 1.5;
    if (isTablet(context)) return base * 1.2;
    return base;
  }

  static double sizedBoxWidth(BuildContext context, double base) {
    if (isWeb(context)) return base * 1.5;
    if (isTablet(context)) return base * 1.2;
    return base;
  }

  //컨테이너 높이
  static double containerHeight(BuildContext context, double ratio) {
    return height(context) * ratio;
  }

  // 화면 좌우 여백
  static EdgeInsets screenPadding(BuildContext context) {
    if (isWeb(context)) {
      return const EdgeInsets.symmetric(horizontal: 80, vertical: 24);
    }
    if (isTablet(context)) {
      return const EdgeInsets.symmetric(horizontal: 32, vertical: 20);
    }
    return const EdgeInsets.symmetric(horizontal: 16, vertical: 16);
  }

  // 좌우 여백만 (리스트 아이템)
  static double horizontalPadding(BuildContext context) {
    if (isWeb(context)) return 80;
    if (isTablet(context)) return 32;
    return 16;
  }

  //캘린더 셀 너비
  static double calendarCellWidth(BuildContext context) {
    return (width(context) - 32) / 7 - 4;
  }

  //캘린더 행 높이
  static double calendarRowHeight(BuildContext context) {
    final calculated = calendarCellWidth(context) * 1.4;
    return calculated.clamp(80, 100);
  }
}
