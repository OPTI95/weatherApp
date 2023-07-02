import 'package:book/features/weather/domain/entities/weather_entity.dart';

class CordinateModel extends CordinateEntity {
  CordinateModel({required super.lon, required super.lat});
  factory CordinateModel.fromJson(Map<String, dynamic> json) {
    return CordinateModel(
      lon: json['lon'] as double,
      lat: json['lat'] as double,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'lon': lon,
      'lat': lat,
    };
  }
}
