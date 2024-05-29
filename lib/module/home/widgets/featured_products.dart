// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:food_portfolio/resources/app_routes.dart';
import 'package:get/get.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:visibility_detector/visibility_detector.dart';

import 'package:food_portfolio/module/home/home_vm.dart';
import 'package:food_portfolio/resources/app_fonts.dart';
import 'package:food_portfolio/utils/widgets/app_text.dart'; // Update the path as per your project structure
import 'package:food_portfolio/resources/app_colors.dart'; // Update the path as per your project structure

class FeaturedProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   
    return GetBuilder<HomeVM>(
      init: HomeVM(),
      builder: (c) {
        return Container(
          width: double.infinity,
          color: AppColors.black.withOpacity(0.6),
          child: Column(
            children: [
              SizedBox(height: 16),
              VisibilityDetector(
                key: Key('products-section'),
                onVisibilityChanged: (visibilityInfo) {
                  if (visibilityInfo.visibleFraction > 0.1) {
                    c.isOurProductTextVisible = true;
                    c.update();
                  }
                },
                child: AppText(
                  text: 'Our Products',
                  size: 48.0,
                  fontFamily: AppFonts.gaby,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ).animate(target: c.isOurProductTextVisible ? 1 : 0).fadeIn(duration: 800.ms, curve: Curves.easeIn),
              ),
              SizedBox(height: 40),
              for (int i = 0; i < c.productsList.length; i++)
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
                  child: VisibilityDetector(
                    key: Key('product_$i'),
                    onVisibilityChanged: (info) {
                      if (info.visibleFraction > 0.5) {
                        c.isProductVisibleList[i] = true;
                        c.update();
                      } else {
                        c.isProductVisibleList[i] = false;
                        c.update();
                      }
                    },
                    child: Row(
                      mainAxisAlignment: i % 2 == 0 ? MainAxisAlignment.start : MainAxisAlignment.end,
                      children: [
                        if (i % 2 == 0) ...[
                          Image.asset(
                            c.productsList[i].imageUrl,
                            width: 320,
                            height: 320,
                          ).animate(target: c.isProductVisibleList[i] ? 1 : 0).slide(
                                begin: Offset(-2, 0),
                                end: Offset(0, 0),
                                duration: 1000.ms,
                                curve: Curves.easeInOut,
                              ),
                          SizedBox(width: 80),
                          SizedBox(
                            width: 800,
                            child: AppText(
                              text: c.productsList[i].description,
                              size: 24.0,
                              color: AppColors.white,
                              maxLines: 5,
                            ).animate(target: c.isProductVisibleList[i] ? 1 : 0).fadeIn(duration: 1000.ms),
                          ),
                        ] else ...[
                          SizedBox(
                            width: 800,
                            child: AppText(
                              text: c.productsList[i].description,
                              size: 24.0,
                              color: AppColors.white,
                              maxLines: 5,
                            ).animate(target: c.isProductVisibleList[i] ? 1 : 0).fadeIn(duration: 1000.ms),
                          ),
                          SizedBox(width: 80),
                          Image.asset(
                            c.productsList[i].imageUrl,
                            width: 320,
                            height: 320,
                          ).animate(target: c.isProductVisibleList[i] ? 1 : 0).slide(begin: Offset(2, 0), end: Offset(0, 0), duration: 1000.ms, curve: Curves.easeInOut),
                        ],
                      ],
                    ),
                  ),
                ),
              VisibilityDetector(
                key: Key('browseMoreProductsText'),
                onVisibilityChanged: (info) {
                  if (info.visibleFraction > 0.5) {
                    c.isBrowseMoreVisible = true;
                    c.update();
                  } else {
                    c.isBrowseMoreVisible = false;
                    c.update();
                  }
                },
                child: Column(
                  children: [
                    AppText(
                      text: 'Browse More \nProducts',
                      textAlign: TextAlign.center,
                      size: 48.0,
                      color: AppColors.white,
                      fontFamily: AppFonts.gaby,
                      fontWeight: FontWeight.bold,
                    ).animate(target: c.isBrowseMoreVisible ? 1 : 0).fadeIn(duration: 1000.ms),
                    SizedBox(height: 20.0),
                    ElevatedButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.products);
                      },
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(20),
                        backgroundColor: AppColors.primaryColor, // Button color
                      ),
                      child: Icon(Icons.arrow_forward, color: AppColors.secondaryColor),
                    ).animate(target: c.isBrowseMoreVisible ? 1 : 0).fadeIn(duration: 1000.ms),
                  ],
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }
}
