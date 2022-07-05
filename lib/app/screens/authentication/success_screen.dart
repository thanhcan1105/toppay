import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:toppay/app/GlobalComponents/button_global.dart';
import 'package:toppay/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class SuccessScreen extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 150.0,
            ),
            Image(
              image: AssetImage('images/success.png'),
            ),
            SizedBox(
              height: 40.0,
            ),
            Text(
              'Congratulations',
              style: GoogleFonts.poppins(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris cras",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color: kGreyTextColor,
                  fontSize: 20.0,
                ),
              ),
            ),
            Spacer(),
            ButtonGlobalWithoutIcon(
                buttontext: 'Continue',
                buttonDecoration:
                    kButtonDecoration.copyWith(color: kMainColor),
                onPressed: () {
                  Navigator.pushNamed(context, '/home');
                },
                buttonTextColor: Colors.white),
            SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}