import 'package:get/get.dart';
import 'package:toppay/app/controllers/detail_transaction_controller.dart';

class DetailTransactionBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(DetailTransactionController());
  }
}
