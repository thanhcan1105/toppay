import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:toppay/constants.dart';
import 'package:toppay/models/user_model.dart';
import 'package:toppay/utils/get_tool/get_tool.dart';
import 'package:toppay/utils/http_service.dart';
import 'package:http/http.dart' as http;

class AuthService extends HttpService with GetTool {
  GetStorage box = GetStorage();

  Future login({
    required Map<String, dynamic> data,
  }) async {
    var res = await http.post(
      Uri.parse('${CONST.API_BASE_URL}/auth/login'),
      body: {
        "email": data['email'],
        "password": data['password'],
      },
    );

    if (res.statusCode == 200) {
    } else {}
    return res;
  }

  Future register({
    required Map<String, dynamic> data,
  }) async {
    var res = await http.post(
      Uri.parse('${CONST.API_BASE_URL}/auth/register'),
      body: {
        "full_name": data['full_name'],
        "email": data['email'],
        "password": data['password'],
      },
    );

    if (res.statusCode == 200) {
    } else {}
    return res;
  }

  Future<UserModel> getUser() async {
    var res = await http.get(Uri.parse('${CONST.API_BASE_URL}/auth/user'), headers: {'Authorization': 'Bearer ${box.read('token')}'});

    var bodyResponse = jsonDecode(res.body);
    if (res.statusCode == 200) {
      final user = UserModel.fromJson(bodyResponse['data']);
      return user;
    } else {
      throw Exception("False to load transaction");
    }

    // if (res.statusCode == 200) {
    // } else {}
    // return res.body;
  }

  Future updateInfo({required Map<String, dynamic> data, id}) async {
    var res = await http.post(
      Uri.parse('${CONST.API_BASE_URL}/auth/update-info/$id'),
      body: {
        "bank_name": data['bank_name'],
        "bank_number": data['bank_number'],
        "momo": data['momo'],
        "zalopay": data['zalopay'],
      },
      headers: {'Authorization': 'Bearer ${box.read('token')}'},
    );

    if (res.statusCode == 200) {
      notify.success(message: 'Success', title: 'Thành công');
      getUser();
    } else {
      notify.error(message: 'Error', title: 'Thất bại');
    }
  }
}
