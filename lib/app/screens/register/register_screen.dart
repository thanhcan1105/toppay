import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toppay/app/controllers/register_controller.dart';
import 'package:toppay/config/palette.dart';
import 'package:toppay/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toppay/utils/button_submit.dart';
import 'package:toppay/utils/text_input.dart';

const String CAPTCHA_SITE_KEY = "6LezvcoUAAAAAOLuRkLd12Vv07OVyqkLg3DfXzpk";

class RegisterScreen extends GetView<RegisterController> {
  final focus = FocusNode();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: Get.height * 0.1,
                      ),
                      const Text(
                        'Create Account,',
                        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        'Sign up to get started!',
                        style: TextStyle(fontSize: 20, color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Get.height * 0.1,
                  ),
                  MyTextInput(
                    iconData: Icons.person,
                    hintText: 'Full name',
                    controller: controller.fullnameController,
                    rules: {
                      'minLength': 5,
                      'required': 'not_empty'.tr,
                    },
                    validateCallback: (value) {
                      controller.isValidateFullName.value = value;
                      controller.formValidate();
                    },
                    borderColor: Colors.grey,
                    background: Palette.primaryColor.withOpacity(.1),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MyTextInput(
                    iconData: Icons.email,
                    hintText: 'Email ID',
                    controller: controller.emailController,
                    rules: {
                      'email': true,
                      'required': 'not_empty'.tr,
                    },
                    validateCallback: (value) {
                      controller.isValidateEmail.value = value;
                      controller.formValidate();
                    },
                    borderColor: Colors.grey,
                    background: Palette.primaryColor.withOpacity(.1),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MyTextInput(
                    textInputType: TextInputType.visiblePassword,
                    iconData: Icons.password,
                    hintText: 'Password',
                    controller: controller.passwordController,
                    rules: {
                      'minLength': 6,
                      'required': 'not_empty'.tr,
                    },
                    validateCallback: (value) {
                      controller.isValidatePassword.value = value;
                      controller.formValidate();
                    },
                    borderColor: Colors.grey,
                    background: Palette.primaryColor.withOpacity(.1),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Obx(
                    () => MyButtonSubmit(
                      submiting: controller.isSubmitting.value,
                      onPressed: controller.isEnableSubmit.value
                          ? () {
                              controller.handleRegister();
                            }
                          : null,
                      label: 'Register',
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: GoogleFonts.poppins(color: kGreyTextColor, fontSize: 15.0),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.toNamed('login');
                        },
                        child: Text(
                          'Log In',
                          style: GoogleFonts.poppins(
                            color: kMainColor,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
