import 'package:bloc/bloc.dart';
import 'package:book/features/weather/domain/usecases/get_weather_city.dart';
import 'package:book/features/weather/domain/usecases/get_weather_cordinate.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/weather_entity.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final GetWeatherCity getWeatherCity;
  final GetWeatherCordinate getWeatherCordinate;
  WeatherCubit(
      {required this.getWeatherCity, required this.getWeatherCordinate})
      : super(WeatherInitialState());
  Future<void> fetchWeatherCity(String city) async {
    try {
      emit(WeatherLoadingState());
      final loadedWeatherOrFailure =
          await getWeatherCity(CityParams(city: city));
      loadedWeatherOrFailure.fold(
          (error) => emit(WeatherErrorState(
              message: error is ServerFailure
                  ? "SERVER_FAILURE_MESSAGE"
                  : "CACHE_FAILURE_MESSAGE")), (weatherEntity) {
        emit(WeatherLoadedState(weatherEntity));
      });
    } catch (_) {}
  }

  Future<void> fetchWeatherCordinate(CordinateEntity cordinateEntity) async {
    try {
      emit(WeatherLoadingState());
      final loadedWeatherOrFailure = await getWeatherCordinate(
          CordinateParams(cordinateEntity: cordinateEntity));
      loadedWeatherOrFailure.fold(
          (error) => emit(WeatherErrorState(
              message: error is ServerFailure
                  ? "SERVER_FAILURE_MESSAGE"
                  : "CACHE_FAILURE_MESSAGE")), (weatherEntity) {
        emit(WeatherLoadedState(weatherEntity));
      });
    } catch (_) {}
  }

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
