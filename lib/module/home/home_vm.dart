// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:food_portfolio/resources/app_strings.dart';
import 'package:get/get.dart';

class HomeVM extends GetxController {
  // Define ScrollController and GlobalKeys for each section
  final ScrollController scrollController = ScrollController();
  final GlobalKey homeKey = GlobalKey();
  final GlobalKey productsKey = GlobalKey();
  final GlobalKey aboutUsKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();

  bool isOurProductTextVisible = false;
  bool isBrowseMoreVisible = false;
  bool imageVisible = false;
  bool isHeroSection = true;
  bool isReadMoreButtonHovered = false;
  bool isCntctAnmTrig = false;

  List<Product> productsList = [
    Product(imageUrl: 'assets/images/product1.png', description: AppStrings.loremIpsum),
    Product(imageUrl: 'assets/images/product2.png', description: AppStrings.loremIpsum),
    Product(imageUrl: 'assets/images/product3.png', description: AppStrings.loremIpsum),
  ];
  List<bool> isProductVisibleList = [false, false, false];

  // Function to scroll to a specific section
  void scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    }
  }

  void triggerImageAnimation() {
    imageVisible = true;
    update();
  }

  void triggerContactSectionAnimations() {
    isCntctAnmTrig = true;
    update();
  }
}

class Product {
  final String imageUrl;
  final String description;

  Product({required this.imageUrl, required this.description});
}
