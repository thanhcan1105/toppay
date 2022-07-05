import 'package:get/get.dart';
import './../../app/controllers/transfer_controller.dart';

class TransferBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(TransferController());
  }
}
