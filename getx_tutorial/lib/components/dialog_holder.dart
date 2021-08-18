import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogHolder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
            child: Text("Show Dialog"),
            color: Colors.brown,
            textColor: Colors.white,
            onPressed: () => showDialogWithProperties(),
          ),
        ],
      ),
    );
  }

  void showBasicDialog() {
    Get.defaultDialog(
      title: "Dialog Title",
      titleStyle: TextStyle(fontSize: 25),
    );
  }

  void showDialogWithProperties() {
    Get.defaultDialog(
      title: "Dialog Title",
      titleStyle: TextStyle(
        fontSize: 25,
      ),
      middleText: "This is middle text",
      middleTextStyle: TextStyle(
        fontSize: 20,
      ),
      backgroundColor: Colors.purple,
      radius: 80,
      //Customize the middle text
      content: Row(
        children: [
          CircularProgressIndicator(),
          SizedBox(
            width: 16,
          ),
          Expanded(
            child: Text(
              "Data Loading",
            ),
          ),
        ],
      ),
      textCancel: "Cancel",
      cancelTextColor: Colors.white,
      textConfirm: "Confirm",
      confirmTextColor: Colors.white,
      onCancel: () {
        Get.back();
      },
      onConfirm: () {},
      buttonColor: Colors.green,
      //Customize the default cancel and confirm
      cancel: Text(
        "Cancels",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      confirm: Text(
        "Confirms",
        style: TextStyle(
          color: Colors.white,
        ),
      ),

      // ADD SOME ACTIONS
      actions: [
        MaterialButton(
          child: Text("Action-1"),
          onPressed: () {
            Get.back();
          },
        ),
        MaterialButton(
          child: Text("Action-2"),
          onPressed: () {},
        )
      ],
    );
  }
}
