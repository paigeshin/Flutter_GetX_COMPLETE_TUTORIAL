import 'package:get/get.dart';

class MyController extends GetxController {
  var count = 0;
  increment() {
    count++;
    update();
  }

  decrement() {
    count--;
    update();
  }
}
