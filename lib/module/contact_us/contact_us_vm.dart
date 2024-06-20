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

  bool isloading = false;

  // Future<void> submitForm() async {
  //   debugPrint('Entered submitform()');

  //   CollectionReference contacts = FirebaseFirestore.instance.collection('contacts');

  //   await contacts.add({
  //     'name': nameController.text,
  //     'phone': phoneController.text,
  //     'email': emailController.text,
  //     'subject': subjectController.text,
  //     'message': messageController.text,
  //     'timestamp': FieldValue.serverTimestamp(),
  //   }).then(
  //     (value) {
  //       // Show success message
  //       ScaffoldMessenger.of(formKey.currentContext!).showSnackBar(
  //         SnackBar(
  //           content: AppText(
  //             text: 'Your message has been sent successfully!',
  //             size: 16.0,
  //             color: Colors.white,
  //           ),
  //           backgroundColor: Colors.green,
  //         ),
  //       );
  //       formKey.currentState!.reset();
  //     },
  //   ).onError((error, stacktrace) {
  //     ScaffoldMessenger.of(formKey.currentContext!).showSnackBar(
  //       SnackBar(
  //         content: AppText(
  //           text: 'Your message not sent successfully!',
  //           size: 16.0,
  //           color: Colors.white,
  //         ),
  //         backgroundColor: Colors.red,
  //       ),
  //     );
  //   });
  // }

  Future<void> submitQuickContact(BuildContext context) async {
    isloading = true;
    update();
    var data = {};

    data['name'] = nameController.text;
    data['phone'] = phoneController.text;
    data['email'] = emailController.text;
    data['subject'] = subjectController.text;
    data['message'] = messageController.text;

    debugPrint(data.toString());

    curi.createQuickContact(data).then((res) {
      isloading = false;
      nameController.clear();
      phoneController.clear();
      emailController.clear();
      subjectController.clear();
      messageController.clear();
      update();
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
}
