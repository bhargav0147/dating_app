import 'package:flutter/material.dart';

import '../theme/colors.dart';

class SnackbarUtils {
  static void showSuccess(BuildContext context, String message) {
    _showSnackbar(context, message, AppColors.green, AppColors.white);
  }

  static void showError(BuildContext context, String message) {
    _showSnackbar(context, message, AppColors.red, AppColors.white);
  }

  static void showInfo(BuildContext context, String message) {
    _showSnackbar(context, message, AppColors.yellow, AppColors.black);
  }

  static void _showSnackbar(BuildContext context, String message,
      Color backgroundColor, Color textColor) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style:  TextStyle(color: textColor),
        ),
        backgroundColor: backgroundColor,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(20),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
