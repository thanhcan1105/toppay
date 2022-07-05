import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:toppay/app/services/auth_services.dart';
import 'package:toppay/app/services/transaction_services.dart';
import 'package:toppay/models/user_model.dart';
import 'package:toppay/utils/get_tool/get_tool.dart';

class WithdrawController extends GetxController with GetTool {
  // handle here
  TextEditingController numberController = TextEditingController();

  RxString payment = ''.obs;
  RxInt type = 0.obs;
  RxBool isValidateAmount = false.obs;
  RxBool isValidatePayment = false.obs;
  RxBool isValidateType = false.obs;
  RxBool isEnableSubmit = false.obs;
  RxBool isSubmitting = false.obs;

  Rx<UserModel> user = UserModel().obs;

  List<PaymentModel> payments = [
    PaymentModel(id: 1, isSelected: false, label: 'MoMo'),
    PaymentModel(id: 2, isSelected: false, label: 'ZaloPay'),
    PaymentModel(id: 3, isSelected: false, label: 'ATM'),
  ];

  List<PaymentModel> types = [
    PaymentModel(id: 1, isSelected: false, label: 'Rút nhanh (Phí 3%)'),
    PaymentModel(id: 2, isSelected: false, label: 'Rút chậm'),
  ];

  RxList<PaymentModel> listPayments = <PaymentModel>[].obs;
  RxList<PaymentModel> listTypeWithDraw = <PaymentModel>[].obs;
  var maskFormatter = MaskTextInputFormatter(mask: '#,###', filter: {"#": RegExp(r'[0-9]')});
  @override
  void onInit() {
    super.onInit();
    listPayments.assignAll(payments);
    listTypeWithDraw.assignAll(types);
    getUser();
  }

  formValidate() {
    if (isValidateAmount.value && isValidatePayment.value && isValidateType.value) {
      isEnableSubmit.value = true;
      return true;
    }
    isEnableSubmit.value = false;
    return false;
  }

  selectedButton(int id) {
    listPayments.clear();
    listPayments.addAll([
      PaymentModel(id: 1, isSelected: false, label: 'MoMo'),
      PaymentModel(id: 2, isSelected: false, label: 'ZaloPay'),
      PaymentModel(id: 3, isSelected: false, label: 'ATM'),
    ]);
    listPayments.firstWhere((element) => element.id == id).isSelected = true;
    isValidatePayment.value = true;
    payment.value = listPayments.firstWhere((element) => element.id == id).label!;
    return;
  }

  typeSelected(int id) {
    listTypeWithDraw.clear();
    listTypeWithDraw.addAll([
      PaymentModel(id: 1, isSelected: false, label: 'Rút nhanh (Phí 3%)'),
      PaymentModel(id: 9, isSelected: false, label: 'Rút chậm'),
    ]);
    listTypeWithDraw.firstWhere((element) => element.id == id).isSelected = true;
    isValidateType.value = true;
    if (id == 1) {
      type.value = 3;
    } else {
      type.value = 0;
    }
    return;
  }

  Future submitButton() async {
    isSubmitting.value = true;
    isEnableSubmit.value = false;
    Map<String, String> data = {
      'amount': numberController.text.trim().replaceAll(',', ''),
      'payment': payment.value,
      'tax': type.toString(),
      'received': (((100 - type.value) / 100) * int.parse(numberController.text.trim().replaceAll(',', ''))).toString(),
    };
    var response = await TransactionService().withdraw(data: data);
    if (response.statusCode == 200) {
      Get.back();
      Get.offAllNamed('home');
      notify.success(message: 'Success', title: 'Thành công');
    } else {
      isSubmitting.value = false;
      isEnableSubmit.value = true;
      notify.error(message: 'Error', title: 'Thất bại');
    }
  }

  Future<void> getUser() async {
    isSubmitting.value = true;
    var res = await AuthService().getUser();
    user.value = res;
    isSubmitting.value = false;
    return;
  }
}

class PaymentModel {
  int? id;
  bool? isSelected;
  String? label;
  PaymentModel({this.id, this.isSelected, this.label});
}
