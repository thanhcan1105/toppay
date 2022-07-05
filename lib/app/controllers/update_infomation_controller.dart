import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toppay/app/services/auth_services.dart';
import 'package:toppay/models/user_model.dart';
import 'package:toppay/utils/get_tool/get_tool.dart';

class UpdateInfomationController extends GetxController with GetTool {
  // handle here

  TextEditingController bankNumberController = TextEditingController();
  TextEditingController momoController = TextEditingController();
  TextEditingController zalopayController = TextEditingController();
  TextEditingController bankNameController = TextEditingController();

  RxBool isEnableSubmit = false.obs;
  RxBool isSubmitting = false.obs;
  RxBool isValidateATM = false.obs;
  RxBool isValidateMoMo = false.obs;
  RxBool isValidateZaloPay = false.obs;

  Rx<UserModel> user = UserModel().obs;

  @override
  void onInit() {
    super.onInit();
    getUser();
  }

  formValidate() {
    if (isValidateATM.value && isValidateMoMo.value && isValidateZaloPay.value) {
      isEnableSubmit.value = true;
      return true;
    }
    isEnableSubmit.value = false;
    return false;
  }

  Future submitButton() async {
    isSubmitting.value = true;
    isEnableSubmit.value = false;
    Map<String, String> data = {
      'bank_name': bankNameController.text.isNotEmpty ? bankNameController.text.trim() : user.value.bankName!,
      'bank_number': bankNumberController.text.isNotEmpty ? bankNumberController.text.trim() : user.value.bankNumber!,
      'momo': momoController.text.isNotEmpty ? momoController.text.trim() : user.value.momo!,
      'zalopay': zalopayController.text.isNotEmpty ? zalopayController.text.trim() : user.value.zalopay!,
    };
    await AuthService().updateInfo(data: data, id: user.value.id);

    bankNameController.clear();
    bankNumberController.clear();
    momoController.clear();
    zalopayController.clear();
    isSubmitting.value = false;
    isEnableSubmit.value = true;
  }

  Future<void> getUser() async {
    isSubmitting.value = true;
    var res = await AuthService().getUser();
    user.value = res;
    isSubmitting.value = false;
    return;
  }
}
