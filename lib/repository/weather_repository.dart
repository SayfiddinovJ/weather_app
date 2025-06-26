import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:weather_app/data/models/country/country_model.dart';
import 'package:weather_app/data/storage/sqflite.dart';
import 'package:weather_app/data/universal_data.dart';
import 'package:weather_app/service/weather_service.dart';

class WeatherRepository {
  final WeatherService weatherService;

  WeatherRepository({required this.weatherService});

  Future<UniversalData> getWeather(String city) =>
      weatherService.getCurrentWeather(city);

  Future<UniversalData> getCountriesFromStorage() async {
    try {
      return UniversalData(data: LocalDatabase.getAll());
    } catch (e) {
      return UniversalData(error: e.toString());
    }
  }

  Future<UniversalData> getCountriesFromJson() async {
    try {
      final String rawData = await rootBundle.loadString(
        'assets/json/country_region_data.json',
      );
      final List jsonList = jsonDecode(rawData);

      final List<CountryModel> countries =
          jsonList.map((e) => CountryModel.fromJson(e)).toList();

      return UniversalData(data: countries);
    } catch (e) {
      return UniversalData(error: 'Error: ${e.toString()}');
    }
  }
}
