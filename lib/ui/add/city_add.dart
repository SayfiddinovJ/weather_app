import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/bloc/weather_bloc.dart';
import 'package:weather_app/bloc/weather_event.dart';
import 'package:weather_app/bloc/weather_state.dart';
import 'package:weather_app/data/models/country/country_model.dart';
import 'package:weather_app/data/models/country/region_model.dart';
import 'package:weather_app/data/status.dart';
import 'package:weather_app/ui/add/views/countries_view.dart';
import 'package:weather_app/ui/add/views/regions_view.dart';
import 'package:weather_app/utils/theme/app_theme.dart';

class CityAddScreen extends StatefulWidget {
  const CityAddScreen({super.key});

  @override
  State<CityAddScreen> createState() => _CityAddScreenState();
}

class _CityAddScreenState extends State<CityAddScreen> {
  _init() {
    BlocProvider.of<WeatherBloc>(context).add(GetCountriesFromJsonEvent());
  }

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add your city'),
        titleTextStyle: TextStyle(fontSize: 18.sp, color: AppColors.gray),
      ),
      body: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state.status == Status.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.status == Status.success) {
            return PageView(
              children: [CountriesView(countries: state.countries),RegionsView(regions: [state.selectedRegion])],
            );
          } else {
            return Center(child: Text(state.error));
          }
        },
      ),
    );
  }
}
