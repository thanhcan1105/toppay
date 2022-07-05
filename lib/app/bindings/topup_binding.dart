import 'package:get/get.dart';
import './../../app/controllers/topup_controller.dart';

class TopupBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(TopupController());
  }
}
