import 'package:flutter/material.dart';

import 'package:get/get.dart';

class LoginKingView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LoginKingView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'LoginKingView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
