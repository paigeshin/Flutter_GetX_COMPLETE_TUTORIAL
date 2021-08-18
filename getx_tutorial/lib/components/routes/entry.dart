import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

import 'home.dart.dart';

class Entry extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: MaterialButton(
        onPressed: () {
          Get.to(
            Home(),
            // To make the screen full dialog
            fullscreenDialog: true,
            // To provide animations
            transition: Transition.zoom,
            duration: Duration(
              microseconds: 4000,
            ),
            curve: Curves.bounceInOut,
          );
          // Go to home screen but no option to return to previous screen
          // Get.off(Home(),),

          // Go to home screen and cancel all previous screens/routes
          // Get.offAll(Home(),);

          // Go to next screen with some data
          // Get.to(Home(), arguments: "Data from Main");

          // Go to next screen and receive data sent from home screen
          // var data = await Get.to(Home());
          // print("The Received data is $data");
        },
        color: Colors.black,
        textColor: Colors.white,
        child: Text("Go To Main"),
      ),
    );
  }
}
