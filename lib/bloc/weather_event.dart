import 'package:weather_app/data/models/country/country_model.dart';
import 'package:weather_app/data/models/country/region_model.dart';
import 'package:weather_app/data/models/weather/model_fields.dart';

class WeatherEvent {}

class GetWeatherEvent extends WeatherEvent {}

class GetCountriesFromStorageEvent extends WeatherEvent {}

class GetCountriesFromJsonEvent extends WeatherEvent {}

class SelectCountryEvent extends WeatherEvent {
  final CountryModel country;

  SelectCountryEvent({required this.country});
}

class SelectRegionEvent extends WeatherEvent {
  final RegionModel regionModel;

  SelectRegionEvent({required this.regionModel});
}

class AddRegionToStorageEvent extends WeatherEvent {
  final StorageModel storageModel;

  AddRegionToStorageEvent({required this.storageModel});
}
