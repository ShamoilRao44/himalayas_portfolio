import 'package:get/get.dart';
import '../module/home/home_view.dart';
import '../module/about_us/about_us_view.dart';
import '../module/products/products_view.dart';
import '../module/contact_us/contact_us_view.dart';
import 'app_routes.dart';
import '../utils/bindings.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.home,
      page: () =>  HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.about,
      page: () => const AboutUsView(),
      binding: AboutUsBinding(),
    ),
    GetPage(
      name: AppRoutes.products,
      page: () => const ProductsView(),
      binding: ProductsBinding(),
    ),
    GetPage(
      name: AppRoutes.contact,
      page: () => const ContactUsView(),
      binding: ContactUsBinding(),
    ),
  ];
}
