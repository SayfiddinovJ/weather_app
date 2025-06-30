import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/bloc/weather_bloc.dart';
import 'package:weather_app/bloc/weather_event.dart';
import 'package:weather_app/bloc/weather_state.dart';
import 'package:weather_app/data/models/country/country_model.dart';
import 'package:weather_app/data/models/country/region_model.dart';
import 'package:weather_app/data/status.dart';
import 'package:weather_app/ui/widgets/country_region_selector.dart';
import 'package:weather_app/utils/theme/app_theme.dart';

class LocationAddScreen extends StatelessWidget {
  const LocationAddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: AppColors.gray),
        ),
        title: const Text('Add location'),
        titleTextStyle: TextStyle(fontSize: 18.sp, color: AppColors.gray),
      ),
      body: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state.status == Status.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.status == Status.success) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: CountryRegionSelector(
                countries: state.countries,
                onChanged: (countryName, region) {
                  print(
                    'Selected country: $countryName\nSelected region: $region',
                  );
                },
              ),
            );
          } else {
            return Center(child: Text(state.error));
          }
        },
      ),
    );
  }
}
