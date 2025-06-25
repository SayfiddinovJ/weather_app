import 'package:weather_app/data/models/country/region_model.dart';

class CountryModel {
  final String countryName;
  final String countryShortCode;
  final List<RegionModel> regions;

  CountryModel({
    required this.countryName,
    required this.countryShortCode,
    required this.regions,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      countryName: json['countryName'] ?? '',
      countryShortCode: json['countryShortCode'] ?? '',
      regions: List<RegionModel>.from(
        json['regions'].map((x) => RegionModel.fromJson(x)),
      ),
    );
  }
}
