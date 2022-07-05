import 'package:get_storage/get_storage.dart';
import 'package:toppay/utils/http_service.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:toppay/utils/utils.dart';

class BalanceService extends HttpService {
  GetStorage box = GetStorage();
  Future addMoney({
    required Map<String, dynamic> data,
  }) async {
    final timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    final res = await fetch(
      url: '/AddMoney.php',
      method: POST,
      body: {
        'account': box.read('account') ?? '',
        'password': box.read('password') ?? '',
        'pwMD5': md5
            .convert(utf8.encode(box.read('password') + 'youngerx'))
            .toString(),
        "token": generateTokenMd5(timestamp),
        "timestamp": timestamp,
        "key": box.read('androidId') ?? '',
        'phone': '0339888746',
        'bank': 'App',
        'money': data['money'],
      },
    );

    if ([res.isConnectError, res.isResponseError].contains(true)) {
      return null;
    } else {
      return res.body;
    }
  }
}
