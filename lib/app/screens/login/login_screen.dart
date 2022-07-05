import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toppay/app/controllers/login_controller.dart';
import 'package:toppay/config/palette.dart';
import 'package:toppay/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toppay/utils/button_submit.dart';
import 'package:toppay/utils/text_input.dart';

class LoginScreen extends GetView<LoginController> {
  // final focus = FocusNode();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.fromLTRB(20, Get.height * 0.1, 20, 0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        'Welcome,',
                        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Sign in to continue!',
                        style: TextStyle(fontSize: 20, color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Get.height * 0.15,
                  ),
                  MyTextInput(
                    iconData: Icons.email,
                    hintText: 'Enter your email',
                    textInputType: TextInputType.text,
                    controller: controller.emailController,
                    rules: const {
                      'email': 'required',
                      'required': true,
                    },
                    validateCallback: (value) {
                      controller.isValidateUEmail.value = value;
                      controller.formValidate();
                    },
                    borderColor: Colors.grey,
                    background: Palette.primaryColor.withOpacity(.1),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MyTextInput(
                    iconData: Icons.password,
                    hintText: 'Enter password',
                    textInputType: TextInputType.visiblePassword,
                    controller: controller.passwordController,
                    rules: const {
                      'password': 'required',
                      'required': true,
                    },
                    validateCallback: (value) {
                      controller.isValidatePassword.value = value;
                      controller.formValidate();
                    },
                    borderColor: Colors.grey,
                    background: Palette.primaryColor.withOpacity(.1),
                  ),
                  Row(
                    children: [
                      const Spacer(),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/forgotPassword');
                        },
                        child: Text(
                          'Forgot Password?',
                          style: GoogleFonts.poppins(
                            color: kGreyTextColor,
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Obx(
                    () => MyButtonSubmit(
                      submiting: controller.isSubmitting.value,
                      onPressed: controller.isEnableSubmit.value
                          ? () {
                              controller.handleLogin();
                            }
                          : null,
                      label: 'Login',
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Haven\'t any account?',
                        style: GoogleFonts.poppins(color: kGreyTextColor, fontSize: 15.0),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.toNamed('register');
                        },
                        child: Text(
                          'Register',
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
