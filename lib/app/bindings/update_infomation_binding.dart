import 'package:get/get.dart';
import './../../app/controllers/update_infomation_controller.dart';

class UpdateInfomationBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(UpdateInfomationController());
  }
}
