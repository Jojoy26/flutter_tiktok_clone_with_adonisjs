import 'package:get/get.dart';

class TikTokController extends GetxController {
  RxInt selectedPage = 0.obs;

  void setSelectedPage(int index) {
    selectedPage.value = index;
  }
}