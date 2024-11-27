import 'package:get/get.dart';

import '../theme/colors.dart';

class SnackbarUtils {
  static void showSuccess(String message) {
    Get.snackbar(
      'Success',
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.primary,
      duration: const Duration(seconds: 1),
      colorText: AppColors.white,
    );
  }

  static void showError(String message) {
    Get.snackbar(
      'Error',
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.red,
      duration: const Duration(seconds: 1),
      colorText: AppColors.white,
    );
  }
}
