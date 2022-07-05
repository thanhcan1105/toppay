import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../controllers/detail_feed_controller.dart';

class DetailFeed extends GetView<DetailFeedController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // centerTitle: true,
        title: Obx(
          () => Text(
            '${controller.detailFeed.value.title}',
            style: const TextStyle(color: Colors.black),
          ),
        ),
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Obx(
            () => controller.isLoading.value
                ? const Center(
                  child: CircularProgressIndicator(
                      color: Colors.red,
                    ),
                )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '${controller.detailFeed.value.title}',
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      CachedNetworkImage(
                        imageUrl: controller.detailFeed.value.image.toString(),
                        placeholder: (context, url) => const CircularProgressIndicator(),
                        errorWidget: (context, url, error) => const Icon(Icons.error),
                        // height: ,?
                        width: Get.width,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        '${' ' * 4}${controller.detailFeed.value.description}',
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),

                      Text('${' ' * 4}${controller.detailFeed.value.content}'),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: Get.width,
                        child: Text(
                          DateFormat('dd/MM/yyyy hh:mm').format(DateTime.parse(DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(controller.detailFeed.value.createdAt.toString()).toString())),
                          style: const TextStyle(
                            fontSize: 11,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                      // const SizedBox(height: 10,),
                      // const Text(
                      //   'Theo: wikipedia',
                      //   style: TextStyle(fontWeight: FontWeight.bold),
                      // ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
