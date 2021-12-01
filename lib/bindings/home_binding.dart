import 'package:get/get.dart';
import 'package:getx_base_project/screens/home/home_controller.dart';
import 'package:getx_base_project/screens/splash/splash_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<SplashController>(SplashController());
    Get.put<HomeController>(HomeController());
  }
}
