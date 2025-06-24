import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/routes/app_route.dart';
import 'package:weather_app/utils/extensions/extension.dart';
import 'package:weather_app/utils/icons/app_icons.dart';
import 'package:weather_app/utils/theme/app_theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: SafeArea(
        child: RefreshIndicator(
          semanticsLabel: 'Pull to refresh',
          semanticsValue: 'Refresh',
          color: AppColors.gray,
          displacement: 0,
          edgeOffset: 0,
          strokeWidth: 2,
          onRefresh: () async {
            await Future.delayed(const Duration(seconds: 2));
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, Routes.details);
              },
              child: Column(
                children: [
                  50.ph,
                  Text(
                    'Friday, 25 December 2020',
                    style: TextStyle(fontSize: 18.sp, color: AppColors.gray),
                  ),
                  20.ph,
                  Text('24°c', style: TextStyle(fontSize: 100.sp)),
                  10.ph,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.arrow_downward,
                        color: AppColors.gray,
                        size: 21.w,
                      ),
                      Text(
                        '16°C',
                        style: TextStyle(
                          fontSize: 21.sp,
                          color: AppColors.gray,
                        ),
                      ),
                      20.pw,
                      Icon(
                        Icons.arrow_upward,
                        color: AppColors.gray,
                        size: 21.w,
                      ),
                      Text(
                        '26°C',
                        style: TextStyle(
                          fontSize: 21.sp,
                          color: AppColors.gray,
                        ),
                      ),
                    ],
                  ),
                  20.ph,
                  SvgPicture.asset(
                    AppIcons.dayRain,
                    colorFilter: ColorFilter.mode(
                      Theme.of(context).iconTheme.color!,
                      BlendMode.srcIn,
                    ),
                    height: 150.w,
                    width: 150.w,
                  ),
                  20.ph,
                  Text(
                    'Light Drizzle',
                    style: TextStyle(fontSize: 18.sp, color: AppColors.gray),
                  ),
                  20.ph,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(AppIcons.sunrise),
                      Text(
                        ' 09:18 AM',
                        style: TextStyle(
                          fontSize: 21.sp,
                          color: AppColors.gray,
                        ),
                      ),
                      20.pw,
                      SvgPicture.asset(AppIcons.sunset),
                      Text(
                        ' 06:32 PM',
                        style: TextStyle(
                          fontSize: 21.sp,
                          color: AppColors.gray,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
