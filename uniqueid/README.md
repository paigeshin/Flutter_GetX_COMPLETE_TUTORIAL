```dart
import 'package:get/get.dart';

class MyController extends GetxController {
  var count = 0;
  void increment() {
    count++;
    update(['txtCount']);
  }
}
```

```dart
Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      GetBuilder<MyController>( // only this build will be excuted
        id: 'txtCount',
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
      GetBuilder<MyController>(
        builder: (controller) {
          return Text(
            'The value is ${controller.count}',
            style: TextStyle(fontSize: 25),
          );
        },
      ),
      MaterialButton(
        child: Text("Increment"),
        onPressed: () => Get.find<MyController>().increment(),
      ),
    ],
  ),
```