import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_base_project/screens/category/category_screen.dart';
import 'package:getx_base_project/screens/home/home_controller.dart';

import '../about/about_screen.dart';
import '../cart/cart_screen.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);
  static const routeName = "/home_screen";

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            items: BottomNavyBar,
            currentIndex: controller.pageIndex,
            selectedItemColor: Colors.amber[800],
            onTap: controller.onItemTap,
          ),
          body: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: IndexedStack(
              index: controller.pageIndex,
              children: const [
                CategoryScreen(),
                CartScreen(),
                AboutScreen(),
              ],
            ),
          ));
    });
  }

  // ignore: non_constant_identifier_names
  List<BottomNavigationBarItem> get BottomNavyBar {
    return const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.category_outlined),
        label: 'Categories',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.shopping_bag),
        label: 'Cart',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.info),
        label: 'About',
      ),
    ];
  }
}
