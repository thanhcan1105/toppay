import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/language_controller.dart';
import 'package:restart_app/restart_app.dart';

class LanguageScreen extends GetView<LanguageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'language'.tr,
            style: const TextStyle(color: Colors.black),
          ),
          leading: const BackButton(
            color: Colors.black,
          ),
        ),
        body: Column(
          children: [
            MaterialButton(
              padding: const EdgeInsets.all(15),
              onPressed: () {
                Get.updateLocale(const Locale('vi', 'VN'));
                Restart.restartApp(webOrigin: 'splash');
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'language.vi'.tr,
                    style: const TextStyle(fontSize: 15),
                  ),
                  // Icon(Icons.keyboard_arrow_right_outlined),
                ],
              ),
            ),
            MaterialButton(
              padding: const EdgeInsets.all(15),
              onPressed: () {
                Get.updateLocale(const Locale('en', 'US'));
                Restart.restartApp(webOrigin: 'splash');
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'language.en'.tr,
                    style: const TextStyle(fontSize: 15),
                  ),
                  // Icon(Icons.keyboard_arrow_right_outlined),
                ],
              ),
            )
          ],
        ));
  }
}
