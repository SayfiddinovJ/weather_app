import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/bloc/weather_bloc.dart';
import 'package:weather_app/repository/weather_repository.dart';
import 'package:weather_app/routes/app_route.dart';
import 'package:weather_app/service/weather_service.dart';
import 'package:weather_app/utils/theme/app_theme.dart';

import 'cubit/theme_cubit.dart';
import 'data/storage/storage_repo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  StorageRepository.getInstance();
  final themeCubit = ThemeCubit();
  await themeCubit.loadTheme();
  runApp(App(weatherService: WeatherService(), themeCubit: themeCubit));
}

class App extends StatelessWidget {
  const App({
    super.key,
    required this.weatherService,
    required this.themeCubit,
  });

  final WeatherService weatherService;
  final ThemeCubit themeCubit;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => WeatherRepository(weatherService),
      child: MultiBlocProvider(
        providers: [
          BlocProvider.value(value: themeCubit),
          BlocProvider(
            create: (_) => WeatherBloc(context.read<WeatherRepository>()),
          ),
        ],
        child: const MyApp(),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      splitScreenMode: true,
      minTextAdapt: true,
      ensureScreenSize: true,
      designSize: const Size(375, 812),
      builder: (context, child) {
        return BlocBuilder<ThemeCubit, ThemeMode>(
          builder: (context, themeMode) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Weather App',
              themeMode: themeMode,
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              initialRoute: Routes.splash,
              onGenerateRoute: Pages.onGeneratingRoute,
            );
          },
        );
      },
    );
  }
}
