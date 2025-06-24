import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/utils/theme/app_theme.dart';

class HourlyItem extends StatelessWidget {
  const HourlyItem({super.key, required this.title, required this.icon});

  final String title;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title, style: TextStyle(fontSize: 16.sp, color: AppColors.gray)),
        SvgPicture.asset(icon, height: 30.w, width: 30.w),
      ],
    );
  }
}
