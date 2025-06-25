import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/data/storage/storage_repo.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.system);

  static const _key = 'theme_mode';

  Future<void> loadTheme() async {
    final themeStr = StorageRepository.getString(_key);

    switch (themeStr) {
      case 'light':
        emit(ThemeMode.light);
        break;
      case 'dark':
        emit(ThemeMode.dark);
        break;
      default:
        emit(ThemeMode.system);
    }
  }

  void setLightTheme() async {
    emit(ThemeMode.light);
    await StorageRepository.putString(_key, 'light');
  }

  void setDarkTheme() async {
    emit(ThemeMode.dark);
    await StorageRepository.putString(_key, 'dark');
  }

  void setSystemTheme() async {
    emit(ThemeMode.system);
    await StorageRepository.putString(_key, 'system');
  }
}
