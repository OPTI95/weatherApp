import 'package:book/core/error/exeption.dart';
import 'package:book/core/error/failure.dart';
import 'package:book/core/platform/network_info.dart';
import 'package:book/features/weather/data/datasources/weather_local_data_source.dart';
import 'package:book/features/weather/data/datasources/weather_remote_data_source.dart';
import 'package:book/features/weather/data/models/weather_model.dart';

import 'package:book/features/weather/domain/entities/weather_entity.dart';

import 'package:dartz/dartz.dart';

import '../../domain/repositories/weather_repository.dart';

typedef Future<WeatherModel> _CityOrCordinateChooser();

class WeatherRepositoryImpl extends WeatherRepository {
  final WeatherRemoteDataSource remoteDataSource;
  final WeatherLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  WeatherRepositoryImpl(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, WeatherEntity>> getWeatherCity(String city) async {
    return await _getWeather(() {
      return remoteDataSource.getWeatherCity(city);
    });
  }

  @override
  Future<Either<Failure, WeatherEntity>> getWeatherCordinate(
      CordinateEntity cordinate) async {
    return await _getWeather(() {
      return remoteDataSource.getWeatherCordinate(cordinate);
    });
  }

  Future<Either<Failure, WeatherEntity>> _getWeather(
      _CityOrCordinateChooser getCityOrCordinate) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteWeather = await getCityOrCordinate();
        localDataSource.cacheWeather(remoteWeather);
        return Right(remoteWeather);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localWeather = await localDataSource.getLastWeather();
        return Right(localWeather);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
