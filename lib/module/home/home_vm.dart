// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:food_portfolio/resources/app_images.dart';
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
    Product(imageUrl: Appimages.product1, description: AppStrings.product1dscr),
    Product(imageUrl: Appimages.product2, description: AppStrings.product2dscr),
    Product(imageUrl: Appimages.product3, description: AppStrings.product3dscr),
    Product(imageUrl: Appimages.product4, description: AppStrings.product4dscr),
  ];
  List<bool> isProductVisibleList = [false, false, false, false];

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
