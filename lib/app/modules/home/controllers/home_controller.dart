import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:motowash/app/data/providers/product_provider.dart';
import 'package:motowash/app/data/providers/connection_provider.dart';
import 'package:motowash/app/modules/services/controllers/services_controller.dart';
import 'package:motowash/app/widgets/snackbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController with StateMixin<List<dynamic>> {
  var policeNumberRegion = "BA".obs;
  var promoCode = "NA".obs;
  final TextEditingController policeNumberSerial = TextEditingController();
  final TextEditingController policeNumberSuffix = TextEditingController();
  final TextEditingController customerId = TextEditingController();
  final storingService = false.obs;
  formatingVehNo(policeNumberRegion, policeNumberSerial, policeNumberSuffix) {
    if (policeNumberSerial.text != "") {
      var formatted = policeNumberRegion.value.toString() +
          policeNumberSerial.text.toString() +
          policeNumberSuffix.text.toString().toUpperCase();
      return formatted;
    }
    return "";
  }

  @override
  void onInit() {
    print("Init Home...");
    super.onInit();
    getData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  getData() async {
    final SharedPreferences sf = await SharedPreferences.getInstance();
    ProductProvider().getProduct().then((value) {
      sf.setBool('isConnected', true);
      change(value, status: RxStatus.success());
    }, onError: (err) {
      // print(err.toString());
      if (sf.getBool('isConnected') == true) {
        sf.setBool('isConnected', false);
        // Snackbar().show(message: "Terjadi kesalahans", type: "error");
      }
      change(null, status: RxStatus.error('Terjadi kesalahan'));
      ConnectionProvider().delayedReconnect();
    });
  }

  flush() {
    policeNumberRegion.value = "BA";
    promoCode.value = "NA";
    policeNumberSerial.clear();
    policeNumberSuffix.clear();
    customerId.clear();
  }

  Future<dynamic> storeService(
      String name, int price, int user, String? status) {
    var vehicleNumber = formatingVehNo(
        policeNumberRegion, policeNumberSerial, policeNumberSuffix);
    var response = ServicesController().postData(
      name,
      price,
      user,
      status,
      customerId.text != "" ? int.parse(customerId.text) : 0,
      vehicleNumber,
      promoCode.value,
    );
    // if (response != null) {
    //   storingService.value = false;
    // } else {
    //   storingService.value = false;
    // }
    return response;
  }
}
