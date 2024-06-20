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
              SizedBox(height: 40),
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
                          size: 30.0,
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
                  SizedBox(height: 32),
                  // Contact Information
                  Column(
                    children: [
                      AppText(
                        text: 'Contact Information',
                        size: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      SizedBox(height: 16),
                      AppText(
                        text: AppStrings.address1,
                        size: 18.0,
                        color: Colors.white,
                      ),
                      AppText(
                        text: AppStrings.address2,
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
                  SizedBox(height: 32),
                  // Social Media Links
                  Column(
                    children: [
                      AppText(
                        text: 'Follow Us',
                        size: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      SizedBox(height: 10),
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
                          text: AppStrings.address1,
                          size: 18.0,
                          color: Colors.white,
                        ),
                        AppText(
                          text: AppStrings.address2,
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
