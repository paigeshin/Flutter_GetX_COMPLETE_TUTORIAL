import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 16,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Obx(
                  () => controller.selectedImagePath.value == ''
                      ? Text(
                          'Select image from camera/gallery',
                          style: TextStyle(fontSize: 20),
                        )
                      : Image.file(
                          File(
                            controller.selectedImagePath.value,
                          ),
                        ),
                ),
                SizedBox(
                  height: 10,
                ),
                Obx(
                  () => Text(controller.selectedImagePath.value == ''
                      ? ''
                      : controller.selectedImageSize.value),
                ),
                MaterialButton(
                  child: Text('Open Camera'),
                  color: Colors.black,
                  textColor: Colors.white,
                  onPressed: () => controller.getImage(ImageSource.camera),
                ),
                MaterialButton(
                  child: Text('Open Gallery'),
                  color: Colors.black,
                  textColor: Colors.white,
                  onPressed: () => controller.getImage(ImageSource.gallery),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
