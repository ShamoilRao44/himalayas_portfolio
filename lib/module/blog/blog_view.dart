// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:food_portfolio/module/blog/blog_vm.dart';
import 'package:food_portfolio/module/blog/widgets/hero_section.dart';
import 'package:food_portfolio/resources/app_routes.dart';
import 'package:food_portfolio/utils/widgets/navigation_header.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

class BlogView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BlogVM>(builder: (c) {
      
      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              NavigationHeader(
                onHomePressed: () => Get.toNamed(AppRoutes.home),
                onProductsPressed: () => Get.toNamed(AppRoutes.home),
                onAboutUsPressed: () => Get.toNamed(AppRoutes.about),
                onContactPressed: () => Get.toNamed(AppRoutes.contact),
                onBlogPressed: () => Get.toNamed(AppRoutes.blog),
              ),
              HeroSection(),
            ],
          ),
        ),
      );
    });
  }
}
