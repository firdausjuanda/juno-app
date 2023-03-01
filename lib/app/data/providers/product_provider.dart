import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductProvider {
  Future getProduct() async {
    final SharedPreferences sf = await SharedPreferences.getInstance();
    final response = await Dio().get(
      "${sf.getString('host')}:${sf.getString('port')}/api/product",
      options: Options(
        headers: {"ngrok-skip-browser-warning": "69420"},
      ),
    );
    if (response.statusCode != 200) {
      return response.statusMessage;
    } else {
      return response.data['data'];
    }
  }
}
