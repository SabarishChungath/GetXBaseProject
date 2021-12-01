import 'package:get/get.dart';

class HomeController extends GetxController {
  int _pageIndex = 0;

  int get pageIndex => _pageIndex;
  set pageIndex(int value) {
    _pageIndex = value;
    update();
  }

  onItemTap(int index) {
    pageIndex = index;
  }
}
