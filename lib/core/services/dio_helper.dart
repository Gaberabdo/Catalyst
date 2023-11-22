import 'package:dio/dio.dart';

import '../SharedPreference.dart';

class Diohelper {
  static late Dio dio;

  static init() {
    dio = Dio(BaseOptions(
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> getData({
    required String url,
    String? x_app_token,
  }) async {
    dio.options.headers = {
      'Authorization':
          'Bearer ${Preference.getData(key: 'token')}',
      'x-app-token': x_app_token,
    };
    return await dio.get(url);
  }
}
