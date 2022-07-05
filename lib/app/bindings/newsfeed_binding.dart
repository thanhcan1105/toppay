import 'package:get/get.dart';
import './../../app/controllers/newsfeed_controller.dart';

class NewsfeedBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(NewsfeedController(), permanent: true);
  }
}
