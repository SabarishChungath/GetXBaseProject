import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_base_project/screens/category/category_controller.dart';

import '../../models/category.dart';

class CategoryScreen extends GetView<CategoryController> {
  const CategoryScreen({Key? key}) : super(key: key);
  static const routeName = "/category_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.blue[100],
        child: ListView.separated(
          itemCount: controller.categories.length,
          itemBuilder: (_, index) {
            Category category = controller.categories[index];
            return ListTile(title: Text(category.name ?? ""));
          },
          separatorBuilder: (_, index) => const SizedBox(height: 20),
        ),
      ),
    );
  }
}
