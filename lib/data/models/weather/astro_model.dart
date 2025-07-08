class AstroModel {
  final String sunrise;
  final String sunset;
  final String moonrise;
  final String moonSet;
  final String moonPhase;
  final int moonIllumination;
  final int isMoonUp;
  final int isSunUp;

  AstroModel({
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.moonSet,
    required this.moonPhase,
    required this.moonIllumination,
    required this.isMoonUp,
    required this.isSunUp,
  });

  factory AstroModel.fromJson(Map<String, dynamic> json) => AstroModel(
    sunrise: json['sunrise'] ?? '',
    sunset: json['sunset'] ?? '',
    moonrise: json['moonrise'] ?? '',
    moonSet: json['moonset'] ?? '',
    moonPhase: json['moon_phase'] ?? '',
    moonIllumination: json['moon_illumination'] ?? 0,
    isMoonUp: json['is_moon_up'] ?? 0,
    isSunUp: json['is_sun_up'] ?? 0,
  );
}
