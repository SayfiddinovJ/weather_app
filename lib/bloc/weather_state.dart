import 'package:weather_app/data/models/weather_model.dart';
import 'package:weather_app/data/status.dart';

class WeatherState {
  final WeatherModel weather;
  final Status status;
  final String error;

  WeatherState({
    required this.weather,
    required this.status,
    required this.error,
  });

  WeatherState copyWith({
    WeatherModel? weather,
    Status? status,
    String? error,
  }) {
    return WeatherState(
      weather: weather ?? this.weather,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }

  @override
  String toString() {
    return 'WeatherState{weather: $weather, status: $status, error: $error}';
  }
}
