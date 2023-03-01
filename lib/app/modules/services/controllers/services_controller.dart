import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:motowash/app/data/providers/service_provider.dart';
import 'package:motowash/app/data/providers/connection_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ServicesController extends GetxController with StateMixin<List<dynamic>> {
  final count = 0.obs;
  final totalCount = 0.obs;
  final total = 0.obs;
  final salary = 0.obs;

  TextEditingController dateStart = TextEditingController(
      text: DateFormat('y-MM-dd').format(DateTime.now()).toString());
  TextEditingController dateEnd = TextEditingController(
      text: DateFormat('y-MM-dd').format(DateTime.now()).toString());

  final todayShow = "".obs;

  @override
  void onInit() async {
    print('Init Service...');
    super.onInit();
    String? today = (dateEnd.text == "")
        ? DateFormat('y-MM-dd').format(DateTime.now()).toString()
        : dateEnd.text;
    todayShow.value = today;
    if (DateFormat('y-MM-dd')
        .parse(dateStart.text)
        .isAfter(DateFormat('y-MM-dd').parse(dateEnd.text))) {
      dateEnd.text = dateStart.text;
    }
    getData(start: dateStart.text, end: dateEnd.text);
    getAmount(start: dateStart.text, end: dateEnd.text);
    getCount(start: dateStart.text, end: dateEnd.text);
    getTotalCount();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future postData(String unitType, int price, int user, String? status,
      int? customer, String? vehicleNumber, String? promo) async {
    var response = await ServiceProvider()
        .postData(unitType, price, user, status, customer, vehicleNumber, promo)
        .then((value) {
      change(value, status: RxStatus.success());
      return value;
    }, onError: (err) {
      change(
        null,
        status: RxStatus.error(
          err.toString(),
        ),
      );
      return value;
    });
  }

  getData({String? start = '2022-12-01', String? end = "2022-12-31"}) {
    ServiceProvider().getData(start, end).then((value) {
      change(value, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error('Terjadi kesalahan'));
    });
  }

  getAmount({String? start = '2022-12-01', String? end = "2022-12-31"}) {
    ServiceProvider().getAmount(start, end).then((value) {
      if (value == 0) {
        total.value = value;
      } else {
        total.value = int.parse(value);
      }
    }, onError: (err) {
      change(null, status: RxStatus.error('Terjadi kesalahan'));
    });
  }

  getCount({String? start = '2022-12-01', String? end = "2022-12-31"}) {
    ServiceProvider().getCount(start, end).then((value) {
      count.value = int.parse(value.toString());
    }, onError: (err) {
      change(null, status: RxStatus.error('Terjadi kesalahan'));
    });
  }

  getTotalCount({String? start = '2022-12-01', String? end = "2022-12-31"}) {
    ServiceProvider().getCount(start, end).then((value) {
      totalCount.value = int.parse(value.toString());
      salary.value = totalCount.value * 3500;
    }, onError: (err) {
      change(null, status: RxStatus.error('Terjadi kesalahan'));
    });
  }
}
