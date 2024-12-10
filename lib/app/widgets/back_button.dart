import 'package:dating_app/app/theme/colors.dart';
import 'package:dating_app/app/utils/navigation.dart';
import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        NavigationUtils.navigateBack();
      },
      child: Container(
        height: 52,
        width: 52,
        decoration: BoxDecoration(
            color: AppColors.white,
            border: Border.all(color: AppColors.black.shade100.withOpacity(0.5),),
            borderRadius: BorderRadius.circular(15)),
        child: const Center(
          child: Icon(Icons.arrow_back_ios_new_outlined,
            color: AppColors.primary,
            size: 22,
          ),
        ),
      ),
    );
  }
}
