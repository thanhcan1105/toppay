import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:toppay/app/services/auth_services.dart';
import 'package:toppay/app/services/transaction_services.dart';
import 'package:toppay/models/transaction_model.dart';
import 'package:toppay/models/user_model.dart';

class HomeController extends GetxController {
  // handle here
  GetStorage box = GetStorage();
  late ScrollController scrollController;
  bool isScrolled = false;

  RxList<TransactionModel> listTrans = <TransactionModel>[].obs;
  Rx<UserModel> user = UserModel().obs;
  RxBool isLoading = false.obs;
  RxInt totalAmount = 0.obs;
  RxInt bindingUser = 0.obs;
  final advancedDrawerController = AdvancedDrawerController();

  final List<dynamic> services = [
    // ['Transfer', Iconsax.export_1, Colors.blue],
    ['common.topup'.tr, Iconsax.import, Colors.pink],
    ['common.withdraw'.tr, Iconsax.export, Colors.pink],
    // ['Bill', Iconsax.wallet_3, Colors.orange],
    ['transaction'.tr, Iconsax.money, Colors.green],
    ['newsfeed'.tr, Iconsax.paperclip_21, Colors.green],
    // ['More', Iconsax.more, Colors.green],
  ];

  final List<dynamic> transactions = [
    ['Amazon', 'https://img.icons8.com/color/2x/amazon.png', '6:25pm', '\$8.90'],
    ['Cash from ATM', 'https://img.icons8.com/external-kiranshastry-lineal-color-kiranshastry/2x/external-atm-banking-and-finance-kiranshastry-lineal-color-kiranshastry.png', '5:50pm', '\$200.00'],
    ['Netflix', 'https://img.icons8.com/color-glass/2x/netflix.png', '2:22pm', '\$13.99'],
    ['Apple Store', 'https://img.icons8.com/color/2x/mac-os--v2.gif', '6:25pm', '\$4.99'],
    ['Cash from ATM', 'https://img.icons8.com/external-kiranshastry-lineal-color-kiranshastry/2x/external-atm-banking-and-finance-kiranshastry-lineal-color-kiranshastry.png', '5:50pm', '\$200.00'],
    ['Netflix', 'https://img.icons8.com/color-glass/2x/netflix.png', '2:22pm', '\$13.99'],
    ['Cash from ATM', 'https://img.icons8.com/external-kiranshastry-lineal-color-kiranshastry/2x/external-atm-banking-and-finance-kiranshastry-lineal-color-kiranshastry.png', '5:50pm', '\$200.00'],
    ['Netflix', 'https://img.icons8.com/color-glass/2x/netflix.png', '2:22pm', '\$13.99'],
    ['Netflix', 'https://img.icons8.com/color-glass/2x/netflix.png', '2:22pm', '\$13.99']
  ];

  void handleMenuButtonPressed() {
    advancedDrawerController.showDrawer();
  }

  void listenToScrollChange() {
    if (scrollController.offset >= 100.0) {
      isScrolled = true;
    } else {
      isScrolled = false;
    }
  }

  @override
  void onInit() async {
    super.onInit();
    scrollController = ScrollController();
    scrollController.addListener(listenToScrollChange);
    await getTime();
    await getUser();
  }

  handleUser() async {
    var response = await AuthService().getUser();
  }

  getTime() async {
    isLoading.value == true;
    var now = DateTime.now();
    var dayFormat = DateFormat('dd');
    var monthFormat = DateFormat('MM');
    var yearFormat = DateFormat('yyyy');
    String day = dayFormat.format(now);
    String month = monthFormat.format(now);
    String year = yearFormat.format(now);
    int status = 0;
    var res = await TransactionService().transaction(status, int.parse(month), int.parse(year), int.parse(day));
    listTrans.assignAll(res);
    totalAmount.value = 0;
    listTrans.forEach((e) {
      if (e.subject == 0) {
        totalAmount.value += e.amount!;
      } else {
        totalAmount.value -= e.amount!;
      }
    });
    isLoading.value == false;
    return;
  }

  Future<void> getUser() async {
    isLoading.value = true;
    var res = await AuthService().getUser();
    user.value = res;
    isLoading.value = false;
    return;
  }
}
