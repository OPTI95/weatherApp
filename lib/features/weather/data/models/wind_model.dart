import 'package:book/features/weather/domain/entities/weather_entity.dart';

class WindModel extends WindEntity {
  WindModel({required super.speed, required super.deg, required super.gust});
  factory WindModel.fromJson(Map<String, dynamic> json) {
    return WindModel(
      speed: (json['speed']).toDouble(),
      deg: json['deg'] as int,
      gust: json['gust'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'speed': speed,
      'deg': deg,
      'gust': gust,
    };
  }
}
