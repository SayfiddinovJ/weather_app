import 'package:weather_app/data/models/current_model.dart';
import 'package:weather_app/data/models/location_model.dart';

class WeatherModel {
  final LocationModel locationModel;
  final CurrentModel currentModel;

  WeatherModel({required this.locationModel, required this.currentModel});

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      locationModel: LocationModel.fromJson(json['location']),
      currentModel: CurrentModel.fromJson(json['current']),
    );
  }
}
