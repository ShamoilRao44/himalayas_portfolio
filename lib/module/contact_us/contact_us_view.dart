// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:food_portfolio/resources/app_colors.dart';
import 'package:food_portfolio/resources/app_fonts.dart';
import 'package:food_portfolio/resources/app_routes.dart';
import 'package:food_portfolio/resources/app_strings.dart';
import 'package:food_portfolio/utils/widgets/app_text.dart';
import 'package:food_portfolio/utils/widgets/navigation_header.dart';
import 'package:get/get.dart';
import 'contact_us_vm.dart';
import 'widgets/hero_section.dart'; // Updated import
import 'widgets/location_details_section.dart';
import 'widgets/quick_contact_section.dart';
import '../../utils/widgets/footer.dart';

class ContactUsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ContactUsVM>(
      init: ContactUsVM(),
      builder: (c) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NavigationHeader(
                  onHomePressed: () => Get.toNamed('/home'),
                  onProductsPressed: () => Get.toNamed('/products'),
                  onAboutUsPressed: () => Get.toNamed('/about'),
                  onContactPressed: () => Get.toNamed('/contact'),
                  onBlogPressed: () => Get.toNamed(AppRoutes.blog),
                ),
                HeroSection(), // Updated widget name
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 32.0),
                  child: AppText(
                    text: AppStrings.loremIpsum,
                    maxLines: 3,
                    size: 30,
                    textAlign: TextAlign.center,
                    fontFamily: AppFonts.montserratRegular,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textColor2,
                  ),
                ),
                LocationDetailsSection(),
                QuickContactSection(),
                Footer(),
              ],
            ),
          ),
        );
      },
    );
  }
}
