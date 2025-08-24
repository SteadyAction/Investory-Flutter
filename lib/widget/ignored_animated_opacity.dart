import 'package:flutter/material.dart';

class IgnoredAnimatedOpacity extends StatelessWidget  {

  final Widget child; 
  final bool visible;
  final double invisibleOpacity;

  const IgnoredAnimatedOpacity({required this.child, required this.visible, this.invisibleOpacity=0, super.key});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !visible,
      child: AnimatedOpacity(
        opacity: visible ? 1.0 : invisibleOpacity,
        duration: const Duration(milliseconds: 300),
        child: child,
      ),
    );
  }
}