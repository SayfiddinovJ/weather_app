import 'package:weather_app/data/models/country/country_model.dart';
import 'package:weather_app/data/models/country/region_model.dart';

class WeatherEvent {}

class GetWeatherEvent extends WeatherEvent {}

class GetCountriesFromJsonEvent extends WeatherEvent {}

class SelectCountryEvent extends WeatherEvent {
  final CountryModel country;

  SelectCountryEvent({required this.country});
}

class SelectRegionEvent extends WeatherEvent {
  final RegionModel regionModel;

  SelectRegionEvent({required this.regionModel});
}
