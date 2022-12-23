import 'package:get/get.dart';

class MainScreenController extends GetxController {
  RxInt value = 0.obs;
// Rx<User> user = User.obs;
  // RxInt value2 = 0.obs;
  void add() {
    value.value++;
    // value2.value++;
  }

  void subtract() {
    value.value--;
    // value2.value--;
  }
}
