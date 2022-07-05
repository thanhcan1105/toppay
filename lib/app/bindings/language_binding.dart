import 'package:get/get.dart';
import './../../app/controllers/language_controller.dart';

class LanguageBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(LanguageController());
  }
}
