```dart
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
```

⇒ onInit 

⇒ onClose

```dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'MyController.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyController myController = Get.put(MyController());

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
              GetBuilder<MyController>(
                // initState: , // => bad practice
                // dispose: , //=> bad practice
                // init: MyController(), //=> We declared MyController() instance globally
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
```