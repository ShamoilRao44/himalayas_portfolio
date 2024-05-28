import 'package:flutter/material.dart';
import 'package:food_portfolio/module/home/home_vm.dart';
import 'package:food_portfolio/resources/app_fonts.dart';
import 'package:get/get.dart';
import 'package:flutter_animate/flutter_animate.dart';

class HeroSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeVM>(
      builder: (c) {
        var hght = MediaQuery.of(context).size.height;
        var wdth = MediaQuery.of(context).size.width;
        return Container(
          height: hght,
          width: wdth,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/hero-section-bg.png'), // Replace with your image asset
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
        );
      },
    );
  }
}
