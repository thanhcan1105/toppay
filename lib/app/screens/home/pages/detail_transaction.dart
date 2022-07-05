import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:toppay/app/controllers/detail_transaction_controller.dart';
import 'package:toppay/config/palette.dart';
import 'package:toppay/utils/button_submit.dart';
import 'package:toppay/utils/number.dart';
import 'package:toppay/utils/time.dart';

class DetailTransacionScreen extends GetView<DetailTransactionController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'detail_transaction'.tr,
          style: const TextStyle(color: Colors.black),
        ),
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
      body: SafeArea(
        child: Obx(
          () => controller.isLoading.value
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Palette.colorCyan),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              controller.detailTrans.value.subject == 0 ? Iconsax.arrow_down_2 : Iconsax.arrow_up_1,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.detailTrans.value.subject == 0 ? "Nạp tiền" : "Rút tiền",
                                  style: const TextStyle(color: Colors.white),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Obx(() => Text(
                                      '${$Number.typeSubject(controller.detailTrans.value.subject)} ${$Number.numberFormat(controller.detailTrans.value.amount)} vnđ',
                                      style: const TextStyle(fontSize: 16, color: Colors.white),
                                    )),
                              ],
                            ),
                            const Spacer(),
                            MyText(
                              text: controller.detailTrans.value.status == 1 ? "done".tr : (controller.detailTrans.value.status == 2 ? "cancel".tr : (controller.detailTrans.value.status == 3 ?  "processing".tr : "refuse".tr)),
                            )
                          ],
                        )),
                    Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Palette.colorCyan),
                      child: Column(
                        children: [
                          RowItem(
                            title: 'Mã giao dịch',
                            subtitle: controller.detailTrans.value.transactionCode,
                          ),
                          RowItem(
                            title: 'payment'.tr,
                            subtitle: controller.detailTrans.value.payment.toString(),
                          ),
                          RowItem(
                            title: 'Loại rút',
                            subtitle: 'Rút chậm',
                          ),
                          RowItem(
                            title: 'Phí rút',
                            subtitle: '(${controller.detailTrans.value.tax}%) - ${$Number.numberFormat(int.parse(controller.detailTrans.value.amount.toString()) * ((controller.detailTrans.value.tax ?? 0)) / 100)}đ',
                          ),
                          RowItem(
                            title: 'Thực nhận',
                            subtitle: "${$Number.numberFormat(int.parse(controller.detailTrans.value.amount.toString()) * (100 - (controller.detailTrans.value.tax ?? 0)) / 100)} đ",
                          ),
                          RowItem(
                            title: 'Thời gian nhận dự kiến',
                            subtitle: $Datetime.stringToLocalDateTime(controller.detailTrans.value.dateExpected),
                          ),
                          RowItem(
                            title: 'Thời gian tạo giao dịch',
                            subtitle: $Datetime.stringToLocalDateTime(controller.detailTrans.value.createdAt),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Palette.colorCyan),
                      child: Column(
                        children: [
                          RowItem(
                            title: 'SĐT nhận tiền',
                            subtitle: '0123456789',
                          ),
                          RowItem(
                            title: 'Tên người nhận',
                            subtitle: '1',
                          ),
                        ],
                      ),
                    ),
                    controller.detailTrans.value.status == 3
                        ? MyButtonSubmit(
                            onPressed: () {
                              // print(controller.detailTrans.value.id);
                              controller.delete(controller.detailTrans.value.id);
                            },
                            label: 'Huỷ bỏ',
                            backgroundColor: Colors.red,
                          )
                        : Container(),
                  ],
                ),
        ),
      ),
    );
  }
}

class RowItem extends StatelessWidget {
  RowItem({Key? key, this.subtitle, this.title}) : super(key: key);

  String? title;
  String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        children: [
          MyText(
            text: title,
          ),
          const Spacer(),
          MyText(
            text: subtitle,
          ),
        ],
      ),
    );
  }
}

class MyText extends StatelessWidget {
  MyText({Key? key, this.color, this.fontSize, this.text}) : super(key: key);

  String? text;
  Colors? color;
  int? fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      "$text",
      style: const TextStyle(color: Colors.white),
    );
  }
}
