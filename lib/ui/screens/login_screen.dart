import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic/values/app_colors.dart';
import 'package:flutter_basic/values/app_strings.dart';

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
        padding: EdgeInsets.only(
          bottom: 16,
          right: 16,
          left: 16,
        ),
        child: PrimaryButtonWidget(
          onTap: () {},
          text: AppStrings.masuk,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 140,
              ),
              Align(
                alignment: Alignment.center,
                child: LogoImageWidget(),
              ),
              SizedBox(
                height: 94,
              ),
              Text(
                AppStrings.masuk,
                style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 94,
              ),
              PrimaryTextFieldWidget(
                hintText: 'Username',
                iconData: Icons.person_outlined,
              ),
              SizedBox(
                height: 16,
              ),
              PrimaryTextFieldWidget(
                hintText: 'Password',
                iconData: Icons.lock_outlined,
                obscureText: true,
              ),
              SizedBox(
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
                    onTap: () {},
                    child: Text(
                      AppStrings.daftar,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '${AppStrings.belumPunyaAkun} ',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white.withOpacity(0.6),
                        ),
                      ),
                      TextSpan(
                        text: AppStrings.daftar,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 200,),
            ],
          ),
        ),
      ),
    );
  }
}
