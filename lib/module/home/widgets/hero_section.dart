// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
                  height: hght * 0.5,
                  width: wdth,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(Appimages.heroSectionBG), // Replace with your image asset
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Container(
                      //   width: wdth,
                      //   height: hght,
                      //   color: AppColors.black.withOpacity(0.5),
                      // ),
                      // Company Name and Slogan
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Company Name',
                            style: TextStyle(
                              fontSize: 80,
                              fontFamily: AppFonts.gaby,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ).animate().slide(begin: Offset(0, 4), duration: 1000.ms, curve: Curves.easeOut),
                          SizedBox(height: 24),
                          Text(
                            'Your Company Slogan',
                            style: TextStyle(
                              fontSize: 24.0,
                              color: Colors.white,
                            ),
                          ).animate().slide(begin: Offset(0, 4), duration: 1000.ms, curve: Curves.easeOut),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        } else {
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
                  height: wdth > 1000 ? hght : hght * 0.5,
                  width: wdth,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(Appimages.heroSectionBG), // Replace with your image asset
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: wdth,
                        height: hght,
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
                      Positioned(
                        right: 80,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              AppStrings.companyName,
                              style: TextStyle(
                                fontSize: 100,
                                fontFamily: AppFonts.gaby,
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ).animate().slide(begin: Offset(2, 0), duration: 1000.ms, curve: Curves.easeOut),
                            SizedBox(height: 24),
                            Text(
                              AppStrings.slogan,
                              style: TextStyle(
                                fontSize: 32.0,
                                color: AppColors.primaryColor,
                                fontFamily: AppFonts.cinzel,
                              ),
                            ).animate().slide(begin: Offset(2, 0), duration: 1000.ms, curve: Curves.easeOut),
                          ],
                        ),
                      ),
                    ],
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
