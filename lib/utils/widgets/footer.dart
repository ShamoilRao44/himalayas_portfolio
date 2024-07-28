// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:food_portfolio/resources/app_images.dart';
import 'package:food_portfolio/resources/app_strings.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:food_portfolio/utils/widgets/app_text.dart'; // Update the path as per your project structure
import 'package:food_portfolio/resources/app_colors.dart'; // Update the path as per your project structure

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var wdth = MediaQuery.of(context).size.width;
    var hght = MediaQuery.of(context).size.height;
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
        return Container(
          width: wdth,
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          color: AppColors.secondaryColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
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
              SizedBox(height: 32),
              // Quick Links
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Column(
                      children: [
                        AppText(
                          text: 'Quick Links',
                          size: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          textDecoration: TextDecoration.underline,
                          decorationColor: AppColors.white,
                        ),
                        SizedBox(height: 8),
                        GestureDetector(
                          onTap: () => Get.toNamed('/home'),
                          child: AppText(
                            text: 'Home',
                            size: 16.0,
                            color: Colors.white,
                          ),
                        ),
                        GestureDetector(
                          onTap: () => Get.toNamed('/about'),
                          child: AppText(
                            text: 'About Us',
                            size: 16.0,
                            color: Colors.white,
                          ),
                        ),
                        GestureDetector(
                          onTap: () => Get.toNamed('/contact'),
                          child: AppText(
                            text: 'Contact',
                            size: 16.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24),
                  // Contact Information
                  Column(
                    children: [
                      AppText(
                        text: 'Contact Information',
                        size: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        textDecoration: TextDecoration.underline,
                        decorationColor: AppColors.white,
                      ),
                      SizedBox(height: 8),
                      AppText(
                        text: AppStrings.address1,
                        size: 16.0,
                        color: Colors.white,
                        maxLines: 2,
                      ),
                      AppText(
                        text: AppStrings.address2,
                        size: 16.0,
                        color: Colors.white,
                        maxLines: 2,
                      ),
                      AppText(
                        text:
                            '+91 9589553039\n+91 8602299932\n+91 9009800600\n+91 9926122722',
                        size: 16.0,
                        color: Colors.white,
                      ),
                      AppText(
                        text: AppStrings.email,
                        size: 18.0,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  // Social Media Links
                  Column(
                    children: [
                      AppText(
                        text: 'Follow Us',
                        size: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        textDecoration: TextDecoration.underline,
                        decorationColor: AppColors.white,
                      ),
                      SizedBox(height: 4),
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
        );
      }
      //desktop Layout
      else {
        return Container(
          width: wdth,
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          color: AppColors.secondaryColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Company Logo
              Container(
                height: 80,
                width: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(Appimages.companyLogo),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Quick Links
              SizedBox(
                width: 800,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                        SizedBox(height: 16),
                        SizedBox(
                          width: 240,
                          child: AppText(
                            text: 'City Office: ${AppStrings.address1}',
                            size: 18.0,
                            color: Colors.white,
                            maxLines: 3,
                          ),
                        ),
                        SizedBox(height: 8),
                        SizedBox(
                          width: 240,
                          child: AppText(
                            text: 'Reg. Office: ${AppStrings.address2}',
                            size: 18.0,
                            color: Colors.white,
                            maxLines: 3,
                          ),
                        ),
                        SizedBox(height: 8),
                        AppText(
                          text:
                              'Phone: +91 9589553039\n+91 8602299932\n+91 9009800600\n+91 9926122722',
                          size: 18.0,
                          color: Colors.white,
                        ),
                        SizedBox(height: 8),
                        AppText(
                          text: 'Email: ${AppStrings.email}',
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
                              onPressed: () =>
                                  _launchURL('https://www.facebook.com'),
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
    });
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
