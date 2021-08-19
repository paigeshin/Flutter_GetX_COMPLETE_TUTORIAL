import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class NetworkController extends GetxController {
  final Connectivity _connectivity = Connectivity();
  var connectionStatus = 0.obs;
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void onInit() {
    super.onInit();
    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future<void> initConnectivity() async {
    ConnectivityResult result;
    try {
      result = await _connectivity.checkConnectivity();
      _updateConnectionStatus(result);
    } on PlatformException catch (e) {
      print(e.toString());
    }
  }

  _updateConnectionStatus(ConnectivityResult? result) {
    switch (result) {
      case ConnectivityResult.wifi:
        print('Wifi');
        connectionStatus.value = 1;
        break;
      case ConnectivityResult.mobile:
        print('mobile');
        connectionStatus.value = 2;
        break;
      case ConnectivityResult.none:
        print('none');
        connectionStatus.value = 0;
        break;
      default:
        Get.snackbar('Network Error', 'Failed to get network connection');
    }
  }

  @override
  void onClose() {
    _connectivitySubscription.cancel();
  }
}
