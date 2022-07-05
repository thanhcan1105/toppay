import '../app/screens/setting/component/about_app_screen.dart';
import './../app/bindings/about_app_binding.dart';
import '../app/screens/setting/component/update_infomation_screen.dart';
import './../app/bindings/update_infomation_binding.dart';
import '../app/screens/newsfeed/detail_feed.dart';
import './../app/bindings/detail_feed_binding.dart';
import './../app/screens/newsfeed/newsfeed_screen.dart';
import './../app/bindings/newsfeed_binding.dart';
import '../app/screens/setting/component/language_screen.dart';
import './../app/bindings/language_binding.dart';
import './../app/screens/setting/setting_screen.dart';
import './../app/bindings/setting_binding.dart';
import 'package:toppay/app/screens/home/pages/withdraw.dart';

import '../app/screens/home/pages/withdraw.dart';
import './../app/bindings/withdraw_binding.dart';
import 'package:toppay/app/bindings/contact_page_binding.dart';
import 'package:toppay/app/screens/home/pages/contact.dart';
import 'package:toppay/app/screens/home/pages/detail_transaction.dart';

import '../app/screens/home/pages/transaction.dart';
import './../app/bindings/transaction_binding.dart';
import './../app/screens/transfer/transfer_screen.dart';
import './../app/bindings/transfer_binding.dart';
import '../app/screens/home/pages/topup.dart';
import './../app/bindings/topup_binding.dart';
import './../app/screens/splash/splash_screen.dart';
import './../app/bindings/splash_binding.dart';
import './../app/screens/home/home_screen.dart';
import './../app/bindings/home_binding.dart';
import './../app/screens/register/register_screen.dart';
import './../app/bindings/register_binding.dart';
import './../app/screens/login/login_screen.dart';
import './../app/bindings/login_binding.dart';
import './../app/bindings/detail_transaction_binding.dart';
import 'package:get/get.dart';
part './routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginScreen(),
      transition: Transition.cupertino,
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.REGISTER,
      page: () => RegisterScreen(),
      transition: Transition.cupertino,
      binding: RegisterBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomeScreen(),
      transition: Transition.cupertino,
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashScreen(),
      transition: Transition.cupertino,
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.TOPUP,
      page: () => TopupScreen(),
      transition: Transition.cupertino,
      binding: TopupBinding(),
    ),
    GetPage(
      name: Routes.TRANSFER,
      page: () => TransferScreen(),
      transition: Transition.cupertino,
      binding: TransferBinding(),
    ),
    GetPage(
      name: Routes.TRANSACTION,
      page: () => TransactionScreen(),
      transition: Transition.cupertino,
      binding: TransactionBinding(),
    ),
    GetPage(
      name: Routes.CONTACTPAGE,
      page: () => ContactPage(),
      transition: Transition.cupertino,
      binding: ContactPageBinding(),
    ),
    GetPage(
      name: Routes.DETAILTRANSACTION,
      page: () => DetailTransacionScreen(),
      transition: Transition.cupertino,
      binding: DetailTransactionBinding(),
    ),
    GetPage(
      name: Routes.WITHDRAW,
      page: () => WithdrawScreen(),
      transition: Transition.cupertino,
      binding: WithdrawBinding(),
    ),
    GetPage(
      name: Routes.SETTING,
      page: () => SettingScreen(),
      transition: Transition.cupertino,
      binding: SettingBinding(),
    ),
    GetPage(
      name: Routes.LANGUAGE,
      page: () => LanguageScreen(),
      transition: Transition.cupertino,
      binding: LanguageBinding(),
    ),
    GetPage(
      name: Routes.NEWSFEED,
      page: () => NewsfeedScreen(),
      transition: Transition.cupertino,
      binding: NewsfeedBinding(),
    ),
    GetPage(
      name: Routes.DETAIL_FEED,
      page: () => DetailFeed(),
      transition: Transition.cupertino,
      binding: DetailFeedBinding(),
    ),
    GetPage(
      name: Routes.UPDATE_INFOMATION,
      page: () => UpdateInfomationScreen(),
      transition: Transition.cupertino,
      binding: UpdateInfomationBinding(),
    ),
    GetPage(
      name: Routes.ABOUT_APP,
      page: () => AboutAppScreen(),
      transition: Transition.cupertino,
      binding: AboutAppBinding(),
    ),
  ];
}
