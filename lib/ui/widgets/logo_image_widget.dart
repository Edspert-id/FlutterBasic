import 'package:flutter/material.dart';

import '../../values/app_images.dart';

class LogoImageWidget extends StatelessWidget {
  const LogoImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImages.logo,
      fit: BoxFit.cover,
    );
  }
}