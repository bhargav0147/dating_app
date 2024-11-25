import 'package:flutter/material.dart';

import '../theme/colors.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double? height;
  final double? width;
  final bool isLoading; // Flag to show loading indicator
  final double borderRadius;

  const CustomButton({
    required this.label,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.height,
    this.width,
    this.isLoading = false, // Default: not loading
    this.borderRadius = 8.0, // Default border radius
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 50.0,
      width: width ?? double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        onPressed: isLoading ? null : onPressed,
        child: isLoading
            ? const SizedBox(
                height: 18,
                width: 18,
                child: CircularProgressIndicator(
                  strokeWidth: 2.0,
                  color: AppColors.primary,
                ),
              )
            : Text(
                label,
                style: TextStyle(
                  color: textColor ?? AppColors.white,

                ).copyWith(fontSize: 16),
              ),
      ),
    );
  }
}
