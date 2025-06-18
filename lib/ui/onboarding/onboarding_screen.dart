import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_app/routes/app_route.dart';
import 'package:weather_app/ui/widgets/app_text.dart';
import 'package:weather_app/ui/widgets/text_button.dart';
import 'package:weather_app/utils/assets/app_assets.dart';
import 'package:weather_app/utils/colors/app_colors.dart';
import 'package:weather_app/utils/extensions/size_extension.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Image.asset(
              AppImages.world,
              height: (MediaQuery.of(context).size.height / 2).h,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(3, (index) {
                            return Container(
                              margin: EdgeInsets.symmetric(horizontal: 5.w),
                              height: 9.w,
                              width: 9.w,
                              decoration: BoxDecoration(
                                color:
                                    index == 1
                                        ? AppColors.iris
                                        : AppColors.cultured,
                                shape: BoxShape.circle,
                              ),
                            );
                          }),
                        ),
                        2.ph,
                        AppText(
                          title:
                              'Explore global map of wind, weather, and ocean conditions',
                          maxLines: 3,
                        ),
                        5.ph,
                        AppText(
                          title:
                              'Planing your trip become more easier with ideate weather app. You can instantly see the whole word weather within few second',
                          maxLines: 10,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          textColor: AppColors.spanishGrey,
                        ),
                      ],
                    ),
                    10.ph,
                    Flexible(child: SvgPicture.asset(AppIcons.sun)),
                    10.ph,
                    MyTextButton(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, Routes.home);
                      },
                      title: 'NEXT',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
