import 'package:dop/constants/size.dart';
import 'package:dop/screens/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/color.dart';
import '../constants/icons.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: lightSecondaryColor,
      ),
      child: GestureDetector(
        onTap: () => Get.toNamed('/dashboard'),
        child: Image.asset(
          dopLogoIcon,
          scale: 1.a,
        ),
      ),
    );
  }
}
