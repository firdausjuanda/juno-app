import 'package:get/get.dart';
import 'package:motowash/app/modules/login/controllers/login_controller.dart';

import '../controllers/settings_controller.dart';

class SettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingsController>(
      () => SettingsController(),
    );
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
  }
}
