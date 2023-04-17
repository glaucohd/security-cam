import 'package:flutter/material.dart';

import '../../../../core/app_colors.dart';

class TextWidget extends StatelessWidget {
  final TextAlign? textAlign;
  final String? text;
  final Color? color;
  final FontStyle? fontStyle;
  final double? fontSize;
  final FontWeight? fontWeight;
  const TextWidget({
    super.key,
    this.textAlign = TextAlign.center,
    this.text,
    this.color = AppColors.primaryText,
    this.fontStyle = FontStyle.normal,
    this.fontSize = 13,
    this.fontWeight = FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: textAlign,
      text ?? "-",
      style: TextStyle(
        color: color,
        fontStyle: fontStyle,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
