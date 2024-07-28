// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:food_portfolio/resources/app_colors.dart';
import 'package:food_portfolio/resources/app_fonts.dart';
import 'package:food_portfolio/resources/app_images.dart';
import 'package:food_portfolio/utils/widgets/app_text.dart'; // Update the path as per your project structure
import 'package:flutter_animate/flutter_animate.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HeroSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var hght = MediaQuery.of(context).size.height;
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
        //MOBILE VIEW
        return Stack(
          children: [
            Image.asset(
              Appimages.visitUsBG, // Replace with your background image path
              width: double.infinity,
              height: hght * 0.5,
              fit: BoxFit.cover,
            ),
            Container(
              width: double.infinity,
              height: hght * 0.5,
              color: AppColors.black.withOpacity(0.7),
              alignment: Alignment.center,
              child: AppText(
                text: 'Visit Us',
                size: 64.0,
                fontFamily: AppFonts.hunters,
                fontWeight: FontWeight.normal,
                color: AppColors.primaryColor,
              ).animate().slide(
                  begin: Offset(0, 1), end: Offset(0, 0), duration: 800.ms),
            ),
          ],
        );
      } else {
        //DESKTOP VIEW
        return Stack(
          children: [
            Image.asset(
              Appimages.visitUsBG, // Replace with your background image path
              width: double.infinity,
              height: hght * 0.7,
              fit: BoxFit.cover,
            ),
            Container(
              width: double.infinity,
              height: hght * 0.7,
              color: AppColors.black.withOpacity(0.7),
              alignment: Alignment.center,
              child: AppText(
                text: 'Visit Us',
                size: 160.0,
                fontFamily: AppFonts.hunters,
                fontWeight: FontWeight.normal,
                color: AppColors.primaryColor,
              ).animate().slide(
                  begin: Offset(0, 1), end: Offset(0, 0), duration: 800.ms),
            ),
          ],
        );
      }
    });
  }
}
