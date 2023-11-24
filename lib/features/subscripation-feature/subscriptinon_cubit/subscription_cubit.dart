import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/SharedPreference.dart';
import '../../../core/core-price-cat/models/subscription_prices_model.dart';
import '../../../core/core-price-cat/network/remote/dio_helper.dart';
import '../../../core/core-price-cat/resources/commen_widget/server_message.dart';


part 'subscription_state.dart';

class SubscriptionCubit extends Cubit<SubscriptionState> {
  SubscriptionCubit() : super(SubscriptionInitial());

  static SubscriptionCubit get(context) => BlocProvider.of(context);
  bool subYearly = false;

  void changeSubYearly({required bool state}) {
    subYearly = state;
    emit(ChangeSubYearlyEmitState());
  }

  int broFullSearchPriceYear = 0;
  int broFullSearchPriceMonth = 0;
  int broFullSearchCount=500;

  int broCountUsersPriceYear = 0;
  int broCountUsersPriceMonth = 0;
  int broCountUsersCount=1;

  int totalBroPrice = 0;

  List<Prices> allSubscriptionPrices = [];

  void getAllSubscriptionPrices() {
    emit(GetAllSubscriptionLodingPricesEmitState());
    DioFinalHelper.getData(url: '/api/v1/user/price/get', data: {}).then((value) {
      allSubscriptionPrices = [];
      value.data['prices'].forEach((element) {
        allSubscriptionPrices.add(Prices.fromJson(element));
      });
      broFullSearchPriceYear =
          allSubscriptionPrices[0].year!.fullSearch?.firstNumCost ?? 0;
      broFullSearchPriceMonth =
          allSubscriptionPrices[0].month!.fullSearch?.firstNumCost ?? 0;
      broCountUsersPriceYear =
          allSubscriptionPrices[0].year!.users?.oneUser ?? 0;
      broCountUsersPriceMonth =
          allSubscriptionPrices[0].month!.users?.oneUser ?? 0;
      calculateTotalBroPrice(other: [false, false, false]);
      emit(GetAllSubscriptionSuccessPricesEmitState());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(GetAllSubscriptionErrorPricesEmitState());
    });
  }

  List<bool> chooseFullBroSearch = [true, false, false, false];

  void changeBroSearch({required int index}) {
    for (int i = 0; i < 4; i++) {
      if (i == index) {
        chooseFullBroSearch[i] = true;
      } else {
        chooseFullBroSearch[i] = false;
      }
    }
    if (index == 0) {
      broFullSearchPriceYear =
          allSubscriptionPrices[0].year!.fullSearch!.firstNumCost!;
      broFullSearchPriceMonth =
          allSubscriptionPrices[0].month!.fullSearch!.firstNumCost!;
      broFullSearchCount=500;
    } else if (index == 1) {
      broFullSearchPriceYear =
          allSubscriptionPrices[0].year!.fullSearch!.secondNumCost!;
      broFullSearchPriceMonth =
          allSubscriptionPrices[0].month!.fullSearch!.secondNumCost! ;
      broFullSearchCount=1000;
    } else if (index == 2) {
      broFullSearchPriceYear =
          allSubscriptionPrices[0].year!.fullSearch!.thirdNumCost! ;
      broFullSearchPriceMonth =
          allSubscriptionPrices[0].month!.fullSearch!.thirdNumCost! ;
      broFullSearchCount=2000;
    } else {
      broFullSearchPriceYear =
          allSubscriptionPrices[0].year!.fullSearch!.fourthNumCost!;
      broFullSearchPriceMonth =
          allSubscriptionPrices[0].month!.fullSearch!.fourthNumCost!;
      broFullSearchCount=3000;
    }
    emit(ChangeBroSearchEmitState());
  }

  List<bool> chooseUsersBroSubscription = [true, false, false];

  void changeUsersBroSubscription({required int index}) {
    for (int i = 0; i < 3; i++) {
      if (i == index) {
        chooseUsersBroSubscription[i] = true;
      } else {
        chooseUsersBroSubscription[i] = false;
      }
    }
    if (index == 0) {
      broCountUsersPriceYear =
          allSubscriptionPrices[0].year!.users!.oneUser! ;
      broCountUsersPriceMonth =
          allSubscriptionPrices[0].month!.users!.oneUser! ;
      broCountUsersCount=1;
    } else if (index == 1) {
      broCountUsersPriceYear =
          allSubscriptionPrices[0].year!.users!.twoUsers! ;
      broCountUsersPriceMonth =
          allSubscriptionPrices[0].month!.users!.twoUsers!;
      broCountUsersCount=2;
    } else if (index == 2) {
      broCountUsersPriceYear =
          allSubscriptionPrices[0].year!.users!.threeUsers! ;
      broCountUsersPriceMonth =
          allSubscriptionPrices[0].month!.users!.threeUsers! ;
      broCountUsersCount=3;
    }
    emit(ChangeUsersBroSubscriptionEmitState());
  }

