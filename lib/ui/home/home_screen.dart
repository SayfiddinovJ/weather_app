import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/provider/home_provider.dart';
import 'package:weather_app/ui/widgets/app_text.dart';
import 'package:weather_app/ui/widgets/shimmer.dart';
import 'package:weather_app/utils/colors/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, provider, _) {
        return Scaffold(
          backgroundColor: AppColors.white,
          body: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          provider.loading
                              ? AppShimmer()
                              : AppText(
                                title: 'Hello',
                                textAlign: TextAlign.start,
                              ),
                          AppText(
                            title: 'Discover the weather',
                            textAlign: TextAlign.start,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
