import 'package:flutter_basic/constants/route_constant.dart';
import 'package:flutter_basic/screen/login_screen.dart';
import 'package:flutter_basic/screen/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Basic',
      initialRoute: RouteConstant.splash,
      routes: {
        RouteConstant.splash: (context) => const SplashScreen(),
        RouteConstant.login: (context) => const LoginScreen(),
      },
    );
  }
}
