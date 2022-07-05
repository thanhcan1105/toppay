import 'package:get/get.dart';
import './../../app/controllers/detail_feed_controller.dart';

class DetailFeedBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(DetailFeedController());
  }
}
