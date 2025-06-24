import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/ui/locations/widgets/locations_item.dart';
import 'package:weather_app/utils/icons/app_icons.dart';
import 'package:weather_app/utils/theme/app_theme.dart';

class LocationsScreen extends StatelessWidget {
  const LocationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: AppColors.gray),
        ),
        title: const Text('Select city'),
        titleTextStyle: TextStyle(fontSize: 18.sp, color: AppColors.gray),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add, color: AppColors.gray),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            LocationsItem(
              title: 'New York',
              subtitle: 'United States',
              temp: '23°C',
              icon: AppIcons.rain,
            ),
            LocationsItem(
              title: 'London',
              subtitle: 'United Kingdom',
              temp: '23°C',
              icon: AppIcons.cloud,
            ),
            LocationsItem(
              title: 'Tokyo',
              subtitle: 'Japan',
              temp: '23°C',
              icon: AppIcons.daySunny,
            ),
          ],
        ),
      ),
    );
  }
}
