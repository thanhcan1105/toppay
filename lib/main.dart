import 'package:toppay/app/bindings/splash_binding.dart';
import 'package:toppay/app/screens/splash/splash_screen.dart';
import 'package:toppay/config/palette.dart';
import 'package:toppay/lang/localization.dart';
import 'package:toppay/routes/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/smart_management.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // InAppPurchaseAndroidPlatform.registerPlatform();

  // ignore: unnecessary_statements
  await GetStorage.init();
  Future.delayed(
    const Duration(milliseconds: 200),
    () {
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.transparent,
          systemNavigationBarIconBrightness: Brightness.light,
          // statusBarColor: Color.fromARGB(255, 255, 255, 255),
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
      );
    },
  );



  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      smartManagement: SmartManagement.full,
      initialBinding: SplashBinding(),
      initialRoute: Routes.SPLASH,
      getPages: AppPages.pages,
      home: SplashScreen(),
      theme: ThemeData(
        fontFamily: 'roboto',
        primaryColor: Palette.primaryColor,
      ),
      locale: LocalizationService.locale,
      fallbackLocale: LocalizationService.fallbackLocale,
      translations: LocalizationService(),
    ),
  );
}
