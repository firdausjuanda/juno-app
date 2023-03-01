import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:motowash/app/modules/cashout/views/cashout_view.dart';
import 'package:motowash/app/modules/home/views/home_view.dart';
import 'package:motowash/app/modules/services/views/services_view.dart';
import 'package:motowash/app/modules/settings/views/settings_view.dart';

import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  final _screenList = <Widget>[
    HomeView(),
    ServicesView(),
    // CashoutView(),
    SettingsView(),
  ];

  @override
  Widget build(BuildContext context) {
    // final MainController controller = Get.put(MainController());
    return Obx(
      () => Scaffold(
        body: _screenList.elementAt(controller.currentIndex.value),
        bottomNavigationBar: BottomNavigationBar(
            onTap: (value) => controller.tabChange(value),
            currentIndex: controller.currentIndex.value,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.motorcycle_rounded),
                label: 'MotoWash',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.receipt_rounded),
                label: 'Ringkasan',
              ),
              // BottomNavigationBarItem(
              //   icon: Icon(Icons.attach_money_rounded),
              //   label: 'Cashout',
              // ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Pengaturan',
              ),
            ]),
      ),
    );
  }
}
