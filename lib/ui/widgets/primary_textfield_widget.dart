import 'package:flutter/material.dart';

import '../../values/app_colors.dart';

class PrimaryTextFieldWidget extends StatelessWidget {
  const PrimaryTextFieldWidget({
    super.key,
    required this.hintText,
    required this.iconData,
    this.obscureText = false,
  });

  final String hintText;
  final IconData iconData;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.white.withOpacity(0.2),
        ),
        prefixIcon: Icon(iconData),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
        fillColor: AppColors.softPurple,
        filled: true,
      ),
      obscureText: obscureText,
      style: const TextStyle(
        color: Colors.white,
      ),
    );
  }
}
