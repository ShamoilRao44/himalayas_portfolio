// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:food_portfolio/resources/app_fonts.dart';
import 'package:get/get.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:visibility_detector/visibility_detector.dart';

import 'package:food_portfolio/module/home/home_vm.dart';
import 'package:food_portfolio/resources/app_strings.dart'; // Update the path as per your project structure
import 'package:food_portfolio/utils/widgets/app_text.dart'; // Update the path as per your project structure
import 'package:food_portfolio/resources/app_colors.dart'; // Update the path as per your project structure

class AboutUsSnapshot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeVM>(
      builder: (c) {
        var hght = MediaQuery.of(context).size.height;
        var wdth = MediaQuery.of(context).size.width;
        return Container(
          height: hght * 0.9,
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Text and Content
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AppText(
                      text: 'About Us',
                      size: 64.0,
                      fontFamily: AppFonts.gaby,
                      fontWeight: FontWeight.bold,
                      color: AppColors.secondaryColor,
                    ).animate(target: c.imageVisible ? 1 : 0).fadeIn(duration: 700.ms, curve: Curves.easeOut),
                    SizedBox(height: 20),
                    SizedBox(
                      width: 640,
                      child: AppText(
                        text: AppStrings.aboutUsContent,
                        size: 24.0,
                        color: AppColors.textColor,
                        maxLines: 10,
                      ),
                    ).animate(target: c.imageVisible ? 1 : 0).fadeIn(duration: 700.ms, curve: Curves.easeOut),
                    SizedBox(height: 10),
                    MouseRegion(
                      onEnter: (event) {
                        c.isReadMoreButtonHovered = true;
                        c.update();
                      },
                      onExit: (event) {
                        c.isReadMoreButtonHovered = false;
                        c.update();
                      },
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed('/about'); // Ensure the correct route name
                        },
                        child: AnimatedContainer(
                          duration: 600.ms,
                          height: 80,
                          width: 200,
                          decoration: BoxDecoration(
                            color: c.isReadMoreButtonHovered ? AppColors.primaryColor : AppColors.transparent,
                            border: Border.all(
                              color: AppColors.primaryColor,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Stack(
                            children: [
                              AnimatedContainer(
                                duration: 500.ms,
                                height: c.isReadMoreButtonHovered ? 80 : 0,
                                width: 200,
                                decoration: BoxDecoration(
                                  color: AppColors.primaryColor,
                                  border: Border.all(
                                    color: AppColors.primaryColor,
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              Center(
                                child: AppText(
                                  text: 'Read More',
                                  size: 24,
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ).animate(target: c.imageVisible ? 1 : 0).fadeIn(duration: 2000.ms, curve: Curves.easeOut),
                    ),
                  ],
                ),
              ),
              // Rolling Image
              Expanded(
                flex: 1,
                child: VisibilityDetector(
                  key: Key('about_us_visibility_detector'),
                  onVisibilityChanged: (visibilityInfo) {
                    if (visibilityInfo.visibleFraction > 0.1) {
                      c.triggerImageAnimation();
                    } else {
                      c.imageVisible = false;
                      c.update();
                    }
                  },
                  child: GetBuilder<HomeVM>(
                    builder: (c) {
                      return Image.asset(
                        'assets/icons/peas.png',
                        width: 200,
                      ).animate(target: c.imageVisible ? 1 : 0).slide(
                            begin: Offset(1, 0),
                            duration: 1000.ms,
                            curve: Curves.easeOut,
                          );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
