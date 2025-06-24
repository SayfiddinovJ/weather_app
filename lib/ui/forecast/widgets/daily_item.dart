import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/utils/extensions/extension.dart';
import 'package:weather_app/utils/theme/app_theme.dart';

class DailyItem extends StatelessWidget {
  const DailyItem({
    super.key,
    required this.title,
    required this.icon,
    required this.highTemp,
    required this.lowTemp,
  });

  final String title;
  final String icon;
  final String highTemp;
  final String lowTemp;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title, style: TextStyle(fontSize: 16.sp)),
        SvgPicture.asset(
          icon,
          height: 30.w,
          width: 30.w,
          colorFilter: ColorFilter.mode(
            Theme.of(context).iconTheme.color!,
            BlendMode.srcIn,
          ),
        ),
        5.ph,
        Row(
          children: [
            Icon(Icons.arrow_upward, size: 16.sp, color: AppColors.gray),
            Text('$highTemp°C', style: TextStyle(color: AppColors.gray)),
          ],
        ),
        5.ph,
        Row(
          children: [
            Icon(Icons.arrow_downward, size: 16.sp, color: AppColors.gray),
            Text('$lowTemp°C', style: TextStyle(color: AppColors.gray)),
          ],
        ),
      ],
    );
  }
}
