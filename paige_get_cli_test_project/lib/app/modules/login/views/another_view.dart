import 'package:flutter/material.dart';

import 'package:get/get.dart';

class AnotherView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnotherView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'AnotherView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
