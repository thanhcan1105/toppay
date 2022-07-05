import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController {
  GetStorage box = GetStorage();
  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 2), () {
      if (box.hasData('token')) {
        Get.offAllNamed('home');
      } else {
        Get.offAllNamed('login');
      }
    });
  }
}
