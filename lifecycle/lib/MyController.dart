import 'package:get/get.dart';

class MyController extends GetxController {
  var count = 0;

  @override
  void onInit() {
    super.onInit();
    increment();
  }

  void increment() {
    Future.delayed(const Duration(milliseconds: 500), () {
      count++;
      print('count $count');
      update();
    });
  }

  void decrement() {
    Future.delayed(const Duration(milliseconds: 500), () {
      count--;
      print('count $count');
      update();
    });
  }

  void cleanUpTask() {
    print('Clean up task');
  }

  @override
  void onClose() {
    super.onClose();
  }
}
