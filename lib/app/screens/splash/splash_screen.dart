import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toppay/app/controllers/splash_controller.dart';
import 'package:toppay/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kMainColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Image(
              image: AssetImage('assets/icon/pay-per-click.png'),
            ),
            Center(
              child: Text(
                'Powered By MaanTheme',
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 20.0),
              ),
            ),
            Center(
              child: Text(
                'V 1.0.0',
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 15.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
