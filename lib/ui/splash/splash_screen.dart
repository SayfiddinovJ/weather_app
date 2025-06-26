import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/bloc/weather_bloc.dart';
import 'package:weather_app/bloc/weather_event.dart';
import 'package:weather_app/data/storage/storage_repo.dart';
import 'package:weather_app/routes/app_route.dart';
import 'package:weather_app/utils/extensions/extension.dart';
import 'package:weather_app/utils/theme/app_theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    _navigateHome(context);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              Text('Weather', style: TextStyle(fontSize: 24.sp)),
              const Spacer(),
              Text(
                'A minimal weather app',
                style: TextStyle(fontSize: 10.sp, color: AppColors.gray),
              ),
              20.ph,
            ],
          ),
        ),
      ),
    );
  }

  _navigateHome(context) {
    Future.delayed(const Duration(seconds: 2), () {
      String cityName = StorageRepository.getString('cityName');
      if (cityName.isEmpty) {
        Navigator.pushReplacementNamed(context, Routes.cityAdd);
      } else {
        Navigator.pushReplacementNamed(context, Routes.home);
      }
    });
  }
}
