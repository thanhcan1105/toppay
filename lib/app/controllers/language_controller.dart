import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageController extends GetxController {
  // handle here


  List<ListLangModel> languages = [
    ListLangModel(id: 1, label: 'Tiếng Anh', status: 0),
    ListLangModel(id: 2, label: 'Tiếng Việt', status: 1),
  ];

}

class ListLangModel {
  int? id;
  String? label;
  int? status;

  ListLangModel({this.id, this.status, this.label});
}
