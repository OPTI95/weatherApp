import 'package:book/core/error/failure.dart';
import 'package:book/features/weather/domain/entities/weather_entity.dart';
import 'package:dartz/dartz.dart';

import '../entities/weather_forecast_entity.dart';

abstract class WeatherRepository {
  Future<Either<Failure, WeatherEntity>> getWeatherCity(String city);
  Future<Either<Failure, List<WeatherForecastEntity>>> getWeatherForecastCity(
      CordinateEntity cordinateEntity);
  Future<Either<Failure, WeatherEntity>> getWeatherCordinate(
      CordinateEntity cordinate);
}
