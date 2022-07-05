import 'package:get/get.dart';
import 'package:toppay/app/controllers/contact_page_controller.dart';

class ContactPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ContactPageController());
  }
}
