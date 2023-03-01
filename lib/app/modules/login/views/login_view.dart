import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.put(LoginController());
    return Obx(
      () => SafeArea(
        child: Scaffold(
          body: ListView(
            padding: const EdgeInsets.all(20.0),
            children: [
              const SizedBox(
                height: 40,
              ),
              Text(
                "JunoWash",
                style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                enabled: controller.isLoading.isFalse ? true : false,
                controller: controller.email,
                decoration: InputDecoration(
                  label: Text("Email",
                      style: Theme.of(context).textTheme.labelLarge),
                ),
              ),
              TextField(
                enabled: controller.isLoading.isFalse ? true : false,
                controller: controller.password,
                obscureText: true,
                decoration: InputDecoration(
                  label: Text("Password",
                      style: Theme.of(context).textTheme.labelLarge),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: controller.isLoading.isTrue
                    ? null
                    : () {
                        controller.login();
                      },
                child: controller.isLoading.isTrue
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      )
                    : const Text("LOGIN"),
              ),
              const SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () => controller.advanceSettings.value =
                    !controller.advanceSettings.value,
                child: Text(controller.advanceSettings.isFalse
                    ? 'Show advance settings'
                    : 'Hide advance settings'),
              ),
              const SizedBox(
                height: 30,
              ),
              controller.advanceSettings.isFalse
                  ? const SizedBox()
                  : TextField(
                      controller: controller.hostC,
                      decoration: InputDecoration(
                        label: Text(
                          "Host",
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ),
                    ),
              controller.advanceSettings.isFalse
                  ? const SizedBox()
                  : TextField(
                      controller: controller.portC,
                      decoration: InputDecoration(
                        label: Text(
                          "Port",
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
