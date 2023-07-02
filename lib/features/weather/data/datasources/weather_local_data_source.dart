import 'dart:convert';

import 'package:book/features/weather/data/models/weather_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/error/exeption.dart';

const CACHED_WEATHER = 'CACHED_WEATHER';

abstract class WeatherLocalDataSource {
  Future<WeatherModel> getLastWeather();

  Future<void> cacheWeather(WeatherModel weatherToCache);
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
  Future<WeatherModel> getLastWeather() {
    final jsonString = sharedPreferences.getString(CACHED_WEATHER);
    if (jsonString != null) {
      return Future.value(WeatherModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }
}
