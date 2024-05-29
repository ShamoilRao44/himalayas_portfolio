// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:food_portfolio/resources/app_fonts.dart';
import 'package:food_portfolio/resources/app_images.dart';
import 'package:food_portfolio/resources/app_strings.dart';
import 'package:get/get.dart';
import 'package:flutter_animate/flutter_animate.dart';
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
    return GetBuilder<AboutUsVM>(
      init: AboutUsVM(),
      builder: (vm) {
        return Scaffold(
          backgroundColor: AppColors.backgroundColor,
          body: Column(
            children: [
              // Navigation Header
              NavigationHeader(
                onHomePressed: () => Get.toNamed('/home'),
                onProductsPressed: () => Get.toNamed('/products'),
                onAboutUsPressed: () => Get.toNamed('/about'),
                onContactPressed: () => Get.toNamed('/contact'),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // Background Image with About Us Text
                      Stack(
                        children: [
                          Container(
                            width: wdth,
                            height: hght * 0.7,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(Appimages.aboutUsBG),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ).animate().fadeIn(duration: 600.ms, curve: Curves.easeIn),
                          Container(
                            width: wdth,
                            height: hght * 0.7,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: AppColors.black.withOpacity(0.7),
                            ),
                            child: AppText(
                              text: 'About Us',
                              size: 80.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: AppFonts.gaby,
                              color: Colors.white,
                            ).animate().fadeIn(duration: 800.ms, curve: Curves.easeIn),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      // Main Value Text
                      SizedBox(
                        width: 480,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: AppText(
                            text:
                                'Our company is dedicated to providing the best products and services to our customers. We value quality, integrity, and customer satisfaction above all.',
                            size: 40.0,
                            fontWeight: FontWeight.bold,
                            color: AppColors.secondaryColor,
                            fontFamily: AppFonts.gaby, // Replace with your funky font
                            textAlign: TextAlign.center,
                            maxLines: 6,
                          ),
                        ),
                      ),
                      SizedBox(height: 40),
                      // First Card
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
                              text: AppStrings.loremIpsum,
                              imageLeft: true,
                              target: vm.isFirstCardVisible,
                              color: AppColors.softYellow),
                        ),
                      ),

                      // Second Card
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
                            text: AppStrings.loremIpsum,
                            imageLeft: false,
                            target: vm.isSecondCardVisible,
                            color: AppColors.mintGreen,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      // Footer
                      Footer(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCard({
    required String imagePath,
    required String text,
    required bool imageLeft,
    required bool target,
    Color? color,
  }) {
    return Container(
      width: double.maxFinite,
      height: 320,
      decoration: BoxDecoration(color: color ?? AppColors.primaryColor),
      child: Row(
        children: [
          if (imageLeft) _buildImage(imagePath, target),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: AppText(
                text: text,
                size: 18.0,
                color: AppColors.white,
                fontWeight: FontWeight.w400,
                maxLines: 6,
              ),
            ),
          ),
          if (!imageLeft) _buildImage(imagePath, target),
        ],
      ).animate(target: target ? 1 : 0).fadeIn(duration: 600.ms, curve: Curves.easeIn),
    );
  }

  Widget _buildImage(String imagePath, bool target) {
    return Image.asset(
      imagePath,
      width: 320,
      height: 320,
      fit: BoxFit.cover,
    ).animate(target: target ? 1 : 0).fadeIn(duration: 600.ms, curve: Curves.easeIn);
  }
}
