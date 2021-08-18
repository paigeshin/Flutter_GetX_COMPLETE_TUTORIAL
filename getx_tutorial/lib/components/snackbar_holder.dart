import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackbarHolder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: MaterialButton(
        child: Text("Show Snackbar"),
        color: Colors.brown,
        textColor: Colors.white,
        onPressed: () => showSnacbarMultipleProperties(),
      ),
    );
  }

  void showBasicSnackbar() {
    Get.snackbar(
      "Basic Snackbar",
      "This will be Snackbar Message",
    );
  }

  void showSnacbarMultipleProperties() {
    Get.snackbar("Snackbar with multiple properties",
        "This will be snackbar with multiple properties",
        onTap: (value) => print(value),
        overlayBlur: 5,
        // overlayColor: Colors.grey,
        padding: EdgeInsets.all(50),
        showProgressIndicator: true,
        snackPosition: SnackPosition.BOTTOM,
        progressIndicatorBackgroundColor: Colors.deepOrangeAccent,
        progressIndicatorValueColor:
            AlwaysStoppedAnimation<Color>(Colors.white),
        reverseAnimationCurve: Curves.bounceInOut,
        snackbarStatus: (val) {
          print(val);
        },
        titleText: Text("Another Title"), //This overrides title
        backgroundColor: Colors.amberAccent,
        margin: EdgeInsets.all(10),
        // animationDuration: Duration(microseconds: 300),
        backgroundGradient: LinearGradient(
          colors: [
            Colors.red,
            Colors.green,
          ],
        ),
        boxShadows: [
          BoxShadow(
            color: Colors.yellow,
            offset: Offset(
              30,
              50,
            ),
            spreadRadius: 20,
            blurRadius: 8,
          ),
        ],
        borderColor: Colors.purple,
        borderWidth: 4,
        borderRadius: 30,
        messageText: Text(
          //This overrides message
          "Another Message",
          style: TextStyle(color: Colors.black45),
        ),
        isDismissible: true,
        dismissDirection: SnackDismissDirection.HORIZONTAL,
        forwardAnimationCurve: Curves.bounceInOut,
        icon: Icon(
          Icons.send,
          color: Colors.white,
        ),
        shouldIconPulse: false,
        leftBarIndicatorColor: Colors.white,
        mainButton: TextButton(
          child: Text("Retry"),
          onPressed: () {},
        ),
        userInputForm: Form(
          child: Row(
            children: [
              Expanded(
                child: TextField(),
              ),
            ],
          ),
        ));
  }
}
