import 'package:get/get.dart';
import 'package:network_connectivity/app/modules/network/controllers/network_controller.dart';

class NetworkBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NetworkController>(
      () => NetworkController(),
    );
  }
}
