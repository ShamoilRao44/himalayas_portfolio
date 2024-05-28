import 'package:flutter/material.dart';
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
    var hght = MediaQuery.of(context).size.height;
    var wdth = MediaQuery.of(context).size.width;
    return GetBuilder<HomeVM>(
      init: HomeVM(),
      builder: (c) {
        return Container(
          width: wdth,
          height: hght,
          padding: EdgeInsets.symmetric(vertical: 20.0),
          color: Colors.transparent.withOpacity(0.8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Scrollable row of product containers
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // "Our products" text with slide-in animation
                    VisibilityDetector(
                      key: Key('our_products_visibility_detector'),
                      onVisibilityChanged: (visibilityInfo) {
                        if (visibilityInfo.visibleFraction > 0.1) {
                          c.triggerTextAnimation();
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 120.0),
                        child: Column(
                          children: [
                            AppText(
                              text: 'Our',
                              size: 80.0,
                              fontFamily: AppFonts.gaby,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ).animate(target: c.textVisible ? 1 : 0).slide(begin: Offset(-4, 0), duration: 1000.ms, curve: Curves.linear),
                            AppText(
                              text: 'products ',
                              size: 80.0,
                              fontFamily: AppFonts.gaby,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ).animate(target: c.textVisible ? 1 : 0).slide(begin: Offset(-4, 0), duration: 1000.ms, curve: Curves.linear),
                          ],
                        ),
                      ),
                    ),
                    _buildProductCard('assets/images/product1.jpg', 'Product 1 Name'),
                    _buildProductCard('assets/images/product2.jpg', 'Product 2 Name'),
                    _buildProductCard('assets/images/product3.jpg', 'Product 3 Name'),
                    _buildProductCard('assets/images/product3.jpg', 'Product 3 Name'),
                    // Add more product cards as needed
                    // "Browse more products" button
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          AppText(
                            text: 'Browse more \nproducts',
                            size: 40,
                            color: Colors.white,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 8),
                          ElevatedButton(
                            onPressed: () {
                              Get.toNamed('/products');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryColor,
                              shape: CircleBorder(),
                            ),
                            child: Icon(
                              Icons.navigate_next,
                              size: 64,
                              color: AppColors.secondaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildProductCard(String imagePath, String name) {
    return GetBuilder<HomeVM>(
      builder: (c) {
        return Container(
          width: 320,
          height: 560,
          margin: EdgeInsets.symmetric(horizontal: 10.0),
          decoration: BoxDecoration(
            color: AppColors.transparent,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  width: 400,
                  height: 320,
                ),
              ),
              AppText(
                text: name,
                size: 24.0,
                color: Colors.white,
              ),
            ],
          ),
        );
      },
    );
  }
}
