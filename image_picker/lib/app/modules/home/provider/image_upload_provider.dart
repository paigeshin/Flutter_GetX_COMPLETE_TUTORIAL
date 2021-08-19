import 'dart:io';

import 'package:get/get_connect.dart';

class ImageUploadProvider extends GetConnect {
  //Upload Image
  Future<String> uploadImage(File? file) async {
    if (file == null) {
      return Future.error('file is null..');
    }
    try {
      final form = FormData(
        {
          'file': MultipartFile(file, filename: 'aa.png'),
        },
      );
      final response = await post('http://blabla', form);
      print("response:: => $response");
      if (response.status.hasError) {
        return Future.error(response.body);
      } else {
        return response.body['result'];
      }
    } catch (exception) {
      return Future.error(
        exception.toString(),
      );
    }
  }
}
