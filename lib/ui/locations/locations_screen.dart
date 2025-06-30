import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/bloc/weather_bloc.dart';
import 'package:weather_app/bloc/weather_event.dart';
import 'package:weather_app/bloc/weather_state.dart';
import 'package:weather_app/data/status.dart';
import 'package:weather_app/routes/app_route.dart';
import 'package:weather_app/ui/locations/widgets/locations_item.dart';
import 'package:weather_app/utils/theme/app_theme.dart';

class LocationsScreen extends StatelessWidget {
  const LocationsScreen({super.key});

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
        title: const Text('Select city'),
        titleTextStyle: TextStyle(fontSize: 18.sp, color: AppColors.gray),
        actions: [
          IconButton(
            onPressed: () {
              context.read<WeatherBloc>().add(GetCountriesFromJsonEvent());
              Navigator.pushNamed(context, Routes.locationAdd);
            },
            icon: Icon(Icons.add, color: AppColors.gray),
          ),
        ],
      ),
      body: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state.status == Status.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.status == Status.error) {
            return Center(child: Text(state.error));
          } else if (state.status == Status.success) {
            return ListView.builder(
              itemCount: state.countries.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 10.h,
                  ),
                  child: InkWell(
                    onTap: () {
                      context.read<WeatherBloc>().add(GetWeatherEvent());
                      Navigator.pop(context);
                    },
                    child: LocationsItem(
                      title: state.countryModel.countryName,
                      isSelected: false,
                      onTap: () {},
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(child: Text(''));
          }
        },
      ),
    );
  }
}
