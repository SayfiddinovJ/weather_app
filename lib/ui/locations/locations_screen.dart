import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/bloc/weather_bloc.dart';
import 'package:weather_app/bloc/weather_event.dart';
import 'package:weather_app/data/storage/storage_repo.dart';
import 'package:weather_app/routes/app_route.dart';
import 'package:weather_app/ui/locations/widgets/locations_item.dart';
import 'package:weather_app/utils/theme/app_theme.dart';

class LocationsScreen extends StatefulWidget {
  const LocationsScreen({super.key});

  @override
  State<LocationsScreen> createState() => _LocationsScreenState();
}

class _LocationsScreenState extends State<LocationsScreen> {
  List<String> cities = StorageRepository.getList('cities');
  String currentCity = StorageRepository.getString('cityName');

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
      body: ListView.builder(
        itemCount: cities.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: UniqueKey(),
            onDismissed: (direction) {
              cities.removeAt(index);
              StorageRepository.putList('cities', cities);
              StorageRepository.putString('cityName', cities[0]);
              cities = StorageRepository.getList('cities');
              if (cities.isNotEmpty) {
                context.read<WeatherBloc>().add(GetWeatherEvent());
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  Routes.home,
                  (route) => false,
                );
              } else {
                StorageRepository.putString('cityName', '');
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  Routes.cityAdd,
                  (route) => false,
                );
              }
            },
            child: LocationsItem(
              title: cities[index],
              isSelected: currentCity == cities[index],
              onTap: () {
                StorageRepository.putString('cityName', cities[index]);
                context.read<WeatherBloc>().add(GetWeatherEvent());
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  Routes.home,
                  (route) => false,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
