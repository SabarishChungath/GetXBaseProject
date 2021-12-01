import 'dart:developer';

import 'package:get/get.dart';
import 'package:getx_base_project/global_controllers/store_controller.dart';
import 'package:getx_base_project/screens/home/home_screen.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    log("splash has been mounted");
    nextScreen();
    super.onInit();
  }

  initialCall() async {
    var storeController = Get.find<StoreController>();
    await storeController.fetchCategories();
  }

  nextScreen() async {
    await initialCall();
    Future.delayed(const Duration(seconds: 1),
        () => Get.offAndToNamed(HomeScreen.routeName));
  }
}
