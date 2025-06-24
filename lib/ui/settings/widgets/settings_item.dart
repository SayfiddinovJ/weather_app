import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/utils/theme/app_theme.dart';

class SettingsItem extends StatelessWidget {
  const SettingsItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.visible,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final bool visible;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      titleTextStyle: TextStyle(fontSize: 18.sp, color: AppColors.gray),
      subtitle: Text(subtitle),
      subtitleTextStyle: TextStyle(fontSize: 12.sp, color: AppColors.gray),
      trailing: Visibility(visible: visible, child: Icon(Icons.check)),
      onTap: onTap,
    );
  }
}
