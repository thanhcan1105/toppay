import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toppay/utils/time.dart';
import './../../../app/controllers/newsfeed_controller.dart';

class NewsfeedScreen extends GetView<NewsfeedController> {
  const NewsfeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'newsfeed'.tr,
          style: const TextStyle(color: Colors.black),
        ),
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
      body: Column(
        children: [
          Obx(
            () => RefreshIndicator(
              onRefresh: () async {
                await controller.getList();
              },
              child: Column(
                children: [
                  ...controller.listFeed.map(
                    (e) => Container(
                      // padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            // spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0.0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      width: Get.width,
                      child: InkWell(
                        onTap: () {
                          Get.toNamed('detail_feed', arguments: {'detail_feed_id': e.id});
                        },
                        child: Row(
                          children: [
                            Column(
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                  ),
                                  child: CachedNetworkImage(
                                    imageUrl: e.image.toString(),
                                    placeholder: (context, url) => const CircularProgressIndicator(),
                                    errorWidget: (context, url, error) => const Icon(Icons.error),
                                    height: 120,
                                    width: 120,
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            // 'tittle',
                                            '${e.title}',
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            // 'description',
                                            '${e.description}',
                                            maxLines: 3,
                                            style: const TextStyle(overflow: TextOverflow.ellipsis, fontSize: 15),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          $Datetime.stringToLocalDateTime(e.createdAt.toString()),
                                          textAlign: TextAlign.right,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Obx(
            () => controller.checkEmpty.value
                ? Container()
                : controller.isLoading.value
                    ? const CircularProgressIndicator(
                        color: Colors.red,
                      )
                    : Container(
                        width: Get.width * 0.3,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.cyan,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: MaterialButton(
                          onPressed: () {
                            controller.sumPage();
                            controller.getList();
                          },
                          child: Row(
                            children: const [
                              Text('Load more'),
                              Icon(Icons.arrow_drop_down),
                            ],
                          ),
                        ),
                      ),
          )
        ],
      ),
    );
  }
}
