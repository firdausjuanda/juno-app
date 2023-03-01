import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:motowash/app/modules/main/views/main_view.dart';

import '../controllers/result_controller.dart';

class ResultView extends GetView<ResultController> {
  final data = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            (data["type"] == "error")
                ? Icons.error_outline_rounded
                : Icons.check_circle_outline_rounded,
            size: 84,
            color: (data["type"] == "error") ? Colors.red : Colors.green,
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            data["title"],
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 48),
          ),
          // Text(data["data"].toString()),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              (data["type"] != "error")
                  ? ElevatedButton(
                      onPressed: () => Get.off(() => MainView()),
                      child: Text('Cetak'),
                    )
                  : SizedBox(),
              SizedBox(
                width: 8,
              ),
              ElevatedButton(
                onPressed: () => Get.off(() => MainView()),
                child: Text('Kembali ke MotoWash'),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
