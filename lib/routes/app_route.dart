import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/data/models/weather/forecast_day_model.dart';
import 'package:weather_app/data/models/weather/weather_model.dart';
import 'package:weather_app/ui/details/details_screen.dart';
import 'package:weather_app/ui/forecast/forecast_screen.dart';
import 'package:weather_app/ui/home/home_screen.dart';
import 'package:weather_app/ui/locations/location_add/location_add_screen.dart';
import 'package:weather_app/ui/locations/locations_screen.dart';
import 'package:weather_app/ui/settings/settings_screen.dart';
import 'package:weather_app/ui/add/city_add.dart';
import 'package:weather_app/ui/splash/splash_screen.dart';

class Routes {
  static const splash = '/';
  static const home = '/home';
  static const forecast = '/forecast';
  static const details = '/details';
  static const settings = '/settings';
  static const locations = '/locations';
  static const locationAdd = '/location_add';
  static const cityAdd = '/city_add';
}

class Pages {
  static Route<dynamic> onGeneratingRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return CupertinoPageRoute(builder: (context) => const SplashScreen());
      case Routes.home:
        return CupertinoPageRoute(builder: (context) => const HomeScreen());
      case Routes.forecast:
        return CupertinoPageRoute(
          builder:
              (context) => ForecastScreen(
                forecastDay: settings.arguments as List<ForecastDayModel>,
              ),
        );
      case Routes.details:
        return CupertinoPageRoute(
          builder:
              (context) =>
                  DetailsScreen(weather: settings.arguments as WeatherModel),
        );
      case Routes.settings:
        return CupertinoPageRoute(builder: (context) => const SettingsScreen());
      case Routes.locations:
        return CupertinoPageRoute(
          builder: (context) => const LocationsScreen(),
        );
      case Routes.locationAdd:
        return CupertinoPageRoute(
          builder: (context) => const LocationAddScreen(),
        );
      case Routes.cityAdd:
        return CupertinoPageRoute(builder: (context) => const CityAddScreen());
      default:
        return _errorRoute();
    }
  }
}

Route<dynamic> _errorRoute() {
  return MaterialPageRoute(
    builder: (context) => Scaffold(body: Center(child: Text('Error route'))),
  );
}
