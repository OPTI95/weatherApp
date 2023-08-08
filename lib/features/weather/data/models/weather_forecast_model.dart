import 'package:book/features/weather/data/models/weather_info_model.dart';

import '../../domain/entities/weather_forecast_entity.dart';

class WeatherForecastModel extends WeatherForecastEntity {
  WeatherForecastModel(
      {required super.temp, required super.weather, required super.dt_txt});
  factory WeatherForecastModel.fromJson(Map<String, dynamic> json) {
    var tempValue = json["main"]["temp"];

    double temperature;

    if (tempValue is int) {
      temperature = tempValue.toDouble();
    } else if (tempValue is double) {
      temperature = tempValue;
    } else {
      temperature = 0.0;
    }
    return WeatherForecastModel(
        temp: temperature,
        weather: WeatherInfoModel.fromJson(json['weather'][0]),
        dt_txt: json["dt_txt"]);
  }

  Map<String, dynamic> toJson() {
    return {
      'main': {'temp': temp},
      'weather': weather,
      'dt_txt': dt_txt,
    };
  }
}
