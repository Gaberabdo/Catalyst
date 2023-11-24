import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/SharedPreference.dart';

import '../../../core/core-brand/utiles/api_const.dart';
import '../../../core/core-brand/utiles/api_service.dart';
import '../../Authentication/data/LoginModel.dart';
import '../components/models/brand_model.dart';
import 'setting_state.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit() : super(SettingInitial());

  static SettingCubit get(context) => BlocProvider.of(context);

  Future<List<Brand>> getBrand() async {
    emit(GetBrandLoading());
    try {
      Response response = await DioHelper.getData(
        url: "${ApiConst.baseUrl}admin/brand/list",
        options: Options(
          headers: {
            // 'Authorization': 'Bearer ${Preference.getData(key: "token")}',

            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NTNmYzg1ZjdiY2UwOTJlYjViYjU2OTMiLCJuYW1lIjoiQWRtaW4iLCJlbWFpbCI6ImFkbWluNTBAZ21haWwuY29tIiwicm9sZSI6ImFkbWluIiwiaWF0IjoxNjk4Njc4OTA2LCJleHAiOjE3MDEyNzA5MDZ9.DUqsYcEQcTQCKQLIqebNCAB2hwimj1_ze0OjrurkOXc',
            'x-app-token': 'Catalyst-Team'
          },
        ),
      );
      print(response.data["brands"]);
      emit(GetBrandSuccess(List<Brand>.from(
          (response.data["brands"] as List).map((e) => Brand.fromJson(e)))));
      return List<Brand>.from(
          (response.data["brands"] as List).map((e) => Brand.fromJson(e)));
    } on DioException catch (error) {
      emit(GetBrandError());
      return List<Brand>.empty();
    }
  }

  Future<List<Brand>> getDetailsBrand({
    required String name,
  }) async {
    emit(GetBrandLoading());
    try {
      Response response = await DioHelper.getData(
        url: "${ApiConst.baseUrl}admin/item/list?brand=$name",
        options: Options(
          headers: {
            // 'Authorization': 'Bearer ${Preference.getData(key: "token")}',
            'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NTNmYzg1ZjdiY2UwOTJlYjViYjU2OTMiLCJuYW1lIjoiQWRtaW4iLCJlbWFpbCI6ImFkbWluNTBAZ21haWwuY29tIiwicm9sZSI6ImFkbWluIiwiaWF0IjoxNjk4Njc4OTA2LCJleHAiOjE3MDEyNzA5MDZ9.DUqsYcEQcTQCKQLIqebNCAB2hwimj1_ze0OjrurkOXc',
            'x-app-token': 'Catalyst-Team'
          },
        ),
      );
      print(response.data["Items"]);
      emit(GetBrandSuccess(List<Brand>.from(
          (response.data["Items"] as List).map((e) => Brand.fromJson(e)))));
      return List<Brand>.from(
          (response.data["Items"] as List).map((e) => Brand.fromJson(e)));
    } on DioException catch (error) {
      emit(GetBrandError());
      return List<Brand>.empty();
    }
  }

  String? language;
  void changeAppLang({
    String? fromSharedLang,
    String? langMode,
  }) {
    if (fromSharedLang != null) {
      language = fromSharedLang;
      emit(RadioState(language!));
    } else {
      language = langMode;
      Preference.saveData(key: "language", value: langMode);
      emit(RadioState(language!));
    }
  }

  bool isPassword = true;
  IconData suffix = Icons.visibility_off;

  void changeOldPasswordVisibility() {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_off : Icons.visibility;
    emit(ChangerPasswordVisibility());
  }

  bool isNewPassword = true;
  IconData suffixNew = Icons.visibility_off;

  void changeNewPasswordVisibility() {
    isNewPassword = !isNewPassword;
    suffixNew = isConPassword ? Icons.visibility_off : Icons.visibility;
    emit(ChangerPasswordVisibility());
  }

  bool isConPassword = true;
  IconData suffixCon = Icons.visibility_off;

  void changeConPasswordVisibility() {
    isConPassword = !isConPassword;
    suffixCon = isConPassword ? Icons.visibility_off : Icons.visibility;
    emit(ChangerPasswordVisibility());
  }

  Future<LoginModel> getUserData() async {
    emit(GetUserLoading());
    try {
      Response response = await DioHelper.getData(
        url:
            "${ApiConst.baseUrl}user/get/?_id=${Preference.getData(key: "userId")}",
        options: Options(
          headers: {
            'Authorization': 'Bearer ${Preference.getData(key: "token")}',
            'x-app-token': 'Catalyst-Team'
          },
        ),
      );
      emit(GetUserSuccess(LoginModel.fromJson(response.data)));
      return LoginModel.fromJson(response.data);
    } on DioException catch (error) {
      emit(GetUserError());
      return LoginModel.fromJson(error as Map<String, dynamic>);
    }
  }
  // gaber122888
  Future changePassword({
    required String id,
    required String oldPassword,
    required String newPassword,
    required String conPassword,
  }) async {
    emit(ChangePasswordLoading());
    DioHelper.putData(
        url: "${ApiConst.baseUrl}user/changePassword?_id=$id",
        options: Options(
          headers: {
            'Authorization': 'Bearer ${Preference.getData(key: "token")}',
            'x-app-token': 'Catalyst-Team'
          },
        ),
        data: {
          "currentPassword": oldPassword,
          "newPassword": newPassword,
          "confirmPassword": conPassword
        }).then((value) {
      emit(ChangePasswordSuccess());
    }).catchError((onError) {
      print(onError.message);
      emit(ChangePasswordError(onError.message.toString()));
    });
  }

  Future deleteAccount({
    required String password,
    required String id,
  }) async {
    emit(DeleteUserLoading());
    DioHelper.deleteData(
        url: "${ApiConst.baseUrl}user/delete?_id=$id",
        options: Options(
          headers: {
            'Authorization': 'Bearer ${Preference.getData(key: "token")}',
            'x-app-token': 'Catalyst-Team'
          },
        ),
        data: {
          "password": password,
        }).then((value) {
      emit(DeleteUserSuccess());
    }).catchError((onError) {
      print(onError.message);
      emit(DeleteUserError(onError.message.toString()));
    });
  }

  Future editUser({
    required String id,
    required String name,
    required String email,
    required String phoneNumber,
    required String country,
    required String type,
    required String companyName,
  }) async {
    emit(EditUserLoading());
    DioHelper.putData(
        url: "${ApiConst.baseUrl}user/update?_id=$id",
        options: Options(
          headers: {
            'Authorization': 'Bearer ${Preference.getData(key: "token")}',
            'x-app-token': 'Catalyst-Team'
          },
        ),
        data: {
          "name": name,
          "email": email,
          "phoneNumber": phoneNumber,
          "country": country,
          "type": type,
          "companyName": "none",
        }).then((value) {
      emit(EditUserSuccess());
    }).catchError((onError) {
      print(onError.message);
      emit(EditUserError(onError.message.toString()));
    });
  }

  String selectedValue = 'individual';

  void updateRadioValue(String value) {
    selectedValue = value;
    emit(UpdateRadioValue());
  }
}
