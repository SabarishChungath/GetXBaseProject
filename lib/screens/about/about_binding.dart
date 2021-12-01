import 'package:get/get.dart';
import 'package:getx_base_project/screens/about/about_controller.dart';

class AboutBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AboutController());
  }
}
