import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/bloc/weather_bloc.dart';
import 'package:weather_app/bloc/weather_event.dart';
import 'package:weather_app/bloc/weather_state.dart';
import 'package:weather_app/data/models/country/country_model.dart';
import 'package:weather_app/data/models/country/region_model.dart';
import 'package:weather_app/utils/theme/app_theme.dart';

class LocationAddScreen extends StatelessWidget {
  const LocationAddScreen({super.key});

  void _navigateHome(context) {
    Navigator.popUntil(context, (route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.popUntil(context, (route) => route.isFirst);
            // Navigator.pop(context);
            // _navigateHome(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: AppColors.gray),
        ),
        title: const Text('Add location'),
        titleTextStyle: TextStyle(fontSize: 18.sp, color: AppColors.gray),
      ),
      body: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropdownButton<CountryModel>(
                hint: Text("Select country"),
                value: state.selectedCountry,
                items:
                state.countries.map((c) {
                  return DropdownMenuItem(
                    value: c,
                    child: Text(c.countryName),
                  );
                }).toList(),
                onChanged: (c) {
                  context.read<WeatherBloc>().add(
                    SelectCountryEvent(country: c!),
                  );
                },
              ),
              if (state.selectedCountry.regions.isNotEmpty)
                DropdownButton<RegionModel>(
                  hint: Text("Select region"),
                  value: state.selectedRegion,
                  items:
                  state.selectedCountry.regions.map((r) {
                    return DropdownMenuItem(value: r, child: Text(r.name));
                  }).toList(),
                  onChanged: (r) {
                    context.read<WeatherBloc>().add(
                      SelectRegionEvent(regionModel: r!),
                    );
                  },
                ),
              if (state.selectedCountry.regions.isNotEmpty)
                Padding(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 16.w),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("Add this city"),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
