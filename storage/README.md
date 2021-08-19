```dart
void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

var storage = GetStorage();

await storage.write('email', emailEditingController.text);

print("The email is ${storage.read('email')}");
```

```dart
// Listen to changes
var listen = storage.listen(
  () {
    print('Email changed');
  },
);

// listen key
var listenKey = storage.listenKey('email', (value) {
  print('new key is $value');
});

// remove key
storage.remove('email');

// erade the container
storage.erase();

// Create a new container
GetStorage newStorage = GetStorage('MyStorage');
await GetStorage.init('MyStroage'); // initialize
```