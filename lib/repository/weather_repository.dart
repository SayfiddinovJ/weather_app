import 'package:weather_app/data/universal_data.dart';
import 'package:weather_app/service/weather_service.dart';

class WeatherRepository {
  final WeatherService weatherService;

  WeatherRepository(this.weatherService);

  Future<UniversalData> getWeather(String city) =>
      weatherService.getCurrentWeather(city);
}
