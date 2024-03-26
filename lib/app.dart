import 'package:flutter/material.dart';
import 'package:flutter_basic/ui/screens/login_screen.dart';
import 'package:flutter_basic/values/app_colors.dart';

import 'router/router.dart';
import 'ui/screens/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        primaryColor: AppColors.darkPurle,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColors.softPurple,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.yellow,
          unselectedItemColor: Colors.white,
        ),
      ),
      // routerConfig: router,
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
    );
  }
}
