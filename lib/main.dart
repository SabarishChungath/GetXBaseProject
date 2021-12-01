import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_base_project/api_repository/api_service.dart';
import 'package:getx_base_project/bindings/home_binding.dart';
import 'package:getx_base_project/global_controllers/store_controller.dart';
import 'package:getx_base_project/screens/about/about_screen.dart';
import 'package:getx_base_project/screens/cart/cart_screen.dart';
import 'package:getx_base_project/screens/category/category_screen.dart';
import 'package:getx_base_project/screens/home/home_screen.dart';
import 'package:getx_base_project/screens/splash/splash_screen.dart';

void main() {
  initServices();
  runApp(const AppWidget());
}

void initServices() {
  Get.putAsync(() => ApiService().init());
  Get.lazyPut(() => StoreController());
}

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const SplashScreen(),
      initialBinding: HomeBinding(),
      getPages: [
        GetPage(
          name: SplashScreen.routeName,
          page: () => const SplashScreen(),
        ),
        GetPage(
            name: HomeScreen.routeName,
            page: () => const HomeScreen(),
            children: [
              GetPage(
                  name: CategoryScreen.routeName,
                  page: () => const CategoryScreen()),
              GetPage(
                  name: AboutScreen.routeName, page: () => const AboutScreen()),
              GetPage(
                  name: CartScreen.routeName, page: () => const CartScreen()),
            ]),
      ],
    );
  }
}
