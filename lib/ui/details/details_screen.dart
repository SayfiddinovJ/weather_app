import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/data/models/weather/weather_model.dart';
import 'package:weather_app/data/storage/storage_repo.dart';
import 'package:weather_app/routes/app_route.dart';
import 'package:weather_app/ui/details/widgets/details_text.dart';
import 'package:weather_app/ui/widgets/app_bar_actions.dart';
import 'package:weather_app/utils/extensions/extension.dart';
import 'package:weather_app/utils/theme/app_theme.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.weather});

  final WeatherModel weather;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              StorageRepository.getString('cityName'),
              style: TextStyle(fontSize: 18.sp),
            ),
            Text(
              'Current location',
              style: TextStyle(fontSize: 10.sp, color: AppColors.gray),
            ),
          ],
        ),
        actions: [AppBarActions()],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsetsGeometry.symmetric(vertical: 24.h, horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.ph,
            Row(
              children: [
                Text('Details', style: TextStyle(fontSize: 24.sp)),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      Routes.forecast,
                      arguments: weather.forecastModel,
                    );
                  },
                  child: Text(
                    'Forecast',
                    style: TextStyle(fontSize: 24.sp, color: AppColors.gray),
                  ),
                ),
              ],
            ),
            20.ph,
            DetailsText(
              title: 'Precipitation',
              value: '${weather.currentModel.preCipMm} mm',
            ),
            DetailsText(
              title: 'SE Wind',
              value: '${weather.currentModel.windKph} km/h',
            ),
            DetailsText(
              title: 'Humidity',
              value: '${weather.currentModel.humidity} %',
            ),
            DetailsText(
              title: 'Visibility',
              value: '${weather.currentModel.visKm} km',
            ),
            DetailsText(title: 'UV', value: '${weather.currentModel.uv}'),
            DetailsText(
              title: 'Pressure',
              value: '${weather.currentModel.pressureMb} hPa',
            ),
            DetailsText(
              title: 'Feels like',
              value: '${weather.currentModel.feelsLikeC}°c',
            ),
          ],
        ),
      ),
    );
  }
}
