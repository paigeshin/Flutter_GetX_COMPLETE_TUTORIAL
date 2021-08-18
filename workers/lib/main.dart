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
