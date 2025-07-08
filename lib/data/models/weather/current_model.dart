import 'package:weather_app/data/models/weather/condition_model.dart';

class CurrentModel {
  final int lastUpdatedEpoch;
  final String lastUpdated;
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
  final double heatIndexC;
  final double heatIndexF;
  final double dewPointC;
  final double dewPointF;
  final double visKm;
  final double visMiles;
  final double uv;
  final double gustMph;
  final double gustKph;

  CurrentModel({
    required this.lastUpdatedEpoch,
    required this.lastUpdated,
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
    required this.heatIndexC,
    required this.heatIndexF,
    required this.dewPointC,
    required this.dewPointF,
    required this.visKm,
    required this.visMiles,
    required this.uv,
    required this.gustMph,
    required this.gustKph,
  });

  factory CurrentModel.fromJson(Map<String, dynamic> json) => CurrentModel(
    lastUpdatedEpoch: json['last_updated_epoch'] ?? 0,
    lastUpdated: json['last_updated'] ?? "",
    tempC: json['temp_c'] ?? 0,
    tempF: json['temp_f'] ?? 0,
    isDay: json['is_day'] ?? 0,
    condition: ConditionModel.fromJson(json['condition']),
    windMph: json['wind_mph'] ?? 0,
    windKph: json['wind_kph'] ?? 0,
    windDegree: json['wind_degree'] ?? 0,
    windDir: json['wind_dir'] ?? "",
    pressureMb: json['pressure_mb'] ?? 0,
    pressureIn: json['pressure_in'] ?? 0,
    preCipMm: json['precip_mm'] ?? 0,
    preCipIn: json['precip_in'] ?? 0,
    humidity: json['humidity'] ?? 0,
    cloud: json['cloud'] ?? 0,
    feelsLikeC: json['feelslike_c'] ?? 0,
    feelsLikeF: json['feelslike_f'] ?? 0,
    windchillC: json['windchill_c'] ?? 0,
    windchillF: json['windchill_f'] ?? 0,
    heatIndexC: json['heatindex_c'] ?? 0,
    heatIndexF: json['heatindex_f'] ?? 0,
    dewPointC: json['dewpoint_c'] ?? 0,
    dewPointF: json['dewpoint_f'] ?? 0,
    visKm: json['vis_km'] ?? 0,
    visMiles: json['vis_miles'] ?? 0,
    uv: json['uv'] ?? 0,
    gustMph: json['gust_mph'] ?? 0,
    gustKph: json['gust_kph'] ?? 0,
  );
}
