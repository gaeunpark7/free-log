import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:free_log/core/theme/app_colors.dart';
import 'package:free_log/core/utils/responsive_utils.dart';

class AppTextStyles {
  // 제목
  static const double displaySize = 28; //큰 제목
  static const double headlineSize = 22; // 섹션 제목
  static const double titleSize = 18; // 카드 제목
  static const double subTitleSize = 16; // 부제목

  // 본문
  static const double bodySize = 15; // 기본 텍스트
  static const double captionSize = 13; // 보조 텍스트
  static const double badgeSize = 12; // 뱃지

  static TextStyle display(BuildContext context) => TextStyle(fontSize: Responsive.fontSize(context, displaySize), fontWeight: FontWeight.bold, color: Colors.black87);

  static TextStyle headline(BuildContext context) => TextStyle(fontSize: Responsive.fontSize(context, headlineSize), fontWeight: FontWeight.w700, color: Colors.black87);

  static TextStyle title(BuildContext context) => TextStyle(fontSize: Responsive.fontSize(context, titleSize), fontWeight: FontWeight.bold, color: AppColors.textPrimary);

  static TextStyle subTitle(BuildContext context) => TextStyle(fontSize: Responsive.fontSize(context, subTitleSize), fontWeight: FontWeight.w500, color: AppColors.textPrimary);

  static TextStyle subTitleBold(BuildContext context) => TextStyle(fontSize: Responsive.fontSize(context, subTitleSize), fontWeight: FontWeight.w700, color: AppColors.textPrimary);

  static TextStyle body(BuildContext context) => TextStyle(fontSize: Responsive.fontSize(context, bodySize), color: AppColors.textPrimary);

  static TextStyle bodyBold(BuildContext context) => TextStyle(fontSize: Responsive.fontSize(context, bodySize), color: AppColors.textPrimary, fontWeight: FontWeight.w700);

  static TextStyle caption(BuildContext context) => TextStyle(fontSize: Responsive.fontSize(context, captionSize), color: Colors.grey);
  static TextStyle captionBold(BuildContext context) => TextStyle(fontSize: Responsive.fontSize(context, captionSize), color: Colors.grey, fontWeight: FontWeight.bold);

  static TextStyle badge(BuildContext context) => TextStyle(fontSize: Responsive.fontSize(context, badgeSize), fontWeight: FontWeight.w500);
  static TextStyle badgeBold(BuildContext context) => TextStyle(fontSize: Responsive.fontSize(context, badgeSize), fontWeight: FontWeight.bold);
}
