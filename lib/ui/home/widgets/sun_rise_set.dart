import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_app/utils/extensions/extension.dart';
import 'package:weather_app/utils/icons/app_icons.dart';
import 'package:weather_app/utils/theme/app_theme.dart';

class SunRiseSet extends StatelessWidget {
  const SunRiseSet({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(AppIcons.sunrise),
        Text(
          ' 09:18 AM',
          style: TextStyle(fontSize: 21.sp, color: AppColors.gray),
        ),
        20.pw,
        SvgPicture.asset(AppIcons.sunset),
        Text(
          ' 06:32 PM',
          style: TextStyle(fontSize: 21.sp, color: AppColors.gray),
        ),
      ],
    );
  }
}
