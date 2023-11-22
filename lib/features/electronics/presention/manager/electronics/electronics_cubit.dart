
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/services/dio_helper.dart';
import '../../../data/product_model.dart';

part 'electronics_state.dart';

class ElectronicsCubit extends Cubit<ElectronicsState> {
  ElectronicsCubit() : super(ElectronicsInitial());
  static ElectronicsCubit get(context) => BlocProvider.of(context);
  List<Product> items = [];

  Future<void> getItems({required String type}) async {
    emit(ElectronicsInitial());
    items = [];
    try {
      final response = await Diohelper.getData(
          url:
              'https://catprice-588efcf30992.herokuapp.com/api/v1/user/item/list?type=$type');
      if (response.statusCode == 200) {
        ProductData productData = ProductData.fromJson(response.data);
        items = productData.items;

        emit(GetItemsSuccess());
      }
    } catch (e) {
      print(e.toString());
      emit(GetItemsFailure(error: "Check The Internet"));
    }
  }
}
