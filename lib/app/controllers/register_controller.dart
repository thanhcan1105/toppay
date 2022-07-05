import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:toppay/utils/get_tool/get_tool.dart';
import 'package:get/get.dart';
import 'package:toppay/app/services/auth_services.dart';

class RegisterController extends GetxController with GetTool {
  // handle here
  TextEditingController fullnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool isValidateFullName = false.obs;
  RxBool isValidateEmail = false.obs;
  RxBool isValidatePassword = false.obs;
  RxBool isEnableSubmit = false.obs;
  RxBool isSubmitting = false.obs;
  RxString errorString = ''.obs;

  formValidate() {
    if (isValidateFullName.value && isValidatePassword.value && isValidateEmail.value) {
      if (passwordController.text.isEmpty) {
        errorString.value = 'login_confirm_password_wrong'.tr;
        return;
      } else {
        errorString.value = '';
      }
      isEnableSubmit.value = true;
      return true;
    }
    isEnableSubmit.value = false;
    return false;
  }

  handleRegister() async {
    isSubmitting.value = true;
    isEnableSubmit.value = false;

    if (isValidateFullName.value && isValidatePassword.value && isValidateEmail.value) {
      Map<String, String> data = {
        'full_name': fullnameController.text.trim(),
        'email': emailController.text.trim(),
        'password': passwordController.text,
      };
      var response = await AuthService().register(data: data);

      Map<String, dynamic> bodyResponse = jsonDecode(response.body);

      if (response.statusCode == 200) {
        isSubmitting.value = false;
        isEnableSubmit.value = true;
        Get.offAllNamed('login');
        notify.success(title: 'Done', message: 'Success');
      } else {
        isSubmitting.value = false;
        isEnableSubmit.value = true;
        notify.error(title: 'Error', message: bodyResponse.keys.map((e) => bodyResponse[e].map((element) => element)).toString());
      }
    }
  }
}
