import 'package:flutter_basic/widgets/nonton_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../constants/route_constant.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 45),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/logo.png'),
              const SizedBox(height: 104),
              const Text(
                'Registrasi',
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
                controller: TextEditingController(),
              ),
              const SizedBox(height: 16),
              NontonTextFieldWidget(
                hintText: 'Password',
                icon: Icons.lock_outline,
                controller: TextEditingController(),
              ),
              Row(
                children: [
                  Text(
                    'Sudah Punya Akun?',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      context.go(RouteConstant.login);
                    },
                    child: Text(
                      'Masuk',
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 12),
        child: ElevatedButton(
          onPressed: () {
            context.go(RouteConstant.main);
          },
          child: const Text('Daftar'),
        ),
      ),
    );
  }
}
