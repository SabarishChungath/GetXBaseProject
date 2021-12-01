import 'package:get/get.dart';
import 'package:getx_base_project/screens/home/index.dart';

import '../screens/about/about_controller.dart';
import '../screens/category/category_controller.dart';
import '../screens/splash/splash_controller.dart';

class RootBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<SplashController>(SplashController());
    Get.put<HomeController>(HomeController());
    Get.put<CategoryController>(CategoryController());
    Get.put<AboutController>(AboutController());
  }
}
