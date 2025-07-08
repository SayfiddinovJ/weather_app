import 'package:weather_app/data/models/weather/current_model.dart';
import 'package:weather_app/data/models/weather/forecast_day_model.dart';
import 'package:weather_app/data/models/weather/location_model.dart';

class WeatherModel {
  final LocationModel locationModel;
  final CurrentModel currentModel;
  final List<ForecastDayModel> forecastModel;

  WeatherModel({
    required this.locationModel,
    required this.currentModel,
    required this.forecastModel,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      locationModel: LocationModel.fromJson(json['location']),
      currentModel: CurrentModel.fromJson(json['current']),
      forecastModel: List<ForecastDayModel>.from(
        json['forecast']['forecastday'].map(
          (e) => ForecastDayModel.fromJson(e),
        ),
      ),
    );
  }
}
