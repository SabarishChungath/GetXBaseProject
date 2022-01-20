import 'package:get/get.dart';
import 'package:getx_base_project/screens/splash/index.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController());
  }
}
