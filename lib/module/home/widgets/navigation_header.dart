import 'package:flutter/material.dart';
import 'package:food_portfolio/resources/app_colors.dart';
import 'package:food_portfolio/utils/widgets/app_text.dart'; // Update the path as per your project structure

class NavigationHeader extends StatelessWidget {
  final VoidCallback onHomePressed;
  final VoidCallback onProductsPressed;
  final VoidCallback onAboutUsPressed;
  final VoidCallback onContactPressed;

  NavigationHeader({
    required this.onHomePressed,
    required this.onProductsPressed,
    required this.onAboutUsPressed,
    required this.onContactPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      color: AppColors.secondaryColor, // Background color of the navbar
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Company Logo
          AppText(
            text: 'Company Logo',
            size: 24.0,
            fontWeight: FontWeight.bold,
            color: AppColors.white, // Replace with appropriate color
          ),
          // Navigation Links
          Row(
            children: [
              _buildNavItem('Home', onHomePressed),
              _buildNavItem('Products', onProductsPressed),
              _buildNavItem('About Us', onAboutUsPressed),
              _buildNavItem('Contact', onContactPressed),
            ],
          ),
        ],
      ),
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
            color: AppColors.white, // Replace with appropriate color
          ),
        ),
      ),
    );
  }
}
