import 'package:get/get.dart';

class MainScreenController extends GetxController {
  RxInt value = 0.obs;

  void add() {
    value.value++;
  }

  void subtract() {
    value.value--;
  }
}
