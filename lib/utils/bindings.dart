import 'package:food_portfolio/module/blog/blog_vm.dart';
import 'package:get/get.dart';
import '../module/home/home_vm.dart';
import '../module/about_us/about_us_vm.dart';
import '../module/products/products_vm.dart';
import '../module/contact_us/contact_us_vm.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeVM>(() => HomeVM());
  }
}

class AboutUsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AboutUsVM>(() => AboutUsVM());
  }
}

class ProductsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductsVM>(() => ProductsVM());
  }
}

class ContactUsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ContactUsVM>(() => ContactUsVM());
  }
}

class BlogBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BlogVM());
  }
}
