import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart%20';
import 'package:cat_price/features/Authentication/presention/manager/Auth_cubit/cubit.dart';
import 'package:cat_price/features/conect%20us-feature/controller/states-connect.dart';

import 'package:cat_price/features/inbox-feature/controller/cubit/inbox-state.dart';


import '../../../core/SharedPreference.dart';
import '../../../core/core-brand/utiles/api_const.dart';
import '../../../core/core-brand/utiles/api_service.dart';

class ConnectCubit extends Cubit<ConnectStates> {
  ConnectCubit() : super(ConnectInial());

  static ConnectCubit get(context) => BlocProvider.of(context);

  Future<void> SendConnect({
    required String message,
  }) async {
    emit(ConnectLoading());
    try {
      await DioHelper.postData(
          url: "${ApiConst.baseUrl}user/inbox/contactUs",
          options: Options(
            headers: {
              'Authorization':
                  'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NTM2ZGZlNGIwNDdmYjFjYjMzOGE3NWMiLCJuYW1lIjoiWW91c3NlZiBRYXRyeSIsImVtYWlsIjoieW91c2VmcWF0cnkyMDAyQGdtYWlsLmNvbSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNjk4MTQ3NzkyLCJleHAiOjE3Mjk2ODM3OTJ9.d3HGPahRS7ZdMASpzpZM5I-NJ-1q25ycxSktscEAvMY',
              'x-app-token': 'Catalyst-Team'
            },
          ),
          data: {
            "userId": Preference.getData(key: 'userId'),
            "message": message
          });
      print('connnnnect uuuuuuuuuuuuuuuuuus');
      print(Preference.getData(key: 'userId'));
      emit(ConnectSucess());
    } on DioException catch (error) {
      print(error.message);
      print(error.error);
      emit(ConnectErorr());
    }
  }
}
