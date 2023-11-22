import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';


import '../../../../../core/SharedPreference.dart';
import '../../../../../core/core-price-cat/models/my_list_model.dart';
import '../../../../../core/core-price-cat/models/search_model.dart';
import '../../../../../core/core-price-cat/network/remote/dio_helper.dart';
import '../../../../../core/core-price-cat/resources/commen_widget/server_message.dart';


part 'price_state.dart';

class PriceCubit extends Cubit<PriceState> {
  PriceCubit() : super(PriceInitial());

  static PriceCubit get(context) => BlocProvider.of(context);

  int totalPrice = 0;
  int myItems = 0;
  List<Items> searchModelList = [];

  void searchForItem({required String searchTerm}) {
    emit(SearchForItemLodingState());
    DioFinalHelper.getData(url: 'api/v1/user/item/search', data: {
      'searchTerm': searchTerm,
    }).then((value) {
      searchModelList = [];
      value.data['items'].forEach((element) {
        searchModelList.add(Items.fromJson(element));
      });
      emit(SearchForItemSuccessState());
    }).catchError((error) {
      searchModelList = [];
      if (kDebugMode) {
        print(error.toString());
      }
      emit(SearchForItemErrorState());
    });
  }

  List<Items> newPriceList = [];

  void addNewPriceItem({required Items item}) {
    newPriceList.add(item);
    if (kDebugMode) {
      print(item.image?.url);
    }
    if (kDebugMode) {
      print(newPriceList.length);
    }
    myItems++;
    totalPrice += (item.price)! * (item.quantity ?? 0);
    emit(AddNewPriceItemState());
  }

  void increaseQuantity({required int index}) {
    newPriceList[index].quantity = (newPriceList[index].quantity! + 1);
    calculateTotalPrice();
    emit(IncreaseQuantityState());
  }

  void decreaseQuantity({required int index}) {
    if (newPriceList[index].quantity! > 0) {
      newPriceList[index].quantity = (newPriceList[index].quantity! - 1);
    }
    calculateTotalPrice();
    emit(DecreaseQuantityState());
  }

  void calculateTotalPrice() {
    totalPrice = 0;
    myItems=0;
    newPriceList.forEach((element) {
      totalPrice += ((element.price)! * (element.quantity ?? 0));
      myItems+=element.quantity!;
    });
  }

  void createNewList(context, {required String listName}) {
    //TODO change UserId
    emit(CreateNewListLodingState());
    List<Map<String, dynamic>> dataList = [];
    newPriceList.forEach((element) {
      dataList.add({
        '_id': element.sId,
        'price': element.price,
        'quantity': element.quantity
      });
    });
    DioFinalHelper.postData(url: 'api/v1/user/list/create', data: {
      "userId": Preference.getData(key: 'userId'),
      "numOfItems": myItems,
      "totalPrice": totalPrice,
      "listName": listName,
      "listOfItems": dataList
    }).then((value) {
      Navigator.pop(context);
      newPriceList = [];
      myItems = 0;
      totalPrice = 0;
      emit(CreateNewListSuccessState());
    }).catchError((error) {
      Navigator.pop(context);
      showMassageFromServer(context,
          mes: error.response.data['message'].toString());
      if (kDebugMode) {
        print(error.toString());
      }
      emit(CreateNewListErrorState());
    });
  }

  void updateList(context, {required String listId, required String listName}) {
    emit(UpdateListLodingState());
    List<Map<String, dynamic>> dataList = [];
    newPriceList.forEach((element) {
      dataList.add({
        '_id': element.sId,
        'price': element.price,
        'quantity': element.quantity
      });
    });
    DioFinalHelper.putData(url: 'api/v1/user/list/update?listId=$listId', data: {
      "numOfItems": myItems,
      "totalPrice": totalPrice,
      "listName": listName,
      "listOfItems": dataList
    }).then((value) {
      Navigator.pop(context);
      newPriceList = [];
      myItems = 0;
      totalPrice = 0;
      emit(UpdateListSuccessState());
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      Navigator.pop(context);
      showMassageFromServer(context,
          mes: error.response.data['message'].toString());
      emit(UpdateListErrorState());
    });
  }

  List<Lists> allMyList = [];

  void getAllLists() {
    emit(GetAllListsLodingState());
    //TODO change UserId
    DioFinalHelper.getData(
        url: 'api/v1/user/list/get',
        data: {'userId': Preference.getData(key: 'userId')}).then((value) {
      allMyList = [];
      value.data['lists'].forEach((element) {
        allMyList.add(Lists.fromJson(element));
      });

      emit(GetAllListsSuccessState());
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      emit(GetAllListsErrorState());
    });
  }

  void deleteList(context, {required String id}) {
    emit(DeleteListLodingState());
    DioFinalHelper.deleteData(url: 'api/v1/user/list/delete?listId=$id')
        .then((value) {
      getAllLists();
      emit(DeleteListSuccessState());
    }).catchError((error) {
      showMassageFromServer(context,
          mes: error.response.data['message'].toString());
      if (kDebugMode) {
        print(error.toString());
      }
      emit(DeleteListErrorState());
    });
  }

  File itemImage = File('');
  final ImagePicker picker = ImagePicker();

  Future<void> selectItemImage(context,{required bool isCamera}) async {
    emit(SelectItemImageLodingState());
    final pickedFile;
    if(isCamera==true)
      {
        pickedFile = await picker.pickImage(source: ImageSource.camera);
      }
    else
      {
         pickedFile = await picker.pickImage(source: ImageSource.gallery);
      }
    if (pickedFile != null) {
      emit(SelectItemImageSuccessState());
      Navigator.pop(context);
      itemImage = File(pickedFile.path);
    } else {
      debugPrint('No Image Selected');
      emit(SelectItemImageErrorState());
    }
  }

  void createItem(context, {required String name, required int price}) {
    //TODO change UserId
    emit(CreateItemLodingState());
    DioFinalHelper.postData(url: 'api/v1/user/item/create', data: {
      "userId": Preference.getData(key: 'userId'),
      "name": name,
      "price": price
    }).then((value) {
      emit(CreateItemSuccessState());
      uploadImageItem(context, id: value.data['item']['_id']);
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      emit(CreateItemErrorState());
    });
  }

  Future<void> uploadImageItem(context, {required String id}) async {
    emit(UploadImageItemLodingState());
    print(itemImage.path);
    print(MediaType('image', itemImage.path.split('.').last));
    var fromData = FormData.fromMap({
      'image': await MultipartFile.fromFile(
        itemImage.path,
        filename: itemImage.path.split('/').last,
        contentType: MediaType('image', itemImage.path.split('.').last),
      ),
    });
    DioFinalHelper.postData(
            content:
                "multipart/form-data",
            url: 'api/v1/user/item/image',
            query: {
              '_id':id
            },
            data: fromData)
        .then((value) {
       Items it = Items();
       it=Items.fromJson(value.data['item']);
      // it.sId = value.data['item']['_id'];print(value.data['item']['_id']);
      // it.name = value.data['item']['name'];print(value.data['item']['name']);
      // it.image = value.data['item']['image'];print(value.data['item']['image']);
      // it.price = value.data['item']['price'];print(value.data['item']['price']);
      // it.quantity = value.data['item']['quantity'];print(value.data['item']['quantity']);
      newPriceList.add(it);
      calculateTotalPrice();
      Navigator.pop(context);
      emit(UploadImageItemSuccessState());
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      emit(UploadImageItemErrorState());
    });
  }
}
