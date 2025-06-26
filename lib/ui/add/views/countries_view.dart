import 'package:flutter/material.dart';
import 'package:weather_app/data/models/country/country_model.dart';

class CountriesView extends StatelessWidget {
  const CountriesView({super.key, required this.countries});

  final List<CountryModel> countries;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ...List.generate(countries.length, (index) {
          CountryModel country = countries[index];
          return ListTile(
            title: Text(country.countryName),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {},
          );
        }),
      ],
    );
  }
}
