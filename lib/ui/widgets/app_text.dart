import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/utils/assets/app_assets.dart';
import 'package:weather_app/utils/colors/app_colors.dart';

class AppText extends StatelessWidget {
  const AppText({
    super.key,
    required this.title,
    this.textColor = AppColors.dark,
    this.fontSize = 20,
    this.fontWeight = FontWeight.w500,
    this.textAlign = TextAlign.center,
    this.maxLines = 2,
  });

  final String title;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: maxLines,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize.sp,
        fontWeight: fontWeight,
        fontFamily: fontFamily,
        color: textColor,
      ),
    );
  }
}
