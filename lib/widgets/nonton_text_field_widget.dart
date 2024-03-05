import 'package:flutter/material.dart';

class NontonTextFieldWidget extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final bool obscureText;
  final TextEditingController controller;
  final FormFieldValidator<String?>? validator;

  const NontonTextFieldWidget({
    super.key,
    required this.hintText,
    required this.icon,
    this.obscureText = false,
    required this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF2F2C44),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.white24),
          prefixIcon: Icon(icon),
          prefixIconColor: Colors.white24,
        ),
        obscureText: obscureText,
        validator: validator,
      ),
    );
  }
}
