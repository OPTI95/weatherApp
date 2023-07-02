import 'package:book/core/error/failure.dart';
import 'package:book/features/weather/domain/entities/weather_entity.dart';
import 'package:book/features/weather/domain/repositories/weather_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/usecases/usecase.dart';

class GetWeatherCity extends UseCase<WeatherEntity, CityParams> {
  final WeatherRepository repository;
  GetWeatherCity(this.repository);

  @override
  Future<Either<Failure, WeatherEntity>> call(CityParams params) async {
    return await repository.getWeatherCity(params.city);
  }
}

class CityParams extends Equatable {
  final String city;

  const CityParams({required this.city});

  @override
  List<Object?> get props => [city];
}
