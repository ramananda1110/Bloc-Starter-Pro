
import 'package:bloc_starter_pro/config/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CustomTextStyle {
  static const double fontSize = 12;
  static const FontWeight fontWeight = FontWeight.normal;

  static const TextStyle textStyleNormal = TextStyle(
    fontSize: fontSize,
    fontWeight: fontWeight,
  );

  static const TextStyle textStyleBold = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle connectTitle = TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: AppColorTheme.deliveryHandoverBox);

}