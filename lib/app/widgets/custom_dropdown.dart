import 'package:dating_app/app/theme/fonts.dart';
import 'package:flutter/material.dart';

import '../theme/colors.dart';

class CustomDropdown extends StatelessWidget {
  final List<String> options; // Required
  final String? initialValue;
  final ValueChanged<String?>? onChanged;
  final String? Function(String?)? validator;
  final Color borderColor;
  final Color focusedBorderColor;
  final Color errorBorderColor;
  final Color dropdownColor;
  final double borderRadius;
  final Color iconColor;
  final double iconSize;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final String hintText;

  const CustomDropdown({
    super.key,
    required this.options,
    this.initialValue,
    this.onChanged,
    this.validator,
    this.borderColor = AppColors.grey,
    this.focusedBorderColor = AppColors.primary,
    this.errorBorderColor = AppColors.red,
    this.dropdownColor = AppColors.white,
    this.borderRadius = 15,
    this.iconColor = AppColors.black,
    this.iconSize = 24.0,
    this.textStyle,
    this.hintStyle,
    this.hintText = 'Select an option',
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: initialValue,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: hintText,
        labelStyle: hintStyle ?? const TextStyle(color: AppColors.grey),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: borderColor, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: focusedBorderColor, width: 1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: errorBorderColor, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: errorBorderColor, width: 1),
        ),
        filled: true,
        fillColor: dropdownColor,
      ),
      icon: Icon(
        Icons.arrow_drop_down,
        color: iconColor,
        size: iconSize,
      ),
      style: textStyle ?? AppFonts.medium,
      validator: validator,
      menuMaxHeight: 300,
      onChanged: onChanged,
      items: options.map((option) {
        return DropdownMenuItem<String>(
          value: option,
          child: Text(option),
        );
      }).toList(),
    );
  }
}
