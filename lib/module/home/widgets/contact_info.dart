// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:food_portfolio/module/home/home_vm.dart';
import 'package:food_portfolio/resources/app_fonts.dart';
import 'package:food_portfolio/resources/app_routes.dart';
import 'package:food_portfolio/resources/app_strings.dart';
import 'package:get/get.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:food_portfolio/utils/widgets/app_text.dart'; // Update the path as per your project structure
import 'package:food_portfolio/resources/app_colors.dart'; // Update the path as per your project structure

class ContactInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var hght = MediaQuery.of(context).size.height;
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        //mobile Layout
        if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
          return GetBuilder<HomeVM>(
            builder: (c) {
              return VisibilityDetector(
                key: Key('contact_us_visibility_detector'),
                onVisibilityChanged: (visibilityInfo) {
                  if (visibilityInfo.visibleFraction > 0.1) {
                    c.triggerContactSectionAnimations();
                  } else {
                    c.isCntctAnmTrig = false;
                    c.update();
                  }
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0),
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Contact Us Title
                      Center(
                        child: AppText(
                          text: 'Contact Us',
                          size: 48.0,
                          fontFamily: AppFonts.gaby,
                          fontWeight: FontWeight.bold,
                          color: AppColors.secondaryColor,
                        ).animate(target: c.isCntctAnmTrig ? 1 : 0).fadeIn(duration: 600.ms, curve: Curves.easeIn),
                      ),
                      SizedBox(height: 40),
                      // Contact Information
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          _buildContactInfo(Icons.email, 'info@company.com', animation: 'slideLeft', target: c.isCntctAnmTrig),
                          _buildContactInfo(Icons.phone, '+123 456 7890', animation: 'fadeIn', target: c.isCntctAnmTrig),
                          _buildContactInfo(Icons.location_on, AppStrings.address1, animation: 'slideRight', target: c.isCntctAnmTrig),
                        ],
                      ),
                      SizedBox(height: 40),
                      // Visit Us Button
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
                            Get.toNamed(AppRoutes.contact); // Ensure the correct route name
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
                                    text: 'Visit Us',
                                    size: 24,
                                    color: AppColors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ).animate(target: c.isCntctAnmTrig ? 1 : 0).fadeIn(duration: 2000.ms, curve: Curves.easeOut),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
        //desktop Layout
        else {
          return GetBuilder<HomeVM>(
            builder: (c) {
              return VisibilityDetector(
                key: Key('contact_us_visibility_detector'),
                onVisibilityChanged: (visibilityInfo) {
                  if (visibilityInfo.visibleFraction > 0.1) {
                    c.triggerContactSectionAnimations();
                  } else {
                    c.isCntctAnmTrig = false;
                    c.update();
                  }
                },
                child: Container(
                  height: hght * 0.7,
                  padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0),
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Contact Us Title
                      Center(
                        child: AppText(
                          text: 'Contact Us',
                          size: 48.0,
                          fontFamily: AppFonts.gaby,
                          fontWeight: FontWeight.bold,
                          color: AppColors.secondaryColor,
                        ).animate(target: c.isCntctAnmTrig ? 1 : 0).fadeIn(duration: 600.ms, curve: Curves.easeIn),
                      ),
                      SizedBox(height: 40),
                      // Contact Information
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildContactInfo(Icons.email, 'info@company.com', animation: 'slideLeft', target: c.isCntctAnmTrig),
                          _buildContactInfo(Icons.phone, '+123 456 7890', animation: 'fadeIn', target: c.isCntctAnmTrig),
                          _buildContactInfo(Icons.location_on, AppStrings.address1, animation: 'slideRight', target: c.isCntctAnmTrig),
                        ],
                      ),
                      SizedBox(height: 40),
                      // Visit Us Button

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
                            Get.toNamed(AppRoutes.contact); // Ensure the correct route name
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
                                    text: 'Visit Us',
                                    size: 24,
                                    color: AppColors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ).animate(target: c.isCntctAnmTrig ? 1 : 0).fadeIn(duration: 2000.ms, curve: Curves.easeOut),
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

  Widget _buildContactInfo(IconData icon, String info, {required String animation, required bool target}) {
    Widget contactInfo = Column(
      children: [
        Icon(icon, color: AppColors.primaryColor),
        SizedBox(height: 10),
        MouseRegion(
          cursor: SystemMouseCursors.text,
          child: AppText(
            text: info,
            size: 16.0,
            color: AppColors.textColor,
          ),
        ),
      ],
    );

    switch (animation) {
      case 'slideLeft':
        return contactInfo.animate(target: target ? 1 : 0).slide(begin: Offset(-1, 0), duration: 600.ms, curve: Curves.easeOut);
      case 'slideRight':
        return contactInfo.animate(target: target ? 1 : 0).slide(begin: Offset(1, 0), duration: 600.ms, curve: Curves.easeOut);
      case 'fadeIn':
      default:
        return contactInfo.animate(target: target ? 1 : 0).fadeIn(duration: 600.ms, curve: Curves.easeIn);
    }
  }
}
