import 'dart:async';


import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';



import '../../../../../core/services/dio_helper.dart';
import '../../../../../core/services/preferences.dart';
import '../../../data/cache_daily_model.dart';
import '../../../data/cache_week_model.dart';
import '../../../data/metal_model.dart';
import '../../../data/week_model.dart';

part 'chart_state.dart';

class ChartCubit extends Cubit<ChartState> {
  ChartCubit() : super(ChartInitial());

  static ChartCubit get(context) => BlocProvider.of(context);

  // thirty day ago
  // show error correctly

  late Timer _timer;

  //daily data

  List<FlSpot> dayDataXPD = [];
  List<FlSpot> dayDataXPT = [];
  List<FlSpot> dayDataXRH = [];

  List<String> daysNames = [];

  //------------------------------------

  //month data

  List<FlSpot> weekDataPD = [];
  List<FlSpot> weekDataPT = [];
  List<FlSpot> weekDataRH = [];

  List<dynamic> weakDates = [];

  //-----------------------------------

  List<FlSpot> currentDataXPD = [];
  List<FlSpot> currentDataXPT = [];
  List<FlSpot> currentDataXRH = [];

  int selectedIndex = 0;

  void startFetchingData() async {
    // Fetch data initially and every 6 hours
    await fetchDataCheckerDaily();
    await weekDataChecker();
    changeChartData(0);

    // _timer = Timer.periodic(Duration(minutes: 600), (timer) {
    //   fetchDataCheckerDaily();
    //   fetchDataChecker();
    // });
  }

  void fetchDailyData() async {
    emit(ChartInitial());
    try {
      final response = await Diohelper.getData(
        url:
            'https://catprice-588efcf30992.herokuapp.com/api/v1/user/metal/get?userId=655918f10f9a784499a26041',
      );

      if (response.statusCode == 200) {
        final data = response.data;
        MetalData metalData = MetalData.fromJson(data);
        List<double> pdDouble = metalData.metal.pdDaily
            .map((int value) => value.toDouble())
            .toList();
        dayDataXPD = convertDataToFlSpots(pdDouble);
        currentDataXPD = dayDataXPD;

        List<double> ptDouble = metalData.metal.ptDaily
            .map((int value) => value.toDouble())
            .toList();
        dayDataXPT = convertDataToFlSpots(ptDouble);
        currentDataXPT = dayDataXPT;
        List<double> rhDouble = metalData.metal.rhDaily
            .map((int value) => value.toDouble())
            .toList();
        dayDataXRH = convertDataToFlSpots(rhDouble);
        currentDataXRH = dayDataXRH;
        Preferences.saveCacheModelDaily(CacheModelDaily(
          lastTime: DateFormat('yyyy-MM-dd hh:mm').format(DateTime.now()),
          listDoubleXpdDaily: convertDataToDouble(dayDataXPD),
          listDoubleXptDaily: convertDataToDouble(dayDataXPT),
          listDoubleXrhDaily: convertDataToDouble(dayDataXRH),
          times: daysNames,
        ));

        emit(ChartSuccess(currentDataXPD));
      } else {}
    } catch (e) {
      emit(ChartFailure());
    }
  }

  void fetchWeekData() async {
    weekDataPD = [];
    weekDataPT = [];
    weekDataRH = [];
    emit(ChartInitialM());
    try {
      final response = await Diohelper.getData(
          url:
              'https://catprice-588efcf30992.herokuapp.com/api/v1/user/metal/timeseries',
          x_app_token: 'Catalyst-Team');

      // final response = await dio.get(
      //     'https://catprice-588efcf30992.herokuapp.com/api/v1/user/metal/timeseries');
      if (response.statusCode == 200) {
        final data = response.data;
        //var history = RatesResponse(rates: jsonData);
        WeekModel weekData = WeekModel.fromJson(data);
        weekDataPD = convertDataToFlSpots(weekData.pdHistory);
        weekDataPT = convertDataToFlSpots(weekData.ptHistory);
        weekDataRH = convertDataToFlSpots(weekData.rhHistory);
        for (int i = 0; i < data['pdHistory'].length; i++) {
          weakDates.add(DateFormat('dd MMM')
              .format((DateTime.now().subtract(Duration(days: 6 - i))))
              .toString());
        }
        Preferences.saveCacheModel(CacheWeekModel(
          date: weakDates,
          listDoublepd: convertDataToDouble(weekDataPD),
          listDoublept: convertDataToDouble(weekDataPT),
          listDoublerh: convertDataToDouble(weekDataRH),
        ));
      }
      //Preferences.loadCacheModel();
      emit(ChartSuccessM());
      // } else {}
    } catch (e) {
      emit(ChartFailureM());
      print(e.toString());
    }
  }

