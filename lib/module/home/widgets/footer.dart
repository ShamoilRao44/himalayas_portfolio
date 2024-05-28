// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:food_portfolio/utils/widgets/app_text.dart'; // Update the path as per your project structure
import 'package:food_portfolio/resources/app_colors.dart'; // Update the path as per your project structure

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var wdth = MediaQuery.of(context).size.width;
    var hght = MediaQuery.of(context).size.height;
    return Container(
      width: wdth,
      height: hght * 0.8,
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
      color: AppColors.primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Company Logo
          AppText(
            text: 'Company Logo',
            size: 24.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          SizedBox(height: 20),
          // Quick Links
          SizedBox(
            width: 800,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        text: 'Quick Links',
                        size: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      SizedBox(height: 10),
                      GestureDetector(
                        onTap: () => Get.toNamed('/home'),
                        child: AppText(
                          text: 'Home',
                          size: 18.0,
                          color: Colors.white,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Get.toNamed('/products'),
                        child: AppText(
                          text: 'Products',
                          size: 18.0,
                          color: Colors.white,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Get.toNamed('/about'),
                        child: AppText(
                          text: 'About Us',
                          size: 18.0,
                          color: Colors.white,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Get.toNamed('/contact'),
                        child: AppText(
                          text: 'Contact',
                          size: 18.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                // Contact Information
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      text: 'Contact Information',
                      size: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    SizedBox(height: 10),
                    AppText(
                      text: 'Address: 123 Main Street, City, Country',
                      size: 18.0,
                      color: Colors.white,
                    ),
                    AppText(
                      text: 'Phone: +123 456 7890',
                      size: 18.0,
                      color: Colors.white,
                    ),
                    AppText(
                      text: 'Email: info@company.com',
                      size: 18.0,
                      color: Colors.white,
                    ),
                  ],
                ),
                // Social Media Links
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      text: 'Follow Us',
                      size: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.facebook),
                          iconSize: 24,
                          color: Colors.white,
                          onPressed: () => _launchURL('https://www.facebook.com'),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(
        Uri.parse(url),
      );
    } else {
      throw 'Could not launch $url';
    }
  }
}
