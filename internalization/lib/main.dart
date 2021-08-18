import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internalization/MyController.dart';

import 'Messages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyController myController = Get.put(MyController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: Messages(),
      locale: Locale('en', 'US'),
      fallbackLocale: Locale('en', 'US'),
      title: 'Internalization',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Internalization'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Hello".tr,
                style: TextStyle(
                  fontSize: 36,
                ),
              ),
              MaterialButton(
                child: Text('한국어'),
                color: Colors.black,
                textColor: Colors.white,
                onPressed: () {
                  myController.changeLanguage('ko', 'KR');
                },
              ),
              MaterialButton(
                child: Text('English'),
                color: Colors.black,
                textColor: Colors.white,
                onPressed: () {
                  myController.changeLanguage('en', 'US');
                },
              ),
              MaterialButton(
                child: Text('Français'),
                color: Colors.black,
                textColor: Colors.white,
                onPressed: () {
                  myController.changeLanguage('fr', 'FR');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
