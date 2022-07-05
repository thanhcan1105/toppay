import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:toppay/utils/get_tool/get_tool.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:toppay/app/services/auth_services.dart';

class LoginController extends GetxController with GetTool {
  // handle here
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool isValidateUEmail = false.obs;
  RxBool isValidatePassword = false.obs;
  RxBool isEnableSubmit = false.obs;
  RxBool isSubmitting = false.obs;
  GetStorage box = GetStorage();

  formValidate() {
    if (isValidateUEmail.value && isValidatePassword.value) {
      isEnableSubmit.value = true;
      return true;
    }
    isEnableSubmit.value = false;
    return false;
  }

  handleLogin() async {
    isSubmitting.value = true;
    isEnableSubmit.value = false;
    if (isValidateUEmail.value && isValidatePassword.value) {
      Map<String, String> data = {
        'email': emailController.text.trim(),
        'password': passwordController.text,
      };
      var response = await AuthService().login(data: data);

      Map<String, dynamic> bodyResponse = jsonDecode(response.body);

      if (response.statusCode == 200) {
        isSubmitting.value = false;
        isEnableSubmit.value = true;
        Get.back();
        Get.offAllNamed('home');
        box.write('token', bodyResponse['token']);
        notify.success(message: 'Success', title: 'Thành công');
      } else {
        isSubmitting.value = false;
        isEnableSubmit.value = true;
        notify.error(message: bodyResponse['message'], title: 'Thất bại');
      }
    }
  }
}
