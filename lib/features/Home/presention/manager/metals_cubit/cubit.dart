import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cat_price/features/Home/data/models/slider_item.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart%20';
import 'package:cat_price/Api.dart';
import 'package:cat_price/features/Home/presention/manager/metals_cubit/state.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/Api.dart';
import '../../../../../core/SharedPreference.dart';
import '../../../../../core/core-brand/utiles/api_const.dart';
import '../../../../../core/core-brand/utiles/api_service.dart';
import '../../../data/models/metals_model.dart';
import '../../../data/models/most_searched_model.dart';
import '../../../data/models/search_item_model.dart';

class MetalsCubit extends Cubit<MetalsState> {
  MetalsCubit() : super(intialState());

  static MetalsCubit get(context) => BlocProvider.of(context);
  MetalItem? model;
  SharedPreferences? preferences;
  Dio dio = Dio();

  Future<void> GetMetals() async {
    emit(loadingState());
    try {
      Response result = await DioHelper.getData(
          url:
              "${ApiConst.baseUrl}user/metal/get?userId=${Preference.getData(key: "userId")}",
          options: Options(
            headers: {
              'Authorization': 'Bearer ${Preference.getData(key: "token")}',
              'x-app-token': 'Catalyst-Team'
            },
          ));
      model = MetalItem.fromJson(result.data["metal"]);

      emit(successState(MetalItem.fromJson(result.data["metal"])));
    } on DioException catch (e) {
      print(e.error);
      print(e.message);

      emit(errorState("An error occurred while searching."));
    }
  }

  void TimerGetMetals() async {
    await GetMetals();
    Timer.periodic(const Duration(hours: 6), (timer) async {
      await GetMetals();
    });
  }

  MostSearchedModel? mostSearchedModel;
  Future<void> GetMostSearched() async {
    emit(LoadingMostSearcedState());
    ApiService(dio)
        .get(
      endPoint: "/api/v1/user/item/most-searched",
    )
        .then((value) {
      mostSearchedModel = MostSearchedModel.fromJson(value);
      if (mostSearchedModel?.success == true) {
        emit(successMostSearcedState());
      } else {
        print("wrong with request");
        emit(ErrorMostSearcedState("wrong with request"));
      }
    }).catchError((err) {
      print(err.toString());
      emit(ErrorMostSearcedState(err.toString()));
    });
  }

  @override
  void onChange(Change<MetalsState> change) {
    // TODO: implement onChange
    super.onChange(change);
    print(change);
  }

  Future<void> searchCatlog({
    required String name,
  }) async {
    emit(SearchLoadingState());

    try {
      Response result = await DioHelper.getData(
          url: "${ApiConst.baseUrl}user/item/search?searchTerm=$name",
          options: Options(
            headers: {
              'Authorization': 'Bearer ${Preference.getData(key: "token")}',
              'x-app-token': 'Catalyst-Team'
            },
          ));
      print(result.data);
      emit(SearchSuccessState(List<Item>.from(
          (result.data["items"] as List).map((e) => Item.fromJson(e)))));
    } on DioException catch (e) {
      print(e.message.toString());
      emit(SearchErrorState("An error occurred while searching."));
    }
  }

  String? idFavList;
  Future<void> getFavorites() async {
    emit(FavLoadingState());
    try {
      Response result = await DioHelper.getData(
          url: "${ApiConst.baseUrl}user/favorite/get",
          options: Options(
            headers: {
              'Authorization': 'Bearer ${Preference.getData(key: "token")}',
              'x-app-token': 'Catalyst-Team'
            },
          ));

      idFavList = result.data["favList"]["_id"];
      print(idFavList);
      print(result.data["favList"]["favItems"]);
      emit(FavSuccessState(List<Item>.from(
          (result.data["favList"]["favItems"] as List)
              .map((e) => Item.fromJson(e)))));
    } on DioException catch (e) {
      print(e.error);
      print(e.message);

      emit(FavErrorState("An error occurred while searching."));
    }
  }

  Future<void> addFav({
    required String itemId,
    String? favListId,
  }) async {
    emit(FavLoadingState());
    try {
      Response result = await DioHelper.postData(
        url: "${ApiConst.baseUrl}user/favorite/update",
        options: Options(
          headers: {
            'Authorization': 'Bearer ${Preference.getData(key: "token")}',
            'x-app-token': 'Catalyst-Team'
          },
        ),
        queryParameters: {
          "userId": Preference.getData(key: "userId"),
          "itemId": itemId,
          "favListId": favListId,
        },
      );
      emit(FavActionSuccessState());
    } on DioException catch (e) {
      print(e.error);
      print(e.message);

      emit(FavErrorState("An error occurred while searching."));
    }
  }

  Future getSlider() async {
    emit(GetSliderLoadingState());
    try {
      Response result = await DioHelper.getData(
        url: "${ApiConst.baseUrl}admin/slider/list",
        options: Options(
          headers: {
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NTNmYzg1ZjdiY2UwOTJlYjViYjU2OTMiLCJuYW1lIjoiQWRtaW4iLCJlbWFpbCI6ImFkbWluNTBAZ21haWwuY29tIiwicm9sZSI6ImFkbWluIiwiaWF0IjoxNjk4Njc4OTA2LCJleHAiOjE3MDEyNzA5MDZ9.DUqsYcEQcTQCKQLIqebNCAB2hwimj1_ze0OjrurkOXc',
            'x-app-token': 'Catalyst-Team'
          },
        ),
      );

      emit(
        GetSliderSuccessState(SliderList.fromJson(result.data)),
      );
    } on DioException catch (e) {
      print(e.error);
      print(e.message);

      emit(GetSliderErrorState());
    }
  }
}
