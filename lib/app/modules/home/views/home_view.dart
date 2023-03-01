import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:motowash/app/modules/home/views/select_view.dart';
import 'package:motowash/app/modules/main/controllers/main_controller.dart';
import 'package:motowash/app/modules/services/controllers/services_controller.dart';
import 'package:motowash/app/widgets/dialog.dart' as my_dialog;
import 'package:motowash/app/widgets/snackbar.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final MainController mainC = Get.find<MainController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('MotoWash'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () async {
              mainC.onInit();
              await controller.getData();
              Snackbar()
                  .show(message: "Berhasil memuat", title: "Kerja bagus!");
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: controller.obx(
        (data) {
          if (data?.length == 0) {
            return const Center(
              child: Text("No data"),
            );
          }
          return GridView.builder(
            padding: const EdgeInsets.only(top: 2, bottom: 2),
            itemCount: data?.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 2, mainAxisSpacing: 2),
            itemBuilder: (context, i) => Container(
              // color: Colors.grey,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data?[i]['name'],
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                    Text(data?[i]['category'] == null
                        ? "Undefined"
                        : data?[i]['category']['name']),
                    Text(
                        "Rp. ${NumberFormat("#,###", "en_US").format(int.parse(data?[i]['price']))}"),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Get.to(() => SelectView(),
                            arguments: data?[i],
                            transition: Transition.rightToLeft);
                      },
                      child: const Text('PILIH'),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        onEmpty: const Center(
          child: Text('Tidak ada data'),
        ),
        onError: (error) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                error.toString(),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton.icon(
                onPressed: () => controller.getData(),
                icon: const Icon(Icons.refresh),
                label: const Text('RELOAD'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
