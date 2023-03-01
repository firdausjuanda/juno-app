import 'package:get/get.dart';
// import 'package:motowash/app/modules/login/controllers/login_controller.dart';
import 'package:motowash/app/modules/login/views/login_view.dart';
// import 'package:motowash/app/modules/main/controllers/main_controller.dart';
import 'package:motowash/app/modules/main/views/main_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  final text = "JunoWash".obs;

  @override
  void onInit() {
    super.onInit();
    checkAuth();
  }

  checkAuth() async {
    final sf = await SharedPreferences.getInstance();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        var uid = sf.getInt("uid");
        if (uid == null) {
          Get.off(() => LoginView());
        } else {
          Get.off(() => MainView());
        }
      },
    );
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
