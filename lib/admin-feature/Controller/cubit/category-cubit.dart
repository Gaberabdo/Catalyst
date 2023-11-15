import 'package:admin_task/admin-feature/Controller/Models/brand_model.dart';
import 'package:dio/dio.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Core/errors/failures.dart';
import '../../../Core/utiles/api_const.dart';
import '../../../Core/utiles/api_service.dart';
import '../../../Core/utiles/app_functions.dart';
import '../Models/catalog_model.dart';
import '../Models/catalytic_model.dart';
import '../Models/product_model.dart';
import 'category-state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(HomeInial());

  static CategoryCubit get(context) => BlocProvider.of(context);
  CatalogModel? approvedList;
  CatalogModel? refusedList;
  CatalogModel? pendingList;

  ///get item
  Future<void> getAdminCategory() async {
    emit(HomeLoading());
    try {
      Response approved = await DioHelper.getData(
        url: "${ApiConst.baseUrl}admin/catalog/list?status=approved",
        options: Options(
          headers: {
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NTNmYzg1ZjdiY2UwOTJlYjViYjU2OTMiLCJuYW1lIjoiQWRtaW4iLCJlbWFpbCI6ImFkbWluNTBAZ21haWwuY29tIiwicm9sZSI6ImFkbWluIiwiaWF0IjoxNjk4Njc4OTA2LCJleHAiOjE3MDEyNzA5MDZ9.DUqsYcEQcTQCKQLIqebNCAB2hwimj1_ze0OjrurkOXc',
            'x-app-token': 'Catalyst-Team'
          },
        ),
      );
      approvedList = CatalogModel.fromJson(approved.data);
      Response refused = await DioHelper.getData(
        url: "${ApiConst.baseUrl}admin/catalog/list?status=refused",
        options: Options(
          headers: {
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NTNmYzg1ZjdiY2UwOTJlYjViYjU2OTMiLCJuYW1lIjoiQWRtaW4iLCJlbWFpbCI6ImFkbWluNTBAZ21haWwuY29tIiwicm9sZSI6ImFkbWluIiwiaWF0IjoxNjk4Njc4OTA2LCJleHAiOjE3MDEyNzA5MDZ9.DUqsYcEQcTQCKQLIqebNCAB2hwimj1_ze0OjrurkOXc',
            'x-app-token': 'Catalyst-Team'
          },
        ),
      );
      refusedList = CatalogModel.fromJson(refused.data);
      Response pending = await DioHelper.getData(
        url: "${ApiConst.baseUrl}admin/catalog/list?status=pending",
        options: Options(
          headers: {
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NTNmYzg1ZjdiY2UwOTJlYjViYjU2OTMiLCJuYW1lIjoiQWRtaW4iLCJlbWFpbCI6ImFkbWluNTBAZ21haWwuY29tIiwicm9sZSI6ImFkbWluIiwiaWF0IjoxNjk4Njc4OTA2LCJleHAiOjE3MDEyNzA5MDZ9.DUqsYcEQcTQCKQLIqebNCAB2hwimj1_ze0OjrurkOXc',
            'x-app-token': 'Catalyst-Team'
          },
        ),
      );
      pendingList = CatalogModel.fromJson(pending.data);
      emit(HomeSucess());
    } on Exception catch (e) {
      if (e is DioError) {
        emit(HomeErorr());
        print('error');
      }
    }
  }

  //updata item
  Future<List<CatalogModel>> updateItem({
    String? userId,
    String? id,
    String? name,
    int? weight,
    String? details,
    String? isHyprid,
    String? brand,
    String? product,
    String? note,
    String? manufacturer,
    String? status,
    int? rh,
    int? pt,
    int? pd,
    context,
  }) async {
    emit(UpdateLoading());
    try {
      DioHelper.putData(
        url: "${ApiConst.baseUrl}admin/catalog/update?_id=$id",
        data: {
          "userId": userId,
          "name": name,
          "isHyprid": isHyprid,
          "weight": weight,
          "details": details,
          "brand": brand,
          "product": product,
          "note": note,
          "status": status,
          "manufacturer": manufacturer,
          "rh": rh,
          "pt": pt,
          "pd": pd,
          "_id": id
        },
        options: Options(
          headers: {
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NTNmYzg1ZjdiY2UwOTJlYjViYjU2OTMiLCJuYW1lIjoiQWRtaW4iLCJlbWFpbCI6ImFkbWluNTBAZ21haWwuY29tIiwicm9sZSI6ImFkbWluIiwiaWF0IjoxNjk4Njc4OTA2LCJleHAiOjE3MDEyNzA5MDZ9.DUqsYcEQcTQCKQLIqebNCAB2hwimj1_ze0OjrurkOXc',
          },
        ),
      );
      emit(UpdateSucess());
    } on DioError catch (e) {
      if (e.response != null) {
        await AppFunction.showErrorORWarningDialog(
          context: context,
          subtitle: "An error has been occured $e",
          fct: () {},
        );
      }
    }
    return [];
  }

  //todo get brand item
  Future<List<Brand>> getBrand() async {
    emit(GetBrandLoading());
    try {
      Response response = await DioHelper.getData(
        url: "${ApiConst.baseUrl}admin/brand/list",
        options: Options(
          headers: {
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

  Future<List<CatalyticsModel>> getCTList() async {
    emit(GetBrandLoading());
    try {
      Response response = await DioHelper.getData(
        url: "${ApiConst.baseUrl}admin/catalytic/list",
        options: Options(
          headers: {
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NTNmYzg1ZjdiY2UwOTJlYjViYjU2OTMiLCJuYW1lIjoiQWRtaW4iLCJlbWFpbCI6ImFkbWluNTBAZ21haWwuY29tIiwicm9sZSI6ImFkbWluIiwiaWF0IjoxNjk4Njc4OTA2LCJleHAiOjE3MDEyNzA5MDZ9.DUqsYcEQcTQCKQLIqebNCAB2hwimj1_ze0OjrurkOXc',
            'x-app-token': 'Catalyst-Team'
          },
        ),
      );
      print(response.data["catalytics"]);
      emit(GetClListSuccess(List<CatalyticsModel>.from(
          (response.data["catalytics"] as List)
              .map((e) => CatalyticsModel.fromJson(e)))));
      return List<CatalyticsModel>.from((response.data["catalytics"] as List)
          .map((e) => CatalyticsModel.fromJson(e)));
    } on DioException catch (error) {
      emit(GetBrandError());
      return List<CatalyticsModel>.empty();
    }
  }

  Future<List<ProductModel>> getProduct() async {
    emit(GetProductLoading());
    try {
      Response response = await DioHelper.getData(
        url: "${ApiConst.baseUrl}admin/product/list",
        options: Options(
          headers: {
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NTNmYzg1ZjdiY2UwOTJlYjViYjU2OTMiLCJuYW1lIjoiQWRtaW4iLCJlbWFpbCI6ImFkbWluNTBAZ21haWwuY29tIiwicm9sZSI6ImFkbWluIiwiaWF0IjoxNjk4Njc4OTA2LCJleHAiOjE3MDEyNzA5MDZ9.DUqsYcEQcTQCKQLIqebNCAB2hwimj1_ze0OjrurkOXc',
            'x-app-token': 'Catalyst-Team'
          },
        ),
      );
      print(response.data["products"]);
      emit(GetProductSuccess(List<ProductModel>.from(
          (response.data["products"] as List)
              .map((e) => ProductModel.fromJson(e)))));
      return List<ProductModel>.from((response.data["products"] as List)
          .map((e) => ProductModel.fromJson(e)));
    } on DioException catch (error) {
      emit(GetProductError());
      return List<ProductModel>.empty();
    }
  }

  Future<void> approveRequest({
    required String id,
  }) async {
    emit(RequestAdminStateLoading());
    try {
      await DioHelper.postData(
        url: "${ApiConst.baseUrl}admin/catalog/approve?_id=$id",
        options: Options(
          headers: {
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NTNmYzg1ZjdiY2UwOTJlYjViYjU2OTMiLCJuYW1lIjoiQWRtaW4iLCJlbWFpbCI6ImFkbWluNTBAZ21haWwuY29tIiwicm9sZSI6ImFkbWluIiwiaWF0IjoxNjk4Njc4OTA2LCJleHAiOjE3MDEyNzA5MDZ9.DUqsYcEQcTQCKQLIqebNCAB2hwimj1_ze0OjrurkOXc',
            'x-app-token': 'Catalyst-Team'
          },
        ),
      );
      emit(RequestAdminStateLSuccess());
    } on DioException catch (error) {
      print(error.message);
      print(error.error);
      emit(RequestAdminStateError());
    }
  }

  Future<void> refuseRequest({
    required String id,
    required String note,
  }) async {
    emit(RequestAdminStateLoading());
    try {
      DioHelper.postData(
        url: "${ApiConst.baseUrl}admin/catalog/refuse?_id=$id",
        data: {"note": note},
        options: Options(
          headers: {
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NTNmYzg1ZjdiY2UwOTJlYjViYjU2OTMiLCJuYW1lIjoiQWRtaW4iLCJlbWFpbCI6ImFkbWluNTBAZ21haWwuY29tIiwicm9sZSI6ImFkbWluIiwiaWF0IjoxNjk4Njc4OTA2LCJleHAiOjE3MDEyNzA5MDZ9.DUqsYcEQcTQCKQLIqebNCAB2hwimj1_ze0OjrurkOXc',
            'x-app-token': 'Catalyst-Team'
          },
        ),
      );
      emit(RequestAdminStateLSuccess());
    } on DioException catch (error) {
      print(error.message);
      print(error.error);
      emit(RequestAdminStateError());
    }
  }

  Future<void> deleteCatalog({
    required String id,
    required String state,
  }) async {
    emit(DeleteCatalogLoading());
    try {
      await DioHelper.deleteData(
        url: "${ApiConst.baseUrl}admin/catalog/delete?_id=$id",
        options: Options(
          headers: {
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NTNmYzg1ZjdiY2UwOTJlYjViYjU2OTMiLCJuYW1lIjoiQWRtaW4iLCJlbWFpbCI6ImFkbWluNTBAZ21haWwuY29tIiwicm9sZSI6ImFkbWluIiwiaWF0IjoxNjk4Njc4OTA2LCJleHAiOjE3MDEyNzA5MDZ9.DUqsYcEQcTQCKQLIqebNCAB2hwimj1_ze0OjrurkOXc',
            'x-app-token': 'Catalyst-Team'
          },
        ),
      );
      if (state == "refused") {
        refusedList!.catalogs.clear();
      } else if (state == "pending") {
        pendingList!.catalogs.clear();
      } else {
        approvedList!.catalogs.clear();
      }

      getAdminCategory();
      emit(DeleteCatalogSuccess());
    } on DioException catch (error) {
      print(error.message);
      print(error.error);
      emit(DeleteCatalogError());
    }
  }

  void performSearch({
    required String searchTerm,
    required String state,
  }) {
    emit(SearchLoadingState());

    try {
      if (state == "refused") {
        List<Catalogs> results = refusedList!.catalogs
            .where((item) =>
                item.name.toString().contains(searchTerm.toString()))
            .toList();
        emit(SearchSuccessState(results));
      } else if (state == "pending") {
        List<Catalogs> results = pendingList!.catalogs
            .where(
                (item) => item.name.toString().contains(searchTerm.toString()))
            .toList();
        emit(SearchSuccessState(results));
      } else {
        List<Catalogs> results = approvedList!.catalogs
            .where(
                (item) => item.name.toString().contains(searchTerm.toString()))
            .toList();
        emit(SearchSuccessState(results));
      }
    } catch (e) {
      emit(SearchErrorState("An error occurred while searching."));
    }
  }
}
