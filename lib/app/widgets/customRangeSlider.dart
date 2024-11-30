// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../theme/colors.dart';

class CustomRangeSlider extends StatelessWidget {
  final double min;
  final double max;
  final int divisions;
  final RangeValues values;
  final ValueChanged<RangeValues> onChanged;
  final Color activeColor;

  const CustomRangeSlider({
    super.key,
    required this.min,
    required this.max,
    required this.divisions,
    required this.values,
    required this.onChanged,
    this.activeColor = AppColors.primary, // Default color if not provided
  });

  @override
  Widget build(BuildContext context) {
    return RangeSlider(
      min: min,
      max: max,
      divisions: divisions,
      activeColor: activeColor,
      labels: RangeLabels(
        values.start.round().toString(),
        values.end.round().toString(),
      ),
      values: values,
      onChanged: onChanged,
    );
  }
}
