// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:food_portfolio/resources/app_fonts.dart';
import 'package:food_portfolio/resources/app_images.dart';
import 'package:food_portfolio/resources/app_routes.dart';
import 'package:food_portfolio/resources/app_strings.dart';
import 'package:food_portfolio/utils/widgets/app_drawer.dart';
import 'package:get/get.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:food_portfolio/utils/widgets/navigation_header.dart'; // Update the path as per your project structure
import 'package:food_portfolio/utils/widgets/footer.dart'; // Update the path as per your project structure
import 'package:food_portfolio/utils/widgets/app_text.dart'; // Update the path as per your project structure
import 'package:food_portfolio/resources/app_colors.dart'; // Update the path as per your project structure
import 'about_us_vm.dart'; // Create a ViewModel for this page

class AboutUsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var hght = MediaQuery.of(context).size.height;
    var wdth = MediaQuery.of(context).size.width;
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
          //MOBILE VIEW
          return GetBuilder<AboutUsVM>(
            init: AboutUsVM(),
            builder: (vm) {
              return Scaffold(
                endDrawer: AppDrawer(),
                backgroundColor: AppColors.backgroundColor,
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      // Navigation Header
                      NavigationHeader(
                        onHomePressed: () => Get.toNamed(AppRoutes.home),
                        onProductsPressed: () => Get.toNamed(AppRoutes.home),
                        onAboutUsPressed: () => Get.toNamed('/about'),
                        onContactPressed: () => Get.toNamed('/contact'),
                        onBlogPressed: () => Get.toNamed(AppRoutes.blog),
                      ),
                      // Background Image with About Us Text
                      Stack(
                        children: [
                          Container(
                            width: wdth,
                            height: hght * 0.5,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(Appimages.aboutUsBG),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ).animate().fadeIn(duration: 600.ms, curve: Curves.easeIn),
                          Container(
                            width: wdth,
                            height: hght * 0.5,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: AppColors.black.withValues(alpha: 0.8),
                            ),
                            child: AppText(
                              text: 'About Us',
                              size: 64.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: AppFonts.gaby,
                              color: AppColors.primaryColor,
                            ).animate().fadeIn(duration: 800.ms, curve: Curves.easeIn),
                          ),
                        ],
                      ),
                      SizedBox(height: 80),
                      // Main Value Text
                      SizedBox(
                        width: 480,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: AppText(
                            text: AppStrings.aboutUsIntro,
                            size: 24.0,
                            fontWeight: FontWeight.normal,
                            color: AppColors.secondaryColor,
                            fontFamily: AppFonts.gaby, // Replace with your funky font
                            textAlign: TextAlign.center,
                            maxLines: 6,
                          ),
                        ),
                      ),
                      SizedBox(height: 80),
                      // FIRST CARD
                      VisibilityDetector(
                        key: Key('card1_visibility_detector'),
                        onVisibilityChanged: (visibilityInfo) {
                          if (visibilityInfo.visibleFraction > 0.1) {
                            vm.triggerFirstCardAnimation();
                          }
                        },
                        child: _buildCard(
                          imagePath: Appimages.card1,
                          title: 'Our Vision',
                          text: AppStrings.visionText,
                          imageLeft: true,
                          target: vm.isFirstCardVisible,
                          color: AppColors.softYellow,
                          isMobile: true,
                          wdth: wdth,
                        ),
                      ),
                      // SECOND CARD
                      VisibilityDetector(
                        key: Key('card2_visibility_detector'),
                        onVisibilityChanged: (visibilityInfo) {
                          if (visibilityInfo.visibleFraction > 0.1) {
                            vm.triggerSecondCardAnimation();
                          }
                        },
                        child: _buildCard(
                          imagePath: Appimages.card2,
                          title: 'Our Mission',
                          text: AppStrings.missionText,
                          imageLeft: false,
                          target: vm.isSecondCardVisible,
                          color: AppColors.mintGreen,
                          isMobile: true,
                          wdth: wdth,
                        ),
                      ),
                      SizedBox(height: 48),
                      // FOOTER
                      Footer(),
                    ],
                  ),
                ),
              );
            },
          );
        } else {
          //DESKTOP VIEW
          return GetBuilder<AboutUsVM>(
            init: AboutUsVM(),
            builder: (vm) {
              return Scaffold(
                backgroundColor: AppColors.backgroundColor,
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      // Navigation Header
                      NavigationHeader(
                        onHomePressed: () => Get.toNamed(AppRoutes.home),
                        onProductsPressed: () => Get.toNamed(AppRoutes.home),
                        onAboutUsPressed: () => Get.toNamed('/about'),
                        onContactPressed: () => Get.toNamed(AppRoutes.contact),
                        onBlogPressed: () => Get.toNamed(AppRoutes.blog),
                      ),
                      // Background Image with About Us Text
                      Stack(
                        children: [
                          Container(
                            width: wdth,
                            height: hght * 0.8,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(Appimages.aboutUsBG),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ).animate().fadeIn(duration: 600.ms, curve: Curves.easeIn),
                          Container(
                            width: wdth,
                            height: hght * 0.8,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: AppColors.black.withValues(alpha: 0.8),
                            ),
                            child: AppText(
                              text: 'About Us',
                              size: 80.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: AppFonts.gaby,
                              color: AppColors.primaryColor,
                            ).animate().fadeIn(duration: 800.ms, curve: Curves.easeIn),
                          ),
                        ],
                      ),
                      SizedBox(height: 80),
                      // Main Value Text
                      SizedBox(
                        width: 480,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: AppText(
                            text: AppStrings.aboutUsIntro,
                            size: 40.0,
                            fontWeight: FontWeight.normal,
                            color: AppColors.secondaryColor,
                            fontFamily: AppFonts.gaby, // Replace with your funky font
                            textAlign: TextAlign.center,
                            maxLines: 6,
                          ),
                        ),
                      ),
                      SizedBox(height: 80),
                      // FIRST CARD
                      VisibilityDetector(
                        key: Key('card1_visibility_detector'),
                        onVisibilityChanged: (visibilityInfo) {
                          if (visibilityInfo.visibleFraction > 0.1) {
                            vm.triggerFirstCardAnimation();
                          }
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 120.0),
                          child: _buildCard(
                              imagePath: Appimages.card1, // Replace with your image asset
                              title: 'Our Mission',
                              text: AppStrings.missionText,
                              imageLeft: true,
                              target: vm.isFirstCardVisible,
                              color: AppColors.softYellow),
                        ),
                      ),
                      // SECOND CARD
                      VisibilityDetector(
                        key: Key('card2_visibility_detector'),
                        onVisibilityChanged: (visibilityInfo) {
                          if (visibilityInfo.visibleFraction > 0.1) {
                            vm.triggerSecondCardAnimation();
                          }
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 120.0),
                          child: _buildCard(
                            imagePath: Appimages.card2, // Replace with your image asset
                            title: 'Our Vision',
                            text: AppStrings.visionText,
                            imageLeft: false,
                            target: vm.isSecondCardVisible,
                            color: AppColors.mintGreen,
                          ),
                        ),
                      ),
                      SizedBox(height: 48),
                      // Footer
                      Footer(),
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

  Widget _buildCard({
    required String imagePath,
    required String text,
    required String title,
    required bool imageLeft,
    required bool target,
    bool isMobile = false,
    Color? color,
    double? wdth,
  }) {
    return Container(
      width: isMobile ? wdth : double.maxFinite,
      height: isMobile ? 160 : 320,
      decoration: BoxDecoration(color: color ?? AppColors.primaryColor),
      child: Row(
        children: [
          if (imageLeft) _buildImage(imagePath, target, isMobile: isMobile ? true : false),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText(
                    text: title,
                    size: isMobile ? 16 : 30.0,
                    color: AppColors.textColor,
                    fontWeight: FontWeight.normal,
                    fontFamily: AppFonts.gaby,
                    maxLines: 6,
                  ),
                  SizedBox(height: isMobile ? 8 : 32),
                  AppText(
                    text: text,
                    size: isMobile ? 12 : 18.0,
                    color: AppColors.textColor,
                    fontWeight: FontWeight.w400,
                    maxLines: 6,
                  ),
                ],
              ),
            ),
          ),
          if (!imageLeft) _buildImage(imagePath, target, isMobile: isMobile ? true : false),
        ],
      ).animate(target: target ? 1 : 0).fadeIn(duration: 600.ms, curve: Curves.easeIn),
    );
  }

  Widget _buildImage(String imagePath, bool target, {bool isMobile = false}) {
    return Image.asset(
      imagePath,
      width: isMobile ? 160 : 320,
      height: isMobile ? 160 : 320,
      fit: BoxFit.cover,
    ).animate(target: target ? 1 : 0).fadeIn(duration: 600.ms, curve: Curves.easeIn);
  }
}
