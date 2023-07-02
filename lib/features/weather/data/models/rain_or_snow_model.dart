import '../../domain/entities/weather_entity.dart';

class RainOrSnowModel extends RainOrSnowEntity {
  RainOrSnowModel({required super.oneH, required super.threeH});
  factory RainOrSnowModel.fromJson(Map<String, dynamic> json) {
    return RainOrSnowModel(
      oneH: json['oneH'],
      threeH: json['threeH'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'oneH': oneH,
      'threeH': threeH,
    };
  }
}
