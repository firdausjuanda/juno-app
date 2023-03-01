import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:motowash/app/widgets/snackbar.dart';

class SettingsController extends GetxController {
  final count = 0.obs;
  final name = ''.obs;
  final email = ''.obs;
  final role = ''.obs;
  final serverHost = ''.obs;
  final serverPort = ''.obs;

  TextEditingController serverHostController = TextEditingController();
  TextEditingController serverPortController = TextEditingController();

  @override
  void onInit() async {
    final sf = await SharedPreferences.getInstance();
    name.value = sf.getString('name').toString();
    email.value = sf.getString('email').toString();
    role.value = sf.getString('role').toString();
    serverHost.value = sf.getString('host').toString();
    serverPort.value = sf.getString('port').toString();
    serverHostController.text = serverHost.value;
    serverPortController.text = serverPort.value;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  saveServer() async {
    var host = serverHostController.text;
    var port = serverPortController.text;
    final sf = await SharedPreferences.getInstance();
    sf.setString('host', host);
    sf.setString('port', port);
    Get.back();
    Snackbar()
        .show(message: 'Server updated', title: "Success!", type: "success");
  }
}
