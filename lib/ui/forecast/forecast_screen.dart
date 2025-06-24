import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/ui/forecast/widgets/daily_item.dart';
import 'package:weather_app/ui/forecast/widgets/hourly_item.dart';
import 'package:weather_app/utils/extensions/extension.dart';
import 'package:weather_app/utils/icons/app_icons.dart';
import 'package:weather_app/utils/theme/app_theme.dart';

class ForecastScreen extends StatelessWidget {
  const ForecastScreen({super.key});

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
            Text('City name', style: TextStyle(fontSize: 18.sp)),
            Text(
              'Current location',
              style: TextStyle(fontSize: 10.sp, color: AppColors.gray),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.map_outlined, color: AppColors.gray),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings, color: AppColors.gray),
          ),
          10.pw,
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          30.ph,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            child: Text('Forecast', style: TextStyle(fontSize: 24.sp)),
          ),
          30.ph,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            child: Text(
              'Hourly Forecast',
              style: TextStyle(fontSize: 18.sp, color: AppColors.gray),
            ),
          ),
          SizedBox(
            height: 90.h,
            child: ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
              scrollDirection: Axis.horizontal,
              itemCount: 24,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: HourlyItem(title: '$index:00', icon: AppIcons.rain),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            child: Text(
              'Daily Forecast',
              style: TextStyle(fontSize: 18.sp, color: AppColors.gray),
            ),
          ),
          SizedBox(
            height: 130.h,
            child: ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              scrollDirection: Axis.horizontal,
              itemCount: 30,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: DailyItem(title: '$index Jun', icon: AppIcons.rain,highTemp: '26',lowTemp: '16',),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
