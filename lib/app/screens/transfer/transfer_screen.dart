import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './../../../app/controllers/transfer_controller.dart';

class TransferScreen extends GetView<TransferController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TransferScreen'),
      ),
      body: Center(
        child: Container(
          child: Text('This is an automatically generated screen'),
        ),
      ),
    );
  }
}


