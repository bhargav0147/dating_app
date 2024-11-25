import 'package:flutter/material.dart';

import '../theme/colors.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final Color cursorColor;
  final Color borderColor;
  final Color focusedBorderColor;
  final Color errorBorderColor;
  final bool ifLeading;
  final IconData? leadingIcon;
  final Color leadingIconColor;
  final ValueChanged<String>? onChange;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool obscureText;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.borderColor = AppColors.grey,
    this.focusedBorderColor = AppColors.primary,
    this.errorBorderColor = AppColors.red,
    this.cursorColor = AppColors.black,
    this.ifLeading = false,
    this.leadingIcon,
    this.leadingIconColor = AppColors.black,
    this.onChange,
    this.validator,
    this.controller,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      cursorColor: cursorColor,
      onChanged: onChange,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        prefixIcon: ifLeading && leadingIcon != null
            ? Icon(
                leadingIcon,
                color: leadingIconColor,
              )
            : null,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: borderColor, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: focusedBorderColor, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: errorBorderColor, width: 2),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: errorBorderColor, width: 2),
        ),
      ),
    );
  }
}
