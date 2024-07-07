// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:food_portfolio/resources/app_colors.dart';
import 'package:food_portfolio/resources/app_images.dart';
import 'package:food_portfolio/utils/widgets/app_text.dart';
import 'package:responsive_builder/responsive_builder.dart';

class NavigationHeader extends StatelessWidget {
  final VoidCallback onHomePressed;
  final VoidCallback onProductsPressed;
  final VoidCallback onAboutUsPressed;
  final VoidCallback onContactPressed;
  final VoidCallback onBlogPressed;

  NavigationHeader({
    required this.onHomePressed,
    required this.onProductsPressed,
    required this.onAboutUsPressed,
    required this.onContactPressed,
    required this.onBlogPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
          return Container(
            color: AppColors.primaryColor, // Background color of the navbar
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Company Logo
                Container(
                  height: 64,
                  width: 160,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(Appimages.companyLogo),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            color: AppColors.primaryColor, // Background color of the navbar
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Company Logo
                Container(
                  height: 64,
                  width: 240,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(Appimages.companyLogo),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                // Navigation Links
                Row(
                  children: [
                    _buildNavItem('Home', onHomePressed),
                    _buildNavItem('Products', onProductsPressed),
                    _buildNavItem('About Us', onAboutUsPressed),
                    _buildNavItem('Contact', onContactPressed),
                    _buildNavItem('Blog', onBlogPressed)
                  ],
                ),
              ],
            ),
          );
        }
      },
    );
  }

  Widget _buildNavItem(String title, VoidCallback onPressed) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: AppText(
            text: title,
            size: 18.0,
            fontWeight: FontWeight.w500,
            color: AppColors.textColor, // Replace with appropriate color
          ),
        ),
      ),
    );
  }
}
