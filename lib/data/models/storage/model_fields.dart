class WeatherModelFields {
  static const String id = "_id";
  static const String region = "author";
  static const String country = "title";

  static const String dbTable = "weather";
}

class StorageModel {
  int? id;
  final String region;
  final String country;

  StorageModel({
    this.id,
    required this.region,
    required this.country,
  });

  StorageModel copyWith({
    int? id,
    String? region,
    String? country,
  }) => StorageModel(
    id: id ?? this.id,
    region: region ?? this.region,
    country: country ?? this.country,
  );

  StorageModel.fromJson(Map<String, Object?> json)
    : this(
        id: json[WeatherModelFields.id] as int?,
        region: json[WeatherModelFields.region] as String,
        country: json[WeatherModelFields.country] as String,
      );

  Map<String, Object?> toJson() => {
    WeatherModelFields.id: id,
    WeatherModelFields.region: region,
    WeatherModelFields.country: country,
  };

  @override
  String toString() {
    return """
    id: $id
    region: $region
    country: $country
    """;
  }
}
