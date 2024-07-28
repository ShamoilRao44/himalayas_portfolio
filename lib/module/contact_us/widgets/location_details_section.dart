// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:food_portfolio/resources/app_strings.dart';
import 'package:food_portfolio/utils/widgets/app_text.dart';
import 'package:responsive_builder/responsive_builder.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationDetailsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
          //MOBILE VIEW
          return Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AppText(
                            text: 'Opening Hours: ',
                            size: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                          AppText(
                            text: '9 AM - 9 PM',
                            size: 16.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            text: 'Phone: ',
                            size: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                          AppText(
                            text:
                                '+91 9589553039\n+91 8602299932\n+91 9009800600\n+91 9926122722',
                            size: 16.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AppText(
                            text: 'Email: ',
                            size: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                          AppText(
                            text: AppStrings.email,
                            size: 14.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      AppText(
                        text: 'Address: ',
                        size: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(height: 16),
                      AppText(
                        text: AppStrings.address1,
                        size: 16.0,
                        fontWeight: FontWeight.w500,
                        maxLines: 2,
                      ),
                      AppText(
                        text: AppStrings.address2,
                        size: 16.0,
                        fontWeight: FontWeight.w500,
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        } else {
          //DESKTOP VIEW
          return Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AppText(
                            text: 'Opening Hours: ',
                            size: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                          AppText(
                            text: '9 AM - 9 PM',
                            size: 20.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            text: 'Phone: ',
                            size: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                          AppText(
                            text:
                                '+91 9589553039\n+91 8602299932\n+91 9009800600\n+91 9926122722',
                            size: 20.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AppText(
                            text: 'Email: ',
                            size: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                          AppText(
                            text: AppStrings.email,
                            size: 20.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      AppText(
                        text: 'Address: ',
                        size: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(height: 16),
                      AppText(
                        text: AppStrings.address1,
                        size: 20.0,
                        fontWeight: FontWeight.w500,
                      ),
                      AppText(
                        text: AppStrings.address2,
                        size: 20.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
