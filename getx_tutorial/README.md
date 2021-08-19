```dart
void main() {
  runApp(StudentApp());
}

// Entire class becomes observable
class Student {
  var name;
  var age;
  Student({this.name, this.age});
}

class StudentApp extends StatelessWidget {
  final student = Student(name: "tom", age: 25).obs;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("State Management"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(
                () => Text(
                  'Student Name: ${student.value.name}',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              MaterialButton(
                onPressed: () {
                  student.update((student) {
                    student?.name = student.name.toString().toUpperCase();
                  });
                },
                color: Colors.black,
                textColor: Colors.white,
                child: Text("Make student name uppercase"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
```

```dart
  final student = Student(name: "tom", age: 25).obs;
  student.update((student) {
    student?.name = student.name.toString().toUpperCase();
  });

```


```dart
var count = 0.obs;
increment() => count++;
Obx(
  () => Text(
    'Count valie is $count',
    style: TextStyle(
      fontSize: 25,
    ),
  ),
),
```

```dart
class App extends StatelessWidget {
  var count = 0.obs;
  increment() => count++;
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("State Management"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Count"),
              Obx(
                () => Text(
                  'Count valie is $count',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
              MaterialButton(
                onPressed: increment,
                color: Colors.black,
                textColor: Colors.white,
                child: Text("Count"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
```