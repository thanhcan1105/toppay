import 'package:get/get.dart';
import 'package:toppay/app/services/newsfeed_services.dart';
import 'package:toppay/models/newsfeed_model.dart';

class DetailFeedController extends GetxController {
  // handle here
  RxInt detailId = 0.obs;
  RxBool isLoading = false.obs;
  Rx<NewsFeedModel> detailFeed = NewsFeedModel().obs;

  @override
  void onInit() async {
    super.onInit();
    detailId.value = Get.arguments['detail_feed_id'];
    await detail();
  }

  Future<void> detail() async {
    isLoading.value = true;
    var res = await NewsFeedService().detailFeed(detailId.value);
    detailFeed.value = res;
    isLoading.value = false;
    return;
  }
}
