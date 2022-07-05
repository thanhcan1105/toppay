import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiver/strings.dart';
import 'package:toppay/utils/button_submit.dart';
import 'package:toppay/utils/text_input.dart';
import '../../../controllers/update_infomation_controller.dart';

class UpdateInfomationScreen extends GetView<UpdateInfomationController> {
  const UpdateInfomationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'update_infomation'.tr,
            style: const TextStyle(color: Colors.black),
          ),
          leading: const BackButton(
            color: Colors.black,
          ),
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Obx(
                    () => controller.isSubmitting.value
                        ? const Center(child: CircularProgressIndicator())
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Text(
                                'Tên người dùng:',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              MyTextInput(
                                readOnly: true,
                                iconData: Icons.person,
                                hintText: controller.user.value.fullName,
                                background: Colors.cyan,
                                borderColor: Colors.cyan,
                                textColor: Colors.white,
                                hintColor: Colors.white,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                'ATM:',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              MyTextInput(
                                iconData: Icons.atm,
                                hintText: controller.user.value.bankName ?? 'Tên tài khoản ngân hàng',
                                background: Colors.cyan,
                                validateCallback: (value) {
                                  controller.isValidateATM.value = value;
                                  controller.formValidate();
                                },
                                controller: controller.bankNameController,
                                rules: const {'required': 'Khong duoc trong'},
                                borderColor: Colors.cyan,
                                textColor: Colors.white,
                                hintColor: Colors.white,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              MyTextInput(
                                iconData: Icons.atm,
                                hintText: controller.user.value.bankNumber ?? 'Số tài khoản ngân hàng',
                                background: Colors.cyan,
                                validateCallback: (value) {
                                  controller.isValidateATM.value = value;
                                  controller.formValidate();
                                },
                                controller: controller.bankNumberController,
                                rules: const {'required': 'Khong duoc trong'},
                                borderColor: Colors.cyan,
                                textColor: Colors.white,
                                hintColor: Colors.white,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                'MoMo:',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              MyTextInput(
                                iconData: Icons.attach_money_outlined,
                                hintText: controller.user.value.momo ?? 'Số MoMo',
                                background: Colors.cyan,
                                validateCallback: (value) {
                                  controller.isValidateMoMo.value = value;
                                  controller.formValidate();
                                },
                                controller: controller.momoController,
                                rules: const {'phone': true, 'required': 'Khong duoc trong'},
                                borderColor: Colors.cyan,
                                textColor: Colors.white,
                                hintColor: Colors.white,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                'ZaloPay:',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              MyTextInput(
                                iconData: Icons.attach_money_outlined,
                                hintText: controller.user.value.zalopay ?? 'Số ZaloPay',
                                background: Colors.cyan,
                                validateCallback: (value) {
                                  controller.isValidateZaloPay.value = value;
                                  controller.formValidate();
                                },
                                controller: controller.zalopayController,
                                rules: const {'phone': true, 'required': 'Khong duoc trong'},
                                borderColor: Colors.cyan,
                                textColor: Colors.white,
                                hintColor: Colors.white,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              MyButtonSubmit(
                                onPressed: () {
                                  controller.submitButton();
                                },
                                label: 'Lưu thông tin',
                                backgroundColor: Colors.cyan,
                              )
                            ],
                          ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
