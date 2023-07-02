import 'package:equatable/equatable.dart';

class WeatherEntity extends Equatable {
  final CordinateEntity coord;
  final WeatherInfoEntity? weather;
  final String base;
  final WeatherTempAndOtherInfoEntity main;
  final int visibility;
  final WindEntity wind;
  final int all;
  final RainOrSnowEntity? rain;
  final RainOrSnowEntity? snow;
  final int dt;
  final CountryInfoEntity sys;
  final int? timezona;
  final int id;
  final String name;
  final int cod;

  const WeatherEntity(
      {required this.coord,
      required this.weather,
      required this.base,
      required this.main,
      required this.visibility,
      required this.wind,
      required this.all,
      required this.rain,
      required this.snow,
      required this.dt,
      required this.sys,
      required this.timezona,
      required this.id,
      required this.name,
      required this.cod});

  @override
  List<Object?> get props => [
        coord,
        weather,
        base,
        main,
        visibility,
        wind,
        all,
        rain,
        snow,
        dt,
        sys,
        timezona,
        id,
        name,
        cod
      ];
}

class CountryInfoEntity {
  final int type;
  final int id;
  final String country;
  final int sunrise;
  final int sunset;

  CountryInfoEntity(
      {required this.type,
      required this.id,
      required this.country,
      required this.sunrise,
      required this.sunset});
}

class RainOrSnowEntity {
  final double? oneH;
  final double? threeH;

  RainOrSnowEntity({required this.oneH, required this.threeH});
}

class WindEntity {
  final double speed;
  final int deg;
  final int? gust;
  WindEntity({required this.speed, required this.deg, required this.gust});
}

class CordinateEntity {
  final double lon;
  final double lat;

  CordinateEntity({required this.lon, required this.lat});
}

class WeatherInfoEntity {
  final int id;
  final String main;
  final String description;
  final String icon;

  WeatherInfoEntity(
      {required this.id,
      required this.main,
      required this.description,
      required this.icon});
}

class WeatherTempAndOtherInfoEntity {
  final double temp;
  final double feels_like;
  final double temp_min;
  final double temp_max;
  final int pressure;
  final int humidity;

  WeatherTempAndOtherInfoEntity(
      {required this.temp,
      required this.feels_like,
      required this.temp_min,
      required this.temp_max,
      required this.pressure,
      required this.humidity});
}
