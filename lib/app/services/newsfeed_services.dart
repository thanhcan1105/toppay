import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:toppay/constants.dart';
import 'package:toppay/models/newsfeed_model.dart';
import 'package:toppay/utils/http_service.dart';
import 'package:http/http.dart' as http;

class NewsFeedService extends HttpService {
  GetStorage box = GetStorage();

  Future<List<NewsFeedModel>> list(int page) async {
    var res = await http.get(Uri.parse('${CONST.API_BASE_URL}/newsfeed/list?page=$page'));
    var bodyResponse = jsonDecode(res.body);
    if (res.statusCode == 200) {
      List<NewsFeedModel> listFeed = List.from(bodyResponse['data']['items'].map((element) => NewsFeedModel.fromJson(element)).toList());
      return listFeed;
    } else {
      throw 'No data found';
    }
  }

  Future<NewsFeedModel> detailFeed(int id) async {
    var res = await http.get(Uri.parse('${CONST.API_BASE_URL}/newsfeed/detail/$id'));
    var bodyResponse = jsonDecode(res.body);
    if (res.statusCode == 200) {
      NewsFeedModel detailFeed = NewsFeedModel.fromJson(bodyResponse['data']);
      return detailFeed;
    } else {
      throw 'No data found';
    }
  }
}
