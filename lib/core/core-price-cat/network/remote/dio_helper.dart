import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../../SharedPreference.dart';
import '../../resources/constants.dart';

class DioFinalHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: Constants.baseUrl,
        receiveDataWhenStatusError: true,
        headers: {
          "Content-Type": "application/json;charset=UTF-8",
          "Accept": "*/*",
          'x-app-token': 'Catalyst-Team',
          'Authorization': 'Bearer ${Preference.getData(key: 'token')}'
        },
      ),
    );
    if (!kReleaseMode) {
      // to print app logs in debug mode
      dio.interceptors.add(PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ));
    }
  }

  static Future<Response> getData({
    required String url,
    required Map<String, dynamic> data,
  }) async {
    return await dio.get(
      options: Options(headers: {
        "Content-Type": "application/json;charset=UTF-8",
        "Accept": "*/*",
        'x-app-token': 'Catalyst-Team',
        'Authorization': 'Bearer ${Preference.getData(key: 'token')}'
      }),
      url,
      queryParameters: data,
    );
  }

  static Future<Response> postData({
    required String url,
    required dynamic data,
    content = 'application/json;charset=UTF-8',
    query,
  }) async {
    return await dio.post(url,
        data: data,
        queryParameters: query,
        options: Options(
          headers: {
            "Content-Type": content,
            'Authorization': 'Bearer ${Preference.getData(key: 'token')}'
          },
        ));
  }

  static Future<Response> putData(
      {required String url, required dynamic data}) async {
    return await dio.put(
      url,
      data: data,
      options: Options(
        headers: {
          "Content-Type": "application/json;charset=UTF-8",
          "Accept": "*/*",
          'x-app-token': 'Catalyst-Team',
          'Authorization': 'Bearer ${Preference.getData(key: 'token')}'
        },
      ),
    );
  }

  static Future<Response> deleteData({required String url}) async {
    return await dio.delete(url);
  }
}