  Future<void> weekDataChecker() async {
    bool isConnected = await isOnline();

    CacheWeekModel? weekData = await Preferences.loadCacheModel();
    // DateTime? lastDate = DateTime.tryParse(
    //     monthData?.date[6] ?? DateFormat('yyyy-MM-dd').format(DateTime.now()));
    if (isConnected) {
      try {
        fetchWeekData();
      } catch (e) {}
    } else if (weekData?.listDoublepd == null) {
      weekDataPD = [];
      weekDataPT = [];
      weekDataRH = [];
      weakDates = [];
    } else {
      // CacheModel? dataMonths = await Preferences.loadCacheModel();
      weekDataPD = convertdoubleToFlSpots(weekData!.listDoublepd);
      weekDataPT = convertdoubleToFlSpots(weekData.listDoublept);
      weekDataRH = convertdoubleToFlSpots(weekData.listDoublerh);
      weakDates = weekData.date!;
    }
  }

  Future<void> fetchDataCheckerDaily() async {
    bool isConnected = await isOnline();

    CacheModelDaily? dailyData = await Preferences.loadCacheModelDaily();
    // DateTime? lastTime = DateTime.tryParse(dailyData?.lastTime ??
    //     DateFormat('yyyy-MM-dd hh:mm')
    //         .format(DateTime.now().subtract(const Duration(hours: 6))));
    if (isConnected) {
      try {
        fetchDailyData();
      } catch (e) {}
    } else if (dailyData?.listDoubleXpdDaily == null && !isConnected) {
      dayDataXPD = [];
      dayDataXPT = [];
      dayDataXRH = [];
    } else {
      dayDataXPD = convertdoubleToFlSpots(dailyData!.listDoubleXpdDaily);
      dayDataXPT = convertdoubleToFlSpots(dailyData.listDoubleXptDaily);
      dayDataXRH = convertdoubleToFlSpots(dailyData.listDoubleXrhDaily);
      daysNames = dailyData.times;
    }
  }

  void changeChartData(int index) {
    emit(ChartInitials());
    if (index == 1) {
      currentDataXPD = weekDataPD;
      currentDataXPT = weekDataPT;
      currentDataXRH = weekDataRH;
      selectedIndex = 1;
    } else {
      currentDataXPD = dayDataXPD;
      currentDataXPT = dayDataXPT;
      currentDataXRH = dayDataXRH;
      selectedIndex = 0;
    }
    emit(ChartSuccesss());
  }
}

List<FlSpot> convertDataToFlSpotss(List<dynamic> metal) {
  final List<FlSpot> flSpots = [];

  for (int i = 0; i < metal.length; i++) {
    flSpots.add(FlSpot(i.toDouble(), metal[i].price));
  }

  return flSpots;
}

List<FlSpot> convertDataToFlSpots(List<double> metal) {
  final List<FlSpot> flSpots = [];

  for (int i = 0; i < metal.length; i++) {
    flSpots.add(FlSpot(i.toDouble(), metal[i]));
  }

  return flSpots;
}

List<FlSpot> convertdoubleToFlSpots(List<dynamic> metal) {
  final List<FlSpot> flSpots = [];

  for (int i = 0; i < metal.length; i++) {
    flSpots.add(FlSpot(i.toDouble(), metal[i]));
  }

  return flSpots;
}

List<double> convertDataToDouble(List<FlSpot> metal) {
  final List<double> listSpots = [];

  for (int i = 0; i < metal.length; i++) {
    listSpots.add(metal[i].y);
  }
  return listSpots;
}

Future<bool> isOnline() async {
  bool result = await InternetConnectionChecker().hasConnection;
  return result;
}
