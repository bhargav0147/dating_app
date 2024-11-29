import 'package:dating_app/app/theme/fonts.dart';
import 'package:dating_app/app/utils/sized_box_helper.dart';
import 'package:dating_app/app/widgets/custom_icon.dart';
import 'package:flutter/material.dart';

import '../../theme/colors.dart';
import '../../widgets/custom_text.dart';

class InterestCard extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const InterestCard({
    super.key,
    required this.icon,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : AppColors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
              color: isSelected ? AppColors.primary : AppColors.grey),
          boxShadow: [
            if (isSelected)
              BoxShadow(
                color: AppColors.primary.withOpacity(0.5),
                blurRadius: 8,
              ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomIcon(
                icon: icon,
                size: 20,
                color: isSelected ? AppColors.white : AppColors.primary,
              ),
              SizedBoxHelper.w10,
              CustomText(
                style: AppFonts.small,
                text: text,
                color: isSelected ? AppColors.white : AppColors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
