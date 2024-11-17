import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:cat_price/features/Authentication/presention/manager/Auth_cubit/state.dart';
import 'package:cat_price/features/Authentication/presention/views/sigin_in_view.dart';
import '../../../../../core/SharedPreference.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(intialState());

  static const String fcmBaseUrl = "https://identitytoolkit.googleapis.com/v1/accounts";
  static const String apiKey = "AIzaSyA-xbesp8_FIsQpCqbBkw4oKLdwJVORHNI";

  Future<void> SignIn({required String email, required String password}) async {
    emit(LoadingSignIn());
    try {
      final response = await http.post(
        Uri.parse("$fcmBaseUrl:signInWithPassword?key=$apiKey"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "email": email,
          "password": password,
          "returnSecureToken": true,
        }),
      );

      final data = jsonDecode(response.body);
      if (response.statusCode == 200 && data["idToken"] != null) {
        await Preference.saveData(key: "token", value: data["idToken"]);
        await Preference.saveData(key: "userId", value: data["localId"]);
        await Preference.saveData(key: "email", value: email);


        emit(SuccessSignIn());
      } else {
        emit(ErrorSignIn(data["error"]["message"] ?? "Login failed"));
      }
    } catch (e) {

      emit(ErrorSignIn(e.toString()));
    }
  }

  Future<void> SignUp({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(LoadingSignUp());
    try {
      final response = await http.post(
        Uri.parse("$fcmBaseUrl:signUp?key=$apiKey"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "email": email,
          "password": password,
          "returnSecureToken": true,
        }),
      );

      final data = jsonDecode(response.body);
      if (response.statusCode == 200 && data["idToken"] != null) {
        await Preference.saveData(key: "token", value: data["idToken"]);
        await Preference.saveData(key: "userId", value: data["localId"]);
        await Preference.saveData(key: "email", value: email);
        await Preference.saveData(key: "name", value: name);

        Fluttertoast.showToast(
          msg: "ACCOUNT CREATED SUCCESSFULLY",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        emit(SuccessSignUp());
      } else {
        emit(ErrorSignUp());
      }
    } catch (e) {

      emit(ErrorSignUp());
    }
  }

  Future<void> OtpCode({required String phone}) async {
    emit(LoadingOtp());
    try {
      final response = await http.post(
        Uri.parse("https://identitytoolkit.googleapis.com/v1/accounts:sendOobCode?key=$apiKey"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "phoneNumber": phone,
          "requestType": "PHONE_SIGN_IN",
        }),
      );

      final data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        emit(SuccessOtp());
        Fluttertoast.showToast(
          msg: "OTP SENT SUCCESSFULLY",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      } else {
        emit(ErrorOtp());
        Fluttertoast.showToast(
          msg: data["error"]["message"] ?? "Failed to send OTP",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    } catch (e) {
      emit(ErrorOtp());
    }
  }

  Future<void> logout(BuildContext context) async {
    try {
      Preference.deleteData(key: 'token');
      Preference.deleteData(key: 'userId');
      Preference.deleteData(key: 'email');
      Preference.deleteData(key: 'name');


      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const SignInView()),
            (route) => false,
      );
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Error with logout",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }
}
