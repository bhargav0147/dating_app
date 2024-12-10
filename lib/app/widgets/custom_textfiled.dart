import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../theme/fonts.dart'; // Make sure AppColors is imported correctly.

class CustomTextField extends StatelessWidget {
  final String hintText;
  final Color cursorColor;
  final Color borderColor;
  final Color focusedBorderColor;
  final Color errorBorderColor;
  final bool useHintText;
  final bool ifLeading;
  final double borderRadius;
  final IconData? leadingIcon;
  final Color leadingIconColor;
  final double leadingIconSize;
  final ValueChanged<String>? onChange;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType keyboardType;
  final int maxLine;
  final TextStyle? textStyle;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.keyboardType,
    this.borderColor = AppColors.grey,
    this.focusedBorderColor = AppColors.primary,
    this.errorBorderColor = AppColors.red,
    this.cursorColor = AppColors.black,
    this.ifLeading = false,
    this.maxLine = 1,
    this.borderRadius = 15,
    this.leadingIcon,
    this.leadingIconColor = AppColors.black,
    this.onChange,
    this.validator,
    this.controller,
    this.obscureText = false,
    this.textStyle,
    this.leadingIconSize = 24,
    this.useHintText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      cursorColor: cursorColor,
      onChanged: onChange,
      validator: validator,
      keyboardType: keyboardType,
      maxLines: maxLine,
      style: textStyle ?? AppFonts.medium.copyWith(color: AppColors.black),
      decoration: InputDecoration(
        hintText: useHintText ? hintText : null,
        labelText: useHintText ? null : hintText,
        labelStyle: TextStyle(color: AppColors.grey.shade900),
        hintStyle: TextStyle(color: AppColors.grey.shade600),
        prefixIcon: ifLeading && leadingIcon != null
            ? Icon(
                leadingIcon,
                color: leadingIconColor,
          size: leadingIconSize,
              )
            : null,
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
