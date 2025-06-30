import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/data/models/weather/weather_model.dart';
import 'package:weather_app/utils/extensions/extension.dart';
import 'package:weather_app/utils/theme/app_theme.dart';

class DawnUpWard extends StatelessWidget {
  const DawnUpWard({super.key, required this.weather});

  final WeatherModel weather;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.arrow_downward, color: AppColors.gray, size: 21.w),
        Text(
          '${weather.currentModel.tempC}°C',
          style: TextStyle(fontSize: 21.sp, color: AppColors.gray),
        ),
        20.pw,
        Icon(Icons.arrow_upward, color: AppColors.gray, size: 21.w),
        Text(
          '${weather.currentModel.tempC}°C',
          style: TextStyle(fontSize: 21.sp, color: AppColors.gray),
        ),
      ],
    );
  }
}
