import '../../domain/entities/weather_entity.dart';

class WeatherTempAndOtherInfoModel extends WeatherTempAndOtherInfoEntity {
  WeatherTempAndOtherInfoModel(
      {required super.temp,
      required super.feels_like,
      required super.temp_min,
      required super.temp_max,
      required super.pressure,
      required super.humidity});

  factory WeatherTempAndOtherInfoModel.fromJson(Map<String, dynamic> json) {
    return WeatherTempAndOtherInfoModel(
      temp: json['temp'] as double,
      feels_like: json['feels_like'] as double,
      temp_min: json['temp_min'] as double,
      temp_max: json['temp_max'] as double,
      pressure: json['pressure'] as int,
      humidity: json['humidity'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'temp': temp,
      'feels_like': feels_like,
      'temp_min': temp_min,
      'temp_max': temp_max,
      'pressure': pressure,
      'humidity': humidity,
    };
  }
}
