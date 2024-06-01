// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:food_portfolio/resources/app_colors.dart';
import 'package:get/get.dart';
import 'package:food_portfolio/module/contact_us/contact_us_vm.dart';
import 'package:food_portfolio/utils/widgets/app_text.dart'; // Update the path as per your project structure

class QuickContactSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ContactUsVM>(builder: (c) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 48.0),
        child: Center(
          child: Container(
            width: 800,
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.primaryColor,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: c.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AppText(
                      text: 'Quick Contact',
                      size: 32.0,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(height: 24),
                    _buildTextField('Name', controller: c.nameController),
                    SizedBox(height: 16),
                    _buildTextField('Phone Number', controller: c.phoneController),
                    SizedBox(height: 16),
                    _buildTextField('Email', email: true, controller: c.emailController),
                    SizedBox(height: 16),
                    _buildTextField('Subject', controller: c.subjectController),
                    SizedBox(height: 16),
                    _buildTextField('Message', maxLines: 5, controller: c.messageController),
                    SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () async {
                        if (c.formKey.currentState!.validate()) {
                          debugPrint('enter in form');
                          c.submitForm();
                        } else {
                          debugPrint('Error in form');
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.secondaryColor,
                      ),
                      child: AppText(
                        text: 'Submit',
                        size: 18.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget _buildTextField(String label, {bool email = false, int maxLines = 1, required TextEditingController controller}) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.primaryColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.primaryColor,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.red,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.red,
          ),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your $label';
        }
        // if (email && !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
        //   return 'Please enter a valid email';
        // }
        return null;
      },
    );
  }
}
