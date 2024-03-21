import 'package:flutter/material.dart';

import '../../values/app_colors.dart';
import '../../values/app_strings.dart';

class PrimaryButtonWidget extends StatelessWidget {
  const PrimaryButtonWidget({
    Key? key,
    required this.onTap,
    required this.text,
  }) : super(key: key);

  final void Function() onTap;
  final String text;
  
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Ink(
          padding: EdgeInsets.symmetric(
            vertical: 14,
          ),
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.lightPurple,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 0),
                blurRadius: 15,
                spreadRadius: 0,
                color: AppColors.lightPurple3.withOpacity(0.15),
              ),
            ],
            gradient: LinearGradient(
              colors: [
                AppColors.lightPurple,
                AppColors.lightPurple2,
              ],
            ),
          ),
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
