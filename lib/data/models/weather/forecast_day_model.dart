import 'package:weather_app/data/models/weather/astro_model.dart';
import 'package:weather_app/data/models/weather/day_model.dart';
import 'package:weather_app/data/models/weather/hour_model.dart';

class ForecastDayModel {
  final String date;
  final int dateEpoch;
  final DayModel day;
  final AstroModel astro;
  final List<HourModel> hour;

  ForecastDayModel({
    required this.date,
    required this.dateEpoch,
    required this.day,
    required this.astro,
    required this.hour,
  });

  factory ForecastDayModel.fromJson(Map<String, dynamic> json) {
    return ForecastDayModel(
      date: json['date'] ?? '',
      dateEpoch: json['date_epoch'] ?? 0,
      day: DayModel.fromJson(json['day']),
      astro: AstroModel.fromJson(json['astro']),
      hour:
          List<HourModel>.from(
            json['hour'].map((x) => HourModel.fromJson(x)),
          ) ??
          [],
    );
  }
}
