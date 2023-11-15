import 'package:admin_task/Core/utiles/api_const.dart';
import 'package:admin_task/Core/utiles/api_service.dart';
import 'package:admin_task/admin-create-feature/cubit/Create-states.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateCubit extends Cubit<CreateStates> {
  CreateCubit() : super(HomeInial());

  static CreateCubit get(context) => BlocProvider.of(context);
//Brand

  Future CreateBrand({
    required String name,
  }) async {
    emit(BrandLoading());
    DioHelper.postData(
        url: '${ApiConst.baseUrl}admin/brand/create',
        options: Options(
          headers: {
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NTNmYzg1ZjdiY2UwOTJlYjViYjU2OTMiLCJuYW1lIjoiQWRtaW4iLCJlbWFpbCI6ImFkbWluNTBAZ21haWwuY29tIiwicm9sZSI6ImFkbWluIiwiaWF0IjoxNjk4Njc4OTA2LCJleHAiOjE3MDEyNzA5MDZ9.DUqsYcEQcTQCKQLIqebNCAB2hwimj1_ze0OjrurkOXc',
            'x-app-token': 'Catalyst-Team'
          },
        ),
        data: {
          'name': name,
          'details': 'details',
          'admin': '653fc85f7bce092eb5bb5693'
        }).then((value) {
      print(value.data);
      emit(BrandSucess());
    }).catchError((e) {
      print(e.toString());
      emit(BrandErorr());
    });
  }

  //Product
  Future CreateProduct({
    required String name,
  }) async {
    emit(ProductLoading());
    DioHelper.postData(
            url: '${ApiConst.baseUrl}admin/product/create',
            options: Options(
              headers: {
                'Authorization':
                    'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NTNmYzg1ZjdiY2UwOTJlYjViYjU2OTMiLCJuYW1lIjoiQWRtaW4iLCJlbWFpbCI6ImFkbWluNTBAZ21haWwuY29tIiwicm9sZSI6ImFkbWluIiwiaWF0IjoxNjk4Njc4OTA2LCJleHAiOjE3MDEyNzA5MDZ9.DUqsYcEQcTQCKQLIqebNCAB2hwimj1_ze0OjrurkOXc',
                'x-app-token': 'Catalyst-Team',
                'Content-Type': 'application/json'
              },
            ),
            data: {'name': name, 'admin': '653fc85f7bce092eb5bb5693'})
        .then((value) {
      print(value.data);
      emit(ProductSucess());
    }).catchError((e) {
      print(e.toString());
      emit(ProductErorr());
    });
  }

  //Catalyitics
  Future CreateCatalytics({
    required String name,
  }) async {
    emit(CatalyistLoading());
    DioHelper.postData(
            url: '${ApiConst.baseUrl}admin/catalytic/create',
            options: Options(
              headers: {
                'Authorization':
                    'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NTNmYzg1ZjdiY2UwOTJlYjViYjU2OTMiLCJuYW1lIjoiQWRtaW4iLCJlbWFpbCI6ImFkbWluNTBAZ21haWwuY29tIiwicm9sZSI6ImFkbWluIiwiaWF0IjoxNjk4Njc4OTA2LCJleHAiOjE3MDEyNzA5MDZ9.DUqsYcEQcTQCKQLIqebNCAB2hwimj1_ze0OjrurkOXc',
                'x-app-token': 'Catalyst-Team',
                'Content-Type': 'application/json'
              },
            ),
            data: {'name': name, 'admin': '653fc85f7bce092eb5bb5693'})
        .then((value) {
      print(value.data);
      emit(CatalyistSucess());
    }).catchError((e) {
      print(e.toString());
      emit(CatalyistErorr());
    });
  }
}
