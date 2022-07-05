import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toppay/utils/button_submit.dart';
import './../../../app/controllers/setting_controller.dart';

class SettingScreen extends GetView<SettingController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'common.settings'.tr,
          style: const TextStyle(color: Colors.black),
        ),
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        // padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            MaterialButton(
              padding: const EdgeInsets.all(10),
              onPressed: () {
                Get.toNamed('update_infomation');
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'update_infomation'.tr,
                    style: const TextStyle(fontSize: 15),
                  ),
                  const Icon(Icons.keyboard_arrow_right_outlined),
                ],
              ),
            ),
            MaterialButton(
              padding: const EdgeInsets.all(10),
              onPressed: () {
                Get.toNamed('language');
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'language'.tr,
                    style: const TextStyle(fontSize: 15),
                  ),
                  const Icon(Icons.keyboard_arrow_right_outlined),
                ],
              ),
            ),
            MaterialButton(
              padding: const EdgeInsets.all(10),
              onPressed: () {
                // Get.toNamed('about_app');
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'about_app'.tr,
                    style: const TextStyle(fontSize: 15),
                  ),
                  const Text('#')
                  // const Icon(Icons.keyboard_arrow_right_outlined),
                ],
              ),
            ),
            const SizedBox(height: 20,),
            MyButtonSubmit(
              onPressed: () {
                Get.offAllNamed('login');
              },
              label: 'common_logout'.tr,
              backgroundColor: Colors.cyan,
            )
          ],
        ),
      ),
    );
  }
}
