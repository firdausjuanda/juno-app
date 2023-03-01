import 'package:get/get.dart';
import 'package:flutter/material.dart';

class Dialog extends GetMaterialApp {
  show(
      {String message = "",
      Widget? content,
      required VoidCallback onConfirm,
      String title = "Konfirmasi!"}) {
    Get.defaultDialog(
      backgroundColor: Colors.blueGrey[900],
      radius: 10,
      title: title,
      content: content,
      middleText: message,
      barrierDismissible: false,
      confirm: ElevatedButton(
        onPressed: onConfirm,
        child: const Text('YA'),
      ),
      cancel:
          TextButton(onPressed: () => Get.back(), child: const Text('TIDAK')),
    );
  }
}
