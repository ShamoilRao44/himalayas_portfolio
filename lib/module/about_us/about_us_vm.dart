import 'package:get/get.dart';

class AboutUsVM extends GetxController {
  bool isFirstCardVisible = false;
  bool isSecondCardVisible = false;

  void triggerFirstCardAnimation() {
    isFirstCardVisible = true;
    update();
  }

  void triggerSecondCardAnimation() {
    isSecondCardVisible = true;
    update();
  }
}
