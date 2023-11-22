import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart%20';
import 'package:http/http.dart' as http;

import 'SharedPreference.dart';

class Api {
  Future<dynamic> get({required String url,@required String? token,@required headers}) async {
    if (token != null) {
      headers.addAll({"Authorization":   Preference.getData(key: "token",),
      });
    }
    http.Response response = await http.get(Uri.parse(url),headers: headers);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);

    } else {
      throw Exception(
          "there is a problem with status code${response.statusCode}");
    }
  }


  }
