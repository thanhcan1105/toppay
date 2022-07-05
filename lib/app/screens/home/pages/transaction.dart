import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:toppay/models/list_date_model.dart';
import 'package:toppay/utils/number.dart';
import '../../../controllers/transaction_controller.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class TransactionScreen extends GetView<TransactionController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'transaction'.tr,
          style: const TextStyle(color: Colors.black),
        ),
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: Container(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: Obx(
                () => Column(
                  children: [
                    FadeInDown(
                      duration: const Duration(milliseconds: 500),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 150,
                            height: 40,
                            child: DropdownButtonFormField2<ListDateModel>(
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.zero,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              isExpanded: true,
                              hint: Text(
                                'time'.tr,
                                style: TextStyle(fontSize: 14),
                              ),
                              icon: const Icon(
                                Icons.arrow_drop_down,
                                color: Colors.black45,
                              ),
                              iconSize: 30,
                              buttonHeight: 60,
                              buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                              dropdownDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              // items: controller.status.map((e) => )
                              items: controller.listDates
                                  .map((item) => DropdownMenuItem<ListDateModel>(
                                        value: item,
                                        child: item.year == 0
                                            ? Text('all'.tr)
                                            : Text(
                                                '${'month'.tr} ${item.month} - ${item.year}',
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                ),
                                              ),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                controller.month!.value = value!.month!;
                                controller.year!.value = value.year!;
                                controller.getList();
                              },
                              onSaved: (value) {
                                controller.selectedDate?.value = value.toString();
                              },
                            ),
                          ),
                          SizedBox(
                            width: 150,
                            height: 40,
                            child: DropdownButtonFormField2<StatusModel>(
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.zero,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              isExpanded: true,
                              hint: Text(
                                'status'.tr,
                                style: TextStyle(fontSize: 14),
                              ),
                              icon: const Icon(
                                Icons.arrow_drop_down,
                                color: Colors.black45,
                              ),
                              iconSize: 30,
                              buttonHeight: 60,
                              buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                              dropdownDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              // items: controller.status.map((e) => )
                              items: controller.status
                                  .map((item) => DropdownMenuItem<StatusModel>(
                                        value: item,
                                        child: Text(
                                          '${item.label}',
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                //Do something when changing the item if you want.
                                controller.isStatus?.value = value!.status!;
                                controller.getList();
                                // print(value!.status);
                              },
                              onSaved: (value) {
                                controller.selectedStatus?.value = value.toString();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    controller.isLoading.value
                        ? const CircularProgressIndicator(
                            color: Colors.red,
                          )
                        : Expanded(
                            child: RefreshIndicator(
                              onRefresh: () async {
                                await controller.getList();
                              },
                              child: controller.listTrans.isEmpty
                                  ? Center(
                                      child: Text('no_data'.tr),
                                    )
                                  : ListView.builder(
                                      padding: const EdgeInsets.only(top: 20),
                                      // physics: const NeverScrollableScrollPhysics(),
                                      itemCount: controller.listTrans.length,
                                      itemBuilder: (context, index) {
                                        return Column(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                Get.toNamed('detail_transaction', arguments: {'transaction_id': controller.listTrans[index].id});
                                              },
                                              child: FadeInDown(
                                                duration: const Duration(milliseconds: 500),
                                                child: Container(
                                                  margin: const EdgeInsets.only(bottom: 10),
                                                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                                  decoration: BoxDecoration(
                                                    color: controller.listTrans[index].status == 1 ? Colors.green : (controller.listTrans[index].status == 2 ? Colors.red : (controller.listTrans[index].status == 3 ? Colors.blueGrey : Colors.deepOrange)),
                                                    borderRadius: BorderRadius.circular(15),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.grey.shade200,
                                                        blurRadius: 5,
                                                        spreadRadius: 1,
                                                        offset: const Offset(0, 6),
                                                      ),
                                                    ],
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Icon(
                                                            controller.listTrans[index].subject == 0 ? Iconsax.arrow_down_2 : Iconsax.arrow_up_1,
                                                            color: Colors.white,
                                                          ),
                                                          const SizedBox(
                                                            width: 15,
                                                          ),
                                                          Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              Text(
                                                                controller.listTrans[index].subject == 0 ? "common.topup".tr : "common.withdraw".tr,
                                                                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 14),
                                                              ),
                                                              const SizedBox(
                                                                height: 5,
                                                              ),
                                                              Text(
                                                                DateFormat('dd/MM/yyyy hh:mm').format(DateTime.parse(DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(controller.listTrans[index].createdAt.toString()).toString())),
                                                                style: const TextStyle(color: Colors.white, fontSize: 12),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                      Column(
                                                        children: [
                                                          Text(
                                                            '${$Number.typeSubject(controller.listTrans[index].subject)} ${$Number.numberFormat(controller.listTrans[index].amount)} vnđ',
                                                            style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w700),
                                                          ),
                                                          Text(
                                                            controller.listTrans[index].status == 1 ? "done".tr : (controller.listTrans[index].status == 2 ? "cancel".tr : (controller.listTrans[index].status == 3 ?  "processing".tr : "refuse".tr)),
                                                            style: const TextStyle(color: Colors.white, fontSize: 14),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                            ),
                          ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
