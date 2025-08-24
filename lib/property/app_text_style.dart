import 'package:investory/extension/text_style_extension.dart';
import 'package:investory/property/app_color.dart';
import 'package:flutter/material.dart';
import 'package:investory/property/app_font.dart';

class AppTextStyle extends TextStyle {

  static TextStyle get barTitle {
    return const TextStyle(
      color: AppColor.primaryText,
      fontSize: 16, 
      fontWeight: FontWeight.w600,
      fontFamily: AppFont.inter
    ).withDefault;
  }

  static TextStyle get barCenterTitle {
    return const TextStyle(
      color: AppColor.primaryText,
      fontSize: 14, 
      fontWeight: FontWeight.w600,
    ).withDefault;
  }

  static TextStyle get header {
    return const TextStyle(
      color: AppColor.primaryText,
      fontSize: 35, 
      fontWeight: FontWeight.w700,
      fontFamily: AppFont.sourceSerif4
    ).withDefault;
  }

  static TextStyle get insightTitle {
    return const TextStyle(
      color: AppColor.primaryText,
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ).withDefault;
  }
}