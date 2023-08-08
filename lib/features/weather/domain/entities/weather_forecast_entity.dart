import 'package:book/features/weather/domain/entities/weather_entity.dart';
import 'package:equatable/equatable.dart';

class WeatherForecastEntity extends Equatable {
  final double temp;
  final WeatherInfoEntity? weather;
  final String dt_txt;

  const WeatherForecastEntity({required this.temp, required this.weather, required this.dt_txt});
  @override
  // TODO: implement props
  List<Object?> get props => [temp, weather, dt_txt];
}
