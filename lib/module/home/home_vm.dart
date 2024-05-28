import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeVM extends GetxController {
  // Define ScrollController and GlobalKeys for each section
  final ScrollController scrollController = ScrollController();
  final GlobalKey homeKey = GlobalKey();
  final GlobalKey productsKey = GlobalKey();
  final GlobalKey aboutUsKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();

  bool textVisible = false;
  bool imageVisible = false;
  bool isReadMoreButtonHovered = false;
  bool isCntctAnmTrig = false;

  // Function to scroll to a specific section
  void scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    }
  }

  void triggerTextAnimation() {
    textVisible = true;
    update();
  }

  void triggerImageAnimation() {
    imageVisible = true;
    update();
  }

  void triggerContactSectionAnimations() {
    isCntctAnmTrig = true;
    update();
  }
}
