import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:motowash/app/data/providers/auth_provider.dart';
import 'package:motowash/app/modules/home/controllers/home_controller.dart';
import 'package:motowash/app/modules/login/views/login_view.dart';
import 'package:motowash/app/modules/main/controllers/main_controller.dart';
import 'package:motowash/app/modules/main/views/main_view.dart';
import 'package:motowash/app/widgets/snackbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

  final count = 0.obs;
  final isLoading = false.obs;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController hostC = TextEditingController();
  TextEditingController portC = TextEditingController();
  final advanceSettings = false.obs;
  final host = ''.obs;
  final port = ''.obs;

  @override
  void onInit() async {
    print('Init Login...');
    hostC.text = host.value;
    portC.text = port.value;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  login() async {
    isLoading.value = true;
    final sf = await SharedPreferences.getInstance();
    await dotenv.load(fileName: ".env");
    if (dotenv.env['URL'] == "") {
      Snackbar().show(
          title: 'Error', message: 'Server or port not defined', type: 'error');
    }
    AuthProvider()
        .login(
            email: email.text,
            password: password.text,
            host: '${dotenv.env['URL']}',
            port: '${dotenv.env['PORT']}')
        .then((value) {
      if (value != null) {
        sf.setInt("uid", value['id']);
        sf.setString("name", value['name']);
        sf.setString("email", value['email']);
        sf.setString("role", value['role']);
        sf.setBool("isConnected", true);
        sf.setString('host', "${dotenv.env['URL']}");
        sf.setString('port', "${dotenv.env['PORT']}");
        Get.offAll(() => MainView(), binding: BindingsBuilder(() {
          Get.put(LoginController());
          Get.put(MainController());
        }));
      }
      isLoading.value = false;
    }, onError: (err) {
      // change(null, status: RxStatus.error(err.toString()));
      isLoading.value = false;
      Snackbar().show(
        title: "Error",
        message: "Something went wrong",
        type: "error",
      );
    });
  }

  logout() async {
    final sf = await SharedPreferences.getInstance();
    // ignore: unrelated_type_equality_checks
    sf.clear() == true ? print("cleared") : print("not cleared");
    Get.offAll(
      () => LoginView(),
      binding: BindingsBuilder.put(
        () => MainController(),
      ),
    );
  }
}
