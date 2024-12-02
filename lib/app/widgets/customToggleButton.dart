// ignore_for_file: file_names

import 'package:dating_app/app/theme/fonts.dart';
import 'package:dating_app/app/widgets/custom_text.dart';
import 'package:flutter/material.dart';

import '../theme/colors.dart';

class CustomToggleButtons extends StatelessWidget {
  final List<String> items;
  final int selectedIndex;
  final ValueChanged<int> onChanged;

  const CustomToggleButtons({
    super.key,
    required this.items,
    required this.selectedIndex,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      isSelected:
          List.generate(items.length, (index) => selectedIndex == index),
      onPressed: (int index) => onChanged(index),
      color: Colors.black,
      selectedColor: AppColors.white,
      fillColor: AppColors.primary,
      borderRadius: BorderRadius.circular(8.0),
      constraints: const BoxConstraints(
          minHeight: 50, minWidth: 87, maxHeight: 55, maxWidth: 130),
      children: items
          .map((item) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: CustomText(
                  text: item,
                  style: AppFonts.extraSmall,
                ),
              ))
          .toList(),
    );
  }
}
