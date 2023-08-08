import 'package:bloc/bloc.dart';
import 'package:book/features/weather/domain/usecases/get_weather_city.dart';
import 'package:book/features/weather/domain/usecases/get_weather_cordinate.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/weather_entity.dart';
import '../../domain/entities/weather_forecast_entity.dart';
import '../../domain/usecases/get_weather_forecast_city.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final GetWeatherCity getWeatherCity;
  final GetWeatherCordinate getWeatherCordinate;
  final GetWeatherForecastCity getWeatherForecastCity;
  WeatherCubit(
      {required this.getWeatherCity,
      required this.getWeatherCordinate,
      required this.getWeatherForecastCity})
      : super(WeatherInitialState());
  Future<void> fetchWeatherCity() async {
    try {
      emit(WeatherLoadingState());
      late WeatherEntity weatherEntityEmit;
      late List<WeatherForecastEntity> weatherForecastEmit;
      Position position = await getPositionCity();
      String city = await getNameCity(position);
      CordinateEntity cordinateEntity =
          CordinateEntity(lon: position.longitude, lat: position.latitude);
      final loadedWeatherOrFailure = await getWeatherCordinate(
          CordinateParams(cordinateEntity: cordinateEntity));
      loadedWeatherOrFailure.fold(
          (error) => emit(WeatherErrorState(
              message: error is ServerFailure
                  ? "SERVER_FAILURE_MESSAGE"
                  : "CACHE_FAILURE_MESSAGE")), (weatherEntity) {
        weatherEntityEmit = weatherEntity;
      });
      final loadedWeatherForecstOrFailure = await getWeatherForecastCity(
          CordinateForecastParams(cordinateEntity: cordinateEntity));
      loadedWeatherForecstOrFailure.fold(
          (error) => emit(WeatherErrorState(
              message: error is ServerFailure
                  ? "SERVER_FAILURE_MESSAGE"
                  : "CACHE_FAILURE_MESSAGE")), (weatherEntity) {
        weatherForecastEmit = weatherEntity;
      });
      emit(WeatherLoadedState(weatherEntityEmit, weatherForecastEmit, city));
    } catch (_) {}
  }

  Future<Position> getPositionCity() async {
    await checkLocationPermission();
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }

  Future<String> getNameCity(Position position) async {
    final placemarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );
    return placemarks[0].locality.toString();
  }

  Future<void> checkLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        return;
      }
    }

    // Future<void> fetchWeatherCordinate(CordinateEntity cordinateEntity) async {
    //   try {
    //     emit(WeatherLoadingState());
    //     final loadedWeatherOrFailure = await getWeatherCordinate(
    //         CordinateParams(cordinateEntity: cordinateEntity));
    //     loadedWeatherOrFailure.fold(
    //         (error) => emit(WeatherErrorState(
    //             message: error is ServerFailure
    //                 ? "SERVER_FAILURE_MESSAGE"
    //                 : "CACHE_FAILURE_MESSAGE")), (weatherEntity) {
    //       emit(WeatherLoadedState(weatherEntity));
    //     });
    //   } catch (_) {}
    // }

    String _mapFailureToMessage(Failure failure) {
      switch (failure.runtimeType) {
        case ServerFailure:
          return "SERVER_FAILURE_MESSAGE";
        case CacheFailure:
          return "CACHE_FAILURE_MESSAGE";
        default:
          return 'Unexpected Error';
      }
    }
  }
}
