import 'package:flutter/material.dart';
import 'package:weather_app/routes/app_route.dart';
import 'package:weather_app/utils/extensions/extension.dart';
import 'package:weather_app/utils/theme/app_theme.dart';

class AppBarActions extends StatelessWidget {
  const AppBarActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, Routes.locations);
          },
          icon: const Icon(Icons.map_outlined, color: AppColors.gray),
        ),
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, Routes.settings);
          },
          icon: const Icon(Icons.settings, color: AppColors.gray),
        ),
        10.pw,
      ],
    );
  }
}
