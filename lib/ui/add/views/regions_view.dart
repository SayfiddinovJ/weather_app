import 'package:flutter/material.dart';
import 'package:weather_app/data/models/country/region_model.dart';

class RegionsView extends StatelessWidget {
  const RegionsView({super.key, required this.regions});

  final List<RegionModel> regions ;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ...List.generate(regions.length, (index) {
          RegionModel region = regions[index];
          return ListTile(
            title: Text(region.name),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {},
          );
        }),
      ],
    );
  }
}
