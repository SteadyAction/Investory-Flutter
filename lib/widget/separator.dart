import 'package:flutter/material.dart';
import 'package:investory/property/app_color.dart';

class Separator extends StatelessWidget {

  final Color? color;
  final double? height;

  const Separator({super.key, this.color, this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color ?? AppColor.secondarySeparator,
      height: height ?? (1 / MediaQuery.of(context).devicePixelRatio)
    );
  }
}