import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
            onPressed: () => {
              Get.back(),
            },
            color: Colors.black,
            textColor: Colors.white,
            child: Text("Go back"),
          ),
          MaterialButton(
            onPressed: () => {
              Get.toNamed('/newnextscreen/hahaha')
              // Get.toNamed("/newnextscreen?channel=paige&content=flutter getX"),
            },
            color: Colors.black,
            textColor: Colors.white,
            child: Text("Go To Next Screen"),
          ),
        ],
      ),
    );
  }
}
