import 'package:dating_app/app/modules/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../theme/colors.dart';
import '../theme/fonts.dart'; // Make sure AppColors is imported correctly.

class CustomPhoneTextField extends StatelessWidget {
  final String hintText;
  final Color cursorColor;
  final Color borderColor;
  final Color focusedBorderColor;
  final Color errorBorderColor;
  final bool useHintText;
  final double borderRadius;
  final Color leadingIconColor;
  final TextEditingController? controller;
  final TextStyle? textStyle;
  final String? Function(String?)? validator;

  const CustomPhoneTextField({
    super.key,
    required this.hintText,
    this.borderColor = AppColors.grey,
    this.focusedBorderColor = AppColors.primary,
    this.errorBorderColor = AppColors.red,
    this.cursorColor = AppColors.black,
    this.borderRadius = 15,
    this.leadingIconColor = AppColors.black,
    this.controller,
    this.textStyle,
    this.useHintText = false,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      controller: controller,
      showDropdownIcon: false,
      flagsButtonPadding: const EdgeInsets.symmetric(horizontal: 10),
      cursorColor: cursorColor,
      keyboardType: TextInputType.number,
      initialCountryCode: 'IN',
      autovalidateMode: AutovalidateMode.onUnfocus,
      style: textStyle ?? AppFonts.medium.copyWith(color: AppColors.black),
      decoration: InputDecoration(
        hintText: useHintText ? hintText : null,
        labelText: useHintText ? null : hintText,
        labelStyle: TextStyle(color: AppColors.grey.shade900),
        hintStyle: TextStyle(color: AppColors.grey.shade600),
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
      ),
    );
  }
}
