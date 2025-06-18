import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/provider/home_provider.dart';
import 'package:weather_app/routes/app_route.dart';
import 'package:weather_app/utils/colors/app_colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => HomeProvider())],
      child: ScreenUtilInit(
        splitScreenMode: true,
        minTextAdapt: true,
        ensureScreenSize: true,
        designSize: const Size(375, 812),
        builder: (context, child){
        return  MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              scaffoldBackgroundColor: AppColors.iris,
              colorScheme: ColorScheme.fromSeed(seedColor: AppColors.iris),
            ),
            initialRoute: Routes.onboarding,
            onGenerateRoute: Pages.onGeneratingRoute,
          );
        },
      ),
    );
  }
}
