import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../theme/colors.dart';
import '../../theme/fonts.dart';
import '../../widgets/custom_icon.dart';
import '../../widgets/custom_text.dart';
import 'gender_controller.dart';

class GenderOption extends StatelessWidget {
  final String gender;
  final Rx<String> selectedGender;
  final GenderController controller;

  const GenderOption({
    super.key,
    required this.gender,
    required this.selectedGender,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.selectedGemder.value = gender;
      },
      child: Obx(
        () => Container(
          height: 58,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: selectedGender.value == gender
                ? AppColors.primary
                : AppColors.white,
            border: Border.all(
              color: selectedGender.value == gender
                  ? AppColors.primary
                  : AppColors.grey.shade400,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomText(
                  text: gender,
                  style: AppFonts.mediumBold,
                  color: selectedGender.value == gender
                      ? AppColors.white
                      : AppColors.black,
                ),
                CustomIcon(
                  icon: Icons.check,
                  size: 22,
                  color: selectedGender.value == gender
                      ? AppColors.white
                      : AppColors.grey.shade400,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
