import 'dart:convert';

import 'package:book/features/weather/data/models/weather_model.dart';
import 'package:book/features/weather/domain/entities/weather_entity.dart';
import 'package:http/http.dart' as http;

import '../../../../core/error/exeption.dart';

abstract class WeatherRemoteDataSource {
  /// Calls the https://api.openweathermap.org/data/2.5/weather?q={city}&lang=ru&units=metric&appid=ceb646cefd930f578e03e84c617f2ce3 endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<WeatherModel> getWeatherCity(String city);

  /// Calls the https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&lang=ru&units=metric&appid=ceb646cefd930f578e03e84c617f2ce3 endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<WeatherModel> getWeatherCordinate(CordinateEntity cordinateEntity);
}

class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  final http.Client client;

  WeatherRemoteDataSourceImpl({required this.client});

  @override
  Future<WeatherModel> getWeatherCity(String city) => _getWeatherFromUrl(
      "https://api.openweathermap.org/data/2.5/weather?q=$city&lang=ru&units=metric&appid=ceb646cefd930f578e03e84c617f2ce3");

  @override
  Future<WeatherModel> getWeatherCordinate(CordinateEntity cordinateEntity) {
    final double lat = cordinateEntity. lat;
    final double lon = cordinateEntity.lon;
    return _getWeatherFromUrl(
        "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&lang=ru&units=metric&appid=ceb646cefd930f578e03e84c617f2ce3");
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
      throw(e);
    }
  }
}
