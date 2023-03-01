import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:motowash/app/modules/settings/controllers/settings_controller.dart';
import 'package:motowash/app/widgets/snackbar.dart';

class ServerView extends GetView<SettingsController> {
  const ServerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.onInit();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Server Link'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => controller.saveServer(),
            icon: Icon(Icons.check),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          controller.onInit();
          Snackbar().show(
              message: 'Berhasil memuat',
              title: "Kerja bagus!",
              type: "success");
        },
        child: ListView(
          padding: EdgeInsets.all(10),
          children: [
            TextField(
              controller: controller.serverHostController,
              decoration: InputDecoration(
                label: Text(
                  'Server host link',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
            ),
            TextField(
              controller: controller.serverPortController,
              decoration: InputDecoration(
                label: Text(
                  'Server port',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
