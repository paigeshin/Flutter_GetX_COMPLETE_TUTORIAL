import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NextScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Last Screen"),
        MaterialButton(
          onPressed: () => {
            Get.back(),
          },
          color: Colors.black,
          textColor: Colors.white,
          child: Text("Go Back To Main"),
        ),
      ],
    );
  }
}
