import 'package:flutter/material.dart';

class NontonForm extends StatelessWidget {
  final String hintText;
  final IconData icon;

  const NontonForm({
    super.key,
    required this.hintText,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF2F2C44),
      child: TextFormField(
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.white24),
          prefixIcon: Icon(icon),
          prefixIconColor: Colors.white24,
        ),
      ),
    );
  }
}
