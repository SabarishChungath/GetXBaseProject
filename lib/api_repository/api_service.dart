import 'dart:developer';

import 'package:get/get.dart';
import 'package:getx_base_project/api_repository/base_client.dart';
import 'package:getx_base_project/models/category.dart';

ApiService apiService = Get.find<ApiService>();

class ApiService extends GetxService {
  late RestClient _restClient;

  Future<ApiService> init() async {
    _restClient = RestClient();
    _restClient.init();
    return this;
  }

  Future getCategories() async {
    log("fetching categories");
    String url = "https://www.themealdb.com/api/json/v1/1/categories.php";
    Map<String, dynamic>? headers = {"content-type": "application/json"};
    try {
      var response = await _restClient.getData(url: url, headers: headers);
      return categoriesFromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
