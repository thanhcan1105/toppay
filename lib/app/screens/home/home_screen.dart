import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:toppay/app/controllers/home_controller.dart';
import 'package:toppay/utils/number.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdropColor: Colors.grey.shade900,
      controller: controller.advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      disabledGestures: false,
      childDecoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade900,
            blurRadius: 20.0,
            spreadRadius: 5.0,
            offset: const Offset(-20.0, 0.0),
          ),
        ],
        borderRadius: BorderRadius.circular(30),
      ),
      drawer: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(top: 20),
          child: ListTileTheme(
            textColor: Colors.white,
            iconColor: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: 80.0,
                    height: 80.0,
                    margin: const EdgeInsets.only(
                      left: 20,
                      top: 24.0,
                    ),
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade800,
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset('assets/images/avatar-1.png')),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Obx(
                    () => controller.isLoading.value
                        ? const CircularProgressIndicator(
                            color: Colors.red,
                          )
                        : Text(
                            "${controller.user.value.fullName}",
                            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                          ),
                  ),
                ),
                const Spacer(),
                Divider(
                  color: Colors.grey.shade800,
                ),
                ListTile(
                  onTap: () {
                    // controller.handleUser();
                    Get.toNamed('home');
                  },
                  leading: const Icon(Iconsax.home),
                  title: const Text('Dashboard'),
                ),
                ListTile(
                  onTap: () {},
                  leading: const Icon(Iconsax.chart_2),
                  title: const Text('Analytics'),
                ),
                ListTile(
                  onTap: () {},
                  leading: const Icon(Iconsax.profile_2user),
                  title: const Text('Contacts'),
                ),
                ListTile(
                  onTap: () {
                    controller.box.remove('token');
                    Get.offAllNamed('login');
                  },
                  leading: const Icon(Iconsax.logout),
                  title: const Text('Logout'),
                ),
                const SizedBox(
                  height: 50,
                ),
                Divider(color: Colors.grey.shade800),
                ListTile(
                  onTap: () {
                    Get.toNamed('setting');
                  },
                  leading: const Icon(Iconsax.setting_2),
                  title: const Text('Settings'),
                ),
                ListTile(
                  onTap: () {},
                  leading: const Icon(Iconsax.support),
                  title: const Text('Support'),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Version 1.0.0',
                    style: TextStyle(color: Colors.grey.shade500),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      child: Scaffold(
          backgroundColor: Colors.grey.shade100,
          body: CustomScrollView(controller: controller.scrollController, slivers: [
            SliverAppBar(
              expandedHeight: 150,
              elevation: 0,
              pinned: true,
              stretch: true,
              toolbarHeight: 80,
              backgroundColor: Colors.white,
              leading: IconButton(
                color: Colors.black,
                onPressed: controller.handleMenuButtonPressed,
                icon: ValueListenableBuilder<AdvancedDrawerValue>(
                  valueListenable: controller.advancedDrawerController,
                  builder: (_, value, __) {
                    return AnimatedSwitcher(
                      duration: const Duration(milliseconds: 250),
                      child: Icon(
                        value.visible ? Iconsax.close_square : Iconsax.menu,
                        key: ValueKey<bool>(value.visible),
                      ),
                    );
                  },
                ),
              ),
              actions: [
                IconButton(
                  icon: Icon(Iconsax.notification, color: Colors.grey.shade700),
                  onPressed: () {
                    Get.toNamed('transaction');
                  },
                ),
                IconButton(
                  icon: Icon(Iconsax.more, color: Colors.grey.shade700),
                  onPressed: () {},
                ),
              ],
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              centerTitle: true,
              title: AnimatedOpacity(
                opacity: controller.isScrolled ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 500),
                child: Column(
                  children: [
                    Obx(
                      () => Text(
                        '${controller.user.value.balance}56756756',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 30,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade800,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ],
                ),
              ),
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                titlePadding: const EdgeInsets.only(left: 20, right: 20),
                title: AnimatedOpacity(
                  duration: const Duration(milliseconds: 500),
                  opacity: controller.isScrolled ? 0.0 : 1.0,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        FadeIn(
                          duration: const Duration(milliseconds: 500),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Obx(
                                () => controller.isLoading.value
                                    ? const CircularProgressIndicator(
                                        color: Colors.red,
                                      )
                                    : Text(
                                        '${$Number.numberFormat(int.parse(controller.user.value.balance ?? '0'))} đ',
                                          style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 30,
                          height: 3,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade800,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.only(top: 20),
                height: 115,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.services.length,
                  itemBuilder: (context, index) {
                    return FadeInDown(
                      duration: Duration(milliseconds: (index + 1) * 100),
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: GestureDetector(
                          onTap: () {
                            if (controller.services[index][0] == 'common.topup'.tr) {
                              Get.toNamed('topup');
                              // controller.getUser();
                            } else if (controller.services[index][0] == 'transaction'.tr) {
                              Get.toNamed('transaction');
                            } else if (controller.services[index][0] == 'common.withdraw'.tr) {
                              Get.toNamed('withdraw');
                            } else if (controller.services[index][0] == 'newsfeed'.tr) {
                              Get.toNamed('newsfeed');
                            }
                          },
                          child: Column(
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade900,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: Icon(
                                    controller.services[index][1],
                                    color: Colors.white,
                                    size: 25,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                controller.services[index][0],
                                style: TextStyle(color: Colors.grey.shade800, fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ])),
            SliverFillRemaining(
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                child: Obx(
                  () => Column(
                    children: [
                      FadeInDown(
                        duration: const Duration(milliseconds: 500),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Today',
                              style: TextStyle(color: Colors.grey.shade800, fontSize: 14, fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              '${$Number.numberFormat(controller.totalAmount.value)} đ', //controller.listTrans.map((e)=> count(e.amount))
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      controller.isLoading.value
                          ? const CircularProgressIndicator(
                              color: Colors.red,
                            )
                          : Expanded(
                              child: RefreshIndicator(
                                onRefresh: () async {
                                  await controller.getTime();
                                },
                                child: controller.listTrans.isEmpty
                                    ?  Center(
                                        child: Text('no_data'.tr),
                                      )
                                    : ListView.builder(
                                        padding: const EdgeInsets.only(top: 20),
                                        // physics: const NeverScrollableScrollPhysics(),
                                        itemCount: controller.listTrans.length,
                                        itemBuilder: (context, index) {
                                          return Column(
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  Get.toNamed('detail_transaction', arguments: {'transaction_id': controller.listTrans[index].id});
                                                },
                                                child: FadeInDown(
                                                  duration: const Duration(milliseconds: 500),
                                                  child: Container(
                                                    margin: const EdgeInsets.only(bottom: 10),
                                                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                                    decoration: BoxDecoration(
                                                      color: controller.listTrans[index].status == 1 ? Colors.green : (controller.listTrans[index].status == 2 ? Colors.red : (controller.listTrans[index].status == 3 ? Colors.blueGrey : Colors.orange)),
                                                      borderRadius: BorderRadius.circular(15),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.grey.shade200,
                                                          blurRadius: 5,
                                                          spreadRadius: 1,
                                                          offset: const Offset(0, 6),
                                                        ),
                                                      ],
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Icon(
                                                              controller.listTrans[index].subject == 0 ? Iconsax.arrow_down_2 : Iconsax.arrow_up_1,
                                                              color: Colors.white,
                                                            ),
                                                            const SizedBox(
                                                              width: 15,
                                                            ),
                                                            Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                Text(
                                                                  controller.listTrans[index].subject == 0 ? "common.topup".tr : "common.withdraw".tr,
                                                                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 14),
                                                                ),
                                                                const SizedBox(
                                                                  height: 5,
                                                                ),
                                                                Text(
                                                                  DateFormat('dd/MM/yyyy hh:mm').format(DateTime.parse(DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(controller.listTrans[index].createdAt.toString()).toString())),
                                                                  style: const TextStyle(color: Colors.white, fontSize: 12),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                        Column(
                                                          children: [
                                                            Text(
                                                              '${$Number.typeSubject(controller.listTrans[index].subject)} ${$Number.numberFormat(controller.listTrans[index].amount)} vnđ',
                                                              style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w700),
                                                            ),
                                                            Text(
                                                              controller.listTrans[index].status == 1 ? "done".tr : (controller.listTrans[index].status == 2 ? "cancel".tr : (controller.listTrans[index].status == 3 ? "processing".tr : "refuse".tr)),
                                                              style: const TextStyle(color: Colors.white, fontSize: 14),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                              ),
                            ),
                    ],
                  ),
                ),
              ),
            )
          ])),
    );
  }
}
