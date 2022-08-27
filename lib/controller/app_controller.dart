import 'package:get/get.dart';

class AppController extends GetxController {
  RxBool show = true.obs;
  RxInt selectedIndex = 0.obs;

  void toggleShow() {
    show.value = !show.value;
  }

  void toggleColor(index) {
    selectedIndex.value = index;
  }
}
