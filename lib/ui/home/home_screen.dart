import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/bloc/weather_bloc.dart';
import 'package:weather_app/bloc/weather_event.dart';
import 'package:weather_app/bloc/weather_state.dart';
import 'package:weather_app/data/models/weather/weather_model.dart';
import 'package:weather_app/data/status.dart';
import 'package:weather_app/data/storage/storage_repo.dart';
import 'package:weather_app/routes/app_route.dart';
import 'package:weather_app/ui/home/widgets/dawn_up_ward.dart';
import 'package:weather_app/ui/home/widgets/sun_rise_set.dart';
import 'package:weather_app/ui/widgets/app_bar_actions.dart';
import 'package:weather_app/utils/extensions/extension.dart';
import 'package:weather_app/utils/theme/app_theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              StorageRepository.getString('cityName'),
              style: TextStyle(fontSize: 18.sp),
            ),
            Text(
              'Current location',
              style: TextStyle(fontSize: 10.sp, color: AppColors.gray),
            ),
          ],
        ),
        actions: [AppBarActions()],
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
            context.read<WeatherBloc>().add(GetWeatherEvent());
          },
          child: BlocBuilder<WeatherBloc, WeatherState>(
            builder: (context, state) {
              WeatherModel weather = state.weather;
              if (state.status == Status.loading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state.status == Status.error) {
                return SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      200.ph,
                      Center(child: Text(state.error)),
                      10.ph,
                      ElevatedButton(
                        onPressed: () async {
                          context.read<WeatherBloc>().add(GetWeatherEvent());
                        },
                        child: Text('Refresh'),
                      ),
                    ],
                  ),
                );
              }
              return SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.details);
                  },
                  child: Column(
                    children: [
                      50.ph,
                      Text(
                        weather.locationModel.localtime,
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: AppColors.gray,
                        ),
                      ),
                      20.ph,
                      Text(
                        '${weather.currentModel.tempC}°c',
                        style: TextStyle(fontSize: 100.sp),
                      ),
                      10.ph,
                      DawnUpWard(weather: weather),
                      20.ph,
                      Image.network(
                        'https:${weather.currentModel.condition.icon}',
                        height: 150.w,
                        width: 150.w,
                        fit: BoxFit.cover,
                        errorBuilder: (c, o, s) {
                          return Icon(Icons.photo, size: 150.w);
                        },
                      ),
                      20.ph,
                      Text(
                        weather.currentModel.condition.text,
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: AppColors.gray,
                        ),
                      ),
                      20.ph,
                      SunRiseSet(),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
