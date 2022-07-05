import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toppay/config/palette.dart';

class RowAppBar extends StatelessWidget {
  const RowAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print(window.locales);
    return Row(
      children: [
        InkWell(
          onTap: () {
            Get.updateLocale(Locale('vi', 'VN'));
          },
          child: Container(
            padding: EdgeInsets.only(left: 0, top: 3, bottom: 3, right: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Get.locale == Locale('vi', 'VN')
                    ? Palette.primaryColor
                    : Colors.grey),
            child: Row(
              children: [
                const SizedBox(width: 3),
                Container(
                  //padding: EdgeInsets.all(3),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: Image.asset(
                    'assets/images/vn.png',
                    height: 20,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  'VN',
                  style: Palette.textStyle().copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        InkWell(
          onTap: () {
            Get.updateLocale(const Locale('en', 'US'));
          },
          child: Container(
            padding: const EdgeInsets.only(left: 0, top: 3, bottom: 3, right: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Get.locale == Locale('en', 'US')
                    ? Palette.primaryColor
                    : Colors.grey),
            child: Row(
              children: [
                const SizedBox(width: 3),
                Container(
                  //padding: EdgeInsets.all(7),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: Image.asset(
                    'assets/images/en.png',
                    height: 20,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  'EN',
                  style: Palette.textStyle().copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
