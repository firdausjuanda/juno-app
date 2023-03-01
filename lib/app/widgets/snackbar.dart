import 'package:get/get.dart';
import 'package:flutter/material.dart';

class Snackbar extends GetMaterialApp {
  show({String type = "success", String message = "", String? title}) {
    Get.snackbar("", "",
        duration: const Duration(seconds: 1),
        backgroundColor: type == "success" ? Colors.green : Colors.red,
        icon: type == "success"
            ? const Icon(
                Icons.check_circle_outline_rounded,
                color: Colors.white,
              )
            : const Icon(Icons.close_rounded),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
        messageText: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ),
        titleText: Text(
          type == "success" ? (title ?? "Sukses") : (title ?? "Eror"),
          style:
              const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        snackPosition: SnackPosition.BOTTOM);
  }
}
