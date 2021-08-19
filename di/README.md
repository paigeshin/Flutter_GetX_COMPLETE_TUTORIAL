- Controllers with tag & permanent

```dart
MyController myController = Get.put(
    MyController(),
    tag: 'instance1',
    permanent: false,
  );
```

- Lazy Put

```dart
Get.lazyPut<MyController>(() => MyController());

Get.lazyPut<MyController>(
  () => MyController(),
  tag: 'instance1',
);

Get.lazyPut<MyController>(
  () => MyController(),
  tag: 'instance2',
  fenix: true,
); //fenix equals permenant here
```

- felix ⇒ Normally, Get.lazyPut loads dependencies only one time, which means that if the route gets removed, and created again, Get.lazyPut will not load them again. This default behavior might be preferable in some cases while for others, we have the fenix property.

- Put Async

```dart
Get.putAsync<MyController>(() async => await MyController());
```

### Entire Code

```dart
import 'package:di/MyController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  /** Controller with tag & permanent **/
  // MyController myController = Get.put(
  //   MyController(),
  //   tag: 'instance1',
  //   permanent: false,
  // );

  @override
  Widget build(BuildContext context) {
    /** Lazy Put **/
    // Get.lazyPut<MyController>(() => MyController());
    // Get.lazyPut<MyController>(
    //   () => MyController(),
    //   tag: 'instance1',
    // );
    // Get.lazyPut<MyController>(
    //   () => MyController(),
    //   tag: 'instance2',
    //   fenix: true,
    // ); //fenix equals permenant here
    // =>
    /*
    Normally, Get.lazyPut loads dependencies only one time, which means that if the route gets removed, and created again, Get.lazyPut will not load them again. This default behavior might be preferable in some cases while for others, we have the fenix property.
     */

    Get.putAsync<MyController>(() async => await MyController());

    return GetMaterialApp(
      title: 'Dependency Injection',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Dependency Injection'),
        ),
        body: Center(
          child: MaterialButton(
            child: Text('Click Me'),
            textColor: Colors.white,
            color: Colors.black,
            onPressed: () {
              // Get.find<MyController>(tag: 'instance1'),
              Get.find<MyController>();
              Get.find<MyController>().incrementCounter();
            },
          ),
        ),
      ),
    );
  }
}
```