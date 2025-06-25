class RegionModel {
  final String name;
  final String shortCode;

  RegionModel({required this.name, required this.shortCode});

  factory RegionModel.fromJson(Map<String, dynamic> json) {
    return RegionModel(
      name: json['name'] ?? '',
      shortCode: json['shortCode'] ?? '',
    );
  }
}
