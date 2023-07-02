import 'package:book/features/weather/data/models/cordinate_model.dart';
import 'package:book/features/weather/data/models/country_model.dart';
import 'package:book/features/weather/data/models/rain_or_snow_model.dart';
import 'package:book/features/weather/data/models/weather_info_model.dart';
import 'package:book/features/weather/data/models/weather_temp_and_other_info_model.dart';
import 'package:book/features/weather/data/models/wind_model.dart';
import 'package:book/features/weather/domain/entities/weather_entity.dart';

class WeatherModel extends WeatherEntity {
  const WeatherModel(
      {required super.coord,
      required super.weather,
      required super.base,
      required super.main,
      required super.visibility,
      required super.wind,
      required super.all,
      required super.rain,
      required super.snow,
      required super.dt,
      required super.sys,
      required super.timezona,
      required super.id,
      required super.name,
      required super.cod});
  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
        coord: CordinateModel.fromJson(json["coord"]),
        weather: WeatherInfoModel.fromJson(json["weather"]?[0]),
        base: json["base"],
        main: WeatherTempAndOtherInfoModel.fromJson(json["main"]),
        visibility: json["visibility"],
        wind: WindModel.fromJson(json["wind"]),
        all: json["clouds"]["all"],
        rain: json["rain"] != null
            ? RainOrSnowModel.fromJson(json["rain"])
            : null,
        snow: json["snow"] != null
            ? RainOrSnowModel.fromJson(json["snow"])
            : null,
        dt: json["dt"],
        sys: CountryModel.fromJson(json["sys"]),
        timezona: json["timezone"],
        id: json["id"],
        name: json["name"],
        cod: json["cod"]);
  }

  Map<String, dynamic> toJson() {
    return {
      'coord': coord,
      'weather': weather,
      'base': base,
      'main': main,
      'visibility': visibility,
      'wind': wind,
      'clouds': {'all': all},
      'rain': rain,
      'snow': snow,
      'dt': dt,
      'sys': sys,
      'timezona': timezona,
      'id': id,
      'name': name,
      'cod': cod
    };
  }
}
