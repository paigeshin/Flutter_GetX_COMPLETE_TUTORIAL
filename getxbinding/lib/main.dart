import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxbinding/new_screen.dart';

class AllControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyController>(() => MyController());
    Get.lazyPut<HomeController>(() => HomeController());
  }
}

class HomeControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}

class MyController extends GetxController {
  var count = 0.obs;
  void increment() {
    count++;
  }
}

class HomeController extends GetxController {}

void main() {
  // Binding applied to all application
  AllControllerBinding().dependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Binding',
      smartManagement: SmartManagement.full,
      getPages: [
        // binding applied at route level
        GetPage(
          name: '/home',
          page: () => NewScreen(),
          binding: HomeControllerBinding(),
        ),
        // using binding builder
        GetPage(
          name: '/second_screen',
          page: () => NewScreen(),
          binding: BindingsBuilder(
            () => {
              Get.lazyPut<HomeControllerBinding>(
                () => HomeControllerBinding(),
              ),
              Get.lazyPut<AllControllerBinding>(
                () => AllControllerBinding(),
              ),
            },
          ),
        ),
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Binding'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Obx(
                () => Text(
                  'The value is ${Get.find<MyController>().count}',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
              MaterialButton(
                child: Text('Click Me'),
                textColor: Colors.white,
                color: Colors.black,
                onPressed: () {
                  Get.find<MyController>().increment();

                  // for normal routes
                  Get.to(
                    NewScreen(),
                    binding: HomeControllerBinding(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