  void calculateTotalBroPrice({required List<bool> other}) {
    totalBroPrice = 0;
    if (subYearly == true) {
      totalBroPrice += broFullSearchPriceYear;
      totalBroPrice += broCountUsersPriceYear;
      if (other[0] == true) {
        totalBroPrice += allSubscriptionPrices[0].year?.priceList ?? 0;
      }
      if (other[1] == true) {
        totalBroPrice += allSubscriptionPrices[0].year?.myCatalog ?? 0;
      }
      if (other[2] == true) {
        totalBroPrice += allSubscriptionPrices[0].year?.calculator ?? 0;
      }
    } else {
      totalBroPrice += broFullSearchPriceMonth;
      totalBroPrice += broCountUsersPriceMonth;
      if (other[0] == true) {
        totalBroPrice += allSubscriptionPrices[0].month?.priceList ?? 0;
      }
      if (other[1] == true) {
        totalBroPrice += allSubscriptionPrices[0].month?.myCatalog ?? 0;
      }
      if (other[2] == true) {
        totalBroPrice += allSubscriptionPrices[0].month?.calculator ?? 0;
      }
    }
    emit(CalculateTotalBroPriceEmitState());
  }

  // Create Price
  int cost = 10;
  // ToDo change user id
  Map<String, dynamic> createDataRequest = {
    "userId": "${Preference.getData(key: 'userId')}",
    "userName": "userTest",
    "subscriptionType": "Bro",
    "paymentMethod": "Visa",
    "accountNumber": "54911242351123",
    "paymentHistory": "20/11/2023",
    "cost": 45
  };

  List<bool>otherCreateBroRequestData=[false,false,false];
  void createSubscriptionRequest(context) {
    emit(CreateSubscriptionRequestLodingPricesEmitState());
    Map<String, dynamic> createBroRequestData = {};
    if(subYearly==true)
      {
        createBroRequestData = {
          "fullSearch": broFullSearchCount,
          "fullSearchCost": broFullSearchPriceYear,
          "users": broCountUsersCount,
          "usersCost": broCountUsersPriceYear,
          "priceList": otherCreateBroRequestData[0],
          "priceListCost": allSubscriptionPrices[0].year?.priceList??0,
          "myCatalog": otherCreateBroRequestData[1],
          "myCatalogCost": allSubscriptionPrices[0].year?.myCatalog??0,
          "calculator": otherCreateBroRequestData[2],
          "calculatorCost": allSubscriptionPrices[0].year?.calculator??0
        };

      }
    else {
       createBroRequestData = {
      "fullSearch": broFullSearchCount,
      "fullSearchCost": broFullSearchPriceMonth,
      "users": broCountUsersCount,
      "usersCost": broCountUsersPriceMonth,
      "priceList": otherCreateBroRequestData[0],
      "priceListCost": allSubscriptionPrices[0].month?.priceList??0,
      "myCatalog": otherCreateBroRequestData[1],
      "myCatalogCost": allSubscriptionPrices[0].month?.myCatalog??0,
      "calculator": otherCreateBroRequestData[2],
      "calculatorCost": allSubscriptionPrices[0].month?.calculator??0
    };
    }
    if (kDebugMode) {
      print(createDataRequest);
    }
    createDataRequest['broSubscription']=createBroRequestData;
    if (kDebugMode) {
      print(createDataRequest);
    }
    DioFinalHelper.postData(url: '/api/v1/user/subscription/create', data: createDataRequest)
        .then((value) {
      showMassageFromServer(context, mes: value.data['message'].toString());
      createDataRequest = {
        "userId": "${Preference.getData(key: 'userId')}",
        "userName": "userTest",
        "subscriptionType": "Bro",
        "paymentMethod": "Visa",
        "accountNumber": "54911242351123",
        "paymentHistory": "20/11/2023",
        "cost": 45
      };
      createBroRequestData = {
        "fullSearch": 1000,
        "fullSearchCost": 10,
        "users": 2,
        "usersCost": 3,
        "priceList": true,
        "priceListCost": 4,
        "myCatalog": true,
        "myCatalogCost": 20,
        "calculator": false,
        "calculatorCost": 5
      };
      otherCreateBroRequestData=[false,false,false];
      emit(CreateSubscriptionRequestSuccessPricesEmitState());
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      emit(CreateSubscriptionRequestErrorPricesEmitState());
    });
  }
}
