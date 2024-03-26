import 'package:flutter/material.dart';
import 'package:flutter_basic/router/router.dart';
import 'package:flutter_basic/ui/screens/login_screen.dart';
import 'package:flutter_basic/values/app_images.dart';
import 'package:go_router/go_router.dart';

import '../../values/app_colors.dart';
import '../widgets/logo_image_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      print('initState go to login??');
      context.go(RoutePaths.login);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkPurle,
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Image.asset(
              AppImages.background,
            ),
          ),
          const Positioned(
            top: 140,
            left: 0,
            right: 0,
            child: LogoImageWidget(),
          ),
        ],
      ),
    );
  }
}
