import 'package:get/get.dart';
import './../../app/controllers/about_app_controller.dart';

class AboutAppBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AboutAppController());
  }
}
