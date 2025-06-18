import 'package:flutter/material.dart';
import 'package:weather_app/ui/widgets/app_text.dart';
import 'package:weather_app/utils/colors/app_colors.dart';

class MyTextButton extends StatelessWidget {
  const MyTextButton({
    super.key,
    required this.onTap,
    this.bgColor = AppColors.iris,
    this.radius = 30,
    this.hPadding = 8,
    this.vPadding = 12,
    this.width,
    required this.title,
    this.textColor = AppColors.white,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w400,
  });

  final VoidCallback onTap;
  final Color bgColor;
  final double radius;
  final double hPadding;
  final double vPadding;
  final dynamic width;
  final String title;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? double.infinity,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: hPadding, vertical: vPadding),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(radius),
        ),
        child: AppText(
          title: title,
          textColor: textColor,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
