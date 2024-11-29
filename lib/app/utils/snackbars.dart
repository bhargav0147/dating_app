import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/colors.dart';

class SnackbarUtils {
  static void showSuccess(String message) {
    Get.snackbar(
      'Success',
      message,
      snackStyle: SnackStyle.FLOATING,
      margin: const EdgeInsets.all(20),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.green,
      duration: const Duration(seconds: 2),
      colorText: AppColors.white,
    );
  }

  static void showError(String message) {
    Get.snackbar(
      'Error',
      message,
      margin: const EdgeInsets.all(20),
      snackStyle: SnackStyle.FLOATING,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.red,
      duration: const Duration(seconds: 1),
      colorText: AppColors.white,
    );
  }

  static void showInfo(String message) {
    Get.snackbar(
      'Information',
      message,
      margin: const EdgeInsets.all(20),
      snackStyle: SnackStyle.FLOATING,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.grey,
      duration: const Duration(seconds: 1),
      colorText: AppColors.white,
    );
  }
}
