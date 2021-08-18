import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(StudentApp());
}

// Entire class becomes observable
class Student {
  var name;
  var age;
  Student({this.name, this.age});
}

class MyController extends GetxController {
  // var student = Student();
  // void convertToUppercase() {
  //   student.name.value = student.name.value.toUpperCase();
  // }

  var student = Student(name: 'Tom', age: 25).obs;

  void convertUPdateToUppercase() {
    student.update((student) {
      student?.name = student.name.toString().toUpperCase();
    });
  }
}

class StudentApp extends StatelessWidget {
  // Create the instance of Controller
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
          title: Text("State Management"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(
                () => Text(
                  'Name is ${myController.student.value.name}',
                  style: TextStyle(fontSize: 25),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              MaterialButton(
                onPressed: myController.convertUPdateToUppercase,
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
