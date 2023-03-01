// import 'package:dio/dio.dart';
import 'package:motowash/app/modules/services/controllers/services_controller.dart';
import 'package:motowash/app/modules/home/controllers/home_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';

class ConnectionProvider {
  void reload() {
    HomeController().onInit();
    ServicesController().onInit();
  }

  Future delayedReconnect() async {
    final SharedPreferences sf = await SharedPreferences.getInstance();
    final str = "${sf.getString('host')}:";
    const start = "//";
    const end = ":";

    final startIndex = str.indexOf(start);
    final endIndex = str.indexOf(end, startIndex + start.length);
    var domain = str.substring(startIndex + start.length, endIndex);
    print(domain);
    Future.delayed(Duration(seconds: 3), () async {
      try {
        final result = await InternetAddress.lookup(domain);
        print(result);
        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
          print('connected');
          sf.setBool('isConnected', true);
          HomeController().onInit();
          ServicesController().onInit();
        }
      } on SocketException catch (_) {
        print('not connected');
        if (sf.getBool('isConnected') == false) {
          ConnectionProvider().delayedReconnect();
        }
      }
      print(
          'Retrying to connect to ${sf.getString('host')}:${sf.getString('port')}');
    });
  }
}
