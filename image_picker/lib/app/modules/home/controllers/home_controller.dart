import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_tutorial/app/modules/home/provider/image_upload_provider.dart';

class HomeController extends GetxController {
  // image picker
  var selectedImagePath = ''.obs;
  var selectedImageSize = ''.obs;

  // Crop
  var cropImagePath = ''.obs;
  var cropImageSize = ''.obs;

  // Compress Code
  var compressImagePath = ''.obs;
  var compressImageSize = ''.obs;

  void getImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
      selectedImageSize.value =
          ((File(selectedImagePath.value)).lengthSync() / 1024 / 1024)
                  .toStringAsFixed(2) +
              ' Mb';

      //Crop
      final cropImageFile = await ImageCropper.cropImage(
        sourcePath: selectedImagePath.value,
        maxWidth: 512,
        maxHeight: 512,
        compressFormat: ImageCompressFormat.png,
      );
      cropImagePath.value = cropImageFile?.path ?? '';
      cropImageSize.value =
          ((File(cropImagePath.value)).lengthSync() / 1024 / 1024)
                  .toStringAsFixed(2) +
              ' Mb';

      //Compress
      final dir = await Directory.systemTemp;
      final targetPath = dir.absolute.path + '/temp.png';
      var compressedFile = await FlutterImageCompress.compressAndGetFile(
        cropImagePath.value,
        targetPath,
        quality: 90,
      );
      compressImagePath.value = compressedFile?.path ?? '';
      compressImagePath.value =
          ((File(compressImagePath.value)).lengthSync() / 1024 / 1024)
                  .toStringAsFixed(2) +
              ' Mb';

      //Upload image
      uploadImage(compressedFile);
    } else {
      Get.snackbar(
        'Error',
        'No image selected',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void uploadImage(File? file) {
    Get.dialog(
      Center(
        child: CircularProgressIndicator(),
      ),
      barrierDismissible: false,
    );
    ImageUploadProvider().uploadImage(file).then(
      (response) {
        Get.back();
        if (response == 'success') {
          Get.snackbar(
            'Success',
            'File Uploaded',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
        } else if (response == 'fail') {
          Get.snackbar(
            'Error',
            'File upload failed',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        }
      },
      onError: (err) {
        Get.back();
        Get.snackbar(
          'Error',
          'File upload failed',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      },
    );
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
