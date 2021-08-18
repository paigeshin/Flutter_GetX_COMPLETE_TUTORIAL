import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_tutorial/components/routes/next_screen.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(Get.arguments != null ? Get.arguments! : "Main"),
        MaterialButton(
          onPressed: () => {
            Get.to(
              NextScreen(),
            ),
          },
          color: Colors.black,
          textColor: Colors.white,
          child: Text("Go To Next Screen"),
        ),
        MaterialButton(
          onPressed: () => {
            Get.back(),
          },
          color: Colors.black,
          textColor: Colors.white,
          child: Text("Go Back"),
        ),
      ],
    );
  }
}
