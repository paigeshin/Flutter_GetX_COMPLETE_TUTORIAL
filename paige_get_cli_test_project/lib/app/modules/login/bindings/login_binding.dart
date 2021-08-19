import 'package:get/get.dart';

import 'package:paige_get_cli_test_project/app/modules/login/controllers/another_controller.dart';

import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AnotherController>(
      () => AnotherController(),
    );
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
  }
}
