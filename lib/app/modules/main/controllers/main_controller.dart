import 'package:get/get.dart';
import 'package:motowash/app/modules/cashout/controllers/cashout_controller.dart';
import 'package:motowash/app/modules/home/controllers/home_controller.dart';
import 'package:motowash/app/modules/login/controllers/login_controller.dart';
import 'package:motowash/app/modules/services/controllers/services_controller.dart';
import 'package:motowash/app/modules/settings/controllers/settings_controller.dart';

class MainController extends GetxController {
  final currentIndex = 0.obs;

  @override
  void onInit() {
    print('Main controller init...');
    Get.put<HomeController>(HomeController());
    Get.put<SettingsController>(SettingsController());
    Get.put<ServicesController>(ServicesController());
    Get.put<CashoutController>(CashoutController());
    Get.put<LoginController>(LoginController());
    final homeController = Get.find<HomeController>();
    homeController.onInit();
    final settingsController = Get.find<SettingsController>();
    settingsController.onInit();
    final serviceController = Get.find<ServicesController>();
    serviceController.onInit();
    final cashoutController = Get.find<CashoutController>();
    cashoutController.onInit();
    final loginController = Get.find<LoginController>();
    loginController.onInit();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  tabChange(val) {
    currentIndex.value = val;
  }
}
