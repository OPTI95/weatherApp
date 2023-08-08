import 'dart:convert';

import 'package:book/features/weather/data/models/weather_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/error/exeption.dart';
import '../models/weather_forecast_model.dart';

const CACHED_WEATHER = 'CACHED_WEATHER';
const CACHED_FORECAST_WEATHER = 'CACHED_FORECAST_WEATHER';

abstract class WeatherLocalDataSource {
  Future<WeatherModel> getLastWeather();

  Future<List<WeatherForecastModel>> getLastForecastWeather();

  Future<void> cacheWeather(WeatherModel weatherToCache);

  Future<void> cacheForecastWeather(
      List<WeatherForecastModel> weatherForecastToCache);
}

class WeatherLocalDataSourceImpl implements WeatherLocalDataSource {
  final SharedPreferences sharedPreferences;

  WeatherLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> cacheWeather(WeatherModel weatherToCache) {
    return sharedPreferences.setString(
      CACHED_WEATHER,
      json.encode(weatherToCache.toJson()),
    );
  }

  @override
  Future<void> cacheForecastWeather(
      List<WeatherForecastModel> weatherForecastToCache) {
    final jsonList = weatherForecastToCache.map((e) => e.toJson()).toList();
    final jsonString = json.encode(jsonList);
    return sharedPreferences.setString(CACHED_FORECAST_WEATHER, jsonString);
  }

  @override
  Future<WeatherModel> getLastWeather() {
    final jsonString = sharedPreferences.getString(CACHED_WEATHER);
    if (jsonString != null) {
      return Future.value(WeatherModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<List<WeatherForecastModel>> getLastForecastWeather() {
    final jsonString = sharedPreferences.getString(CACHED_FORECAST_WEATHER);
    if (jsonString != null) {
      final jsonList = json.decode(jsonString) as List<dynamic>;
      return Future.value(
          jsonList.map((e) => WeatherForecastModel.fromJson(e)).toList());
    } else {
      throw CacheException();
    }
  }
}
