import 'package:flutter/material.dart';
import 'package:weather_app/ui/home/home_screen.dart';
import 'package:weather_app/ui/onboarding/onboarding_screen.dart';

class Routes {
  static const onboarding = '/';
  static const home = '/home';
}

class Pages {
  static Route<dynamic> onGeneratingRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboarding:
        return MaterialPageRoute(builder: (context) => OnboardingScreen());
      case Routes.home:
        return MaterialPageRoute(builder: (context) => HomeScreen());
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
