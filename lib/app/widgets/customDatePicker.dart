// ignore_for_file: file_names

import 'package:dating_app/app/theme/colors.dart';
import 'package:flutter/material.dart';

class DatePickerHelper {
  static Future<DateTime?> pickDate({
    required BuildContext context,
    DateTime? initialDate,
    required DateTime firstDate,
    required DateTime lastDate,
  }) async {
    // Show Date Picker with custom theme
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: firstDate,
      lastDate: lastDate,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.primary, // Primary color
              onPrimary: Colors.white, // Text color on the primary color
              onSurface: Colors.black, // Text color on the surface
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: AppColors.primary, // Button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    return pickedDate;
  }
}
