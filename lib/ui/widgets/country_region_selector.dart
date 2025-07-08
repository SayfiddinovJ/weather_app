import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/bloc/weather_bloc.dart';
import 'package:weather_app/bloc/weather_event.dart';
import 'package:weather_app/data/models/country/country_model.dart';
import 'package:weather_app/data/models/country/region_model.dart';
import 'package:weather_app/data/models/storage/model_fields.dart';
import 'package:weather_app/data/storage/storage_repo.dart';
import 'package:weather_app/routes/app_route.dart';
import 'package:weather_app/utils/extensions/extension.dart';

class CountryRegionSelector extends StatefulWidget {
  final List<CountryModel> countries;
  final Function(String country, String region)? onChanged;

  const CountryRegionSelector({
    super.key,
    required this.countries,
    this.onChanged,
  });

  @override
  State<CountryRegionSelector> createState() => _CountryRegionSelectorState();
}

class _CountryRegionSelectorState extends State<CountryRegionSelector> {
  CountryModel? selectedCountry;
  RegionModel? selectedRegion;

  @override
  void initState() {
    super.initState();
    if (widget.countries.isNotEmpty) {
      selectedCountry = widget.countries.first;
      selectedRegion = selectedCountry!.regions.first;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          10.ph,
          Text('Country:', style: TextStyle(fontSize: 16.sp)),
          5.ph,
          DropdownSearch<CountryModel>(
            compareFn: (CountryModel a, CountryModel b) {
              if (a.countryName == b.countryName) {
                return true;
              }
              return false;
            },
            items: (filter, infiniteScrollProps) => widget.countries,
            itemAsString: (c) => c.countryName,
            selectedItem: selectedCountry,
            popupProps: const PopupProps.menu(showSearchBox: true),
            onChanged: (value) {
              setState(() {
                selectedCountry = value;
                selectedRegion = null;
              });
            },
          ),
          16.ph,
          Text('Region:', style: TextStyle(fontSize: 16.sp)),
          5.ph,
          if (selectedCountry != null)
            DropdownSearch<RegionModel>(
              compareFn: (RegionModel a, RegionModel b) {
                if (a.name == b.name) {
                  return true;
                }
                return false;
              },
              items: (filter, infiniteScrollProps) => selectedCountry!.regions,
              itemAsString: (r) => r.name,
              selectedItem: selectedRegion,
              popupProps: const PopupProps.menu(showSearchBox: true),
              onChanged: (value) {
                setState(() {
                  selectedRegion = value;
                });
                if (selectedCountry != null && selectedRegion != null) {
                  widget.onChanged?.call(
                    selectedCountry!.countryName,
                    selectedRegion!.name,
                  );
                }
              },
            ),
          20.ph,
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (selectedRegion!.name.isNotEmpty) {
                  StorageRepository.putString('cityName', selectedRegion!.name);
                  context.read<WeatherBloc>().add(
                    AddRegionToStorageEvent(
                      storageModel: StorageModel(
                        region: selectedRegion!.name,
                        country: selectedCountry!.countryName,
                      ),
                    ),
                  );
                  context.read<WeatherBloc>().add(GetWeatherEvent());
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    Routes.home,
                    (_) => false,
                  );
                }
              },
              child: Text('Save'),
            ),
          ),
        ],
      ),
    );
  }
}
