import 'package:get/get.dart';
import 'package:toppay/app/services/transaction_services.dart';
import 'package:toppay/models/list_date_model.dart';
import 'package:toppay/models/transaction_model.dart';

class TransactionController extends GetxController {
  // handle here
  String? selectedFormality;
  RxString? selectedStatus = ''.obs;
  RxString? selectedDate = ''.obs;
  RxList<TransactionModel> listTrans = <TransactionModel>[].obs;
  RxBool isLoading = false.obs;
  RxInt? isStatus = 0.obs;
  RxInt? month = 0.obs;
  RxInt? year = 0.obs;

  RxList<ListDateModel> listDates = <ListDateModel>[].obs;

  List<StatusModel> status = [
    StatusModel(id: 1, label: 'all'.tr, status: 0),
    StatusModel(id: 2, label: 'done'.tr, status: 1),
    StatusModel(id: 3, label: 'cancel'.tr, status: 2),
    StatusModel(id: 3, label: 'processing'.tr, status: 3),
  ];

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await date();
    await getList();
  }

  Future<void> getList() async {
    isLoading.value = true;
    var res = await TransactionService().transaction(isStatus!.value, month!.value, year!.value, 0);
    listTrans.assignAll(res);
    isLoading.value = false;
    return;
  }

  Future<void> date() async {
    isLoading.value = true;
    var res = await TransactionService().listDate();
    res.insert(0, ListDateModel(month: 0, year: 0));
    listDates.assignAll(res);
    isLoading.value = false;
    return;
  }
}

class StatusModel {
  int? id;
  String? label;
  int? status;
  StatusModel({this.id, this.status, this.label});
}
