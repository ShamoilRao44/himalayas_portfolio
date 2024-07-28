// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:food_portfolio/resources/app_colors.dart';
import 'package:food_portfolio/resources/app_strings.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:visibility_detector/visibility_detector.dart';

import 'package:food_portfolio/module/home/home_vm.dart';
import 'package:food_portfolio/resources/app_fonts.dart';
import 'package:food_portfolio/resources/app_images.dart';
import 'package:get/get.dart';

class HeroSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        //MOBILE VIEW
        if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
          return GetBuilder<HomeVM>(
            builder: (c) {
              var hght = MediaQuery.of(context).size.height;
              var wdth = MediaQuery.of(context).size.width;
              return VisibilityDetector(
                key: Key('our_products_visibility_detector'),
                onVisibilityChanged: (visibilityInfo) {
                  if (visibilityInfo.visibleFraction > 0.2) {
                    c.isHeroSection = true;
                    c.update();
                  } else {
                    c.isHeroSection = false;
                    c.update();
                  }
                },
                child: Container(
                  height: hght * 0.6,
                  width: wdth,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(Appimages
                          .heroSectionBG), // Replace with your image asset
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: hght * 0.6,
                        width: wdth,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              AppColors.black.withOpacity(0.3),
                              AppColors.black.withOpacity(0.6),
                              AppColors.black.withOpacity(0.7),
                            ],
                          ),
                        ),
                      ),
                      // Company Name and Slogan
                      Container(
                        height: hght * 0.6,
                        width: wdth,
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 24.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Natural\nHimalaya',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 48,
                                    fontFamily: AppFonts.hunters,
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.normal,
                                    height: 0.8),
                              ).animate().slide(
                                    begin: Offset(2, 0),
                                    duration: 1000.ms,
                                    curve: Curves.easeOut,
                                  ),
                              SizedBox(height: 8),
                              Text(
                                AppStrings.slogan,
                                style: TextStyle(
                                  fontSize: 12.0,
                                  color: AppColors.primaryColor,
                                  fontFamily: AppFonts.montserratRegular,
                                ),
                              ).animate().slide(
                                  begin: Offset(2, 0),
                                  duration: 1000.ms,
                                  curve: Curves.easeOut),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
        //DESKTOP VIEW
        else {
          return GetBuilder<HomeVM>(
            builder: (c) {
              var hght = MediaQuery.of(context).size.height;
              var wdth = MediaQuery.of(context).size.width;
              return Container(
                child: VisibilityDetector(
                  key: Key('our_products_visibility_detector'),
                  onVisibilityChanged: (visibilityInfo) {
                    if (visibilityInfo.visibleFraction > 0.2) {
                      c.isHeroSection = true;
                      c.update();
                    } else {
                      c.isHeroSection = false;
                      c.update();
                    }
                  },
                  child: Container(
                    height: wdth > 1000 ? 640 : 320,
                    width: wdth,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(Appimages
                            .heroSectionBG), // Replace with your image asset
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: wdth > 1000 ? 640 : 320,
                          width: wdth,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                AppColors.black.withOpacity(0.3),
                                AppColors.black.withOpacity(0.6),
                                AppColors.black.withOpacity(0.7),
                              ],
                            ),
                          ),
                        ),
                        // Company Name and Slogan
                        Container(
                          width: 1420,
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.only(right: 80),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                AppStrings.companyName,
                                style: TextStyle(
                                  fontSize: 120,
                                  fontFamily: AppFonts.hunters,
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.normal,
                                ),
                              ).animate().slide(
                                  begin: Offset(2, 0),
                                  duration: 1000.ms,
                                  curve: Curves.easeOut),
                              SizedBox(height: 24),
                              Text(
                                AppStrings.slogan,
                                style: TextStyle(
                                  fontSize: 32.0,
                                  color: AppColors.primaryColor,
                                  fontFamily: AppFonts.montserratRegular,
                                ),
                              ).animate().slide(
                                  begin: Offset(2, 0),
                                  duration: 1000.ms,
                                  curve: Curves.easeOut),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}
