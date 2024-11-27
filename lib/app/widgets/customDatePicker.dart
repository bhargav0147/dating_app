// ignore_for_file: file_names

import 'package:flutter/material.dart';

class DatePickerHelper {
  static Future<DateTime?> pickDate({
    required BuildContext context,
    DateTime? initialDate,
    required DateTime firstDate,
    required DateTime lastDate,
  }) async {
    // Show Date Picker
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    return pickedDate;  }
}
