import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/topup_controller.dart';

class TopupScreen extends GetView<TopupController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text('Topup', style: TextStyle(color: Colors.black),),
        leading: BackButton(color: Colors.black,),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.cyan,
              ),
              
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Số dư tạm khoá', style: TextStyle(fontSize: 15, color: Colors.white),),
                  Text('0 đ', style: TextStyle(fontSize: 15, color: Colors.white),),
                ],
              ),
            ),
            SizedBox(height: 30,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Chọn mệnh giá', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              ],
            ),
            SizedBox(height: 10,),
            
          ],
        ),
      ),
    );
  }
}


