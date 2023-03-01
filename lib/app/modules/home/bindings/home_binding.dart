import 'package:get/get.dart';
import 'package:motowash/app/modules/login/controllers/login_controller.dart';
import 'package:motowash/app/modules/settings/controllers/settings_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<SettingsController>(
      () => SettingsController(),
    );
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
  }
}
