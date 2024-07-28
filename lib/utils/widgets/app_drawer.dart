// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:food_portfolio/resources/app_colors.dart';
import 'package:food_portfolio/resources/app_fonts.dart';
import 'package:food_portfolio/resources/app_routes.dart';
import 'package:food_portfolio/utils/widgets/app_text.dart';
import 'package:get/get.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    var wdth = MediaQuery.of(context).size.width;
    return Drawer(
      backgroundColor: AppColors.secondaryColor,
      width: wdth * 0.55,
      child: ListView(
        padding: EdgeInsets.all(0),
        children: [
          DrawerHeader(
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.close,
                size: 32,
                color: AppColors.white,
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.home,
              color: AppColors.white,
            ),
            title: AppText(
              text: 'Home',
              size: 14,
              color: AppColors.white,
              fontFamily: AppFonts.montserratRegular,
              fontWeight: FontWeight.normal,
            ),
            onTap: () {
              Get.toNamed(AppRoutes.home);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.shopping_cart,
              color: AppColors.white,
            ),
            title: AppText(
              text: 'Products',
              size: 14,
              color: AppColors.white,
              fontFamily: AppFonts.montserratRegular,
              fontWeight: FontWeight.normal,
            ),
            onTap: () {
              Get.toNamed(AppRoutes.home);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.info,
              color: AppColors.white,
            ),
            title: AppText(
              text: 'About Us',
              size: 14,
              color: AppColors.white,
              fontFamily: AppFonts.montserratRegular,
              fontWeight: FontWeight.normal,
            ),
            onTap: () {
              Get.toNamed(AppRoutes.about);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.contact_mail,
              color: AppColors.white,
            ),
            title: AppText(
              text: 'Visit Us',
              size: 14,
              color: AppColors.white,
              fontFamily: AppFonts.montserratRegular,
              fontWeight: FontWeight.normal,
            ),
            onTap: () {
              Get.toNamed(AppRoutes.contact);
            },
          ),
        ],
      ),
    );
  }
}
