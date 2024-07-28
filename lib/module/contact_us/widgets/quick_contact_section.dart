// ignore_for_file: prefer_const_constructors, unused_element

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_portfolio/resources/app_colors.dart';
import 'package:food_portfolio/resources/app_fonts.dart';
import 'package:get/get.dart';
import 'package:food_portfolio/module/contact_us/contact_us_vm.dart';
import 'package:food_portfolio/utils/widgets/app_text.dart';
import 'package:responsive_builder/responsive_builder.dart'; // Update the path as per your project structure

class QuickContactSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      var isMobile =
          sizingInformation.deviceScreenType == DeviceScreenType.mobile
              ? true
              : false;
      var wdth = MediaQuery.of(context).size.width;
      return GetBuilder<ContactUsVM>(builder: (c) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 48.0),
          child: Center(
            child: Container(
              width: isMobile ? wdth * 0.9 : 800,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
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
                        size: 56,
                        fontFamily: AppFonts.hunters,
                        fontWeight: FontWeight.normal,
                      ),
                      SizedBox(height: 24),
                      _buildTextField('Name', controller: c.nameController),
                      SizedBox(height: 16),
                      _buildTextField(
                        'Phone Number',
                        controller: c.phoneController,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                      ),
                      SizedBox(height: 16),
                      _buildTextField('Email',
                          email: true, controller: c.emailController),
                      SizedBox(height: 16),
                      _buildTextField('Subject',
                          controller: c.subjectController),
                      SizedBox(height: 16),
                      CustomDropdownTextField(
                        selectedProducts: c.productsInterested,
                        productList: c.productList,
                        onSelected: (newValue) {
                          c.toggleProductInterested(newValue);
                          c.update();
                        },
                      ),
                      SizedBox(height: 16),
                      _buildTextField('Message',
                          maxLines: 5, controller: c.messageController),
                      SizedBox(height: 24),
                      ElevatedButton(
                        onPressed: c.isloading
                            ? null
                            : () async {
                                if (c.formKey.currentState!.validate()) {
                                  debugPrint('enter in form');
                                  c.submitQuickContact(context);
                                } else {
                                  debugPrint('Error in form');
                                }
                              },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.secondaryColor,
                        ),
                        child: c.isloading
                            ? SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white),
                                  strokeWidth: 2.0,
                                ),
                              )
                            : AppText(
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
    });
  }

  Widget _buildTextField(
    String label, {
    bool email = false,
    int maxLines = 1,
    required TextEditingController controller,
    List<TextInputFormatter>? inputFormatters,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        hintText: label,
        filled: true,
        fillColor: AppColors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: AppColors.primaryColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: AppColors.primaryColor,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: AppColors.red,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
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

class CustomDropdownTextField extends StatelessWidget {
  final List<String> selectedProducts;
  final List<String> productList;
  final ValueChanged<String> onSelected;

  const CustomDropdownTextField({
    required this.selectedProducts,
    required this.productList,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: TextEditingController(
        text: selectedProducts.join(', '),
      ),
      readOnly: true,
      decoration: InputDecoration(
        hintText: 'Select the products you are interested in',
        hintStyle: TextStyle(fontSize: 12),
        suffixIcon: PopupMenuButton<String>(
          icon: Icon(Icons.arrow_drop_down),
          onSelected: (String value) {
            onSelected(value);
          },
          itemBuilder: (BuildContext context) {
            return productList.map((String product) {
              return PopupMenuItem<String>(
                value: product,
                child: Row(
                  children: [
                    Checkbox(
                      value: selectedProducts.contains(product),
                      onChanged: (bool? checked) {
                        onSelected(product);
                        Navigator.of(context).pop(); // Close the dropdown
                      },
                    ),
                    Text(product),
                  ],
                ),
              );
            }).toList();
          },
        ),
        filled: true,
        fillColor: AppColors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: AppColors.primaryColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: AppColors.primaryColor,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: AppColors.red,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: AppColors.red,
          ),
        ),
      ),
    );
  }
}
