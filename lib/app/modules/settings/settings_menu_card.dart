import 'package:flutter/material.dart';

import '../../theme/colors.dart';
import '../../theme/fonts.dart';
import '../../utils/sized_box_helper.dart';
import '../../widgets/custom_icon.dart';
import '../../widgets/custom_text.dart';

class SettingsMenuCard extends StatelessWidget {
  final IconData icon;
  final String text;

  const SettingsMenuCard({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomIcon(
          icon: icon,
          size: 25,
          color: AppColors.black,
        ),
        SizedBoxHelper.w10,
        CustomText(
          text: text,
          style: AppFonts.extraSmallBold,
          color: AppColors.black,
        ),
        const Spacer(),
        const CustomIcon(
          icon: Icons.double_arrow,
          size: 20,
          color: AppColors.black,
        ),
      ],
    );
  }
}
