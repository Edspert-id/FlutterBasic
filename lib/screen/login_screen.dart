import 'package:flutter_basic/utils/form_validators.dart';
import 'package:flutter_basic/widgets/nonton_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../constants/app_colors.dart';
import '../constants/route_constant.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 45),
        child: Center(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/logo.png'),
                const SizedBox(height: 104),
                const Text(
                  'Masuk',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 36),
                NontonTextFieldWidget(
                  hintText: 'Username',
                  icon: Icons.person_2_outlined,
                  controller: usernameController,
                  validator: (value) => textFormValidators(textName: 'Username', value: value),
                ),
                const SizedBox(height: 16),
                NontonTextFieldWidget(
                  hintText: 'Password',
                  icon: Icons.lock_outline,
                  obscureText: true,
                  controller: passwordController,
                  validator: (value) => textFormValidators(textName: 'Password', value: value),
                ),
                Row(
                  children: [
                    const Text(
                      'Belum Punya Akun?',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        context.go(RouteConstant.registration);
                      },
                      child: const Text(
                        'Daftar',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 12),
        child: ElevatedButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              print('Username: ${usernameController.text}');
              print('Password: ${passwordController.text}');
              context.go(RouteConstant.main);
            } else {
              print('Form tidak valid');
            }
          },
          child: const Text('Masuk'),
        ),
      ),
    );
  }
}
