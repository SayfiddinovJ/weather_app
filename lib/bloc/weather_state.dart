import 'package:weather_app/data/models/country/country_model.dart';
import 'package:weather_app/data/models/country/region_model.dart';
import 'package:weather_app/data/models/weather/model_fields.dart';
import 'package:weather_app/data/models/weather/weather_model.dart';
import 'package:weather_app/data/status.dart';

class WeatherState {
  final WeatherModel weather;
  final CountryModel countryModel;
  final List<CountryModel> countries;
  final List<StorageModel> storageList;
  final CountryModel selectedCountry;
  final RegionModel selectedRegion;
  final String cityName;
  final Status status;
  final String error;

  WeatherState({
    required this.weather,
    required this.countryModel,
    required this.countries,
    required this.storageList,
    required this.selectedCountry,
    required this.selectedRegion,
    required this.cityName,
    required this.status,
    required this.error,
  });

  WeatherState copyWith({
    WeatherModel? weather,
    CountryModel? countryModel,
    List<CountryModel>? countries,
    List<StorageModel>? storageList,
    CountryModel? selectedCountry,
    RegionModel? selectedRegion,
    String? cityName,
    Status? status,
    String? error,
  }) {
    return WeatherState(
      weather: weather ?? this.weather,
      countryModel: countryModel ?? this.countryModel,
      countries: countries ?? this.countries,
      storageList: storageList ?? this.storageList,
      selectedCountry: selectedCountry ?? this.selectedCountry,
      selectedRegion: selectedRegion ?? this.selectedRegion,
      cityName: cityName ?? this.cityName,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }

  @override
  String toString() {
    return '''WeatherState{
    weather: $weather, 
    countryModel: $countryModel, 
    countries: $countries,
    storageList: $storageList,
    selectedCountry: $selectedCountry, 
    selectedRegion: $selectedRegion,
    cityName: $cityName, 
    status: $status, 
    error: $error}
    ''';
  }
}
