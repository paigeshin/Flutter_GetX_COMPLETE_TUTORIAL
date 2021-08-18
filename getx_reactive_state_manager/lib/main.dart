import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'MyController.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("StateManagement"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GetX<MyController>(
                init: MyController(),
                builder: (controller) {
                  return Text(
                    'The value is ${controller.count}',
                    style: TextStyle(fontSize: 25),
                  );
                },
              ),
              SizedBox(
                height: 16,
              ),
              MaterialButton(
                child: Text("Increment"),
                onPressed: () => Get.find<MyController>().increment(),
              ),
              MaterialButton(
                child: Text("Decrement"),
                onPressed: () => Get.find<MyController>().decrement(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
