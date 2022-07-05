import 'package:get/get.dart';
import 'package:toppay/app/services/newsfeed_services.dart';
import 'package:toppay/models/newsfeed_model.dart';

class NewsfeedController extends GetxController {
  // handle here
  RxBool isLoading = false.obs;
  RxList<NewsFeedModel> listFeed = <NewsFeedModel>[].obs;
  RxBool checkEmpty = false.obs;
  int page = 0;

  @override
  void onInit() {
    super.onInit();
    getList();
  }

  sumPage() {
    page = page + 1;
  }

  // refreshFeeds() {
  //   listFeed.clear();
  // }

  getList() async {
    isLoading.value = true;
    var res = await NewsFeedService().list(page);
    // checkEmpty.assignAll(res);
    if (res.isEmpty) {
      checkEmpty.value = true;
    }
    listFeed.addAll(res);
    isLoading.value = false;
  }
}
