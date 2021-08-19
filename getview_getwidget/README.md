# GetView

- If we have single controller as a dependency then we can use GetView instead of Statelesswidget and avoid writing `Get.find`

# GetWidget

- It is similar to GetView with one difference . It gives the same instance of Get.find everytime. It becomes very useful when used in combination with `Get.create`

# GetView

- For one dependency
- extends `GetView<T:Controller>`

⇒ use `Get.put(CountController());`

```dart
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
```

# GetWidget

- For more than one dependencies
- extends `GetWidget<T:Controller>`

⇒ use  `Get.create(() => CountController()); // => Doesn't create different instance.`

```dart
void main() {
  Get.put(CountController());
  runApp(GetWidgetApp());
}
```

⇒ Someone needs to initialize this

```dart
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
```