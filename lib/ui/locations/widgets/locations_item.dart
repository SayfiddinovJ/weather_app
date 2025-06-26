import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/utils/theme/app_theme.dart';

class LocationsItem extends StatelessWidget {
  const LocationsItem({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      titleTextStyle: TextStyle(fontSize: 18.sp, color: AppColors.gray),
      trailing: Visibility(visible: isSelected, child: Icon(Icons.check)),
      onTap: onTap,
    );
  }
}
