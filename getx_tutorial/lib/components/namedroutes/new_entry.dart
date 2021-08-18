import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewEntry extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Text(Get.arguments != null ? Get.arguments! : "Main"),
          MaterialButton(
            onPressed: () => {
              Get.toNamed("/newhome"),
            },
            color: Colors.black,
            textColor: Colors.white,
            child: Text("Go To Main Screen"),
          ),
        ],
      ),
    );
  }
}
