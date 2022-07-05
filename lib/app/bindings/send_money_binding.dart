import 'package:get/get.dart';
import 'package:toppay/app/controllers/send_money_controller.dart';

class SendMoneyBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SendMoneyController());
  }
}
