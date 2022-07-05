import 'package:get/get.dart';
import 'package:toppay/app/controllers/home_controller.dart';
import 'package:toppay/app/controllers/transaction_controller.dart';
import 'package:toppay/app/services/transaction_services.dart';
import 'package:toppay/models/transaction_model.dart';
import 'package:toppay/utils/get_tool/get_tool.dart';

class DetailTransactionController extends GetxController with GetTool {
  // handle here
  RxInt detailId = 0.obs;
  RxBool isLoading = false.obs;
  Rx<TransactionModel> detailTrans = TransactionModel().obs;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    detailId.value = Get.arguments['transaction_id'];
    await detail();
  }

  Future<void> detail() async {
    isLoading.value = true;
    var res = await TransactionService().detailTransaction(detailId);
    detailTrans.value = res;
    isLoading.value = false;
    return;
  }

  delete(id) async {
    var res = await TransactionService().updateTransaction(id);

    if (res.statusCode == 200) {
      isLoading.value = true;
      TransactionController transactionController = Get.put(TransactionController());
      await transactionController.getList();
      HomeController homeContorller = Get.put(HomeController());
      await homeContorller.getTime();
      Get.back();
      notify.success(message: 'Success', title: 'Thành công');
    } else {
      isLoading.value = true;
      notify.error(message: 'Error', title: 'Thất bại');
      isLoading.value = false;
    }
  }
}
