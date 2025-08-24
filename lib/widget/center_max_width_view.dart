import 'package:flutter/widgets.dart';
import 'package:investory/property/app_constant.dart';

class CenterMaxWidthView extends StatelessWidget {
  final Widget child;
  final double maxWidth;

  const CenterMaxWidthView({required this.child, this.maxWidth = AppConstant.maxWidth, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: child
      )
    );
  }
}