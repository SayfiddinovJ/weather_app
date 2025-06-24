import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/theme_cubit.dart';
import 'package:weather_app/ui/settings/widgets/settings_item.dart';

class ThemeChanger extends StatelessWidget {
  const ThemeChanger({super.key});

  @override
  Widget build(BuildContext context) {
    final themeCubit = context.read<ThemeCubit>();
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SettingsItem(
              title: 'Dark Theme',
              subtitle: 'Join the Dark Side!',
              visible: state == ThemeMode.dark,
              onTap: themeCubit.setDarkTheme,
            ),
            SettingsItem(
              title: 'Light Theme',
              subtitle: 'Let There be Light!',
              visible: state == ThemeMode.light,
              onTap: themeCubit.setLightTheme,
            ),
          ],
        );
      },
    );
  }
}
