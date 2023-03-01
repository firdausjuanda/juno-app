import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class DeviceProvider {
  Future getDeviceData() async {
    final SharedPreferences sf = await SharedPreferences.getInstance();
    final keys = sf.getKeys();
    var data = [];
    keys.map((e) => {
          data.add({e: sf.get(e)})
        });
    var x = jsonDecode(data.toString());
    // var data = {
    //   "username": sf.getString('username').toString(),
    //   "email": sf.getString('email').toString(),
    //   "role": sf.getString('role').toString(),
    //   "host": sf.getString('host').toString(),
    //   "port": sf.getString('port').toString(),
    //   "isConnected": sf.getBool('isConnected'),
    // };
    return x;
  }

  String email() {
    var dd = getDeviceData();
    var data = '';
    dd.toString();
    return data;
  }
}
