import 'package:flutter_basic/widgets/nonton_form.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1A29),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 45),
        child: Center(
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
              const NontonForm(
                hintText: 'Username',
                icon: Icons.person_2_outlined,
              ),
              const SizedBox(height: 16),
              const NontonForm(
                hintText: 'Password',
                icon: Icons.lock_outline,
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
          onPressed: () {},
          child: const Text('Masuk'),
        ),
      ),
    );
  }
}
