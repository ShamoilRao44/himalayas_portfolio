import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'resources/app_pages.dart';
import 'resources/app_colors.dart';
import 'resources/app_routes.dart';

void main() {
  runApp(FrozenFoodShopApp());
}

class FrozenFoodShopApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Frozen Food Shop',
      theme: ThemeData(
        primaryColor: AppColors.primaryColor,
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: AppColors.accentColor),
        scaffoldBackgroundColor: AppColors.backgroundColor,
      ),
      initialRoute: AppRoutes.home, // Set HomeView as the initial page
      getPages: AppPages.routes, // Set up routes
    );
  }
}
