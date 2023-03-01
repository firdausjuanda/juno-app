import 'package:get/get.dart';
import 'package:motowash/app/modules/cashout/controllers/cashout_controller.dart';
import 'package:motowash/app/modules/home/controllers/home_controller.dart';
import 'package:motowash/app/modules/login/controllers/login_controller.dart';
import 'package:motowash/app/modules/services/controllers/services_controller.dart';
import 'package:motowash/app/modules/settings/controllers/settings_controller.dart';

import '../controllers/main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingsController>(
      () => SettingsController(),
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
    Get.lazyPut<ServicesController>(
      () => ServicesController(),
    );
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
  }
}
