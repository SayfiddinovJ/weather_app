import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/ui/settings/widgets/settings_item.dart';
import 'package:weather_app/ui/settings/widgets/theme_changer.dart';
import 'package:weather_app/utils/extensions/extension.dart';
import 'package:weather_app/utils/theme/app_theme.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

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
        title: const Text('Settings'),
        titleTextStyle: TextStyle(fontSize: 18.sp, color: AppColors.gray),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.ph,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text('Theme', style: TextStyle(fontSize: 24.sp)),
            ),
            ThemeChanger(),
            20.ph,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text('Feedback', style: TextStyle(fontSize: 24.sp)),
            ),
            SettingsItem(
              title: 'Report an Issue',
              subtitle: 'Facing an issue? Report and we’ll look into it.',
              visible: false,
              onTap: () {},
            ),
            SettingsItem(
              title: 'Rate on App Store',
              subtitle: 'Enjoying the app? Leave a review on the App Store.',
              visible: false,
              onTap: () {},
            ),
            20.ph,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text('About', style: TextStyle(fontSize: 24.sp)),
            ),
            SettingsItem(
              title: 'About Weather',
              subtitle: 'Read a bit more about the app.',
              visible: false,
              onTap: () {},
            ),
            SettingsItem(
              title: 'The Team',
              subtitle: 'Get to know the team that made Weather a reality.',
              visible: false,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
