import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:weather_app/utils/colors/app_colors.dart';

class AppShimmer extends StatelessWidget {
  const AppShimmer({
    super.key,
    this.height = 10,
    this.width = 10,
    this.shape = 5,
  });

  final double height;
  final double width;
  final double shape;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.cultured,
      highlightColor: AppColors.platinum,
      child: Container(
        height: height.h,
        width: width.w,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(shape.r),
        ),
      ),
    );
  }
}
