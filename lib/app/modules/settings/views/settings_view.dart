import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motowash/app/modules/login/controllers/login_controller.dart';
import 'package:motowash/app/modules/services/controllers/services_controller.dart';
import 'package:motowash/app/widgets/dialog.dart' as my_dialog;
import 'package:motowash/app/widgets/snackbar.dart';

import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  @override
  Widget build(BuildContext context) {
    final ServicesController sc = Get.find<ServicesController>();
    return Obx(
      () => Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text('Settings'),
            centerTitle: true,
          ),
          body: RefreshIndicator(
            onRefresh: () async {
              sc.onInit;
              Snackbar().show(
                  message: 'Berhasil memuat',
                  title: "Kerja bagus!",
                  type: "success");
            },
            child: ListView(
              children: [
                ListTile(
                  leading: Icon(
                    Icons.person,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  title: Text(controller.name.value),
                  subtitle: Text(
                      '${controller.role.value}, ${controller.email.value}'),
                ),
                // ListTile(
                //   leading: const Icon(Icons.wallet),
                //   title: Text(
                //       "Rp. ${NumberFormat("#,###", "en_US").format(sc.salary.value).toString()}"),
                //   subtitle: const Text('Remaining salary'),
                // ),
                // ListTile(
                //   leading: Icon(
                //     Icons.public,
                //     color: Theme.of(context).iconTheme.color,
                //   ),
                //   title: const Text("Server"),
                //   subtitle: Text(
                //       '${controller.serverHost.value}, ${controller.serverPort.value}'),
                //   onTap: () => Get.to(() => const ServerView()),
                // ),
                ListTile(
                  textColor: Colors.red,
                  iconColor: Colors.red,
                  leading: const Icon(Icons.exit_to_app),
                  title: Text("KELUAR"),
                  subtitle: const Text('Keluar dari aplikasi'),
                  onTap: () => my_dialog.Dialog().show(
                      onConfirm: () => Get.find<LoginController>().logout(),
                      message: "Apakah kamu yakin ingin keluar?"),
                ),
              ],
            ),
          )),
    );
  }
}
