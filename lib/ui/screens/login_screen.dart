import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic/router/router.dart';
import 'package:flutter_basic/values/app_colors.dart';
import 'package:flutter_basic/values/app_strings.dart';
import 'package:go_router/go_router.dart';

import '../widgets/logo_image_widget.dart';
import '../widgets/primary_button_widget.dart';
import '../widgets/primary_textfield_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkPurle,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(
          bottom: 16,
          right: 16,
          left: 16,
        ),
        child: PrimaryButtonWidget(
          onTap: () {
            context.go(RoutePaths.home);
          },
          text: AppStrings.masuk,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 140,
              ),
              const Align(
                alignment: Alignment.center,
                child: LogoImageWidget(),
              ),
              const SizedBox(
                height: 94,
              ),
              const Text(
                AppStrings.masuk,
                style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 94,
              ),
              const PrimaryTextFieldWidget(
                hintText: 'Username',
                iconData: Icons.person_outlined,
              ),
              const SizedBox(
                height: 16,
              ),
              const PrimaryTextFieldWidget(
                hintText: 'Password',
                iconData: Icons.lock_outlined,
                obscureText: true,
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  Text(
                    '${AppStrings.belumPunyaAkun} ',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white.withOpacity(0.6),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      context.go(RoutePaths.register);
                    },
                    child: const Text(
                      AppStrings.daftar,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 200,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
