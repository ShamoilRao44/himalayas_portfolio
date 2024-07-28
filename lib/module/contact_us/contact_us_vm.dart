// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:food_portfolio/module/contact_us/repo/contact_us_repo_impl.dart';
import 'package:food_portfolio/resources/app_colors.dart';
import 'package:food_portfolio/utils/widgets/app_snackbar.dart';
import 'package:food_portfolio/utils/widgets/app_text.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

class ContactUsVM extends GetxController {
  ContactUsRepoImpl curi = ContactUsRepoImpl();

  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  var selectedProduct = ''.obs;
  List<String> productList = ['Mix Veg', 'Green Peas', 'Sweet Corn', 'Hara Chana'];
  List<String> productsInterested = [];

  void toggleProductInterested(String product) {
    if (productsInterested.contains(product)) {
      productsInterested.remove(product);
    } else {
      productsInterested.add(product);
    }
    update(); // Notify the UI to update
  }

  bool isloading = false;


  Future<void> submitQuickContact(BuildContext context) async {
    isloading = true;
    update();
    var data = {};

    data['name'] = nameController.text;
    data['phone'] = phoneController.text;
    data['email'] = emailController.text;
    data['subject'] = subjectController.text;
    data['message'] = messageController.text;
    data['product_interested'] = productsInterested;

    debugPrint(data.toString());

    curi.createQuickContact(data).then((res) {
      isloading = false;
      clearForm();
      ScaffoldMessenger.of(context).showSnackBar(
        appSnackbar(
          msg: 'your message is sent succesfully!',
          color: AppColors.mintGreen,
        ),
      );
    }).onError((error, stackTrace) {
      isloading = false;
      update();
      debugPrint(error.toString());
      debugPrint(stackTrace.toString());
      ScaffoldMessenger.of(context).showSnackBar(
        appSnackbar(
          msg: error.toString(),
          color: AppColors.red,
        ),
      );
    });
  }

  void clearForm() {
    nameController.clear();
    phoneController.clear();
    emailController.clear();
    subjectController.clear();
    messageController.clear();
    productsInterested.clear();
    update();
  }
}
