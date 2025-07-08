import 'package:weather_app/data/models/weather/condition_model.dart';

class HourModel {
  final int timeEpoch;
  final String time;
  final double tempC;
  final double tempF;
  final int isDay;
  final ConditionModel condition;
  final double windMph;
  final double windKph;
  final int windDegree;
  final String windDir;
  final double pressureMb;
  final double pressureIn;
  final double preCipMm;
  final double preCipIn;
  final int humidity;
  final int cloud;
  final double feelsLikeC;
  final double feelsLikeF;
  final double windchillC;
  final double windchillF;
  final double heatindexC;
  final double heatindexF;
  final double dewpointC;
  final double dewpointF;
  final int willItRain;
  final int chanceOfRain;
  final int willItSnow;
  final int chanceOfSnow;
  final double visKm;
  final double visMiles;
  final double gustMph;
  final double gustKph;
  final num uv;

  HourModel({
    required this.timeEpoch,
    required this.time,
    required this.tempC,
    required this.tempF,
    required this.isDay,
    required this.condition,
    required this.windMph,
    required this.windKph,
    required this.windDegree,
    required this.windDir,
    required this.pressureMb,
    required this.pressureIn,
    required this.preCipMm,
    required this.preCipIn,
    required this.humidity,
    required this.cloud,
    required this.feelsLikeC,
    required this.feelsLikeF,
    required this.windchillC,
    required this.windchillF,
    required this.heatindexC,
    required this.heatindexF,
    required this.dewpointC,
    required this.dewpointF,
    required this.willItRain,
    required this.chanceOfRain,
    required this.willItSnow,
    required this.chanceOfSnow,
    required this.visKm,
    required this.visMiles,
    required this.gustMph,
    required this.gustKph,
    required this.uv,
  });

  factory HourModel.fromJson(Map<String, dynamic> json) {
    return HourModel(
      timeEpoch: json['time_epoch'] ?? 0,
      time: json['time'] ?? '',
      tempC: json['temp_c'] ?? 0.0,
      tempF: json['temp_f'] ?? 0.0,
      isDay: json['is_day'] ?? 0,
      condition: ConditionModel.fromJson(json['condition'] ?? {}),
      windMph: json['wind_mph'] ?? 0.0,
      windKph: json['wind_kph'] ?? 0,
      windDegree: json['wind_degree'] ?? 0,
      windDir: json['wind_dir'] ?? '',
      pressureMb: json['pressure_mb'] ?? 0.0,
      pressureIn: json['pressure_in'] ?? 0.0,
      preCipMm: json['precip_mm'] ?? 0.0,
      preCipIn: json['precip_in'] ?? 0.0,
      humidity: json['humidity'] ?? 0,
      cloud: json['cloud'] ?? 0,
      feelsLikeC: json['feelslike_c'] ?? 0.0,
      feelsLikeF: json['feelslike_f'] ?? 0.0,
      windchillC: json['windchill_c'] ?? 0.0,
      windchillF: json['windchill_f'] ?? 0.0,
      heatindexC: json['heatindex_c'] ?? 0.0,
      heatindexF: json['heatindex_f'] ?? 0.0,
      dewpointC: json['dewpoint_c'] ?? 0.0,
      dewpointF: json['dewpoint_f'] ?? 0.0,
      willItRain: json['will_it_rain'] ?? 0,
      chanceOfRain: json['chance_of_rain'] ?? 0,
      willItSnow: json['will_it_snow'] ?? 0,
      chanceOfSnow: json['chance_of_snow'] ?? 0,
      visKm: json['vis_km'] ?? 0.0,
      visMiles: json['vis_miles'] ?? 0.0,
      gustMph: json['gust_mph'] ?? 0,
      gustKph: json['gust_kph'] ?? 0,
      uv: json['uv'] ?? 0,
    );
  }
}
