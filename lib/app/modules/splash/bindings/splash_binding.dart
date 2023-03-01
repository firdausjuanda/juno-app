import 'package:get/get.dart';
import 'package:motowash/app/modules/cashout/controllers/cashout_controller.dart';
import 'package:motowash/app/modules/home/controllers/home_controller.dart';
import 'package:motowash/app/modules/login/controllers/login_controller.dart';
import 'package:motowash/app/modules/main/controllers/main_controller.dart';
import 'package:motowash/app/modules/services/controllers/services_controller.dart';
import 'package:motowash/app/modules/settings/controllers/settings_controller.dart';

import '../controllers/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(
      () => SplashController(),
    );
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
    Get.lazyPut<MainController>(
      () => MainController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<CashoutController>(
      () => CashoutController(),
    );
    Get.lazyPut<SettingsController>(
      () => SettingsController(),
    );
    Get.lazyPut<ServicesController>(
      () => ServicesController(),
    );
  }
}
