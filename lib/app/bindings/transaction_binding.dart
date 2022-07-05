import 'package:get/get.dart';
import './../../app/controllers/transaction_controller.dart';

class TransactionBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(TransactionController());
  }
}
