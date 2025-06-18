import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/provider/home_provider.dart';
import 'package:weather_app/ui/widgets/shimmer.dart';
import 'package:weather_app/utils/colors/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, provider, _) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: AppColors.flashWhite,
            body: Column(children: [AppShimmer()]),
          ),
        );
      },
    );
  }
}
