import 'package:flutter/material.dart';

import '../../resources/app_colors.dart';
import '../../resources/app_fonts.dart';

class AppText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? size;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextDecoration? textDecoration;
  final double? height;

  const AppText({
    required this.text,
    this.color,
    this.size,
    this.fontFamily,
    this.fontWeight,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.height,
    this.textDecoration,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      softWrap: true,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow ?? TextOverflow.ellipsis,
      style: TextStyle(
        height: height ?? 1.5,
        color: color ?? AppColors.textColor,
        fontSize: size ?? 15.0,
        fontFamily: fontFamily ?? AppFonts.cinzel,
        fontWeight: fontWeight ?? FontWeight.w500,
        textBaseline: TextBaseline.alphabetic,
        decoration: textDecoration,
      ),
    );
  }
}
