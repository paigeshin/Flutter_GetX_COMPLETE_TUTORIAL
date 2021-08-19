# Prepare for controllers

```dart
class MyController extends GetxController {
  var count = 0.obs;
  void increment() {
    count++;
  }
}

class HomeController extends GetxController {}
```

# Application Level Binding

```dart
class AllControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyController>(() => MyController());
    Get.lazyPut<HomeController>(() => HomeController());
  }
}

void main() {
  // Binding applied to all application
  AllControllerBinding().dependencies();
  runApp(MyApp());
}

// Every child widget can access 
Obx(
    () => Text(
      'The value is ${Get.find<MyController>().count}',
      style: TextStyle(
        fontSize: 25,
      ),
    ),
  ),
Get.find<MyController>().increment();
```

# Route Level Binding

### binding applied at route level

```dart
GetMaterialApp(
      title: 'Binding',
      getPages: [
        // binding applied at route level
        GetPage(
          name: '/home',
          page: () => NewScreen(),
          binding: HomeControllerBinding(),
        ),
			....
```

### using binding builder

```dart
GetMaterialApp(
      title: 'Binding',
      getPages: [
        // binding applied at route level
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
        
			....
```

# Route Level Binding

```dart
Get.to(
  NewScreen(),
  binding: HomeControllerBinding(),
);
```

⇒ You can also apply bindBuilder 

# Smart Management

- GetX provides SmartManagement that lets us configure how dependencies behave in terms of memory management.

```dart
GetMaterialApp(
      title: 'Binding',
      smartManagement: SmartManagement.full,
```

 

### Full Mode

- Everything gets disposed as soon as the route is removed from navigation stack, unless declared permanent.

### Keep Factory

- Just like SmartManagement.full, it will remove its depdencies when it's not being used anymore. However, it will keep their factory, which means it will recreate the dependency if you need that instance again

### Only Builders

- With this option, only controllers started in init: or loaded into a Binding with Get.lazyPut() will be disposed.

⇒ However, if you use Get.put() or Get.putAsync() or any other approach, SmartManagement will not have permissions to exclude this dependency.

# Entire Code

```dart
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
```