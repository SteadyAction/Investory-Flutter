import 'package:flutter/material.dart';

extension ColorExtension on Color {
  String get colorString {

  return '#${alpha.toRadixString(16).padLeft(2, '0')}${red.toRadixString(16).padLeft(2, '0')}${green.toRadixString(16).padLeft(2, '0')}${blue.toRadixString(16).padLeft(2, '0')}';
}
}