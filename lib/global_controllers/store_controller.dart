import 'package:get/get.dart';
import 'package:getx_base_project/api_repository/api_service.dart';
import 'package:getx_base_project/models/category.dart';

class StoreController extends GetxController {
  List<Category> _categories = [];

  List<Category> get categories => _categories;

  set categories(List<Category> value) {
    _categories = value;
    update();
  }

  fetchCategories() async {
    try {
      List<Category> categoryList = await apiService.getCategories();
      print("categories: $categoryList");
      categories = categoryList;
    } catch (e) {
      print("error: $e");
    }
  }
}
