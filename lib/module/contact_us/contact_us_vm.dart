// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:food_portfolio/utils/widgets/app_text.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ContactUsVM extends GetxController {
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  Future<void> submitForm() async {
    debugPrint('Entered submitform()');

    CollectionReference contacts = FirebaseFirestore.instance.collection('contacts');

    await contacts.add({
      'name': nameController.text,
      'phone': phoneController.text,
      'email': emailController.text,
      'subject': subjectController.text,
      'message': messageController.text,
      'timestamp': FieldValue.serverTimestamp(),
    }).then(
      (value) {
        // Show success message
        ScaffoldMessenger.of(formKey.currentContext!).showSnackBar(
          SnackBar(
            content: AppText(
              text: 'Your message has been sent successfully!',
              size: 16.0,
              color: Colors.white,
            ),
            backgroundColor: Colors.green,
          ),
        );
        formKey.currentState!.reset();
      },
    ).onError((error, stacktrace) {
      ScaffoldMessenger.of(formKey.currentContext!).showSnackBar(
        SnackBar(
          content: AppText(
            text: 'Your message not sent successfully!',
            size: 16.0,
            color: Colors.white,
          ),
          backgroundColor: Colors.red,
        ),
      );
    });
  }
}
