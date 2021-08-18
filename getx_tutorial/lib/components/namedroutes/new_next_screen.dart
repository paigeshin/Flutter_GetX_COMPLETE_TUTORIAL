import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewNextScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final value = Get.parameters['someValue'];
    print(value);
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
            child: Text("Go back to main"),
          ),
        ],
      ),
    );
  }
}
