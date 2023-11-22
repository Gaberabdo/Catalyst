import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart%20';
import 'package:cat_price/features/Authentication/presention/manager/Auth_cubit/cubit.dart';

import 'package:cat_price/features/inbox-feature/controller/cubit/inbox-state.dart';


import '../../../../core/SharedPreference.dart';
import '../../../../core/core-brand/utiles/api_const.dart';
import '../../../../core/core-brand/utiles/api_service.dart';

class InboxCubit extends Cubit<InboxStates> {
  InboxCubit() : super(InboxInial());

  static InboxCubit get(context) => BlocProvider.of(context);
  List<dynamic> brandsJson = [];
  AuthCubit? authCubit;
  var id = Preference.getData(key: 'userId');

  Future<List> getInbox() async {
    emit(InboxLoading());
    try {
      print(id);
      print('iiiiiiiiiiiiiiiiiiiiiidddddddddddddddddddddddddddddddddddddd');
      Response response = await DioHelper.getData(
        url: "${ApiConst.baseUrl}user/inbox/get?_id=${Preference.getData(key: 'userId')}",
        options: Options(
          headers: {
            'Authorization': 'Bearer ${Preference.getData(key: "token")}',
            'x-app-token': 'Catalyst-Team'
          },
        ),
      ); // Replace with your API endpoint

      print("+++++++++++++response++++++++++++++");
      print(response.data['notes']);

      brandsJson = response.data['notes'];

      print("+++++++++++++productsList++++++++++++++");
      print('dattttttttttttttttttttttttttttttttttttttttttttttttttttttt');

      print(brandsJson.length);
      print('lenttttttttttttttttttttttttttttttttt');
      emit(InboxSucess());
      return brandsJson;
    } on Exception catch (e) {
      if (e is DioError) {
        emit(InboxErorr());
        print('error');
      }
      return [];
    }
  }
}
