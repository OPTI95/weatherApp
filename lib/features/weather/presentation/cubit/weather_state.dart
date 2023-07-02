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

  const WeatherLoadedState(this.weatherEntity);
}

class WeatherErrorState extends WeatherState {
  final String message;

  const WeatherErrorState({required this.message});
}
