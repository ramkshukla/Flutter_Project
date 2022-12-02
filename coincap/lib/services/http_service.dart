import 'package:dio/dio.dart';
import '../models/app_config.dart';
import 'package:get_it/get_it.dart';

class HTTPService {
  final Dio dio = Dio();

  AppConfig? _appConfig;
  String? _base_url;

  HTTPService() {
    _appConfig = GetIt.instance.get<AppConfig>();
    _base_url = _appConfig!.COIN_API_BASE_URL;
  }

  Future<Response?> get(String _path) async {
    try {
      //https://api.coingecho.com/api/v3 + /coins/bitcoin
      String _url = "$_base_url$_path";
      print(_url);
      Response response = await dio.get(_url);
      print(response);
      return response;
    } catch (e) {
      print("HTTPService: Unable to perform get request.");
      print(e);
    }
  }
}
