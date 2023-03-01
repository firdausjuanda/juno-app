import 'package:dio/dio.dart';
import 'package:motowash/app/widgets/snackbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider {
  Future login(
      {String email = "",
      String password = "",
      String host = "",
      String port = ""}) async {
    final SharedPreferences sf = await SharedPreferences.getInstance();
    try {
      var data = {"email": email, "password": password};
      final response = await Dio().post(
        "$host:$port/api/auth/login",
        data: data,
      );
      if (response.statusCode != 200) {
        return response.statusMessage;
      } else {
        return response.data['data'];
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 400) {
        // ignore: prefer_typing_uninitialized_variables
        late var messages;
        if (e.response?.data['data'] == null) {
          messages = e.response?.data['meta']['message'];
        } else {
          messages = e.response?.data['data']['email'][0];
        }
        Snackbar().show(type: "error", message: messages);
      } else {
        Snackbar().show(type: "error", message: e.message.toString());
      }
    }
  }
}
