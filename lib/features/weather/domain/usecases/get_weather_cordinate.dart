import 'package:book/core/error/failure.dart';
import 'package:book/features/weather/domain/entities/weather_entity.dart';
import 'package:book/features/weather/domain/repositories/weather_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/usecases/usecase.dart';

class GetWeatherCordinate extends UseCase<WeatherEntity, CordinateParams> {
  final WeatherRepository repository;
  GetWeatherCordinate(this.repository);

  @override
  Future<Either<Failure, WeatherEntity>> call(CordinateParams params) async {
    return await repository.getWeatherCordinate(params.cordinateEntity);
  }
}

class CordinateParams extends Equatable {
  final CordinateEntity cordinateEntity;

  const CordinateParams({required this.cordinateEntity});

  @override
  List<Object?> get props => [cordinateEntity];
}
