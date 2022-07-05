import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/about_app_controller.dart';

class AboutAppScreen extends GetView<AboutAppController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AboutAppScreen'),
      ),
      body: Center(
        child: Container(
          child: Text('This is an automatically generated screen'),
        ),
      ),
    );
  }
}


