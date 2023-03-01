import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ServiceProvider {
  Future getData(String? start, String? end) async {
    final SharedPreferences sf = await SharedPreferences.getInstance();
    final response = await Dio().get(
      "${sf.getString('host')}:${sf.getString('port')}/api/services?start=$start&end=$end",
    );
    if (response.statusCode != 200) {
      sf.setBool('isConnected', false);
      return response.statusMessage;
    } else {
      sf.setBool('isConnected', true);
      return response.data['data'];
    }
  }

  Future getAmount(String? start, String? end) async {
    final SharedPreferences sf = await SharedPreferences.getInstance();
    final response = await Dio().get(
      "${sf.getString('host')}:${sf.getString('port')}/api/services/amount?start=$start&end=$end",
    );
    if (response.statusCode != 200) {
      sf.setBool('isConnected', false);
      return response.statusMessage;
    } else {
      sf.setBool('isConnected', true);
      return response.data['data'];
    }
  }

  Future getCount(String? start, String? end) async {
    final SharedPreferences sf = await SharedPreferences.getInstance();
    final response = await Dio().get(
      "${sf.getString('host')}:${sf.getString('port')}/api/services/count?start=$start&end=$end",
    );
    if (response.statusCode != 200) {
      sf.setBool('isConnected', false);
      return response.statusMessage;
      // return Future.error(response);
    } else {
      sf.setBool('isConnected', true);
      return response.data['data'];
    }
  }

  Future postData(String unitType, int price, int user, String? status,
      int? customer, String? vehicleNumber, String? promo) async {
    final SharedPreferences sf = await SharedPreferences.getInstance();
    Map<String, dynamic> postData = {
      "unit_type": unitType,
      "price": price,
      "user": user,
      "status": status,
      "customer": customer,
      "vehicle_number": vehicleNumber,
      "promo": promo,
    };
    final response = await Dio().post(
      "${sf.getString('host')}:${sf.getString('port')}/api/services/store",
      data: postData,
    );
    if (response.statusCode != 200) {
      sf.setBool('isConnected', false);
      return response.statusMessage;
    } else {
      sf.setBool('isConnected', true);
      return response.data['data'];
    }
  }
}
