import 'package:get/get.dart';

import '../../global_controllers/store_controller.dart';

class CategoryController extends GetxController {
  get categories {
    var storeController = Get.find<StoreController>();
    return storeController.categories;
  }
}
