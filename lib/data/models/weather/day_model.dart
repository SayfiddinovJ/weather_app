import 'package:weather_app/data/models/weather/condition_model.dart';

class DayModel {
  final int? maxTempC;
  final int? maxTempF;
  final int? minTempC;
  final int? minTempF;
  final int? avgTempC;
  final int? avgTempF;
  final int? maxWindMph;
  final int? maxWindKph;
  final int? totalPrecipMm;
  final int? totalPrecipIn;
  final int? totalSnowCm;
  final int? avgVisKm;
  final int? avgVisMiles;
  final int? avgHumidity;
  final int? dailyWillItRain;
  final int? dailyChanceOfRain;
  final int? dailyWillItSnow;
  final int? dailyChanceOfSnow;
  final ConditionModel? condition;
  final double? uv;

  DayModel({
    required this.maxTempC,
    required this.maxTempF,
    required this.minTempC,
    required this.minTempF,
    required this.avgTempC,
    required this.avgTempF,
    required this.maxWindMph,
    required this.maxWindKph,
    required this.totalPrecipMm,
    required this.totalPrecipIn,
    required this.totalSnowCm,
    required this.avgVisKm,
    required this.avgVisMiles,
    required this.avgHumidity,
    required this.dailyWillItRain,
    required this.dailyChanceOfRain,
    required this.dailyWillItSnow,
    required this.dailyChanceOfSnow,
    required this.condition,
    required this.uv,
  });

  factory DayModel.fromJson(Map<String, dynamic> json) => DayModel(
    maxTempC: json['maxtemp_c'] ?? 0,
    maxTempF: json['maxtemp_f'] ?? 0,
    minTempC: json['mintemp_c'] ?? 0,
    minTempF: json['mintemp_f'] ?? 0,
    avgTempC: json['avgtemp_c'] ?? 0,
    avgTempF: json['avgtemp_f'] ?? 0,
    maxWindMph: json['maxwind_mph'] ?? 0,
    maxWindKph: json['maxwind_kph'] ?? 0,
    totalPrecipMm: json['totalprecip_mm'] ?? 0,
    totalPrecipIn: json['totalprecip_in'] ?? 0,
    totalSnowCm: json['totalsnow_cm'] ?? 0,
    avgVisKm: json['avgvis_km'] ?? 0,
    avgVisMiles: json['avgvis_miles'] ?? 0,
    avgHumidity: json['avghumidity'] ?? 0,
    dailyWillItRain: json['daily_will_it_rain'] ?? 0,
    dailyChanceOfRain: json['daily_chance_of_rain'] ?? 0,
    dailyWillItSnow: json['daily_will_it_snow'] ?? 0,
    dailyChanceOfSnow: json['daily_chance_of_snow'] ?? 0,
    condition: ConditionModel.fromJson(json['condition']),
    uv: json['uv'] as double?,
  );
}
