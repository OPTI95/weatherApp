import 'package:book/core/error/failure.dart';
import 'package:book/features/weather/domain/entities/weather_entity.dart';
import 'package:book/features/weather/domain/entities/weather_forecast_entity.dart';
import 'package:book/features/weather/domain/repositories/weather_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/usecases/usecase.dart';

class GetWeatherForecastCity extends UseCase<List<WeatherForecastEntity>, CordinateForecastParams> {
  final WeatherRepository repository;
  GetWeatherForecastCity(this.repository);

  @override
  Future<Either<Failure, List<WeatherForecastEntity>>> call(CordinateForecastParams params) async {
    return await repository.getWeatherForecastCity(params.cordinateEntity);
  }
}

class CordinateForecastParams extends Equatable {
  final CordinateEntity cordinateEntity;

  const CordinateForecastParams({required this.cordinateEntity});

  @override
  List<Object?> get props => [cordinateEntity];
}
