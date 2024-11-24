import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackbarUtils {
  static void showSuccess(String message) {
    Get.snackbar(
      'Success',
      message,
      backgroundColor: Colors.green,
      duration: const Duration(seconds: 1),
      colorText: Colors.white,
    );
  }

  static void showError(String message) {
    Get.snackbar(
      'Error',
      message,
      backgroundColor: Colors.red,
      duration: const Duration(seconds: 1),
      colorText: Colors.white,
    );
  }
}
