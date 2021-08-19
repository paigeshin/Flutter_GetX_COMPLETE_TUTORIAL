```dart
import 'package:get/get.dart';

class MyController extends GetxController {
  var count = 0.obs;

  void increment() {
    count++;
  }

  @override
  void onInit() {
    // called every time when the value of count variable changes
    ever(
      count,
      (_) => print(count),
    );

    // called every time when the value of any variable from the list changes
    everAll(
      [count],
      (_) => print(count),
    );

    // called only once when the varialbe value changes
    once(count, (_) => print(count));

    // called every time the user stops typing for 1 second
    debounce(count, (_) => print(count), time: Duration(seconds: 1));

    // Ignore all changes within 3 seconds.
    // Imagine that the user can earn coins by clicking on something,
    // if he clicks 300 times in the same minute,
    // he would have 300 coins, using interval,
    // you can set a time frame for 3 seconds,
    // and even then clkcing 300 or a thousand times,
    // the maximum he would get in 1 minute would be 20 coins,
    // clicking 300 or 1 million times
    interval(
      count,
      (_) => print('Ignore all changes'),
      time: Duration(seconds: 3),
    );

    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
```

```dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workers/MyController.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyController myController = Get.put(MyController());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Workers',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Workers'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MaterialButton(
                child: Text('Increment'),
                color: Colors.black,
                textColor: Colors.white,
                onPressed: myController.increment,
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: TextField(
                  onChanged: (value) {
                    myController.increment();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```