import 'package:flutter/material.dart';

extension TextStyleExtension on TextStyle {
  TextStyle get withDefault {
    return copyWith(
      letterSpacing: 0
    );
  }
}