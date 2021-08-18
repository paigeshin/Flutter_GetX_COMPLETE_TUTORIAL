import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterApp extends StatelessWidget {
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
