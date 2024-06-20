import 'package:flutter/material.dart';
import 'package:food_portfolio/resources/app_colors.dart';
import 'package:food_portfolio/utils/widgets/app_text.dart';

SnackBar appSnackbar({String? msg, Color? color}) {
  return SnackBar(
    duration: const Duration(seconds: 7),
    backgroundColor: Colors.transparent,
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    content: Container(
      padding: const EdgeInsets.all(16.0),
      alignment: Alignment.center,
      height: 64,
      width: 400,
      decoration: BoxDecoration(
        color: color ?? AppColors.red,
        borderRadius: BorderRadius.circular(16),
      ),
      child: AppText(
        text: msg ?? "",
        size: 15,
        color: AppColors.white,
      ),
    ),
  );
}
