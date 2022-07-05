import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:toppay/constants.dart';
import 'package:toppay/models/list_date_model.dart';
import 'package:toppay/models/transaction_model.dart';
import 'package:toppay/utils/http_service.dart';
import 'package:http/http.dart' as http;

class TransactionService extends HttpService {
  GetStorage box = GetStorage();

  Future<List<TransactionModel>> transaction(int status, int month, int year, int day) async {
    //{int status = 0, String createdMonth = ''} transaction(1,2,3)
    var res = await http.get(
      Uri.parse('${CONST.API_BASE_URL}/transaction/list?status=$status&month=$month&year=$year&day=$day'),
      headers: {'Authorization': 'Bearer ${box.read('token')}'},
    );
    var bodyResponse = jsonDecode(res.body);
    if (res.statusCode == 200) {
      List<TransactionModel> listTrans = List.from(bodyResponse.map((element) => TransactionModel.fromJson(element)).toList());
      return listTrans;
    } else if (res.statusCode == 401) {
      box.remove('token');
      Get.offAllNamed('login');
      throw Exception("False to load transaction");
    } else {
      throw Exception("False to load transaction");
    }
  }

  Future<TransactionModel> detailTransaction(id) async {
    var res = await http.get(Uri.parse('${CONST.API_BASE_URL}/transaction/detail/$id'), headers: {'Authorization': 'Bearer ${box.read('token')}'});
    var bodyResponse = jsonDecode(res.body);
    if (res.statusCode == 200) {
      final listTrans = TransactionModel.fromJson(bodyResponse);
      return listTrans;
    } else {
      throw Exception("False to load transaction");
    }
    // return res.body;
  }

  Future updateTransaction(id) async {
    var res = await http.get(
      Uri.parse('${CONST.API_BASE_URL}/transaction/update/$id'),
      headers: {'Authorization': 'Bearer ${box.read('token')}'},
    );
    return res;
  }

  Future<List<ListDateModel>> listDate() async {
    var res = await http.get(Uri.parse('${CONST.API_BASE_URL}/transaction/listDate'), headers: {'Authorization': 'Bearer ${box.read('token')}'});
    var bodyResponse = jsonDecode(res.body);
    if (res.statusCode == 200) {
      List<ListDateModel> listDate = List.from(bodyResponse.map((element) => ListDateModel.fromJson(element)).toList());
      return listDate;
    } else {
      throw Exception("False to load transaction");
    }
    // return res.body;
  }

  Future withdraw({
    required Map<String, dynamic> data,
  }) async {
    var res = await http.post(
      Uri.parse('${CONST.API_BASE_URL}/transaction/withdraw'),
      headers: {'Authorization': 'Bearer ${box.read('token')}'},
      body: {
        "amount": data['amount'],
        "payment": data['payment'],
        "tax": data['tax'],
        "received": data['received'],
      },
    );
    if (res.statusCode == 200) {
    } else {}
    return res;
  }
}
