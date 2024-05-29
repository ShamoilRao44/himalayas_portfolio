// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:visibility_detector/visibility_detector.dart';

import 'package:food_portfolio/module/home/home_vm.dart';
import 'package:food_portfolio/resources/app_fonts.dart';
import 'package:food_portfolio/resources/app_images.dart';
import 'package:get/get.dart';

class HeroSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeVM>(
      builder: (c) {
        var hght = MediaQuery.of(context).size.height;
        var wdth = MediaQuery.of(context).size.width;
        return VisibilityDetector(
          key: Key('our_products_visibility_detector'),
          onVisibilityChanged: (visibilityInfo) {
            if (visibilityInfo.visibleFraction > 0.2) {
              c.isHeroSection = true;
              c.update();
            }
            else{
              c.isHeroSection = false;
              c.update();
            }
          },
          child: Container(
            height: hght,
            width: wdth,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Appimages.heroSectionBG), // Replace with your image asset
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Company Name and Slogan
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Company Name',
                      style: TextStyle(
                        fontSize: 80,
                        fontFamily: AppFonts.gaby,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ).animate().slide(begin: Offset(0, 4), duration: 1000.ms, curve: Curves.easeOut),
                    SizedBox(height: 24),
                    Text(
                      'Your Company Slogan',
                      style: TextStyle(
                        fontSize: 24.0,
                        color: Colors.white,
                      ),
                    ).animate().slide(begin: Offset(0, 4), duration: 1000.ms, curve: Curves.easeOut),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
