
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pattern_formatter/pattern_formatter.dart';
import 'package:toppay/utils/button_submit.dart';
import 'package:toppay/utils/number.dart';
import 'package:toppay/utils/text_input.dart';
import '../../../controllers/withdraw_controller.dart';

class WithdrawScreen extends GetView<WithdrawController> {
  const WithdrawScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'common.withdraw'.tr,
          style: const TextStyle(color: Colors.black),
        ),
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(
              () => Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(25),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.cyan,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Số dư khả dụng',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                        Text(
                          '${$Number.numberFormat(int.parse(controller.user.value.balance ?? '0'))} đ',
                          style: const TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text('Số tiền rút:'),
                  const SizedBox(
                    height: 10,
                  ),
                  MyTextInput(
                    hintText: 'Nhập số tiền cần rút',
                    rules: {
                      'maxAmount': controller.user.value.balance,
                      'minAmount': 50000,
                      'required': 'Vui lòng nhập số tiền hợp lệ',
                    },
                    iconData: Icons.money,
                    controller: controller.numberController,
                    validateCallback: (value) {
                      controller.isValidateAmount.value = value;
                      controller.formValidate();
                    },
                    background: Colors.cyan,
                    borderColor: Colors.cyan,
                    hintColor: Colors.white,
                    textColor: Colors.white,
                  inputFormatter: [ThousandsFormatter( )],
                    textInputType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text('Phương thức thanh toán'),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    height: 50,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.only(bottom: 10),
                      itemCount: controller.listPayments.value.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            controller.selectedButton(controller.listPayments.value[index].id ?? 0);
                            controller.payment.value = controller.listPayments.value[index].label!;
                            controller.isValidatePayment.value = true;
                            controller.formValidate();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.only(right: 10),
                            width: Get.width * 0.3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.cyan),
                              color: controller.listPayments.value[index].isSelected! ? Colors.green : Colors.cyan,
                            ),
                            child: Text(
                              controller.listPayments.value[index].label!,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text('Loại rút'),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    height: 50,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.only(bottom: 10),
                      itemCount: controller.listTypeWithDraw.value.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            controller.typeSelected(controller.listTypeWithDraw.value[index].id ?? 0);
                            controller.isValidateType.value = true;
                            controller.formValidate();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.only(right: 10),
                            width: Get.width * 0.465,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.cyan),
                              color: controller.listTypeWithDraw.value[index].isSelected! ? Colors.green : Colors.cyan,
                            ),
                            child: Text(
                              controller.listTypeWithDraw.value[index].label!,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              child: Obx(
                () => MyButtonSubmit(
                  width: Get.width,
                  radius: 0,
                  height: 50,
                  backgroundColor: controller.isEnableSubmit.value ? Colors.cyan : Colors.grey,
                  onPressed: controller.isEnableSubmit.value
                      ? () {
                          controller.submitButton();
                        }
                      : null,
                  label: 'common.withdraw'.tr,
                ),
              ))
        ],
      ),
    );
  }
}
