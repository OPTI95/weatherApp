import 'package:book/features/weather/domain/entities/weather_entity.dart';

class WeatherInfoModel extends WeatherInfoEntity {
  WeatherInfoModel(
      {required super.id,
      required super.main,
      required super.description,
      required super.icon});
  factory WeatherInfoModel.fromJson(Map<String, dynamic> json) {
    return WeatherInfoModel(
      id: json['id'] as int,
      main: json['main'] as String,
      description: json['description'] as String,
      icon: json['icon'] as String,
    );
  }

  List<Map<String, dynamic>> toJson() {
    return [
      {
        'id': id,
        'main': main,
        'description': description,
        'icon': icon,
      }
    ];
  }
}
