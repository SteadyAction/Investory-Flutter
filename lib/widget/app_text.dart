import 'package:flutter/material.dart';
import 'package:investory/service/platform_service.dart';

class AppText extends StatelessWidget {
  final String? text;
  final TextSpan? textSpan;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final TextHeightBehavior? textHeightBehavior;

  const AppText(
    this.text, 
    {
      super.key, 
      this.style,
      this.textAlign,
      this.overflow,
      this.maxLines,
      this.textHeightBehavior,
    }
  ) : textSpan = null;

  const AppText.rich(
    this.textSpan,
    {
      super.key,
      this.style,
      this.textAlign,
      this.overflow,
      this.maxLines,
      this.textHeightBehavior,
    }
  ) : text = null;

  @override
  Widget build(BuildContext context) {
    final textSpan_ = textSpan;
    if (PlatformService.isWeb) {
      if (textSpan_ == null) {
        return SelectableText(
          text ?? '',
          style: style,
          textAlign: textAlign,
          maxLines: maxLines,
          textHeightBehavior: textHeightBehavior,
        );
      } else {
        return SelectableText.rich(
          textSpan_,
          style: style,
          textAlign: textAlign,
          maxLines: maxLines,
          textHeightBehavior: textHeightBehavior,
        );
      }
    } else {
      if (textSpan_ == null) {
        return Text(
          text ?? '',
          style: style,
          textAlign: textAlign,
          overflow: overflow,
          maxLines: maxLines,
          textHeightBehavior: textHeightBehavior,
        );
      } else {
        return Text.rich(
          textSpan_,
          style: style,
          textAlign: textAlign,
          overflow: overflow,
          maxLines: maxLines,
          textHeightBehavior: textHeightBehavior,
        );
      }
    }
  }
}