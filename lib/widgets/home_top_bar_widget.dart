import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/app_images.dart';

class HomeTopBarWidget extends StatelessWidget {
  const HomeTopBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 20),
        InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(15),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              'https://img.freepik.com/free-photo/young-crazy-man-happy-expression_1194-5236.jpg',
              width: 30,
              height: 30,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const Expanded(child: SizedBox()),
        Row(
          children: [
            SvgPicture.asset(
              AppImages.iconPinLocation,
            ),
            const Text('Yogyakarta'),
          ],
        ),
        const Expanded(child: SizedBox()),
        InkWell(
          onTap: () {},
          child: Stack(
            alignment: Alignment.center,
            children: [
              const Icon(
                Icons.notifications_outlined,
              ),
              Positioned(
                right: 3,
                top: 3,
                child: Container(
                  width: 9,
                  height: 9,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(4.5),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 20),
      ],
    );
  }
}
