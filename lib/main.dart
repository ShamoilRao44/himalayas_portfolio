// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'resources/app_pages.dart';
import 'resources/app_colors.dart';
import 'resources/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyBRJBet9ALY_3H4z94UR3Q6CmSdsh0Yv3c",
      authDomain: "natural-himalaya-bb785.firebaseapp.com",
      projectId: "natural-himalaya-bb785",
      storageBucket: "natural-himalaya-bb785.appspot.com",
      messagingSenderId: "918681058677",
      appId: "1:918681058677:web:40fb1f0832dad5adcbe73c",
      measurementId: "G-EN2ZH34JFK",
    ),
  );
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
