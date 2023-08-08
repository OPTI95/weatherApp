import 'dart:convert';

import 'package:book/features/weather/data/models/weather_forecast_model.dart';
import 'package:book/features/weather/data/models/weather_model.dart';
import 'package:book/features/weather/domain/entities/weather_entity.dart';
import 'package:http/http.dart' as http;

import '../../../../core/error/exeption.dart';

abstract class WeatherRemoteDataSource {
  /// Calls the https://api.openweathermap.org/data/2.5/weather?q={city}&lang=ru&units=metric&appid=1ef3080d8df50eb84f61838598ccadcc endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<WeatherModel> getWeatherCity(String city);

  /// Calls the https://api.openweathermap.org/data/2.5/forecast?q={city}&lang=ru&units=metric&appid=1ef3080d8df50eb84f61838598ccadcc endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<WeatherForecastModel>> getWeatherForecastCity(
      CordinateEntity cordinateEntity);

  /// Calls the https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&lang=ru&units=metric&appid=1ef3080d8df50eb84f61838598ccadcc endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<WeatherModel> getWeatherCordinate(CordinateEntity cordinateEntity);
}

class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  final http.Client client;

  WeatherRemoteDataSourceImpl({required this.client});

  @override
  Future<WeatherModel> getWeatherCity(String city) => _getWeatherFromUrl(
      "https://api.openweathermap.org/data/2.5/weather?q=$city&lang=ru&units=metric&appid=1ef3080d8df50eb84f61838598ccadcc");
  @override
  Future<List<WeatherForecastModel>> getWeatherForecastCity(
      CordinateEntity cordinateEntity) {
    final double lat = cordinateEntity.lat;
    final double lon = cordinateEntity.lon;
    return _getWeatherForecastFromUrl(
        "https://api.openweathermap.org/data/2.5/forecast?lat=$lat&lon=$lon&lang=ru&units=metric&appid=1ef3080d8df50eb84f61838598ccadcc");
  }

  @override
  Future<WeatherModel> getWeatherCordinate(CordinateEntity cordinateEntity) {
    final double lat = cordinateEntity.lat;
    final double lon = cordinateEntity.lon;
    return _getWeatherFromUrl(
        "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&lang=ru&units=metric&appid=1ef3080d8df50eb84f61838598ccadcc");
  }

  Future<WeatherModel> _getWeatherFromUrl(String url) async {
    try {
      final response = await client.get(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        return WeatherModel.fromJson(json.decode(response.body));
      } else {
        throw ServerException();
      }
    } catch (e) {
      print(e);
      throw (e);
    }
  }

  Future<List<WeatherForecastModel>> _getWeatherForecastFromUrl(
      String url) async {
    try {
      final response = await client.get(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        return List<WeatherForecastModel>.from(
          json
              .decode(response.body)['list']
              .map((data) => WeatherForecastModel.fromJson(data)),
        );
      } else {
        throw ServerException();
      }
    } catch (e) {
      print(e);
      throw (e);
    }
  }
}
