import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  var emailEditingController = TextEditingController();
  var storage = GetStorage();

  @override
  Widget build(BuildContext context) {
    // Listen to changes
    var listen = storage.listen(
      () {
        print('Email changed');
      },
    );

    // listen key
    var listenKey = storage.listenKey('email', (value) {
      print('new key is $value');
    });

    // remove key
    storage.remove('email');

    // erade the container
    storage.erase();

    // Create a new container
    GetStorage newStorage = GetStorage('MyStorage');
    await GetStorage.init('MyStroage'); // initialize 

    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('Storage')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: TextField(
                  controller: emailEditingController,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: MaterialButton(
                  child: Text("Write"),
                  textColor: Colors.white,
                  color: Colors.black,
                  onPressed: () async {
                    if (GetUtils.isEmail(emailEditingController.text)) {
                      print(
                          'text to be stored, ${emailEditingController.text}');
                      await storage.write(
                        'email',
                        emailEditingController.text,
                      );
                      print('email saved!');
                    } else {
                      Get.snackbar(
                        'Incorrect Email',
                        'Provide Email in valid format',
                        colorText: Colors.white,
                        backgroundColor: Colors.red,
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    }
                  },
                ),
              ),
              SizedBox(
                height: 8,
              ),
              MaterialButton(
                child: Text('Read'),
                onPressed: () {
                  print("The email is ${storage.read('email')}");
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
