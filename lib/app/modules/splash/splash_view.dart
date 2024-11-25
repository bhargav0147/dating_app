import 'package:dating_app/app/modules/splash/splash_controller.dart';
import 'package:dating_app/app/theme/colors.dart';
import 'package:dating_app/app/widgets/custom_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return const Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: CustomIcon(
          icon: Icons.favorite,
          size: 150,
          color: AppColors.white,
        ),
      ),
    );
  }
}
