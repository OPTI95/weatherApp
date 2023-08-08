part of 'weather_cubit.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherInitialState extends WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  final WeatherEntity weatherEntity;
  final List<WeatherForecastEntity> weatherForecastEntity;
  final String city;

  const WeatherLoadedState(this.weatherEntity, this.weatherForecastEntity, this.city);
}

class WeatherErrorState extends WeatherState {
  final String message;

  const WeatherErrorState({required this.message});
}
