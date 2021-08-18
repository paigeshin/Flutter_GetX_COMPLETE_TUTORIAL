import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:getview_getwidget/CountController.dart';

void main() {
  Get.put(CountController());
  runApp(GetWidgetApp());
}

class GetWidgetApp extends GetWidget<CountController> {
  @override
  Widget build(BuildContext context) {
    // Get.put(CountController());
    Get.create(
        () => CountController()); // => Doesn't create different instance.
    return GetMaterialApp(
      title: 'Get View',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('GetView & Get Title'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Obx(
                () => Text(
                  'The value is ${controller.count}',
                  style: TextStyle(fontSize: 25),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              MaterialButton(
                child: Text('increment'),
                textColor: Colors.white,
                color: Colors.black,
                onPressed: () {
                  print(controller.hashCode);
                  controller.increment();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class GetViewApp extends GetView<CountController> {
  @override
  Widget build(BuildContext context) {
    Get.put(CountController());
    // Get.create(() =>
    // CountController()); // => Create Different Instance, it won't update widget
    return GetMaterialApp(
      title: 'Get Widget',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('GetView & Get Title'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Obx(
                () => Text(
                  'The value is ${controller.count}',
                  style: TextStyle(fontSize: 25),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              MaterialButton(
                child: Text('increment'),
                textColor: Colors.white,
                color: Colors.black,
                onPressed: () {
                  print(controller.hashCode);
                  controller.increment();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
