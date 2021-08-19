import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:network_connectivity/app/modules/network/bindings/network_binding.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      initialBinding: NetworkBinding(),
    ),
  );
}
