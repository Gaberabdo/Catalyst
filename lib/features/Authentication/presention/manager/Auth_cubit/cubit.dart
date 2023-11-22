import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cat_price/core/Api.dart';
import 'package:cat_price/features/Authentication/data/OtpModel.dart';
import 'package:cat_price/features/Authentication/presention/manager/Auth_cubit/state.dart';
import 'package:cat_price/features/Authentication/presention/views/sigin_in_view.dart';
import '../../../../../Api.dart';
import '../../../../../core/SharedPreference.dart';
import '../../../data/LoginModel.dart';
import '../../../data/registerModel.dart';


class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(intialState());
  LoginModel? loginModel;
  RegisterModel? registerModel;
  OtpModel? otpModel;

  final Dio dio = Dio();

  Future<void> Signin({required String email, required String password}) async {
    emit(LoadingSignIn());
    print(password.toString());
    ApiService(dio).post(
      endPoint: "/api/v1/user/login",
      data: {"email": email, "password": password},
    ).then((value) async {
      print(value.toString());
      loginModel = LoginModel.fromJson(value);
      if (loginModel?.success == true) {
        await Preference.saveData(key: "token", value: loginModel?.token);
        await Preference.saveData(key: "userId", value: loginModel?.userData!.id);
        await Preference.saveData(key: "email", value: loginModel?.userData!.email);
        await Preference.saveData(key: "name", value: loginModel?.userData!.name);

        Fluttertoast.showToast(
          msg: "LOGIN SUCCESSFULLY",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        emit(SuccessSignIn());
      } else {
        Fluttertoast.showToast(
          msg: "Invalid Password or Email",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        print("error with success");
        emit(ErrorSignIn('Invalid Password or Email'));
      }
    }).catchError((err) {
      print(err.toString());
      emit(ErrorSignIn('Invalid Password or Email'));
    });
  }

  Future<void> SignUp(
      {required String name,
      required String email,
      required String password,
      required String phone,
      required String country}) async {
    emit(LoadingSignUp());
    ApiService(dio).post(
      endPoint: "/api/v1/user/register",
      data: {
        "name": name,
        "email": email,
        "password": password,
        "country": country,
        "phoneNumber": phone,
        "type": "individual",
        "companyName": "Noon"
      },
    ).then((value) {
      print(value);
      registerModel = RegisterModel.fromJson(value);
      print(registerModel?.success);
      if (registerModel?.success == true) {
        Fluttertoast.showToast(
          msg: "Created SUCCESSFULLY",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        emit(SuccessSignUp());
      } else {
        Fluttertoast.showToast(
          msg: "Email or phone already in use",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        print("error with success");
        emit(ErrorSignUp());
      }
    }).catchError((err) {
      print(err.toString());
      emit(ErrorSignIn('Invalid Password or Email'));
    });
  }

  Future<void> OtpCode({
    required String phone,
  }) async {
    emit(LoadingOtp());
    ApiService(dio).post(
      endPoint: "/api/v1/user/sms",
      data: {
        "number": phone,
      },
    ).then((value) {
      otpModel = OtpModel.fromJson(value);
      print(otpModel?.success);
      if (otpModel?.success == true) {
        emit(SuccessOtp());
      } else {
        print("error with success");
        emit(ErrorOtp());
      }
    }).catchError((err) {
      print(err.toString());
      emit(ErrorOtp());
    });
  }

  Future<void> logout(context) async {
    Preference.deleteData(key: 'token');
    Preference.deleteData(key: 'userId');
    Preference.deleteData(key: 'email');
    Preference.deleteData(key: 'name');
    Preference.sharedPreferences?.remove("token").then((value) {
      Fluttertoast.showToast(
        msg: "logout successfully",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const SignInView(),
        ),
        (route) {
          return false;
        },
      );
    }).catchError((err) {
      Fluttertoast.showToast(
        msg: "error with logout",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    });
  }
}
