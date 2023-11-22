import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../features/chart/data/cache_daily_model.dart';
import '../../features/chart/data/cache_week_model.dart';



class Preferences {
  static late SharedPreferences _preferences;
  static const String weekPrices = 'weekPrices';
  static const String dailyPrices = 'dailyPrices';

  static init() async => _preferences = await SharedPreferences.getInstance();
  static Future<void> saveCacheModel(CacheWeekModel cacheModel) async {
    String jsonString = json.encode(cacheModel.toJson());
    _preferences.setString(weekPrices, jsonString);
  }

  static Future<void> saveCacheModelDaily(
      CacheModelDaily cacheModelDaily) async {
    String jsonString = json.encode(cacheModelDaily.toJson());
    _preferences.setString(dailyPrices, jsonString);
  }

  static Future<CacheWeekModel?> loadCacheModel() async {
    String? jsonString = _preferences.getString(weekPrices);
    if (jsonString == null) {
      return null;
    }
    Map<String, dynamic> jsonMap = json.decode(jsonString);
    CacheWeekModel loadedCacheModel = CacheWeekModel.fromJson(jsonMap);
    return loadedCacheModel;
  }

  static Future<CacheModelDaily?> loadCacheModelDaily() async {
    String? jsonString = _preferences.getString(dailyPrices);
    if (jsonString == null) {
      return null;
    }
    Map<String, dynamic> jsonMap = json.decode(jsonString);
    CacheModelDaily loadedCacheModel = CacheModelDaily.fromJson(jsonMap);
    return loadedCacheModel;
  }
}
