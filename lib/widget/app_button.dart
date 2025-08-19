

import 'package:flutter/material.dart';
import 'package:investory/property/app_color.dart';

class AppButton extends StatefulWidget {

  final Widget child;
  final Color backgroundColor;
  final void Function() onTapped;
  final void Function()? onLongPress;
  final double? width;
  final double? height;
  final double? radius;
  final bool disabled;
  final Color borderColor;
  final double borderWidth;
  final double highlightOpacity;
  final double hoverOpacity;
  final Alignment alignment;

  const AppButton({required this.onTapped, required this.child,  
    this.onLongPress, this.width , this.height, this.radius=27, this.disabled=false, 
    this.backgroundColor=AppColor.clear, this.borderColor=AppColor.clear, this.borderWidth=0, 
    this.highlightOpacity=0.4, this.hoverOpacity=0.8,
    this.alignment=Alignment.center, super.key});

  @override
  State<StatefulWidget> createState() {
    return AppButtonState();
  }
}

class AppButtonState extends State<AppButton> {

  bool _isHighlighted = false;
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: widget.disabled ? SystemMouseCursors.forbidden : SystemMouseCursors.click,
      onEnter: (_) {
        if (!widget.disabled) {
          setState(() { _isHovered = true; });
        }
      },
      onExit: (_) {
        if (!widget.disabled) {
          setState(() { _isHovered = false; });
        }
      },
      child: GestureDetector(
        onTap:
        () async { 
          if (widget.disabled) { return; }
          setState(() { _isHighlighted = false; }); 
          widget.onTapped();
        },
        onLongPress: widget.onLongPress == null
          ? null
          : () async {
            widget.onLongPress?.call();
          },
        onTapDown: (details) { 
          if (widget.disabled) { return; }
          setState(() { _isHighlighted = true; }); 
        },
        onTapCancel: () { 
          if (widget.disabled) { return; }
          setState(() { _isHighlighted = false; }); 
        },
        child: Material(
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.all(Radius.circular(widget.radius ?? 25)),
          color: Colors.transparent,
          child: AnimatedOpacity(
            opacity: _getOpacity(),
            duration: const Duration(milliseconds: 100),
            child: Container(
              width: widget.width,
              height: widget.height,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(widget.radius ?? 25)),
                border: Border.all(width: widget.borderWidth, color: widget.borderColor),
                color: widget.backgroundColor
              ),
              child: Align(alignment: widget.alignment, child: widget.child)
            ),
          )
        ),
      )
    );
  }

   double _getOpacity() {
    if (widget.disabled) {
      return widget.highlightOpacity;
    }
    if (_isHighlighted) {
      return widget.highlightOpacity;
    }
    if (_isHovered) {
      return widget.hoverOpacity;
    }
    return 1.0;
  }  
}