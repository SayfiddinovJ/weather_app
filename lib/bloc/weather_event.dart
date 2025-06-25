class WeatherEvent {}

class GetWeatherEvent extends WeatherEvent {
  final String cityName;

  GetWeatherEvent({required this.cityName});
}
