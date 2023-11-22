import 'package:dio/dio.dart';

import 'core/SharedPreference.dart';

class ApiService {
  final _baseUrl = 'https://catprice-588efcf30992.herokuapp.com';
  final Dio dio;

  ApiService(this.dio);

  Future<Map<String, dynamic>> post({required String endPoint,required Map<String,dynamic>data}) async {
    var response = await dio.post('$_baseUrl$endPoint',data: data);
    return response.data;
  }
  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await dio.get('$_baseUrl$endPoint',options: Options(
      headers: {
        "Authorization": "Bearer ${Preference.getData(key: "token")}",
        "x-app-token":"Catalyst-Team"
      }
    ));
    return response.data;
  }

}