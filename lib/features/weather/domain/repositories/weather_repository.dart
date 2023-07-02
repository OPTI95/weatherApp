
import 'package:book/core/error/failure.dart';
import 'package:book/features/weather/domain/entities/weather_entity.dart';
import 'package:dartz/dartz.dart';

abstract class WeatherRepository {
  Future<Either<Failure, WeatherEntity>> getWeatherCity(String city);
  Future<Either<Failure, WeatherEntity>> getWeatherCordinate(CordinateEntity cordinate);
}