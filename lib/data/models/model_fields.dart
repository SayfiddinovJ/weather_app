class WeatherModelFields {
  static const String id = "_id";
  static const String cityName = "sourceName";
  static const String region = "author";
  static const String country = "title";

  static const String dbTable = "weather";
}

class StorageModel {
  int? id;
  final String cityName;
  final String region;
  final String country;
  final String dbTable;

  StorageModel({
    this.id,
    required this.cityName,
    required this.region,
    required this.country,
    required this.dbTable,
  });

  StorageModel copyWith({
    int? id,
    String? cityName,
    String? region,
    String? country,
  }) => StorageModel(
    id: id ?? this.id,
    cityName: cityName ?? this.cityName,
    region: region ?? this.region,
    country: country ?? this.country,
    dbTable: dbTable,
  );

  StorageModel.fromJson(Map<String, Object?> json)
    : this(
        id: json[WeatherModelFields.id] as int?,
        cityName: json[WeatherModelFields.cityName] as String,
        region: json[WeatherModelFields.region] as String,
        country: json[WeatherModelFields.country] as String,
        dbTable: json[WeatherModelFields.dbTable] as String,
      );

  Map<String, Object?> toJson() => {
    WeatherModelFields.id: id,
    WeatherModelFields.cityName: cityName,
    WeatherModelFields.region: region,
    WeatherModelFields.country: country,
    WeatherModelFields.dbTable: dbTable,
  };

  @override
  String toString() {
    return """
    id: $id
    cityName: $cityName
    region: $region
    country: $country
    """;
  }
}
