import 'package:book/features/weather/domain/entities/weather_entity.dart';

class CountryModel extends CountryInfoEntity {
  CountryModel(
      {required super.type,
      required super.id,
      required super.country,
      required super.sunrise,
      required super.sunset});

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      type: json['type'] as int,
      id: json['id'] as int,
      country: json['country'] as String,
      sunrise: json['sunrise'] as int,
      sunset: json['sunset'] as int,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'id': id,
      'country': country,
      'sunrise': sunrise,
      'sunset': sunset,
    };
  }
}
