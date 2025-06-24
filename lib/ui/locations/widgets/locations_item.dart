import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/utils/extensions/extension.dart';
import 'package:weather_app/utils/theme/app_theme.dart';

class LocationsItem extends StatelessWidget {
  const LocationsItem({
    super.key,
    required this.title,
    required this.temp,
    required this.subtitle,
    required this.icon,
  });

  final String title;
  final String temp;
  final String subtitle;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontSize: 24.sp)),
                5.ph,
                Text(
                  temp,
                  style: TextStyle(fontSize: 16.sp, color: AppColors.gray),
                ),
                Text(
                  subtitle,
                  style: TextStyle(fontSize: 16.sp, color: AppColors.gray),
                ),
              ],
            ),
            const Spacer(),
            SvgPicture.asset(
              icon,
              height: 50.w,
              width: 50.w,
              colorFilter: ColorFilter.mode(
                Theme.of(context).iconTheme.color!,
                BlendMode.srcIn,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
