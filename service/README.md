```dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  await initServices();
  runApp(MyApp());
}

Future<void> initServices() async {
  print('starting services...');
  await Get.putAsync<Service>(() async => await Service());
  print('All services started...');
}

// This class is like a GetxController
// It shares the same lifecycle ( onInit(), onReady(), onClose() ).
// It just notifies GetX Dependency Injection system,
// that this subclass can not be removed from memory.
class Service extends GetxService {
  Future<void> incrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int counter = (prefs.getInt('counter') ?? 0) + 1;
    print('Pressed $counter items.');
    await prefs.setInt('counter', counter);
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Service',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Service'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MaterialButton(
                  child: Text('Increment'),
                  onPressed: () {
                    Get.find<Service>().incrementCounter();
                  })
            ],
          ),
        ),
      ),
    );
  }
}
```

- This class is like a GetxController
- It shares the same lifecycle ( onInit(), onReady(), onClose() ).
- It just notifies GetX Dependency Injection system that this subclass can not be removed from memory.

### service vs binding

- service, provide one controller  ⇒ You can create multiple services though
- binding, provide multiple controller
- Service never disappears