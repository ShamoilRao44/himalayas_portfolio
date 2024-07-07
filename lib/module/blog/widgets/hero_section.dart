// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:food_portfolio/module/blog/blog_vm.dart';
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
          return GetBuilder<BlogVM>(
            builder: (c) {
              var hght = MediaQuery.of(context).size.height;
              var wdth = MediaQuery.of(context).size.width;
              return VisibilityDetector(
                key: Key('our_products_visibility_detector'),
                onVisibilityChanged: (visibilityInfo) {},
                child: Container(
                  height: hght * 0.5,
                  width: wdth,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(Appimages.blogBG), // Replace with your image asset
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
                              fontFamily: AppFonts.hunters,
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
        }
        //DESKTOP VIEW
        else {
          return GetBuilder<BlogVM>(
            builder: (c) {
              var hght = MediaQuery.of(context).size.height;
              var wdth = MediaQuery.of(context).size.width;
              return VisibilityDetector(
                key: Key('our_products_visibility_detector'),
                onVisibilityChanged: (visibilityInfo) {},
                child: Container(
                  height: wdth > 1000 ? hght * 0.9 : hght * 0.5,
                  width: wdth,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(Appimages.blogBG), // Replace with your image asset
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
                            // gradient: LinearGradient(
                            //   colors: [
                            //     AppColors.black.withOpacity(0.7),
                            //   ],
                            // ),
                            color: AppColors.black.withOpacity(0.7)),
                      ),
                      // BLOG TEXT
                      Text(
                        "Our Blog",
                        style: TextStyle(
                          fontSize: 120,
                          fontFamily: AppFonts.hunters,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.normal,
                        ),
                      ).animate().slide(begin: Offset(2, 0), duration: 1000.ms, curve: Curves.easeOut),
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
