// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:food_portfolio/resources/app_images.dart';
import 'package:food_portfolio/resources/app_routes.dart';
import 'package:get/get.dart';

import 'package:food_portfolio/utils/widgets/footer.dart';
import '../../utils/widgets/navigation_header.dart';
import 'home_vm.dart';
import 'widgets/hero_section.dart';
import 'widgets/featured_products.dart';
import 'widgets/about_us_snapshot.dart';
import 'widgets/contact_info.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeVM>(
      init: HomeVM(),
      builder: (c) {
        var hght = MediaQuery.of(context).size.height;
        var wdth = MediaQuery.of(context).size.width;
        return Scaffold(
          body: Stack(
            children: [
              Container(
                height: hght,
                width: wdth,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(Appimages.pageBG),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SingleChildScrollView(
                controller: c.scrollController,
                child: Padding(
                  padding: const EdgeInsets.only(top: 32.0),
                  child: Column(
                    children: [
                      Container(
                        key: c.homeKey,
                        child: HeroSection(),
                      ),
                      Container(
                        key: c.aboutUsKey,
                        child: AboutUsSnapshot(),
                      ),
                      Container(
                        key: c.productsKey,
                        child: FeaturedProducts(),
                      ),
                      Container(
                        key: c.contactKey,
                        child: ContactInfo(),
                      ),
                      Footer(),
                    ],
                  ),
                ),
              ),
              // Positioned Navigation Header to stay on top
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: NavigationHeader(
                  onHomePressed: () => c.scrollToSection(c.homeKey),
                  onProductsPressed: () => c.scrollToSection(c.productsKey),
                  onAboutUsPressed: () => c.scrollToSection(c.aboutUsKey),
                  onContactPressed: () => c.scrollToSection(c.contactKey),
                  onBlogPressed: () => Get.toNamed(AppRoutes.blog),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
